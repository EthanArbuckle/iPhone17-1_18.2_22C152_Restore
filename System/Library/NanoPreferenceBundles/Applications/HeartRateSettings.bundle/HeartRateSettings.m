uint64_t sub_4698(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_46AC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_4858(id a1)
{
  id v6 = objc_alloc_init((Class)HKHealthStore);
  v1 = +[HKDisplayTypeController sharedInstanceForHealthStore:v6];
  uint64_t v2 = [v1 displayTypeWithIdentifier:&off_192C0];
  v3 = (void *)qword_1E738;
  qword_1E738 = v2;

  id v4 = [objc_alloc((Class)HKUnitPreferenceController) initWithHealthStore:v6];
  v5 = (void *)qword_1E740;
  qword_1E740 = (uint64_t)v4;
}

uint64_t sub_5160(uint64_t a1)
{
  return _NSRequestConcreteImplementation(v2, v1, a1);
}

uint64_t sub_517C()
{
  return objc_opt_class();
}

id HKHeartRateTinkerLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_18D58 table:@"HeartRateSettings-tinker"];

  return v3;
}

void sub_5EC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_5FB0;
  v9[3] = &unk_186A8;
  id v10 = v5;
  id v11 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v7 = v6;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

id sub_5FB0(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 56), "_setUpHeartRhythmAvailabilityWithProfileIdentifier:");
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v3 = (void *)HKLogHeartRhythm;
    if (os_log_type_enabled(HKLogHeartRhythm, OS_LOG_TYPE_ERROR)) {
      sub_E0FC(a1, v3);
    }
    uint64_t v2 = [*(id *)(a1 + 56) _setUpHeartRhythmAvailability];
  }
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(void **)(v4 + 200);
  *(void *)(v4 + 200) = v2;

  return [*(id *)(a1 + 56) reloadSpecifiers];
}

void sub_8D84(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKLogHeartRate;
    if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_ERROR)) {
      sub_E6FC(a1, (uint64_t)v5, v6);
    }
  }
}

void sub_96B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_96DC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_E8A0();
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_97C4;
    block[3] = &unk_18718;
    objc_copyWeak(&v8, (id *)(a1 + 32));
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
  }
}

void sub_97C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_9F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_9F80(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)HKLogHeartRate;
    if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_ERROR)) {
      sub_EA84(a1, v6, v5);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A064;
    block[3] = &unk_18718;
    objc_copyWeak(&v8, (id *)(a1 + 32));
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
  }
}

void sub_A064(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

id sub_A300(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_A6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_A6E0(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_A79C;
    v8[3] = &unk_18790;
    v8[4] = WeakRetained;
    uint64_t v11 = a2;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = v6;
    uint64_t v10 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }
}

id sub_A79C(void *a1)
{
  uint64_t v2 = [(id)objc_opt_class() _cachedInstallStateByAppID];
  uint64_t v3 = +[NSNumber numberWithInteger:a1[7]];
  [v2 setObject:v3 forKey:a1[5]];

  uint64_t v4 = (void *)a1[6];

  return [v4 reloadSpecifiers];
}

void sub_A870(id a1)
{
  qword_1E750 = objc_opt_new();

  _objc_release_x1();
}

id sub_AC78(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_AFF4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_B014(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_B048(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id sub_B068(id a1)
{
  return a1;
}

uint64_t sub_B08C()
{
  return objc_opt_class();
}

id sub_B0A4(id a1)
{
  return a1;
}

void sub_B2C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[NSNumber numberWithInteger:a2];
  v4.receiver = v2;
  v4.super_class = (Class)HPRFHeartRateBradycardiaThresholdController;
  objc_msgSendSuper2(&v4, "didSelectThresholdValue:", v3);
}

void sub_B44C(id a1)
{
  v7.width = 27.0;
  v7.height = 27.0;
  UIGraphicsBeginImageContextWithOptions(v7, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  uint64_t v2 = +[UIColor systemOrangeColor];
  [v2 setStroke];

  CGContextSetLineWidth(CurrentContext, 1.0);
  v8.origin.x = 1.0;
  v8.origin.y = 1.0;
  v8.size.width = 25.0;
  v8.size.height = 25.0;
  CGContextStrokeEllipseInRect(CurrentContext, v8);
  uint64_t v3 = +[UIColor clearColor];
  [v3 setFill];

  v9.origin.x = 13.0;
  v9.origin.y = 10.0;
  v9.size.width = 14.0;
  v9.size.height = 5.5;
  UIRectFill(v9);
  uint64_t v4 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v5 = (void *)qword_1E760;
  qword_1E760 = v4;

  UIGraphicsEndImageContext();
}

void sub_C1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_C1DC(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_C294;
    block[3] = &unk_18858;
    void block[4] = WeakRetained;
    uint64_t v8 = a2;
    id v7 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_C294(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() _cachedInstallStateByAppID];
  uint64_t v3 = +[NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) updateUIWithInstallState:*(void *)(a1 + 48) forBundleID:*(void *)(a1 + 40)];
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 setNeedsLayout];
}

void sub_C498(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C564;
  block[3] = &unk_188A8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  uint64_t v13 = *(void *)(a1 + 56);
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_C564(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  _HKInitializeLogging();
  id v4 = (void *)HKLogDefault;
  if (v3)
  {
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
      sub_EBF0((void *)a1, v4, v2);
    }
    uint64_t v5 = [(id)objc_opt_class() _cachedInstallStateByAppID];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = &off_19350;
  }
  else
  {
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(const char **)(a1 + 64);
      id v11 = v4;
      id v12 = NSStringFromSelector(v10);
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 56);
      int v16 = 138544130;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Scheduled installation of app with bundle identifier(%@) on watch(%@)", (uint8_t *)&v16, 0x2Au);
    }
    uint64_t v5 = [(id)objc_opt_class() _cachedInstallStateByAppID];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = &off_19338;
  }
  [v5 setObject:v8 forKey:v7];

  return [*(id *)(a1 + 40) setNeedsLayout];
}

void sub_D258(id a1)
{
  qword_1E770 = objc_opt_new();

  _objc_release_x1();
}

void sub_D2E8(id a1)
{
  qword_1E780 = objc_opt_new();

  _objc_release_x1();
}

void sub_D378(id a1)
{
  id v1 = objc_alloc_init((Class)NSCache);
  uint64_t v2 = (void *)qword_1E790;
  qword_1E790 = (uint64_t)v1;

  [(id)qword_1E790 setEvictsObjectsWhenApplicationEntersBackground:0];
  uint64_t v3 = (void *)qword_1E790;

  [v3 setCountLimit:50];
}

void sub_DAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_DAC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_DAD4(uint64_t a1)
{
}

void sub_DADC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_E01C(uint64_t a1, void *a2, const char *a3)
{
  uint64_t v5 = a2;
  id v6 = NSStringFromSelector(a3);
  int v7 = 138544130;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = HKElectrocardiogramAppBundleID;
  __int16 v13 = 2112;
  uint64_t v14 = 0;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to setup watch app availability for app bundle identifier(%@) on watch(%@)", (uint8_t *)&v7, 0x2Au);
}

void sub_E0FC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = [v3 pairingID];
  id v6 = [*(id *)(a1 + 48) localizedDescription];
  int v7 = 136446722;
  uint64_t v8 = "-[HPRFHeartRateSettingsController init]_block_invoke_2";
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "[%{public}s]: Profile identifier is nil for NRDevice UUID %{public}@, Error: %{public}@", (uint8_t *)&v7, 0x20u);
}

void sub_E1E0()
{
  sub_B03C();
  id v2 = v1;
  uint64_t v3 = (void *)sub_B08C();
  id v4 = sub_B068(v3);
  sub_AFF4(&dword_0, v5, v6, "[%{public}@]: Error determining IRN feature state; reporting 'not rescinded': %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);
}

void sub_E270()
{
  sub_B03C();
  id v2 = objc_opt_class();
  id v3 = v2;
  id v4 = [v1 description];
  int v6 = 138412546;
  uint64_t v7 = v2;
  sub_B02C();
  sub_B014(&dword_0, v0, v5, "[%@]: Failed to fetch AFibBurden FeatureStatus with error: %@", (uint8_t *)&v6);
}

void sub_E324()
{
  sub_B03C();
  id v3 = v2;
  id v4 = (id)sub_B08C();
  uint64_t v5 = [v0 description];
  sub_B02C();
  sub_AFF4(&dword_0, v6, v7, "[%@]: Failed to fetch Heart Rate Notifications FeatureStatus with error: %@", v8, v9, v10, v11, 2u);
}

void sub_E3D8()
{
  sub_B03C();
  id v2 = v1;
  id v3 = (id)sub_B08C();
  sub_AFF4(&dword_0, v4, v5, "[%{public}@]: Omitting IRN section; failed to determine IRN feature status: %@",
    v6,
    v7,
    v8,
    v9,
    2u);
}

void sub_E47C()
{
  sub_B03C();
  id v3 = v2;
  id v4 = (id)sub_B08C();
  uint64_t v5 = [v0 description];
  sub_B02C();
  sub_AFF4(&dword_0, v6, v7, "[%{public}@]: Failed to fetch CardioFitness FeatureStatus with error: %@", v8, v9, v10, v11, 2u);
}

void sub_E530(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 description];
  int v6 = 136446466;
  uint64_t v7 = "-[HPRFHeartRateSettingsController specifiers]";
  sub_B02C();
  sub_B014(&dword_0, v3, v5, "[%{public}s]: Failed to fetch electrocardiogram's HKFeatureStatus with error: %@", (uint8_t *)&v6);
}

void sub_E5DC(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = sub_B0A4(v2);
  sub_B048(&dword_0, v4, v5, "[%@]: Electrocardiogram footer tapped, but no URL to present", v6, v7, v8, v9, v10);
}

void sub_E66C(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = sub_B0A4(v2);
  sub_B048(&dword_0, v4, v5, "[%{public}@]: IRN footer tapped, but no URL to present", v6, v7, v8, v9, v10);
}

void sub_E6FC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  sub_B014(&dword_0, a3, (uint64_t)a3, "[%{public}@]: Failed to set IRN setting state: %{public}@", (uint8_t *)&v4);
}

void sub_E780()
{
  sub_B03C();
  id v2 = v1;
  uint64_t v3 = (void *)sub_B08C();
  id v4 = sub_B068(v3);
  sub_AFF4(&dword_0, v5, v6, "[%{public}@]: Failed to determine IRN status; reporting 'off': %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11);
}

void sub_E810(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = objc_opt_class();
  id v4 = sub_B0A4(v3);
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "[%@]: AFibBurden footer tapped, but no URL to present", v5, 0xCu);
}

void sub_E8A0()
{
  sub_B03C();
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
  id v4 = [v1 localizedDescription];
  int v6 = 138543618;
  id v7 = WeakRetained;
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  sub_B014(&dword_0, v0, v5, "[%{public}@] Failed to set AFibBurden enabled with error: %{public}@", (uint8_t *)&v6);
}

void sub_E958(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  int v5 = 136446466;
  int v6 = "-[HPRFHeartRateSettingsController aFibBurdenEnabledValueWithSpecifier:]";
  sub_B02C();
  sub_B014(&dword_0, a2, v4, "[%{public}s]: Failed to fetch HKFeatureStatus with error: %@", (uint8_t *)&v5);
}

void sub_E9F4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class();
  id v3 = sub_B0A4(v2);
  sub_B048(&dword_0, v4, v5, "[%{public}@]: CardioFitness footer tapped, but no URL to present", v6, v7, v8, v9, v10);
}

void sub_EA84(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  __int16 v13 = [a3 localizedDescription];
  sub_AFF4(&dword_0, v7, v8, "[%{public}@] Failed to set CardioFitness enabled with error: %{public}@", v9, v10, v11, v12, 2u);
}

void sub_EB44(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 description];
  int v6 = 136446466;
  uint64_t v7 = "-[HPRFHeartRateSettingsController cardioFitnessNotificationsEnabledValueWithSpecifier:]";
  sub_B02C();
  sub_B014(&dword_0, v3, v5, "[%{public}s]: Failed to fetch HKFeatureStatus with error: %@", (uint8_t *)&v6);
}

void sub_EBF0(void *a1, void *a2, uint64_t *a3)
{
  uint64_t v5 = a1[5];
  int v6 = (const char *)a1[8];
  uint64_t v7 = a2;
  uint64_t v8 = NSStringFromSelector(v6);
  uint64_t v9 = a1[6];
  uint64_t v10 = a1[7];
  uint64_t v11 = *a3;
  int v12 = 138544386;
  uint64_t v13 = v5;
  __int16 v14 = 2114;
  v15 = v8;
  __int16 v16 = 2112;
  uint64_t v17 = v9;
  __int16 v18 = 2112;
  uint64_t v19 = v10;
  __int16 v20 = 2114;
  uint64_t v21 = v11;
  _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to schedule installation of app with bundle identifier(%@) on watch(%@) with error: %{public}@", (uint8_t *)&v12, 0x34u);
}

void sub_ECE4(uint64_t a1, void *a2, const char *a3)
{
  uint64_t v5 = a2;
  int v6 = NSStringFromSelector(a3);
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = 0;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to schedule installation of app with bundle identifier(%@) on watch", (uint8_t *)&v7, 0x20u);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t HKFeatureAvailabilityRescindedStatusFromHKFeatureAvailabilityOnboardedCountrySupportedState()
{
  return _HKFeatureAvailabilityRescindedStatusFromHKFeatureAvailabilityOnboardedCountrySupportedState();
}

uint64_t HKHRAFibBurdenLogForCategory()
{
  return _HKHRAFibBurdenLogForCategory();
}

uint64_t HKHRAFibBurdenOnboardingDeepLink()
{
  return _HKHRAFibBurdenOnboardingDeepLink();
}

uint64_t HKHRCardioFitnessEventOnboardingDeepLink()
{
  return _HKHRCardioFitnessEventOnboardingDeepLink();
}

uint64_t HKHRIrregularRhythmNotificationsBridgeSettingsWithFeatureStatus()
{
  return _HKHRIrregularRhythmNotificationsBridgeSettingsWithFeatureStatus();
}

uint64_t HKHeartRateLocalizedString()
{
  return _HKHeartRateLocalizedString();
}

uint64_t HKSynchronizeNanoPreferencesUserDefaults()
{
  return _HKSynchronizeNanoPreferencesUserDefaults();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIInterfaceGetContentDisabledAlpha()
{
  return _UIInterfaceGetContentDisabledAlpha();
}

void UIRectFill(CGRect rect)
{
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__aFibBurdenOnboardingSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _aFibBurdenOnboardingSpecifier];
}

id objc_msgSend__aFibBurdenSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _aFibBurdenSwitchSpecifier];
}

id objc_msgSend__areIrregularRhythmNotificationsTurnedOn(void *a1, const char *a2, ...)
{
  return [a1 _areIrregularRhythmNotificationsTurnedOn];
}

id objc_msgSend__atrialFibrillationDetectionOnboardingSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _atrialFibrillationDetectionOnboardingSpecifier];
}

id objc_msgSend__atrialFibrillationDetectionSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _atrialFibrillationDetectionSwitchSpecifier];
}

id objc_msgSend__bradycardiaSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _bradycardiaSpecifier];
}

id objc_msgSend__cachedInstallStateByAppID(void *a1, const char *a2, ...)
{
  return [a1 _cachedInstallStateByAppID];
}

id objc_msgSend__cachedInstalledProgressByAppID(void *a1, const char *a2, ...)
{
  return [a1 _cachedInstalledProgressByAppID];
}

id objc_msgSend__cardioFitnessNotificationsSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _cardioFitnessNotificationsSwitchSpecifier];
}

id objc_msgSend__cardioFitnessOnboardingSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _cardioFitnessOnboardingSpecifier];
}

id objc_msgSend__electrocardiogramAppInstallSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _electrocardiogramAppInstallSpecifier];
}

id objc_msgSend__electrocardiogramHealthRoomSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _electrocardiogramHealthRoomSpecifier];
}

id objc_msgSend__electrocardiogramOnboardingSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _electrocardiogramOnboardingSpecifier];
}

id objc_msgSend__iconCache(void *a1, const char *a2, ...)
{
  return [a1 _iconCache];
}

id objc_msgSend__setUpAFibBurdenFeatureStatusManager(void *a1, const char *a2, ...)
{
  return [a1 _setUpAFibBurdenFeatureStatusManager];
}

id objc_msgSend__setUpCardioFitnessFeatureStatusManager(void *a1, const char *a2, ...)
{
  return [a1 _setUpCardioFitnessFeatureStatusManager];
}

id objc_msgSend__setUpElectrocardiogramFeatureStatusManager(void *a1, const char *a2, ...)
{
  return [a1 _setUpElectrocardiogramFeatureStatusManager];
}

id objc_msgSend__setUpHeartRateNotificationsFeatureStatusManager(void *a1, const char *a2, ...)
{
  return [a1 _setUpHeartRateNotificationsFeatureStatusManager];
}

id objc_msgSend__setUpHeartRhythmAvailability(void *a1, const char *a2, ...)
{
  return [a1 _setUpHeartRhythmAvailability];
}

id objc_msgSend__shouldReverseLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 _shouldReverseLayoutDirection];
}

id objc_msgSend__tachycardiaSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _tachycardiaSpecifier];
}

id objc_msgSend_aFibBurdenFooterURL(void *a1, const char *a2, ...)
{
  return [a1 aFibBurdenFooterURL];
}

id objc_msgSend_aFibBurdenSectionTitle(void *a1, const char *a2, ...)
{
  return [a1 aFibBurdenSectionTitle];
}

id objc_msgSend_aFibBurdenSetupTitleDescription(void *a1, const char *a2, ...)
{
  return [a1 aFibBurdenSetupTitleDescription];
}

id objc_msgSend_aFibBurdenTitleDescription(void *a1, const char *a2, ...)
{
  return [a1 aFibBurdenTitleDescription];
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return [a1 accessoryView];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
}

id objc_msgSend_activePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 activePairedDevice];
}

id objc_msgSend_applicationSpinnerView(void *a1, const char *a2, ...)
{
  return [a1 applicationSpinnerView];
}

id objc_msgSend_areAllRequirementsSatisfied(void *a1, const char *a2, ...)
{
  return [a1 areAllRequirementsSatisfied];
}

id objc_msgSend_areNotificationsOn(void *a1, const char *a2, ...)
{
  return [a1 areNotificationsOn];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_availabilityManager(void *a1, const char *a2, ...)
{
  return [a1 availabilityManager];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bradycardiaWarningThreshold(void *a1, const char *a2, ...)
{
  return [a1 bradycardiaWarningThreshold];
}

id objc_msgSend_bridgeSettings(void *a1, const char *a2, ...)
{
  return [a1 bridgeSettings];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cardioFitnessFooterURL(void *a1, const char *a2, ...)
{
  return [a1 cardioFitnessFooterURL];
}

id objc_msgSend_cardioFitnessSectionTitle(void *a1, const char *a2, ...)
{
  return [a1 cardioFitnessSectionTitle];
}

id objc_msgSend_cardioFitnessSetupTitleDescription(void *a1, const char *a2, ...)
{
  return [a1 cardioFitnessSetupTitleDescription];
}

id objc_msgSend_cardioFitnessTitleDescription(void *a1, const char *a2, ...)
{
  return [a1 cardioFitnessTitleDescription];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptionText(void *a1, const char *a2, ...)
{
  return [a1 descriptionText];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return [a1 directionalLayoutMargins];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_electrocardiogramFooterURL(void *a1, const char *a2, ...)
{
  return [a1 electrocardiogramFooterURL];
}

id objc_msgSend_electrocardiogramOnboardingCountryCode(void *a1, const char *a2, ...)
{
  return [a1 electrocardiogramOnboardingCountryCode];
}

id objc_msgSend_featureAvailabilityProviding(void *a1, const char *a2, ...)
{
  return [a1 featureAvailabilityProviding];
}

id objc_msgSend_featureIdentifier(void *a1, const char *a2, ...)
{
  return [a1 featureIdentifier];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_footer(void *a1, const char *a2, ...)
{
  return [a1 footer];
}

id objc_msgSend_footerLink(void *a1, const char *a2, ...)
{
  return [a1 footerLink];
}

id objc_msgSend_footerText(void *a1, const char *a2, ...)
{
  return [a1 footerText];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getLazyIconID(void *a1, const char *a2, ...)
{
  return [a1 getLazyIconID];
}

id objc_msgSend_headerText(void *a1, const char *a2, ...)
{
  return [a1 headerText];
}

id objc_msgSend_healthAppHidden(void *a1, const char *a2, ...)
{
  return [a1 healthAppHidden];
}

id objc_msgSend_heartRateThresholdOffDescription(void *a1, const char *a2, ...)
{
  return [a1 heartRateThresholdOffDescription];
}

id objc_msgSend_iconBottomToTitleFirstBaselineMultiplier(void *a1, const char *a2, ...)
{
  return [a1 iconBottomToTitleFirstBaselineMultiplier];
}

id objc_msgSend_iconImage(void *a1, const char *a2, ...)
{
  return [a1 iconImage];
}

id objc_msgSend_iconImageView(void *a1, const char *a2, ...)
{
  return [a1 iconImageView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageFlippedForRightToLeftLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 imageFlippedForRightToLeftLayoutDirection];
}

id objc_msgSend_installApp(void *a1, const char *a2, ...)
{
  return [a1 installApp];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_irregularHeartRhythmSetupTitleDescription(void *a1, const char *a2, ...)
{
  return [a1 irregularHeartRhythmSetupTitleDescription];
}

id objc_msgSend_irregularHeartRhythmTitleDescription(void *a1, const char *a2, ...)
{
  return [a1 irregularHeartRhythmTitleDescription];
}

id objc_msgSend_isBackgroundHeartRateEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBackgroundHeartRateEnabled];
}

id objc_msgSend_isBradycardiaDetectionSupportedOnActiveWatch(void *a1, const char *a2, ...)
{
  return [a1 isBradycardiaDetectionSupportedOnActiveWatch];
}

id objc_msgSend_isCompanionRegionCheckEnabledForActiveWatch(void *a1, const char *a2, ...)
{
  return [a1 isCompanionRegionCheckEnabledForActiveWatch];
}

id objc_msgSend_isDetectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 isDetectionEnabled];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isHeartRateEnabled(void *a1, const char *a2, ...)
{
  return [a1 isHeartRateEnabled];
}

id objc_msgSend_isSettingHidden(void *a1, const char *a2, ...)
{
  return [a1 isSettingHidden];
}

id objc_msgSend_isUserInteractionEnabled(void *a1, const char *a2, ...)
{
  return [a1 isUserInteractionEnabled];
}

id objc_msgSend_isWristDetectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWristDetectionEnabled];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_linkText(void *a1, const char *a2, ...)
{
  return [a1 linkText];
}

id objc_msgSend_linkURL(void *a1, const char *a2, ...)
{
  return [a1 linkURL];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedPaneTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedPaneTitle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_paneTitleLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 paneTitleLocalizationKey];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_prepareProgressIndicatorIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 prepareProgressIndicatorIfNeeded];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_requirementsEvaluationByContext(void *a1, const char *a2, ...)
{
  return [a1 requirementsEvaluationByContext];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sectionInfo(void *a1, const char *a2, ...)
{
  return [a1 sectionInfo];
}

id objc_msgSend_seedExpiredLinkURL(void *a1, const char *a2, ...)
{
  return [a1 seedExpiredLinkURL];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setStroke(void *a1, const char *a2, ...)
{
  return [a1 setStroke];
}

id objc_msgSend_settingEnabled(void *a1, const char *a2, ...)
{
  return [a1 settingEnabled];
}

id objc_msgSend_settingVisible(void *a1, const char *a2, ...)
{
  return [a1 settingVisible];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldLinkToOnboarding(void *a1, const char *a2, ...)
{
  return [a1 shouldLinkToOnboarding];
}

id objc_msgSend_showOnboarding(void *a1, const char *a2, ...)
{
  return [a1 showOnboarding];
}

id objc_msgSend_showProgressAnimation(void *a1, const char *a2, ...)
{
  return [a1 showProgressAnimation];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_stopProgressAnimation(void *a1, const char *a2, ...)
{
  return [a1 stopProgressAnimation];
}

id objc_msgSend_stopSpinnerView(void *a1, const char *a2, ...)
{
  return [a1 stopSpinnerView];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemOrangeColor];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_thresholdHeartRate(void *a1, const char *a2, ...)
{
  return [a1 thresholdHeartRate];
}

id objc_msgSend_thresholdHeartRateOptions(void *a1, const char *a2, ...)
{
  return [a1 thresholdHeartRateOptions];
}

id objc_msgSend_tinkerModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 tinkerModeEnabled];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_titleLastBaselineToDescriptionFirstBaseline(void *a1, const char *a2, ...)
{
  return [a1 titleLastBaselineToDescriptionFirstBaseline];
}

id objc_msgSend_titleText(void *a1, const char *a2, ...)
{
  return [a1 titleText];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topToIconTop(void *a1, const char *a2, ...)
{
  return [a1 topToIconTop];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_updateElectrocardiogramWatchAppInstallIsAllowed(void *a1, const char *a2, ...)
{
  return [a1 updateElectrocardiogramWatchAppInstallIsAllowed];
}

id objc_msgSend_updateOnboardingCompletionVersionCache(void *a1, const char *a2, ...)
{
  return [a1 updateOnboardingCompletionVersionCache];
}

id objc_msgSend_userInteractionEnabled(void *a1, const char *a2, ...)
{
  return [a1 userInteractionEnabled];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}