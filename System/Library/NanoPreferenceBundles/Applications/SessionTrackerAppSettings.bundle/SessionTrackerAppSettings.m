int64_t sub_3C98(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  PSSpecifier *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = [(PSSpecifier *)a2 name];
  v6 = [(PSSpecifier *)v4 name];

  v7 = [v5 localizedStandardCompare:v6];
  return (int64_t)v7;
}

void sub_42C4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 selectedPlaylistId];
  v4 = +[NMSMediaPinningManager sharedManager];
  v5 = [v4 workoutPlaylistID];

  _HKInitializeLogging();
  v6 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    v8 = v3;
    __int16 v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[workoutmusic] Workout playlist may have changed. Old ID: %@, new ID: %@", (uint8_t *)&v7, 0x16u);
  }
  if (v3 && !v5 || ([v3 isEqualToNumber:v5] & 1) == 0) {
    [v2 reloadSpecifiers];
  }
}

void sub_4500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_451C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_45D8;
  v5[3] = &unk_30DD0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_45D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setUserPlaylistSpecifiers:v1];

  id v4 = objc_loadWeakRetained(v2);
  [v4 reloadSpecifiers];
}

void sub_4BA0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    id v7 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[workoutmusic] MPModel request failed with error: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v11 = 0x3032000000;
  v12 = sub_4D78;
  v13 = sub_4D88;
  id v14 = +[NSMutableArray array];
  v8 = [v5 results];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4D90;
  v9[3] = &unk_30E20;
  v9[4] = &buf;
  [v8 enumerateItemsUsingBlock:v9];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_object_dispose(&buf, 8);
}

void sub_4D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_4D78(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4D88(uint64_t a1)
{
}

void sub_4D90(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = objc_alloc_init((Class)PSSpecifier);
  [v9 setCellType:3];
  id v4 = [v3 name];
  [v9 setName:v4];

  id v5 = [v3 identifiers];

  id v6 = [v5 library];
  id v7 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 persistentID]);

  v8 = +[NSString stringWithFormat:@"%@", v7];
  [v9 setIdentifier:v8];

  [v9 setProperty:v7 forKey:@"MusicSpecifierPropertyPlaylistID"];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v9];
}

void sub_552C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_6DA4(id a1, BOOL a2, NSError *a3)
{
  id v4 = a3;
  if (v4 && (_HKInitializeLogging(), id v5 = (void *)HKLogWorkouts, os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)))
  {
    sub_1FB6C(v5, v4);
    if (a2) {
      goto LABEL_6;
    }
  }
  else if (a2)
  {
    goto LABEL_6;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    sub_1FB38();
  }
LABEL_6:
}

void sub_6EB8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_6F58(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiers];
}

void sub_8170(id a1)
{
  qword_3D050 = objc_opt_new();

  _objc_release_x1();
}

void sub_853C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [*(id *)(a1 + 32) object];
  }
  else
  {
    id v6 = 0;
  }

  id v3 = [v6 endOfDocument];
  id v4 = [v6 endOfDocument];
  id v5 = [v6 textRangeFromPosition:v3 toPosition:v4];
  [v6 setSelectedTextRange:v5];
}

void sub_9638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_965C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9738;
  block[3] = &unk_31050;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v12);
}

void sub_9738(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_mainThread_handleLoadingActiveConfiguration:inactiveConfiguration:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_A1CC(id a1, BOOL a2)
{
  BOOL v2 = a2;
  _HKInitializeLogging();
  id v3 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Open url to Fitness app returned %d", (uint8_t *)v4, 8u);
  }
}

void sub_C418(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [*(id *)(a1 + 32) object];
  }
  else
  {
    id v6 = 0;
  }

  id v3 = [v6 endOfDocument];
  id v4 = [v6 endOfDocument];
  id v5 = [v6 textRangeFromPosition:v3 toPosition:v4];
  [v6 setSelectedTextRange:v5];
}

void sub_C58C(id a1)
{
  qword_3D060 = objc_opt_new();

  _objc_release_x1();
}

id sub_C9F4(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiers];
}

void sub_C9FC(uint64_t a1, void *a2)
{
  [a2 reloadSpecifierID:@"NFC_ENABLED_LABEL_ID"];
  _HKInitializeLogging();
  BOOL v2 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "connectedGymSessionTrackerSettingsDidChange called in Bridge", v3, 2u);
  }
}

void sub_CA78(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  id v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Did receive GuidedWorkoutPreferencesChangedNotification", buf, 2u);
  }
  [v2 reloadSpecifierID:@"GUIDED_WORKOUT_PREFETCH_LABEL_ID"];

  _HKInitializeLogging();
  id v4 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "guidedWorkoutSettingsDidChange called in Bridge", v5, 2u);
  }
}

void sub_CB48(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  id v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Did receive GuidedRunPreferencesChangedNotification", buf, 2u);
  }
  [v2 reloadSpecifierID:@"GUIDED_RUN_PREFETCH_LABEL_ID"];

  _HKInitializeLogging();
  id v4 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "guidedRunSettingsDidChange called in Bridge", v5, 2u);
  }
}

id sub_CC18()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_3D070;
  uint64_t v7 = qword_3D070;
  if (!qword_3D070)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_117BC;
    v3[3] = &unk_31240;
    v3[4] = &v4;
    sub_117BC((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_CCE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_CF04(uint64_t a1, int a2)
{
  _HKInitializeLogging();
  uint64_t v4 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 232);
    v7[0] = 67109376;
    v7[1] = v5;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[HPRFSessionTrackerAppSettingsController] old subscriber status: %d new subscriber status: %d", (uint8_t *)v7, 0xEu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 232) = a2;
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_EF60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    uint64_t v7 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[workoutmusic] MPModel request failed with error: %@", buf, 0xCu);
    }
  }
  __int16 v8 = [v5 results];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_F0AC;
  v11[3] = &unk_31150;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v12 = v9;
  uint64_t v13 = v10;
  [v8 enumerateItemsUsingBlock:v11];
}

void sub_F0AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifiers];
  id v5 = [v4 library];
  id v6 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v5 persistentID]);

  uint64_t v7 = +[NMSMediaPinningManager sharedManager];
  __int16 v8 = [v7 workoutPlaylistID];
  unsigned int v9 = [v6 isEqualToNumber:v8];

  if (v9)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_F1EC;
    block[3] = &unk_31128;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v13 = v10;
    uint64_t v14 = v11;
    id v15 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_F1EC(id *a1)
{
  id v5 = [a1[4] specifierForID:@"MUSIC_AUTOSTART_TITLE_ID"];
  uint64_t v2 = [a1[6] name];
  id v3 = a1[5];
  uint64_t v4 = (void *)v3[26];
  v3[26] = v2;

  [a1[5] reloadSpecifier:v5];
}

void sub_F388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_F3A4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showConfigurationDataSourceProviderSpecifiers:a2];
}

void sub_106BC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogWorkouts;
  BOOL v7 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[HPRFSessionTrackerAppSettings] fetchSubscriptionStatus error: %@", (uint8_t *)&v9, 0xCu);
    }
    __int16 v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (v7)
    {
      int v9 = 67109120;
      LODWORD(v10) = a2;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[HPRFSessionTrackerAppSettings] isSubscribed: %d", (uint8_t *)&v9, 8u);
    }
    __int16 v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

id sub_10A48(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) BOOLValue];
    return (id)FIUISetWorkoutNFCAllDayEnabled();
  }
  else
  {
    id v3 = *(void **)(a1 + 40);
    return _[v3 reloadSpecifierID:@"NFC_ENABLED_LABEL_ID" animated:1];
  }
}

id sub_11240(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_112BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_117A0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 233) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

Class sub_117BC(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_3D078)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_11900;
    v3[4] = &unk_31278;
    void v3[5] = v3;
    long long v4 = off_31260;
    uint64_t v5 = 0;
    qword_3D078 = _sl_dlopen();
    if (!qword_3D078)
    {
      abort_report_np();
LABEL_8:
      sub_1FD18();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NPKExpressGymKitAvailabilityManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_3D070 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_11900()
{
  uint64_t result = _sl_dlopen();
  qword_3D078 = result;
  return result;
}

void sub_11974(id a1)
{
  qword_3D088 = +[NSSet setWithObjects:@"EnableAutoPause", @"RunningAP", @"CyclingAP", @"NLPredictedActivityEndEnableNotification", @"NLPredictedActivityResumeEnableNotification", @"NLPredictedActivityStartEnableNotification", @"NLChordPressWorkoutPauseEnableNotification", @"NLVoiceFeedbackEnabled", 0];

  _objc_release_x1();
}

void sub_121E0(id a1)
{
  qword_3D090 = objc_opt_new();

  _objc_release_x1();
}

void sub_127E0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [*(id *)(a1 + 32) object];
  }
  else
  {
    id v6 = 0;
  }

  id v3 = [v6 endOfDocument];
  long long v4 = [v6 endOfDocument];
  uint64_t v5 = [v6 textRangeFromPosition:v3 toPosition:v4];
  [v6 setSelectedTextRange:v5];
}

id HPRFPointImageWithColor(void *a1)
{
  id v1 = a1;
  v5.width = 1.0;
  v5.height = 1.0;
  UIGraphicsBeginImageContext(v5);
  [v1 set];

  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 1.0;
  v6.size.height = 1.0;
  UIRectFill(v6);
  uint64_t v2 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v2;
}

void sub_134D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

__CFString *_LocalizedStringForMetricType(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = v6;
  __int16 v8 = &stru_31A20;
  uint64_t v9 = a1 - 1;
  id v10 = @"METRIC_ROLLING_PACE";
  CFStringRef v11 = @"METRIC_ACTIVE_ENERGY";
  switch(v9)
  {
    case 0:
      id v10 = @"METRIC_DISTANCE";
      goto LABEL_18;
    case 1:
      goto LABEL_7;
    case 2:
      id v10 = @"METRIC_DURATION";
      goto LABEL_18;
    case 3:
      id v12 = (char *)objc_msgSend(v5, "identifier", @"METRIC_ACTIVE_ENERGY");
      CFStringRef v13 = @"METRIC_CURRENT_PACE";
      CFStringRef v14 = @"METRIC_CURRENT_SPEED";
      goto LABEL_10;
    case 4:
      id v10 = @"METRIC_HEART_RATE";
      goto LABEL_18;
    case 6:
      CFStringRef v11 = @"METRIC_TOTAL_ENERGY";
LABEL_7:
      id v10 = [v6 localizationKeyForEnergyBaseKey:v11];
      if (!v10) {
        break;
      }
      goto LABEL_18;
    case 7:
      id v12 = (char *)objc_msgSend(v5, "identifier", @"METRIC_ACTIVE_ENERGY");
      CFStringRef v13 = @"METRIC_AVERAGE_PACE";
      CFStringRef v14 = @"METRIC_AVERAGE_SPEED";
LABEL_10:
      if (v12 == (unsigned char *)&dword_C + 1) {
        id v10 = (__CFString *)v14;
      }
      else {
        id v10 = (__CFString *)v13;
      }
      goto LABEL_18;
    case 8:
      id v10 = @"METRIC_LAPS";
      goto LABEL_18;
    case 9:
      id v10 = @"METRIC_ELEVATION";
      goto LABEL_18;
    case 13:
      goto LABEL_18;
    case 14:
      id v10 = @"METRIC_CURRENT_CADENCE";
      goto LABEL_18;
    case 15:
      id v10 = @"METRIC_AVERAGE_CADENCE";
      goto LABEL_18;
    case 16:
      id v10 = @"METRIC_GROUND_ELEVATION";
LABEL_18:
      id v15 = +[NSBundle bundleForClass:objc_opt_class()];
      __int16 v8 = [v15 localizedStringForKey:v10 value:&stru_31A20 table:@"SessionTrackerAppSettings"];

      break;
    default:
      break;
  }

  return v8;
}

void sub_14F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_14F4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_15008;
  v5[3] = &unk_30DD0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_15008(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_mainThread_handleCyclingPowerZonesConfiguration:", *(void *)(a1 + 32));
}

void sub_16054(id a1)
{
  qword_3D0A0 = objc_opt_new();

  _objc_release_x1();
}

id sub_175B4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) configuration];
  id v3 = +[WOCyclingPowerZonesConfigurationEditor resetManualZonesUsing:v2];
  [*(id *)(a1 + 32) setConfiguration:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 reloadSpecifiers];
}

id sub_18428(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  [v2 size];
  double v5 = v3 * v4;
  double v6 = *(double *)(a1 + 40);
  [*(id *)(a1 + 32) size];

  return _objc_msgSend(v2, "drawInRect:", 0.0, 0.0, v5, v6 * v7);
}

id CyclingPowerZonesConfigurationEditorBridge.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void FunctionalThresholdPowerBridge.init()()
{
}

id FunctionalThresholdPowerBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FunctionalThresholdPowerBridge();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FunctionalThresholdPowerBridge()
{
  return self;
}

id variable initialization expression of CyclingSensorsStoreBridge.cyclingSensorsStore()
{
  id v0 = objc_allocWithZone((Class)sub_1FF50());

  return [v0 init];
}

void sub_18814(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL CyclingPowerZonesConfigurationTypeBridge.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_18844(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_18858()
{
  Swift::UInt v1 = *v0;
  sub_203F0();
  sub_20400(v1);
  return sub_20410();
}

void sub_188A0()
{
  sub_20400(*v0);
}

Swift::Int sub_188CC()
{
  Swift::UInt v1 = *v0;
  sub_203F0();
  sub_20400(v1);
  return sub_20410();
}

void *sub_18910@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_18A34()
{
  uint64_t v0 = sub_20150();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  double v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  double v6 = (char *)v10 - v5;
  sub_20100();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for CyclingPowerZonesConfigurationType.manual(_:), v0);
  sub_1912C();
  sub_202C0();
  sub_202C0();
  if (v10[2] == v10[0] && v10[3] == v10[1]) {
    char v7 = 1;
  }
  else {
    char v7 = sub_203B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __int16 v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  return v7 & 1;
}

void *sub_18DBC()
{
  unint64_t v0 = sub_20120();
  unint64_t v1 = v0;
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v0 & 0xFFFFFFFFFFFFFF8));
    if (v2) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v2 = sub_20390();
  if (!v2) {
    goto LABEL_11;
  }
LABEL_3:
  id v10 = &_swiftEmptyArrayStorage;
  uint64_t result = (void *)sub_20350();
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = sub_20320();
      }
      else
      {
        uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
        swift_retain();
      }
      ++v4;
      double v6 = (objc_class *)type metadata accessor for CyclingPowerZoneBridge();
      char v7 = (char *)objc_allocWithZone(v6);
      *(void *)&v7[OBJC_IVAR___WOCyclingPowerZone_zone] = v5;
      v9.receiver = v7;
      v9.super_class = v6;
      objc_msgSendSuper2(&v9, "init");
      sub_20330();
      sub_20360();
      sub_20370();
      sub_20340();
    }
    while (v2 != v4);
    __int16 v8 = v10;
    swift_bridgeObjectRelease();
    return v8;
  }
  __break(1u);
  return result;
}

id sub_18F60(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  id v4 = a1;
  uint64_t v5 = a3();
  double v6 = (objc_class *)type metadata accessor for FunctionalThresholdPowerBridge();
  char v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR___WOFunctionalThresholdPower_functionalThresholdPower] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  id v8 = objc_msgSendSuper2(&v10, "init");

  return v8;
}

void CyclingPowerZonesConfigurationBridge.init()()
{
}

id CyclingPowerZonesConfigurationBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CyclingPowerZonesConfigurationBridge();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CyclingPowerZonesConfigurationBridge()
{
  return self;
}

unint64_t sub_190B8()
{
  unint64_t result = qword_3CD50;
  if (!qword_3CD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CD50);
  }
  return result;
}

ValueMetadata *type metadata accessor for CyclingPowerZonesConfigurationTypeBridge()
{
  return &type metadata for CyclingPowerZonesConfigurationTypeBridge;
}

unint64_t sub_1912C()
{
  unint64_t result = qword_3CD88;
  if (!qword_3CD88)
  {
    sub_20150();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CD88);
  }
  return result;
}

id sub_191C8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipKitHelper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TipKitHelper()
{
  return self;
}

void CyclingPowerZoneBridge.init()()
{
}

id CyclingPowerZoneBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CyclingPowerZoneBridge();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CyclingPowerZoneBridge()
{
  return self;
}

id CyclingSensorsStoreBridge.init()()
{
  uint64_t v1 = OBJC_IVAR___WOCyclingSensorsStore_cyclingSensorsStore;
  id v2 = objc_allocWithZone((Class)sub_1FF50());
  uint64_t v3 = v0;
  *(void *)&v0[v1] = [v2 init];

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for CyclingSensorsStoreBridge();
  return objc_msgSendSuper2(&v5, "init");
}

uint64_t type metadata accessor for CyclingSensorsStoreBridge()
{
  return self;
}

id CyclingSensorsStoreBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CyclingSensorsStoreBridge();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_198C0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_198F8(char a1)
{
  return sub_19900(a1, *(void *)(v1 + 16));
}

uint64_t sub_19900(char a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, a1 & 1);
}

id sub_19A98()
{
  return sub_1A060(type metadata accessor for QueriedExternalProviderBridge);
}

uint64_t type metadata accessor for QueriedExternalProviderBridge()
{
  return self;
}

void *sub_19B44()
{
  unint64_t v0 = sub_1FE50();
  unint64_t v1 = v0;
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v0 & 0xFFFFFFFFFFFFFF8));
    if (v2) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v2 = sub_20390();
  if (!v2) {
    goto LABEL_11;
  }
LABEL_3:
  objc_super v10 = &_swiftEmptyArrayStorage;
  unint64_t result = (void *)sub_20350();
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = sub_20320();
      }
      else
      {
        uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
        swift_retain();
      }
      ++v4;
      double v6 = (objc_class *)type metadata accessor for QueriedExternalProviderBridge();
      char v7 = (char *)objc_allocWithZone(v6);
      *(void *)&v7[OBJC_IVAR___WOQueriedExternalProviderBridge_externalProvider] = v5;
      v9.receiver = v7;
      v9.super_class = v6;
      objc_msgSendSuper2(&v9, "init");
      sub_20330();
      sub_20360();
      sub_20370();
      sub_20340();
    }
    while (v2 != v4);
    id v8 = v10;
    swift_bridgeObjectRelease();
    return v8;
  }
  __break(1u);
  return result;
}

unint64_t sub_19D2C(unint64_t result, uint64_t (*a2)(BOOL))
{
  if (a2)
  {
    if (result >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_20390();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v3 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
    }
    return a2(v3 != 0);
  }
  return result;
}

id sub_19F7C()
{
  sub_202A0();
  NSString v0 = sub_20280();
  swift_bridgeObjectRelease();

  return v0;
}

id sub_1A048()
{
  return sub_1A060(type metadata accessor for WorkoutConfigurationDataSourcesBridgedModel);
}

id sub_1A060(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for WorkoutConfigurationDataSourcesBridgedModel()
{
  return self;
}

uint64_t sub_1A0CC()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_1A10C(unint64_t a1)
{
  return sub_19D2C(a1, *(uint64_t (**)(BOOL))(v1 + 16));
}

uint64_t sub_1A114(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1A124(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1A134()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1A16C(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_1A184(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t CyclingPowerZonesSizeBridge.init(rawValue:)(uint64_t a1)
{
  return sub_1AE64(a1);
}

uint64_t sub_1A1F8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1AE64(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id static CyclingPowerZonesConfigurationEditorBridge.changeLowerBound(to:zoneIndex:using:)(uint64_t a1, uint64_t a2, double a3)
{
  return sub_1A274(a1, a2, (uint64_t (*)(uint64_t, void, double))&static CyclingPowerZonesConfigurationEditor.changeLowerBound(to:zoneIndex:using:), a3);
}

id static CyclingPowerZonesConfigurationEditorBridge.changeUpperBound(to:zoneIndex:using:)(uint64_t a1, uint64_t a2, double a3)
{
  return sub_1A274(a1, a2, (uint64_t (*)(uint64_t, void, double))&static CyclingPowerZonesConfigurationEditor.changeUpperBound(to:zoneIndex:using:), a3);
}

id sub_1A274(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void, double), double a4)
{
  sub_20200();
  uint64_t v8 = a3(a1, *(void *)(a2 + OBJC_IVAR___WOCyclingPowerZonesConfiguration_configuration), a4);
  objc_super v9 = (objc_class *)type metadata accessor for CyclingPowerZonesConfigurationBridge();
  objc_super v10 = (char *)objc_allocWithZone(v9);
  *(void *)&v10[OBJC_IVAR___WOCyclingPowerZonesConfiguration_configuration] = v8;
  v12.receiver = v10;
  v12.super_class = v9;
  return objc_msgSendSuper2(&v12, "init");
}

id sub_1A330(double a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, uint64_t (*a6)(uint64_t, uint64_t, double))
{
  sub_20200();
  uint64_t v10 = *(void *)&a5[OBJC_IVAR___WOCyclingPowerZonesConfiguration_configuration];
  CFStringRef v11 = a5;
  uint64_t v12 = a6(a4, v10, a1);
  CFStringRef v13 = (objc_class *)type metadata accessor for CyclingPowerZonesConfigurationBridge();
  CFStringRef v14 = (char *)objc_allocWithZone(v13);
  *(void *)&v14[OBJC_IVAR___WOCyclingPowerZonesConfiguration_configuration] = v12;
  v17.receiver = v14;
  v17.super_class = v13;
  id v15 = objc_msgSendSuper2(&v17, "init");

  return v15;
}

id static CyclingPowerZonesConfigurationEditorBridge.changeFunctionalThresholdPower(to:using:)()
{
  uint64_t v0 = sub_1FD90();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_20140();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20200();
  sub_20090();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for FunctionalThresholdPowerSource.other(_:), v1);
  sub_1FD70();
  sub_20070();
  uint64_t v5 = sub_201B0();
  swift_release();
  double v6 = (objc_class *)type metadata accessor for CyclingPowerZonesConfigurationBridge();
  char v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR___WOCyclingPowerZonesConfiguration_configuration] = v5;
  v9.receiver = v7;
  v9.super_class = v6;
  return objc_msgSendSuper2(&v9, "init");
}

id static CyclingPowerZonesConfigurationEditorBridge.changeZonesSize(to:using:)()
{
  uint64_t v0 = sub_1FF90();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20200();
  sub_1FF60();
  uint64_t v4 = sub_201C0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v5 = (objc_class *)type metadata accessor for CyclingPowerZonesConfigurationBridge();
  double v6 = (char *)objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR___WOCyclingPowerZonesConfiguration_configuration] = v4;
  v8.receiver = v6;
  v8.super_class = v5;
  return objc_msgSendSuper2(&v8, "init");
}

id static CyclingPowerZonesConfigurationEditorBridge.resetManualZones(using:)()
{
  sub_20200();
  uint64_t v0 = sub_201A0();
  uint64_t v1 = (objc_class *)type metadata accessor for CyclingPowerZonesConfigurationBridge();
  uint64_t v2 = (char *)objc_allocWithZone(v1);
  *(void *)&v2[OBJC_IVAR___WOCyclingPowerZonesConfiguration_configuration] = v0;
  v4.receiver = v2;
  v4.super_class = v1;
  return objc_msgSendSuper2(&v4, "init");
}

uint64_t static CyclingPowerZonesConfigurationEditorBridge.isManualZonesEqualToAutomatic(using:)()
{
  return sub_201E0() & 1;
}

id CyclingPowerZonesConfigurationEditorBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CyclingPowerZonesConfigurationEditorBridge();
  return objc_msgSendSuper2(&v2, "init");
}

id CyclingPowerZonesConfigurationEditorBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CyclingPowerZonesConfigurationEditorBridge();
  return objc_msgSendSuper2(&v2, "dealloc");
}

char *sub_1AD48(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1AD68(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_1AD68(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1B2B0(&qword_3CEA8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  CFStringRef v13 = v10 + 32;
  CFStringRef v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_1AE64(uint64_t result)
{
  if ((unint64_t)(result - 9) < 0xFFFFFFFFFFFFFFFCLL) {
    return 0;
  }
  return result;
}

id _s25SessionTrackerAppSettings42CyclingPowerZonesConfigurationEditorBridgeC06changeH4Type2to5usingAA0efghJ0CAA0efghlJ0O_AHtFZ_0(uint64_t a1)
{
  uint64_t v2 = sub_20150();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    unint64_t v6 = (unsigned int *)&enum case for CyclingPowerZonesConfigurationType.automatic(_:);
LABEL_5:
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *v6, v2);
    sub_20200();
    uint64_t v7 = sub_201D0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v8 = (objc_class *)type metadata accessor for CyclingPowerZonesConfigurationBridge();
    uint64_t v9 = (char *)objc_allocWithZone(v8);
    *(void *)&v9[OBJC_IVAR___WOCyclingPowerZonesConfiguration_configuration] = v7;
    v11.receiver = v9;
    v11.super_class = v8;
    return objc_msgSendSuper2(&v11, "init");
  }
  if (a1 == 1)
  {
    unint64_t v6 = (unsigned int *)&enum case for CyclingPowerZonesConfigurationType.manual(_:);
    goto LABEL_5;
  }
  id result = (id)sub_20380();
  __break(1u);
  return result;
}

void *_s25SessionTrackerAppSettings42CyclingPowerZonesConfigurationEditorBridgeC17allSupportedSizesSaySiGyFZ_0()
{
  uint64_t v0 = sub_1FF90();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1FF70();
  int64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    v20 = &_swiftEmptyArrayStorage;
    sub_1AD48(0, v5, 0);
    uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
    uint64_t v6 = v1 + 16;
    uint64_t v8 = *(unsigned __int8 *)(v6 + 64);
    uint64_t v17 = v4;
    uint64_t v9 = v4 + ((v8 + 32) & ~v8);
    uint64_t v18 = *(void *)(v6 + 56);
    v19 = v7;
    uint64_t v10 = (void (**)(char *, uint64_t))(v6 - 8);
    do
    {
      uint64_t v11 = v6;
      v19(v3, v9, v0);
      uint64_t v12 = sub_1FF80();
      (*v10)(v3, v0);
      CFStringRef v13 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1AD48(0, v13[2] + 1, 1);
        CFStringRef v13 = v20;
      }
      unint64_t v15 = v13[2];
      unint64_t v14 = v13[3];
      if (v15 >= v14 >> 1)
      {
        sub_1AD48((char *)(v14 > 1), v15 + 1, 1);
        CFStringRef v13 = v20;
      }
      v13[2] = v15 + 1;
      v13[v15 + 4] = v12;
      v9 += v18;
      --v5;
      uint64_t v6 = v11;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return v13;
}

uint64_t type metadata accessor for CyclingPowerZonesConfigurationEditorBridge()
{
  return self;
}

unint64_t sub_1B24C()
{
  unint64_t result = qword_3CE78;
  if (!qword_3CE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CE78);
  }
  return result;
}

ValueMetadata *type metadata accessor for CyclingPowerZonesSizeBridge()
{
  return &type metadata for CyclingPowerZonesSizeBridge;
}

uint64_t sub_1B2B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id sub_1B3A8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    NSString v7 = sub_20280();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for SubtitleMultilineCell();
  id v8 = objc_msgSendSuper2(&v11, "initWithStyle:reuseIdentifier:specifier:", a1, v7, a4);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

id sub_1B590()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SubtitleMultilineCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SubtitleMultilineCell()
{
  return self;
}

uint64_t CyclingPowerZonesConfigurationStoreBridge.fetchCyclingPowerZonesConfiguration(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_20170();

  return swift_release();
}

void sub_1B704(uint64_t a1, void (*a2)(id, uint64_t))
{
  uint64_t v4 = (objc_class *)type metadata accessor for CyclingPowerZonesConfigurationBridge();
  int64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR___WOCyclingPowerZonesConfiguration_configuration] = a1;
  v8.receiver = v5;
  v8.super_class = v4;
  swift_retain();
  id v6 = objc_msgSendSuper2(&v8, "init");
  a2(v6, v7);
}

uint64_t sub_1B78C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1B7C4(uint64_t a1)
{
  sub_1B704(a1, *(void (**)(id, uint64_t))(v1 + 16));
}

uint64_t CyclingPowerZonesConfigurationStoreBridge.saveCyclingPowerZonesConfiguration(_:)()
{
  return sub_20160();
}

void CyclingPowerZonesConfigurationStoreBridge.init()()
{
}

id CyclingPowerZonesConfigurationStoreBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CyclingPowerZonesConfigurationStoreBridge();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CyclingPowerZonesConfigurationStoreBridge()
{
  return self;
}

uint64_t sub_1BA20()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1BA58()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

id sub_1BA74(double a1)
{
  sub_20240();
  if (v2)
  {
    id result = (id)sub_1FEA0();
    double v4 = v8 + a1;
  }
  else
  {
    sub_20210();
    double v4 = v3;
    id result = (id)sub_1FEA0();
    double v7 = v6 + a1;
    if (v4 <= v7) {
      double v4 = v7;
    }
  }
  if (v4 < a1)
  {
    __break(1u);
  }
  else
  {
    sub_20220();
    sub_1FED0();
    swift_allocObject();
    uint64_t v9 = sub_1FE90();
    uint64_t v10 = (objc_class *)type metadata accessor for HeartRateZoneBridge();
    objc_super v11 = (char *)objc_allocWithZone(v10);
    *(void *)&v11[OBJC_IVAR___WOHeartRateZone_heartRateZone] = v9;
    v12.receiver = v11;
    v12.super_class = v10;
    return objc_msgSendSuper2(&v12, "init");
  }
  return result;
}

id sub_1BBAC(double a1)
{
  id result = (id)sub_20230();
  double v3 = 0.0;
  if ((v4 & 1) == 0)
  {
    sub_20210();
    double v3 = v5;
    id result = (id)sub_1FEA0();
    double v7 = a1 - v6;
    if (v7 < v3) {
      double v3 = v7;
    }
  }
  if (v3 > a1)
  {
    __break(1u);
  }
  else
  {
    sub_20220();
    sub_1FED0();
    swift_allocObject();
    uint64_t v8 = sub_1FE90();
    uint64_t v9 = (objc_class *)type metadata accessor for HeartRateZoneBridge();
    uint64_t v10 = (char *)objc_allocWithZone(v9);
    *(void *)&v10[OBJC_IVAR___WOHeartRateZone_heartRateZone] = v8;
    v11.receiver = v10;
    v11.super_class = v9;
    return objc_msgSendSuper2(&v11, "init");
  }
  return result;
}

double sub_1BF08(void *a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v5 = sub_1FEC0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *a3, v5);
  id v9 = a1;
  sub_1FEB0();
  double v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11;
}

double sub_1C02C(void *a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v5 = sub_1FEC0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *a3, v5);
  id v9 = a1;
  sub_1FEB0();
  double v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11;
}

uint64_t HeartRateZoneBridge.description.getter()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for HeartRateZoneBridge();
  id v1 = objc_msgSendSuper2(&v4, "description");
  uint64_t v2 = sub_20290();

  sub_20310(18);
  swift_bridgeObjectRelease();
  sub_1FED0();
  sub_1DD00(&qword_3CF10, (void (*)(uint64_t))&type metadata accessor for HeartRateZone);
  swift_retain();
  v5._countAndFlagsBits = sub_203A0();
  sub_202B0(v5);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v6._countAndFlagsBits = 0xD000000000000010;
  v6._object = (void *)0x800000000002CA40;
  sub_202B0(v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t type metadata accessor for HeartRateZoneBridge()
{
  return self;
}

void HeartRateZoneBridge.init()()
{
}

id HeartRateZoneBridge.__deallocating_deinit()
{
  return sub_1D1E0(type metadata accessor for HeartRateZoneBridge);
}

uint64_t HeartRateConfigurationBridge.configurationType.getter()
{
  return *(void *)(v0 + OBJC_IVAR___WOHeartRateConfiguration_configurationType);
}

uint64_t HeartRateConfigurationBridge.isEditable.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WOHeartRateConfiguration_isEditable);
}

void *HeartRateConfigurationBridge.maximumHeartRate.getter()
{
  id v1 = *(void **)(v0 + OBJC_IVAR___WOHeartRateConfiguration_maximumHeartRate);
  id v2 = v1;
  return v1;
}

void *HeartRateConfigurationBridge.restingHeartRate.getter()
{
  id v1 = *(void **)(v0 + OBJC_IVAR___WOHeartRateConfiguration_restingHeartRate);
  id v2 = v1;
  return v1;
}

uint64_t HeartRateConfigurationBridge.hasDefaultRestingHeartRate.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WOHeartRateConfiguration_hasDefaultRestingHeartRate);
}

uint64_t HeartRateConfigurationBridge.zones.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HeartRateConfigurationBridge.zones.setter(uint64_t a1)
{
  double v3 = (void *)(v1 + OBJC_IVAR___WOHeartRateConfiguration_zones);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*HeartRateConfigurationBridge.zones.modify())()
{
  return j__swift_endAccess;
}

void HeartRateConfigurationBridge.init()()
{
}

id HeartRateConfigurationBridge.__deallocating_deinit()
{
  return sub_1D1E0(type metadata accessor for HeartRateConfigurationBridge);
}

uint64_t HeartRateConfigurationRequestBridge.fetchHeartRateConfiguration(completion:)(uint64_t a1, uint64_t a2)
{
  return sub_1CA2C(a1, a2);
}

void sub_1C878(uint64_t a1, void (*a2)(void))
{
  if (a1)
  {
    id v3 = objc_allocWithZone((Class)type metadata accessor for HeartRateConfigurationBridge());
    swift_retain();
    id v4 = sub_1D4E0();
    a2();
    swift_release();
  }
  else
  {
    a2();
  }
}

uint64_t HeartRateConfigurationRequestBridge.fetchActiveAndInactiveConfiguration(completion:)(uint64_t a1, uint64_t a2)
{
  return sub_1CA2C(a1, a2);
}

uint64_t sub_1CA2C(uint64_t a1, uint64_t a2)
{
  sub_200E0();
  swift_allocObject();
  sub_200D0();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_200A0();
  swift_release();

  return swift_release();
}

uint64_t sub_1CAD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1FFD0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  double v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  objc_super v12 = (char *)v19 - v11;
  if (a1)
  {
    swift_retain();
    sub_1FFF0();
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for HeartRateConfiguration.ConfigurationType.automatic(_:), v6);
    sub_1DD00(&qword_3CFC8, (void (*)(uint64_t))&type metadata accessor for HeartRateConfiguration.ConfigurationType);
    sub_202C0();
    sub_202C0();
    uint64_t v14 = v19[0];
    uint64_t v13 = v19[1];
    unint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
    v15(v10, v6);
    v15(v12, v6);
    sub_200E0();
    swift_allocObject();
    sub_200D0();
    v16 = (void *)swift_allocObject();
    v16[2] = a2;
    v16[3] = a3;
    v16[4] = a1;
    swift_retain();
    swift_retain();
    if (v13 == v14) {
      sub_200B0();
    }
    else {
      sub_200C0();
    }
    swift_release();
    swift_release();
    return swift_release();
  }
  else
  {
    sub_200E0();
    swift_allocObject();
    sub_200D0();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a2;
    *(void *)(v17 + 24) = a3;
    swift_retain();
    sub_200B0();
    swift_release();
    return swift_release();
  }
}

void sub_1CE00(uint64_t a1, void (*a2)(void, id))
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for HeartRateConfigurationBridge());
  swift_retain();
  id v4 = sub_1D4E0();
  swift_release();
  a2(0, v4);
}

void sub_1CE84(uint64_t a1, void (*a2)(id, id))
{
  id v3 = (objc_class *)type metadata accessor for HeartRateConfigurationBridge();
  id v4 = objc_allocWithZone(v3);
  swift_retain();
  id v5 = sub_1D4E0();
  swift_release();
  id v6 = objc_allocWithZone(v3);
  swift_retain();
  id v7 = sub_1D4E0();
  swift_release();
  a2(v5, v7);
}

void sub_1CF48(uint64_t a1, void (*a2)(id, id))
{
  if (a1)
  {
    id v3 = (objc_class *)type metadata accessor for HeartRateConfigurationBridge();
    id v4 = objc_allocWithZone(v3);
    swift_retain();
    swift_retain();
    id v5 = sub_1D4E0();
    swift_release();
    id v6 = objc_allocWithZone(v3);
    swift_retain();
    id v8 = sub_1D4E0();
    swift_release();
    a2(v5, v8);
    swift_release();
  }
  else
  {
    id v7 = objc_allocWithZone((Class)type metadata accessor for HeartRateConfigurationBridge());
    swift_retain();
    id v8 = sub_1D4E0();
    swift_release();
    a2(v8, 0);
  }
}

id HeartRateConfigurationRequestBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeartRateConfigurationRequestBridge();
  return objc_msgSendSuper2(&v2, "init");
}

id HeartRateConfigurationRequestBridge.__deallocating_deinit()
{
  return sub_1D1E0(type metadata accessor for HeartRateConfigurationRequestBridge);
}

id sub_1D1E0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

void *sub_1D218(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_20390();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if (v2)
  {
    unint64_t v15 = &_swiftEmptyArrayStorage;
    id result = (void *)sub_20350();
    if (v2 < 0)
    {
      __break(1u);
      goto LABEL_26;
    }
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v4 = 0;
      do
      {
        uint64_t v5 = v4 + 1;
        sub_20320();
        swift_retain();
        swift_unknownObjectRelease();
        sub_20330();
        sub_20360();
        sub_20370();
        sub_20340();
        uint64_t v4 = v5;
      }
      while (v2 != v5);
    }
    else
    {
      unint64_t v6 = a1 + 32;
      do
      {
        v6 += 8;
        swift_retain();
        sub_20330();
        sub_20360();
        sub_20370();
        sub_20340();
        --v2;
      }
      while (v2);
    }
  }
  unint64_t v7 = sub_202F0();
  swift_bridgeObjectRelease();
  if (!(v7 >> 62))
  {
    uint64_t v8 = *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8));
    if (v8) {
      goto LABEL_14;
    }
LABEL_23:
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_20390();
  swift_bridgeObjectRelease();
  if (!v8) {
    goto LABEL_23;
  }
LABEL_14:
  unint64_t v15 = &_swiftEmptyArrayStorage;
  id result = (void *)sub_20350();
  if ((v8 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = 0;
    do
    {
      if ((v7 & 0xC000000000000001) != 0)
      {
        uint64_t v10 = sub_20320();
      }
      else
      {
        uint64_t v10 = *(void *)(v7 + 8 * v9 + 32);
        swift_retain();
      }
      ++v9;
      uint64_t v11 = (objc_class *)type metadata accessor for HeartRateZoneBridge();
      objc_super v12 = (char *)objc_allocWithZone(v11);
      *(void *)&v12[OBJC_IVAR___WOHeartRateZone_heartRateZone] = v10;
      v14.receiver = v12;
      v14.super_class = v11;
      objc_msgSendSuper2(&v14, "init");
      sub_20330();
      sub_20360();
      sub_20370();
      sub_20340();
    }
    while (v8 != v9);
    uint64_t v13 = v15;
    swift_bridgeObjectRelease();
    return v13;
  }
LABEL_26:
  __break(1u);
  return result;
}

id sub_1D4E0()
{
  uint64_t v1 = sub_1FFD0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v7 = (char *)&v23 - v6;
  uint64_t v8 = v0;
  sub_1FFF0();
  LODWORD(v24) = enum case for HeartRateConfiguration.ConfigurationType.manual(_:);
  v23 = *(void (**)(char *))(v2 + 104);
  v23(v5);
  sub_1DD00(&qword_3CFC8, (void (*)(uint64_t))&type metadata accessor for HeartRateConfiguration.ConfigurationType);
  sub_202C0();
  sub_202C0();
  BOOL v9 = v28 == v27;
  uint64_t v10 = *(void (**)(char *, uint64_t))(v2 + 8);
  v10(v5, v1);
  v10(v7, v1);
  *(void *)&v8[OBJC_IVAR___WOHeartRateConfiguration_configurationType] = v9;
  sub_1FFF0();
  ((void (*)(char *, void, uint64_t))v23)(v5, v24, v1);
  sub_202C0();
  sub_202C0();
  LOBYTE(v9) = v28 == v27;
  v10(v5, v1);
  v10(v7, v1);
  v8[OBJC_IVAR___WOHeartRateConfiguration_isEditable] = v9;
  *(void *)&v8[OBJC_IVAR___WOHeartRateConfiguration_maximumHeartRate] = sub_1FFB0();
  *(void *)&v8[OBJC_IVAR___WOHeartRateConfiguration_restingHeartRate] = sub_1FFC0();
  char v11 = sub_1FFA0();
  v24 = v8;
  v8[OBJC_IVAR___WOHeartRateConfiguration_hasDefaultRestingHeartRate] = v11 & 1;
  unint64_t v12 = sub_20010();
  unint64_t v13 = v12;
  if (!(v12 >> 62))
  {
    uint64_t v14 = *(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFFF8));
    if (v14) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    v20 = &_swiftEmptyArrayStorage;
LABEL_12:
    v21 = v24;
    *(void *)&v24[OBJC_IVAR___WOHeartRateConfiguration_zones] = v20;

    v22 = (objc_class *)type metadata accessor for HeartRateConfigurationBridge();
    v25.receiver = v21;
    v25.super_class = v22;
    return objc_msgSendSuper2(&v25, "init");
  }
  uint64_t v14 = sub_20390();
  if (!v14) {
    goto LABEL_11;
  }
LABEL_3:
  v28 = &_swiftEmptyArrayStorage;
  id result = (id)sub_20350();
  if ((v14 & 0x8000000000000000) == 0)
  {
    uint64_t v16 = 0;
    do
    {
      if ((v13 & 0xC000000000000001) != 0)
      {
        uint64_t v17 = sub_20320();
      }
      else
      {
        uint64_t v17 = *(void *)(v13 + 8 * v16 + 32);
        swift_retain();
      }
      ++v16;
      uint64_t v18 = (objc_class *)type metadata accessor for HeartRateZoneBridge();
      v19 = (char *)objc_allocWithZone(v18);
      *(void *)&v19[OBJC_IVAR___WOHeartRateZone_heartRateZone] = v17;
      v26.receiver = v19;
      v26.super_class = v18;
      objc_msgSendSuper2(&v26, "init");
      sub_20330();
      sub_20360();
      sub_20370();
      sub_20340();
    }
    while (v14 != v16);
    v20 = v28;
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t _s25SessionTrackerAppSettings28HeartRateConfigurationBridgeC3set17configurationTypeyAA0gkH0O_tFZ_0(uint64_t a1)
{
  uint64_t v2 = sub_1FFD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    uint64_t v6 = (unsigned int *)&enum case for HeartRateConfiguration.ConfigurationType.automatic(_:);
LABEL_5:
    sub_20020();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *v6, v2);
    sub_20000();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  if (a1 == 1)
  {
    uint64_t v6 = (unsigned int *)&enum case for HeartRateConfiguration.ConfigurationType.manual(_:);
    goto LABEL_5;
  }
  v8[1] = a1;
  uint64_t result = sub_203C0();
  __break(1u);
  return result;
}

uint64_t _s25SessionTrackerAppSettings28HeartRateConfigurationBridgeC13setConfigured5zonesySayAA0ef4ZoneH0CGSg_tFZ_0(unint64_t a1)
{
  if (a1)
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v2 = sub_20390();
      if (v2) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (v2)
      {
LABEL_4:
        uint64_t result = sub_20350();
        if (v2 < 0)
        {
          __break(1u);
          return result;
        }
        if ((a1 & 0xC000000000000001) != 0)
        {
          uint64_t v4 = 0;
          do
          {
            uint64_t v5 = v4 + 1;
            sub_20320();
            swift_retain();
            swift_unknownObjectRelease();
            sub_20330();
            sub_20360();
            sub_20370();
            sub_20340();
            uint64_t v4 = v5;
          }
          while (v2 != v5);
        }
        else
        {
          unint64_t v6 = a1 + 32;
          do
          {
            v6 += 8;
            swift_retain();
            sub_20330();
            sub_20360();
            sub_20370();
            sub_20340();
            --v2;
          }
          while (v2);
        }
      }
    }
    swift_bridgeObjectRelease();
  }
  sub_20020();
  sub_1FFE0();

  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for HeartRateConfigurationBridge()
{
  return self;
}

uint64_t sub_1DBD4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1DC0C(uint64_t a1)
{
  sub_1C878(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_1DC14(uint64_t a1)
{
  return sub_1CAD0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t type metadata accessor for HeartRateConfigurationRequestBridge()
{
  return self;
}

unint64_t sub_1DC44()
{
  unint64_t result = qword_3CF48;
  if (!qword_3CF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CF48);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfigurationTypeBridge()
{
  return &type metadata for ConfigurationTypeBridge;
}

uint64_t sub_1DCA8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1DCE0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_1DCF8(uint64_t a1)
{
  sub_1CE00(a1, *(void (**)(void, id))(v1 + 16));
}

uint64_t sub_1DD00(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1DD4C(uint64_t a1)
{
  sub_1CF48(a1, *(void (**)(id, id))(v1 + 16));
}

uint64_t sub_1DD5C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_1DD9C(uint64_t a1)
{
  sub_1CE84(a1, *(void (**)(id, id))(v1 + 16));
}

id sub_1DDC8(void *a1)
{
  sub_1FDD0();
  v9[3] = sub_1F874(0, &qword_3D038);
  v9[4] = &protocol witness table for _HKWheelchairUseCharacteristicCache;
  v9[0] = a1;
  sub_1F874(0, &qword_3D040);
  uint64_t v3 = v1;
  id v4 = a1;
  uint64_t v5 = (void *)sub_20300();
  sub_1FDB0();

  sub_1F8B0((uint64_t)v9);
  sub_1B2B0(&qword_3D048);
  sub_1FDC0();
  sub_20270();
  swift_unknownObjectRetain();
  sub_20300();
  *(void *)&v3[OBJC_IVAR___HPRFSessionTrackerAppSettingsContext_subscriptionClient] = sub_20260();

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for SessionTrackerAppContext();
  id v6 = objc_msgSendSuper2(&v8, "init");
  swift_release();
  swift_unknownObjectRelease();

  return v6;
}

uint64_t sub_1DF58(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = a1;
  uint64_t v43 = sub_1B2B0(&qword_3D000);
  uint64_t v4 = *(void *)(v43 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = __chkstk_darwin(v43);
  unint64_t v7 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  BOOL v9 = (char *)&v39 - v8;
  uint64_t v46 = sub_1B2B0(&qword_3D008);
  uint64_t v44 = *(void *)(v46 - 8);
  uint64_t v10 = *(void *)(v44 + 64);
  uint64_t v11 = __chkstk_darwin(v46);
  v45 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v11);
  v42 = (char *)&v39 - v13;
  __chkstk_darwin(v12);
  v47 = (char *)&v39 - v14;
  uint64_t v15 = sub_1FE10();
  uint64_t v49 = *(void *)(v15 - 8);
  uint64_t v50 = v15;
  __chkstk_darwin(v15);
  v48 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1FE00();
  v40 = v9;
  sub_20250();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a1;
  *(void *)(v17 + 24) = a2;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_1E934;
  *(void *)(v18 + 24) = v17;
  uint64_t v19 = v43;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v43);
  unint64_t v20 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v21 = (v5 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v22 + v20, v7, v19);
  v23 = (uint64_t (**)(uint64_t))(v22 + v21);
  *v23 = sub_1EAB0;
  v23[1] = (uint64_t (*)(uint64_t))v18;
  uint64_t v39 = a2;
  swift_retain();
  v24 = v42;
  sub_1FE20();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v40, v19);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v41;
  *(void *)(v25 + 24) = a2;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_1EFE4;
  *(void *)(v26 + 24) = v25;
  uint64_t v27 = v44;
  v28 = v45;
  uint64_t v29 = v46;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v45, v24, v46);
  uint64_t v30 = v27;
  unint64_t v31 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  uint64_t v32 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v32 + v31, v28, v29);
  v33 = (uint64_t (**)(uint64_t))(v32 + ((v10 + v31 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v33 = sub_1F000;
  v33[1] = (uint64_t (*)(uint64_t))v26;
  swift_retain();
  v34 = v47;
  sub_1FE20();
  v35 = *(void (**)(char *, uint64_t))(v30 + 8);
  v35(v24, v29);
  v36 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_1FE30();
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = 0;
  *(void *)(v37 + 24) = 0;
  v36(sub_1F468, v37);
  swift_release();
  swift_release();
  v35(v34, v29);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v48, v50);
}

uint64_t sub_1E49C(uint64_t a1, uint64_t (*a2)(void, void))
{
  uint64_t v3 = sub_1FD90();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1FD80();
  char v7 = sub_1FDE0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return a2(v7 & 1, 0);
}

uint64_t sub_1E5A0(uint64_t a1, uint64_t (*a2)(void, uint64_t))
{
  sub_1B2B0(&qword_3D010);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2E040;
  uint64_t v5 = sub_1FD40();
  *(void *)(v4 + 56) = sub_1F874(0, &qword_3D018);
  *(void *)(v4 + 64) = sub_1F4E4();
  *(void *)(v4 + 32) = v5;
  sub_1FDA0();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  uint64_t v6 = sub_203E0();
  uint64_t v8 = v7;
  sub_1F54C();
  if (v6 == sub_203E0() && v8 == v9)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v10 = sub_203B0();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      return result;
    }
  }
  swift_getErrorValue();
  uint64_t v12 = sub_203D0();
  uint64_t result = sub_203D0();
  if (v12 == result) {
    return a2(0, a1);
  }
  return result;
}

void sub_1E7F4(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_1FD40();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

id sub_1E894()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SessionTrackerAppContext();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SessionTrackerAppContext()
{
  return self;
}

uint64_t sub_1E8FC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1E934(uint64_t a1)
{
  return sub_1E49C(a1, *(uint64_t (**)(void, void))(v1 + 16));
}

uint64_t sub_1E950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1FDF0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_retain();
  return sub_1FE20();
}

uint64_t sub_1EAB0(uint64_t a1)
{
  return sub_1E950(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1EAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a1;
  swift_retain();
  swift_errorRetain();

  return sub_1FE20();
}

uint64_t sub_1EB5C(void (*a1)(uint64_t *), uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t), uint64_t a4, uint64_t a5)
{
  a3(&v8, a5);
  uint64_t v6 = v8;
  char v9 = 0;
  a1(&v8);

  return sub_1F48C(v6, 0);
}

uint64_t sub_1EBF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1B2B0(&qword_3D008);
  char v9 = (void (*)(uint64_t (*)(uint64_t), void *))sub_1FE30();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  void v10[4] = a4;
  v10[5] = a5;
  swift_retain();
  swift_retain();
  v9(sub_1F470, v10);
  swift_release();

  return swift_release();
}

uint64_t sub_1ECBC(uint64_t a1, char a2, uint64_t (*a3)(uint64_t *), uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v10 = sub_1B2B0(&qword_3D008);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    a5(a1);
    uint64_t v15 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_1FE30();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a3;
    *(void *)(v16 + 24) = a4;
    swift_retain();
    v15(sub_1F468, v16);
    swift_release();
    swift_release();
    sub_1F48C(a1, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    uint64_t v17 = a1;
    char v18 = 0;
    return a3(&v17);
  }
}

uint64_t sub_1EE58(void (*a1)(uint64_t *), uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t), uint64_t a4, uint64_t a5)
{
  a3(&v8, a5);
  uint64_t v6 = v8;
  char v9 = 0;
  a1(&v8);

  return sub_1F48C(v6, 0);
}

uint64_t sub_1EEEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1B2B0(&qword_3D000);
  char v9 = (void (*)(uint64_t (*)(uint64_t), void *))sub_1FE30();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a5;
  void v10[4] = a1;
  v10[5] = a2;
  swift_retain();
  swift_retain();
  v9(sub_1F5E4, v10);
  swift_release();

  return swift_release();
}

uint64_t sub_1EFB8()
{
  return sub_1F014(&qword_3D000);
}

uint64_t sub_1EFC4(uint64_t a1, uint64_t a2)
{
  return sub_1F0D8(a1, a2, &qword_3D000, sub_1EEEC);
}

uint64_t sub_1EFE4(uint64_t a1)
{
  return sub_1E5A0(a1, *(uint64_t (**)(void, uint64_t))(v1 + 16));
}

uint64_t sub_1F000(uint64_t a1)
{
  return sub_1EAB8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1F008()
{
  return sub_1F014(&qword_3D008);
}

uint64_t sub_1F014(uint64_t *a1)
{
  uint64_t v2 = sub_1B2B0(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = ((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  swift_release();

  return _swift_deallocObject(v1, v7, v6);
}

uint64_t sub_1F0B8(uint64_t a1, uint64_t a2)
{
  return sub_1F0D8(a1, a2, &qword_3D008, sub_1EBF0);
}

uint64_t sub_1F0D8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(sub_1B2B0(a3) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v4 + v8;
  uint64_t v10 = (uint64_t *)(v4 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];

  return a4(a1, a2, v9, v11, v12);
}

uint64_t sub_1F19C(uint64_t a1, void (*a2)(char *), uint64_t a3, void (*a4)(uint64_t *), uint64_t a5)
{
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  v21[1] = a3;
  uint64_t v7 = sub_1B2B0(&qword_3D008);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1FDF0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1B2B0(&qword_3D030);
  __chkstk_darwin(v15);
  uint64_t v17 = (void *)((char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1F5F0(a1, (uint64_t)v17);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = *v17;
    char v25 = 1;
    swift_errorRetain();
    v22(&v24);
    swift_errorRelease();
    return swift_errorRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v12 + 32))(v14, v17, v11);
    a2(v14);
    uint64_t v19 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_1FE30();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v22;
    *(void *)(v20 + 24) = v23;
    swift_retain();
    v19(sub_1F468, v20);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1F470(uint64_t a1)
{
  return sub_1ECBC(*(void *)a1, *(unsigned char *)(a1 + 8), *(uint64_t (**)(uint64_t *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t))(v1 + 32));
}

uint64_t sub_1F48C(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_1F498()
{
  swift_release();
  swift_errorRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1F4D8(void (*a1)(uint64_t *), uint64_t a2)
{
  return sub_1EB5C(a1, a2, *(void (**)(uint64_t *__return_ptr, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

unint64_t sub_1F4E4()
{
  unint64_t result = qword_3D020;
  if (!qword_3D020)
  {
    sub_1F874(255, &qword_3D018);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D020);
  }
  return result;
}

unint64_t sub_1F54C()
{
  unint64_t result = qword_3D028;
  if (!qword_3D028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D028);
  }
  return result;
}

uint64_t sub_1F5A4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1F5E4(uint64_t a1)
{
  return sub_1F19C(a1, *(void (**)(char *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t *))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1F5F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B2B0(&qword_3D030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1F65C()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1F69C(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  char v3 = *(unsigned char *)(result + 8);
  uint64_t v4 = *(void *)result;
  char v5 = v3;
  if (v2) {
    return v2(&v4);
  }
  return result;
}

uint64_t sub_1F6E4()
{
  uint64_t v1 = sub_1FDF0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1F7B0(void (*a1)(uint64_t *), uint64_t a2)
{
  void (*v6)(uint64_t *__return_ptr, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t vars8;

  uint64_t v5 = *(void *)(sub_1FDF0() - 8);
  uint64_t v6 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1EE58(a1, a2, v6, v7, v8);
}

uint64_t sub_1F834()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1F86C(char a1, uint64_t a2)
{
  sub_1E7F4(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1F874(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1F8B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_1F90C()
{
  sub_6ED4();
  sub_6EB8(&dword_0, v0, v1, "Unexpected energy units. Setting energy units to Kilojoules.", v2, v3, v4, v5, v6);
}

void sub_1F940()
{
  sub_6ED4();
  sub_6EB8(&dword_0, v0, v1, "Unexpected pool length units feet. Setting pool length unit to yards.", v2, v3, v4, v5, v6);
}

void sub_1F974()
{
  sub_6ED4();
  sub_6EB8(&dword_0, v0, v1, "Unexpected pool length units miles. Setting pool length unit to yards.", v2, v3, v4, v5, v6);
}

void sub_1F9A8()
{
  sub_6ED4();
  sub_6EB8(&dword_0, v0, v1, "Unexpected pool length units kilometers. Setting pool length unit to meters.", v2, v3, v4, v5, v6);
}

void sub_1F9DC()
{
  sub_6ED4();
  sub_6EB8(&dword_0, v0, v1, "Unexpected workouts units yards. Setting workouts unit to miles", v2, v3, v4, v5, v6);
}

void sub_1FA10()
{
  sub_6ED4();
  sub_6EB8(&dword_0, v0, v1, "Unexpected workouts units feet. Setting workouts units to miles.", v2, v3, v4, v5, v6);
}

void sub_1FA44()
{
  sub_6ED4();
  sub_6EB8(&dword_0, v0, v1, "Unexpected workouts units meters. Setting workouts unit to kilometers.", v2, v3, v4, v5, v6);
}

void sub_1FA78(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = [a2 description];
  int v7 = 134218242;
  uint64_t v8 = a3;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Error storing track workouts unit (%li): %@", (uint8_t *)&v7, 0x16u);
}

void sub_1FB38()
{
  sub_6ED4();
  sub_6EB8(&dword_0, v0, v1, "Failed to force an HK sync.", v2, v3, v4, v5, v6);
}

void sub_1FB6C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 description];
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "Received an error forcing a HK sync: %@", (uint8_t *)&v5, 0xCu);
}

void sub_1FC14(uint64_t a1, void *a2, void *a3)
{
  int v5 = a2;
  uint8_t v6 = [a3 configuration];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Failed to retrieve a zone for specifier: %@ in configuration: %@", (uint8_t *)&v7, 0x16u);
}

void sub_1FCD4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[HPRFSessionTrackerAppSettings] Failed to find text range of link to the Gesture page", v1, 2u);
}

void sub_1FD18()
{
}

uint64_t sub_1FD40()
{
  return _convertErrorToNSError(_:)();
}

NSData sub_1FD50()
{
  return Data._bridgeToObjectiveC()();
}

NSDate sub_1FD60()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_1FD70()
{
  return static Date.now.getter();
}

uint64_t sub_1FD80()
{
  return Date.init()();
}

uint64_t sub_1FD90()
{
  return type metadata accessor for Date();
}

uint64_t sub_1FDA0()
{
  return NSLog(_:_:)();
}

uint64_t sub_1FDB0()
{
  return static Dependencies.browsing(wheelchairStatus:queue:)();
}

uint64_t sub_1FDC0()
{
  return dispatch thunk of Dependencies.resolve<A>(failureHandler:)();
}

uint64_t sub_1FDD0()
{
  return type metadata accessor for Dependencies();
}

uint64_t sub_1FDE0()
{
  return ServiceSubscription.isSubscribed(date:)();
}

uint64_t sub_1FDF0()
{
  return type metadata accessor for ServiceSubscription();
}

uint64_t sub_1FE00()
{
  return ServiceSubscriptionRequest.init(authenticationBehavior:cacheBehavior:)();
}

uint64_t sub_1FE10()
{
  return type metadata accessor for ServiceSubscriptionRequest();
}

uint64_t sub_1FE20()
{
  return Promise.init(asyncOperation:)();
}

uint64_t sub_1FE30()
{
  return Promise.operation.getter();
}

uint64_t sub_1FE40()
{
  return dispatch thunk of WorkoutConfigurationDataSourcesModel.updateExternalProvider(_:enable:completion:)();
}

uint64_t sub_1FE50()
{
  return dispatch thunk of WorkoutConfigurationDataSourcesModel.cachedExternalProviders.getter();
}

uint64_t sub_1FE60()
{
  return dispatch thunk of WorkoutConfigurationDataSourcesModel.reloadExternalProviders(_:)();
}

uint64_t sub_1FE70()
{
  return WorkoutConfigurationDataSourcesModel.init()();
}

uint64_t sub_1FE80()
{
  return type metadata accessor for WorkoutConfigurationDataSourcesModel();
}

uint64_t sub_1FE90()
{
  return HeartRateZone.init(displaySpan:configuration:)();
}

uint64_t sub_1FEA0()
{
  return HeartRateZone.minimumSpan.getter();
}

uint64_t sub_1FEB0()
{
  return HeartRateZone.configurableSpan(bound:)();
}

uint64_t sub_1FEC0()
{
  return type metadata accessor for HeartRateZone.Bound();
}

uint64_t sub_1FED0()
{
  return type metadata accessor for HeartRateZone();
}

uint64_t sub_1FEE0()
{
  return CyclingPowerZone.lowerBound.getter();
}

uint64_t sub_1FEF0()
{
  return CyclingPowerZone.upperBound.getter();
}

uint64_t sub_1FF00()
{
  return CyclingPowerZone.percentageSpan.getter();
}

uint64_t sub_1FF10()
{
  return CyclingPowerZone.isEmpty.getter();
}

uint64_t sub_1FF20()
{
  return dispatch thunk of ExternalProvider.sourceName.getter();
}

uint64_t sub_1FF30()
{
  return dispatch thunk of ExternalProvider.sourceImageData.getter();
}

uint64_t sub_1FF40()
{
  return dispatch thunk of CyclingSensorsStore.isPowerMeterAvailable(completion:)();
}

uint64_t sub_1FF50()
{
  return type metadata accessor for CyclingSensorsStore();
}

uint64_t sub_1FF60()
{
  return static CyclingPowerZonesSize.sizeForZoneCount(_:)();
}

uint64_t sub_1FF70()
{
  return static CyclingPowerZonesSize.allCases.getter();
}

uint64_t sub_1FF80()
{
  return CyclingPowerZonesSize.rawValue.getter();
}

uint64_t sub_1FF90()
{
  return type metadata accessor for CyclingPowerZonesSize();
}

uint64_t sub_1FFA0()
{
  return HeartRateConfiguration.hasDefaultRestingHeartRate.getter();
}

uint64_t sub_1FFB0()
{
  return HeartRateConfiguration.maximumHeartRate.getter();
}

uint64_t sub_1FFC0()
{
  return HeartRateConfiguration.restingHeartRate.getter();
}

uint64_t sub_1FFD0()
{
  return type metadata accessor for HeartRateConfiguration.ConfigurationType();
}

uint64_t sub_1FFE0()
{
  return static HeartRateConfiguration.setConfigured(zones:)();
}

uint64_t sub_1FFF0()
{
  return HeartRateConfiguration.configurationType.getter();
}

uint64_t sub_20000()
{
  return static HeartRateConfiguration.set(configurationType:)();
}

uint64_t sub_20010()
{
  return HeartRateConfiguration.zones.getter();
}

uint64_t sub_20020()
{
  return type metadata accessor for HeartRateConfiguration();
}

uint64_t sub_20030()
{
  return dispatch thunk of QueriedExternalProvider.externalProvider.getter();
}

uint64_t sub_20040()
{
  return dispatch thunk of QueriedExternalProvider.permissionState.getter();
}

uint64_t sub_20050()
{
  return dispatch thunk of FunctionalThresholdPower.isAvailable.getter();
}

uint64_t sub_20060()
{
  return FunctionalThresholdPower.creationDate.getter();
}

uint64_t sub_20070()
{
  return FunctionalThresholdPower.__allocating_init(value:source:creationDate:)();
}

uint64_t sub_20080()
{
  return FunctionalThresholdPower.value.getter();
}

uint64_t sub_20090()
{
  return type metadata accessor for FunctionalThresholdPower();
}

uint64_t sub_200A0()
{
  return dispatch thunk of HeartRateConfigurationRequest.fetchActiveHeartRateConfiguration(completion:)();
}

uint64_t sub_200B0()
{
  return dispatch thunk of HeartRateConfigurationRequest.fetchManualHeartRateConfiguration(completion:)();
}

uint64_t sub_200C0()
{
  return dispatch thunk of HeartRateConfigurationRequest.fetchAutomaticHeartRateConfiguration(completion:)();
}

uint64_t sub_200D0()
{
  return HeartRateConfigurationRequest.init()();
}

uint64_t sub_200E0()
{
  return type metadata accessor for HeartRateConfigurationRequest();
}

uint64_t sub_200F0()
{
  return CyclingPowerZonesConfiguration.isAutomaticEmpty.getter();
}

uint64_t sub_20100()
{
  return CyclingPowerZonesConfiguration.configurationType.getter();
}

uint64_t sub_20110()
{
  return CyclingPowerZonesConfiguration.isAutomaticFromAppleFTP.getter();
}

uint64_t sub_20120()
{
  return CyclingPowerZonesConfiguration.zones.getter();
}

uint64_t sub_20130()
{
  return CyclingPowerZonesConfiguration.isEmpty.getter();
}

uint64_t sub_20140()
{
  return type metadata accessor for FunctionalThresholdPowerSource();
}

uint64_t sub_20150()
{
  return type metadata accessor for CyclingPowerZonesConfigurationType();
}

uint64_t sub_20160()
{
  return dispatch thunk of CyclingPowerZonesConfigurationStore.saveCyclingPowerZonesConfiguration(_:)();
}

uint64_t sub_20170()
{
  return dispatch thunk of CyclingPowerZonesConfigurationStore.fetchCyclingPowerZonesConfiguration(completion:)();
}

uint64_t sub_20180()
{
  return static CyclingPowerZonesConfigurationStore.create(with:)();
}

uint64_t sub_20190()
{
  return type metadata accessor for CyclingPowerZonesConfigurationStore();
}

uint64_t sub_201A0()
{
  return static CyclingPowerZonesConfigurationEditor.resetManualZones(using:)();
}

uint64_t sub_201B0()
{
  return static CyclingPowerZonesConfigurationEditor.changeFunctionalThresholdPower(to:using:)();
}

uint64_t sub_201C0()
{
  return static CyclingPowerZonesConfigurationEditor.changeZonesSize(to:using:)();
}

uint64_t sub_201D0()
{
  return static CyclingPowerZonesConfigurationEditor.changeConfigurationType(to:using:)();
}

uint64_t sub_201E0()
{
  return static CyclingPowerZonesConfigurationEditor.isManualZonesEqualToAutomatic(using:)();
}

uint64_t sub_201F0()
{
  return static CyclingPowerZonesConfigurationEditor.rounded(_:)();
}

uint64_t sub_20200()
{
  return type metadata accessor for CyclingPowerZonesConfigurationEditor();
}

uint64_t sub_20210()
{
  return Zone.displaySpan.getter();
}

uint64_t sub_20220()
{
  return Zone.configuration.getter();
}

uint64_t sub_20230()
{
  return dispatch thunk of Zone.displayLowerBound.getter();
}

uint64_t sub_20240()
{
  return dispatch thunk of Zone.displayUpperBound.getter();
}

uint64_t sub_20250()
{
  return ServiceSubscriptionClient.fetchServiceSubscription(with:)();
}

uint64_t sub_20260()
{
  return ServiceSubscriptionClient.__allocating_init(eventHub:queue:)();
}

uint64_t sub_20270()
{
  return type metadata accessor for ServiceSubscriptionClient();
}

NSString sub_20280()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_20290()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_202A0()
{
  return String.workoutLocalized()()._countAndFlagsBits;
}

void sub_202B0(Swift::String a1)
{
}

uint64_t sub_202C0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray sub_202D0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_202E0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_202F0()
{
  return Array<A>.replacing(index:with:)();
}

uint64_t sub_20300()
{
  return static OS_dispatch_queue.main.getter();
}

void sub_20310(Swift::Int a1)
{
}

uint64_t sub_20320()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_20330()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_20340()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_20350()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_20360()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_20370()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_20380()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_20390()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_203A0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_203B0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_203C0()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_203D0()
{
  return Error.code.getter();
}

uint64_t sub_203E0()
{
  return Error.domain.getter();
}

uint64_t sub_203F0()
{
  return Hasher.init(_seed:)();
}

void sub_20400(Swift::UInt a1)
{
}

Swift::Int sub_20410()
{
  return Hasher._finalize()();
}

uint64_t BPSBridgeTintColor()
{
  return _BPSBridgeTintColor();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

uint64_t FIActivityAnalyticsSubmission()
{
  return _FIActivityAnalyticsSubmission();
}

uint64_t FIActivityMoveModeWithHealthStore()
{
  return _FIActivityMoveModeWithHealthStore();
}

uint64_t FIAlertOnWatchWhenMirrored()
{
  return _FIAlertOnWatchWhenMirrored();
}

uint64_t FIDeviceMeetsMinimumOSVersionGlory()
{
  return _FIDeviceMeetsMinimumOSVersionGlory();
}

uint64_t FIIsActivePairedDeviceSatellitePaired()
{
  return _FIIsActivePairedDeviceSatellitePaired();
}

uint64_t FIIsEndRemindersEnabled()
{
  return _FIIsEndRemindersEnabled();
}

uint64_t FIIsResumeRemindersEnabled()
{
  return _FIIsResumeRemindersEnabled();
}

uint64_t FIIsStartRemindersEnabled()
{
  return _FIIsStartRemindersEnabled();
}

uint64_t FIIsTinkerVegaOrFitnessJunior()
{
  return _FIIsTinkerVegaOrFitnessJunior();
}

uint64_t FILocalizedNameForActivityType()
{
  return _FILocalizedNameForActivityType();
}

uint64_t FIMirrorModeEnabled()
{
  return _FIMirrorModeEnabled();
}

uint64_t FIShouldTrackTrainingLoad()
{
  return _FIShouldTrackTrainingLoad();
}

uint64_t FIUIBundle()
{
  return _FIUIBundle();
}

uint64_t FIUIClearWorkoutPowerMode()
{
  return _FIUIClearWorkoutPowerMode();
}

uint64_t FIUIDeviceSupportsSwimming()
{
  return _FIUIDeviceSupportsSwimming();
}

uint64_t FIUIHealthStoreForDevice()
{
  return _FIUIHealthStoreForDevice();
}

uint64_t FIUIIsAutoPauseEnabled()
{
  return _FIUIIsAutoPauseEnabled();
}

uint64_t FIUIIsCyclingAutoPauseEnabled()
{
  return _FIUIIsCyclingAutoPauseEnabled();
}

uint64_t FIUIIsGuidedRunMediaMomentsEnabled()
{
  return _FIUIIsGuidedRunMediaMomentsEnabled();
}

uint64_t FIUIIsGuidedRunPrefetchEnabled()
{
  return _FIUIIsGuidedRunPrefetchEnabled();
}

uint64_t FIUIIsGuidedWorkoutMediaMomentsEnabled()
{
  return _FIUIIsGuidedWorkoutMediaMomentsEnabled();
}

uint64_t FIUIIsGuidedWorkoutPrefetchEnabled()
{
  return _FIUIIsGuidedWorkoutPrefetchEnabled();
}

uint64_t FIUIIsHeartRateEnabled()
{
  return _FIUIIsHeartRateEnabled();
}

uint64_t FIUIIsPowerSavingModeEnabled()
{
  return _FIUIIsPowerSavingModeEnabled();
}

uint64_t FIUIIsPrecisionStartEnabled()
{
  return _FIUIIsPrecisionStartEnabled();
}

uint64_t FIUIIsRunningAutoPauseEnabled()
{
  return _FIUIIsRunningAutoPauseEnabled();
}

uint64_t FIUIIsWorkoutExtendedModeEnabled()
{
  return _FIUIIsWorkoutExtendedModeEnabled();
}

uint64_t FIUIIsWorkoutExtendedModeSupported()
{
  return _FIUIIsWorkoutExtendedModeSupported();
}

uint64_t FIUIIsWorkoutNFCAllDayEnabled()
{
  return _FIUIIsWorkoutNFCAllDayEnabled();
}

uint64_t FIUIIsWorkoutSafetyCheckInEnabled()
{
  return _FIUIIsWorkoutSafetyCheckInEnabled();
}

uint64_t FIUIIsWorkoutVoiceFeedbackEnabled()
{
  return _FIUIIsWorkoutVoiceFeedbackEnabled();
}

uint64_t FIUIIsWorkoutVoiceFeedbackSupportedForLanguage()
{
  return _FIUIIsWorkoutVoiceFeedbackSupportedForLanguage();
}

uint64_t FIUIMusicIsPlaybackModeShuffle()
{
  return _FIUIMusicIsPlaybackModeShuffle();
}

uint64_t FIUISetIsPowerSavingModeEnabled()
{
  return _FIUISetIsPowerSavingModeEnabled();
}

uint64_t FIUISetMusicPlaybackModeShuffle()
{
  return _FIUISetMusicPlaybackModeShuffle();
}

uint64_t FIUISetWorkoutExtendedModeEnabled()
{
  return _FIUISetWorkoutExtendedModeEnabled();
}

uint64_t FIUISetWorkoutNFCAllDayEnabled()
{
  return _FIUISetWorkoutNFCAllDayEnabled();
}

uint64_t FIUIShouldConfirmEndingWorkout()
{
  return _FIUIShouldConfirmEndingWorkout();
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

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

void UIRectFill(CGRect rect)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__activityTypeSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _activityTypeSpecifiers];
}

id objc_msgSend__addAboutTextToSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAboutTextToSpecifier:");
}

id objc_msgSend__addGestureLinkToSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addGestureLinkToSpecifier:");
}

id objc_msgSend__addLearnMoreLowPowerModeTextToSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addLearnMoreLowPowerModeTextToSpecifier:");
}

id objc_msgSend__addPreKincaidFooterTextToSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPreKincaidFooterTextToSpecifier:");
}

id objc_msgSend__caloriesSelected(void *a1, const char *a2, ...)
{
  return _[a1 _caloriesSelected];
}

id objc_msgSend__countPerMinuteUnit(void *a1, const char *a2, ...)
{
  return _[a1 _countPerMinuteUnit];
}

id objc_msgSend__createConfigurationDataSourceSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _createConfigurationDataSourceSpecifiers];
}

id objc_msgSend__distanceTypeForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_distanceTypeForSection:");
}

id objc_msgSend__footerForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_footerForSection:");
}

id objc_msgSend__functionalThresholdPowerString(void *a1, const char *a2, ...)
{
  return _[a1 _functionalThresholdPowerString];
}

id objc_msgSend__hasData(void *a1, const char *a2, ...)
{
  return _[a1 _hasData];
}

id objc_msgSend__insertConfigurationTypeSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertConfigurationTypeSpecifiers:");
}

id objc_msgSend__insertFunctionalThresholdPowerSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertFunctionalThresholdPowerSpecifiers:");
}

id objc_msgSend__insertLowerDisplayBoundSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertLowerDisplayBoundSpecifiers:");
}

id objc_msgSend__insertMaximumHeartRateSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertMaximumHeartRateSpecifiers:");
}

id objc_msgSend__insertPowerZonesSizeSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertPowerZonesSizeSpecifiers:");
}

id objc_msgSend__insertRecalculateZonesSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertRecalculateZonesSpecifiers:");
}

id objc_msgSend__insertRestingHeartRateSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertRestingHeartRateSpecifiers:");
}

id objc_msgSend__insertSpecifiers_forSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertSpecifiers:forSection:");
}

id objc_msgSend__insertUpperDisplayBoundSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertUpperDisplayBoundSpecifiers:");
}

id objc_msgSend__insertZoneSizeSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertZoneSizeSpecifiers:");
}

id objc_msgSend__insertZonesSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertZonesSpecifiers:");
}

id objc_msgSend__kilocaloriesSelected(void *a1, const char *a2, ...)
{
  return _[a1 _kilocaloriesSelected];
}

id objc_msgSend__kilojoulesSelected(void *a1, const char *a2, ...)
{
  return _[a1 _kilojoulesSelected];
}

id objc_msgSend__kilometersSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_kilometersSelected:");
}

id objc_msgSend__loadEnergyUnit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadEnergyUnit:");
}

id objc_msgSend__loadPoolLengthUnit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadPoolLengthUnit:");
}

id objc_msgSend__loadTrackWorkoutsUnit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadTrackWorkoutsUnit:");
}

id objc_msgSend__loadUnitForDistanceType_specifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadUnitForDistanceType:specifiers:");
}

id objc_msgSend__mainThread_handleCyclingPowerZonesConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mainThread_handleCyclingPowerZonesConfiguration:");
}

id objc_msgSend__mainThread_handleLoadingActiveConfiguration_inactiveConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mainThread_handleLoadingActiveConfiguration:inactiveConfiguration:");
}

id objc_msgSend__metersSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metersSelected:");
}

id objc_msgSend__metricSpecifiersForSettingSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metricSpecifiersForSettingSection:");
}

id objc_msgSend__milesSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_milesSelected:");
}

id objc_msgSend__obliterateUserConfiguredWorkoutMetricsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _obliterateUserConfiguredWorkoutMetricsIfNeeded];
}

id objc_msgSend__refreshManagedConfigurationDataSources(void *a1, const char *a2, ...)
{
  return _[a1 _refreshManagedConfigurationDataSources];
}

id objc_msgSend__setAndResizeImage_forSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAndResizeImage:forSpecifier:");
}

id objc_msgSend__setEnergyBurnedUnit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setEnergyBurnedUnit:");
}

id objc_msgSend__setWorkoutPlaylistID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setWorkoutPlaylistID:");
}

id objc_msgSend__shouldManuallyConfigure(void *a1, const char *a2, ...)
{
  return _[a1 _shouldManuallyConfigure];
}

id objc_msgSend__shouldObliterateWorkoutMetricsForMetricsActivityMoveMode_activityMoveModeHealthDB_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldObliterateWorkoutMetricsForMetricsActivityMoveMode:activityMoveModeHealthDB:");
}

id objc_msgSend__showConfigurationDataSourceProviderSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showConfigurationDataSourceProviderSpecifiers:");
}

id objc_msgSend__specifierBaseIdForDistanceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_specifierBaseIdForDistanceType:");
}

id objc_msgSend__specifierForMetricType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_specifierForMetricType:");
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemImageNamed:");
}

id objc_msgSend__trackUnitSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trackUnitSelected:");
}

id objc_msgSend__updateShuffleSelectionInSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateShuffleSelectionInSpecifiers:");
}

id objc_msgSend__value(void *a1, const char *a2, ...)
{
  return _[a1 _value];
}

id objc_msgSend__yardsSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_yardsSelected:");
}

id objc_msgSend__zoneRangeDisplayValueForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_zoneRangeDisplayValueForSpecifier:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return _[a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allSupportedSizes(void *a1, const char *a2, ...)
{
  return _[a1 allSupportedSizes];
}

id objc_msgSend_allowEnableExpressGymKitWithVisibleViewController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowEnableExpressGymKitWithVisibleViewController:completion:");
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return _[a1 appearance];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_automaticConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 automaticConfiguration];
}

id objc_msgSend_automaticFTP(void *a1, const char *a2, ...)
{
  return _[a1 automaticFTP];
}

id objc_msgSend_automaticFTPString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automaticFTPString:");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bridgedExternalProviders(void *a1, const char *a2, ...)
{
  return _[a1 bridgedExternalProviders];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _[a1 bundle];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_buttonTextColor(void *a1, const char *a2, ...)
{
  return _[a1 buttonTextColor];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_changeConfigurationTypeTo_using_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeConfigurationTypeTo:using:");
}

id objc_msgSend_changeFunctionalThresholdPowerTo_using_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeFunctionalThresholdPowerTo:using:");
}

id objc_msgSend_changeLowerBoundTo_zoneIndex_using_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeLowerBoundTo:zoneIndex:using:");
}

id objc_msgSend_changeUpperBoundTo_zoneIndex_using_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeUpperBoundTo:zoneIndex:using:");
}

id objc_msgSend_changeZonesSizeTo_using_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeZonesSizeTo:using:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationStore(void *a1, const char *a2, ...)
{
  return _[a1 configurationStore];
}

id objc_msgSend_configurationType(void *a1, const char *a2, ...)
{
  return _[a1 configurationType];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createPowerSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 createPowerSpecifiers];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultParagraphStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultParagraphStyle];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_detailView(void *a1, const char *a2, ...)
{
  return _[a1 detailView];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didSelectWorkoutMusicPlaylist(void *a1, const char *a2, ...)
{
  return _[a1 didSelectWorkoutMusicPlaylist];
}

id objc_msgSend_disabledIndexForMetricType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disabledIndexForMetricType:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValueForUnit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValueForUnit:");
}

id objc_msgSend_editableTextField(void *a1, const char *a2, ...)
{
  return _[a1 editableTextField];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endEditing:");
}

id objc_msgSend_endOfDocument(void *a1, const char *a2, ...)
{
  return _[a1 endOfDocument];
}

id objc_msgSend_enumerateItemsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateItemsUsingBlock:");
}

id objc_msgSend_fetchActiveAndInactiveConfigurationWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchActiveAndInactiveConfigurationWithCompletion:");
}

id objc_msgSend_fetchCyclingPowerZonesConfigurationWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCyclingPowerZonesConfigurationWithCompletion:");
}

id objc_msgSend_fetchSubscriptionStatusWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSubscriptionStatusWithCompletion:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_forceNanoSyncWithOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceNanoSyncWithOptions:completion:");
}

id objc_msgSend_formattingManager(void *a1, const char *a2, ...)
{
  return _[a1 formattingManager];
}

id objc_msgSend_functionalThresholdPower(void *a1, const char *a2, ...)
{
  return _[a1 functionalThresholdPower];
}

id objc_msgSend_functionalThresholdPowerSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 functionalThresholdPowerSpecifier];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 getActivePairedDevice];
}

id objc_msgSend_getAllDevicesWithArchivedAltAccountDevicesMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAllDevicesWithArchivedAltAccountDevicesMatching:");
}

id objc_msgSend_getAllDevicesWithArchivedDevicesMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAllDevicesWithArchivedDevicesMatching:");
}

id objc_msgSend_getAllPlaylistsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAllPlaylistsWithCompletion:");
}

id objc_msgSend_getApplicationIsInstalled_withBundleID_onPairedDevice_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getApplicationIsInstalled:withBundleID:onPairedDevice:error:");
}

id objc_msgSend_groupSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:");
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_hasDataSources(void *a1, const char *a2, ...)
{
  return _[a1 hasDataSources];
}

id objc_msgSend_hasDefaultRestingHeartRate(void *a1, const char *a2, ...)
{
  return _[a1 hasDefaultRestingHeartRate];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_hprf_metricType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hprf_metricType");
}

id objc_msgSend_hprf_setMetricType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hprf_setMetricType:");
}

id objc_msgSend_hprf_setWorkoutActivityOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hprf_setWorkoutActivityOption:");
}

id objc_msgSend_hprf_workoutActivityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hprf_workoutActivityType");
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return _[a1 iconView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return _[a1 identifiers];
}

id objc_msgSend_imageWithActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithActions:");
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return _[a1 index];
}

id objc_msgSend_indexForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForIndexPath:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithCategory_domainName_healthStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCategory:domainName:healthStore:");
}

id objc_msgSend_initWithConfiguration_updateDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:updateDelegate:");
}

id objc_msgSend_initWithConfiguration_zoneIndex_updateDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:zoneIndex:updateDelegate:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_zone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:zone:");
}

id objc_msgSend_initWithDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:");
}

id objc_msgSend_initWithHealthStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHealthStore:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTitle_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:message:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUnitManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnitManager:");
}

id objc_msgSend_initWithWheelchairUseCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWheelchairUseCache:");
}

id objc_msgSend_initWithWorkoutActivityType_activityMoveMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWorkoutActivityType:activityMoveMode:");
}

id objc_msgSend_insertContiguousSpecifiers_atIndex_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertContiguousSpecifiers:atIndex:animated:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertSpecifier_atIndex_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSpecifier:atIndex:animated:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isAppleInternalInstall(void *a1, const char *a2, ...)
{
  return _[a1 isAppleInternalInstall];
}

id objc_msgSend_isAutoPauseEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAutoPauseEnabled];
}

id objc_msgSend_isAutomaticFromAppleFTP(void *a1, const char *a2, ...)
{
  return _[a1 isAutomaticFromAppleFTP];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAvailable];
}

id objc_msgSend_isCyclingAutoPauseEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isCyclingAutoPauseEnabled];
}

id objc_msgSend_isEditable(void *a1, const char *a2, ...)
{
  return _[a1 isEditable];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _[a1 isEditing];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return _[a1 isEmpty];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isIndoor(void *a1, const char *a2, ...)
{
  return _[a1 isIndoor];
}

id objc_msgSend_isManualZonesEqualToAutomaticUsing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isManualZonesEqualToAutomaticUsing:");
}

id objc_msgSend_isMessagesAppInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isMessagesAppInstalled];
}

id objc_msgSend_isMetricEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMetricEnabled:");
}

id objc_msgSend_isRunningAutoPauseEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isRunningAutoPauseEnabled];
}

id objc_msgSend_isSubscribedWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubscribedWithCompletion:");
}

id objc_msgSend_isWheelchairUser(void *a1, const char *a2, ...)
{
  return _[a1 isWheelchairUser];
}

id objc_msgSend_jouleUnitWithMetricPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jouleUnitWithMetricPrefix:");
}

id objc_msgSend_kilocalorieUnit(void *a1, const char *a2, ...)
{
  return _[a1 kilocalorieUnit];
}

id objc_msgSend_kindWithKinds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kindWithKinds:");
}

id objc_msgSend_kindWithVariants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kindWithVariants:");
}

id objc_msgSend_kindWithVariants_playlistEntryKind_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kindWithVariants:playlistEntryKind:options:");
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_largeCalorieUnit(void *a1, const char *a2, ...)
{
  return _[a1 largeCalorieUnit];
}

id objc_msgSend_layoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 layoutDirection];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _[a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _[a1 library];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 lightGrayColor];
}

id objc_msgSend_loadSpecifiersFromPlistName_target_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifiersFromPlistName:target:");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizationKeyForEnergyBaseKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizationKeyForEnergyBaseKey:");
}

id objc_msgSend_localizedInformationalFooterText(void *a1, const char *a2, ...)
{
  return _[a1 localizedInformationalFooterText];
}

id objc_msgSend_localizedPaneTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedPaneTitle];
}

id objc_msgSend_localizedShortPowerUnitString(void *a1, const char *a2, ...)
{
  return _[a1 localizedShortPowerUnitString];
}

id objc_msgSend_localizedStandardCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStandardCompare:");
}

id objc_msgSend_localizedStandardRangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStandardRangeOfString:");
}

id objc_msgSend_localizedStringByJoiningStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringByJoiningStrings:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_localizedStringWithHeartRate_unitStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithHeartRate:unitStyle:");
}

id objc_msgSend_lowPowerModeName(void *a1, const char *a2, ...)
{
  return _[a1 lowPowerModeName];
}

id objc_msgSend_lowerBound(void *a1, const char *a2, ...)
{
  return _[a1 lowerBound];
}

id objc_msgSend_lowerBoundMaximum(void *a1, const char *a2, ...)
{
  return _[a1 lowerBoundMaximum];
}

id objc_msgSend_lowerBoundMinimum(void *a1, const char *a2, ...)
{
  return _[a1 lowerBoundMinimum];
}

id objc_msgSend_lowerBoundSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 lowerBoundSpecifier];
}

id objc_msgSend_lowerDisplayBound(void *a1, const char *a2, ...)
{
  return _[a1 lowerDisplayBound];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_manualConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 manualConfiguration];
}

id objc_msgSend_maximumHeartRate(void *a1, const char *a2, ...)
{
  return _[a1 maximumHeartRate];
}

id objc_msgSend_metricEnabledForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricEnabledForType:");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_moveMetricType_toEnabledIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveMetricType:toEnabledIndex:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nanoAssistantEnabled(void *a1, const char *a2, ...)
{
  return _[a1 nanoAssistantEnabled];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_numberForKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberForKey:error:");
}

id objc_msgSend_numberFormatter(void *a1, const char *a2, ...)
{
  return _[a1 numberFormatter];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfRowsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfRowsInSection:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_obliterateUserConfiguredWorkoutMetrics(void *a1, const char *a2, ...)
{
  return _[a1 obliterateUserConfiguredWorkoutMetrics];
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:options:completionHandler:");
}

id objc_msgSend_optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optimizedActivityTypesWithIsWheelchairUser:isSwimmingSupported:");
}

id objc_msgSend_orderedDisabledMetrics(void *a1, const char *a2, ...)
{
  return _[a1 orderedDisabledMetrics];
}

id objc_msgSend_orderedEnabledMetrics(void *a1, const char *a2, ...)
{
  return _[a1 orderedEnabledMetrics];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return _[a1 pairingID];
}

id objc_msgSend_percentageLowerBound(void *a1, const char *a2, ...)
{
  return _[a1 percentageLowerBound];
}

id objc_msgSend_percentageUpperBound(void *a1, const char *a2, ...)
{
  return _[a1 percentageUpperBound];
}

id objc_msgSend_performWithResponseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithResponseHandler:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _[a1 persistentID];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingViewController];
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_propertySetWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertySetWithProperties:");
}

id objc_msgSend_providerForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerForSpecifier:");
}

id objc_msgSend_ps_insertObjectsFromArray_afterObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ps_insertObjectsFromArray:afterObject:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return _[a1 quantity];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_readWorkoutMetricsActivityMoveMode(void *a1, const char *a2, ...)
{
  return _[a1 readWorkoutMetricsActivityMoveMode];
}

id objc_msgSend_reload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reload:");
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifierID:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_removeContiguousSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContiguousSpecifiers:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifier:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_resetManualZonesUsing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetManualZonesUsing:");
}

id objc_msgSend_restingHeartRate(void *a1, const char *a2, ...)
{
  return _[a1 restingHeartRate];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 rightBarButtonItem];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_saveCyclingPowerZonesConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveCyclingPowerZonesConfiguration:");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_selectedMusicViewString(void *a1, const char *a2, ...)
{
  return _[a1 selectedMusicViewString];
}

id objc_msgSend_selectedPlaylistId(void *a1, const char *a2, ...)
{
  return _[a1 selectedPlaylistId];
}

id objc_msgSend_sendWorkoutPlaylistSelectedTipEvent(void *a1, const char *a2, ...)
{
  return _[a1 sendWorkoutPlaylistSelectedTipEvent];
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return _[a1 separatorColor];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAutomaticConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticConfiguration:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundImage_forBarMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundImage:forBarMetrics:");
}

id objc_msgSend_setBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarStyle:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setCellEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellEnabled:");
}

id objc_msgSend_setCellType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellType:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConfigurationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurationType:");
}

id objc_msgSend_setConfiguredZones_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguredZones:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setDetailControllerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailControllerClass:");
}

id objc_msgSend_setDetailView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailView:");
}

id objc_msgSend_setEditableTextField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditableTextField:");
}

id objc_msgSend_setEnabled_forMetricType_didChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:forMetricType:didChange:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFunctionalThresholdPowerSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFunctionalThresholdPowerSpecifier:");
}

id objc_msgSend_setIconView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconView:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndicatorStyle:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setItemKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemKind:");
}

id objc_msgSend_setItemProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemProperties:");
}

id objc_msgSend_setItemSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemSortDescriptors:");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLowerBoundSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLowerBoundSpecifier:");
}

id objc_msgSend_setManualConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManualConfiguration:");
}

id objc_msgSend_setMetricEnabled_forSpecifier_autoMove_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricEnabled:forSpecifier:autoMove:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNumber_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumber:forKey:error:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setPreservesSuperviewLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreservesSuperviewLayoutMargins:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setReturnKeyGoesToNextResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnKeyGoesToNextResponder:");
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnKeyType:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setSelectedTextRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedTextRange:");
}

id objc_msgSend_setShadowImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowImage:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleView:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUpperBoundSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpperBoundSpecifier:");
}

id objc_msgSend_setUserActiveEnergyBurnedUnit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserActiveEnergyBurnedUnit:");
}

id objc_msgSend_setUserDistanceUnit_forDistanceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserDistanceUnit:forDistanceType:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserPlaylistSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserPlaylistSpecifiers:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWorkoutPlaylistID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorkoutPlaylistID:");
}

id objc_msgSend_setZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZone:");
}

id objc_msgSend_setZones_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZones:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return _[a1 sharedBehavior];
}

id objc_msgSend_sharedCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 sharedCoordinator];
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedDeviceConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_shouldDisallowBasedOnRegulatoryDomain(void *a1, const char *a2, ...)
{
  return _[a1 shouldDisallowBasedOnRegulatoryDomain];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sourceImageData(void *a1, const char *a2, ...)
{
  return _[a1 sourceImageData];
}

id objc_msgSend_sourceName(void *a1, const char *a2, ...)
{
  return _[a1 sourceName];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndexPath:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_startObservation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObservation:");
}

id objc_msgSend_stopObservation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObservation:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithShortStyleDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithShortStyleDate:");
}

id objc_msgSend_supportsCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsCapability:");
}

id objc_msgSend_swimmingLocationType(void *a1, const char *a2, ...)
{
  return _[a1 swimmingLocationType];
}

id objc_msgSend_syncManager(void *a1, const char *a2, ...)
{
  return _[a1 syncManager];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronizeNanoDomain_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeNanoDomain:keys:");
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return _[a1 table];
}

id objc_msgSend_tableStructure(void *a1, const char *a2, ...)
{
  return _[a1 tableStructure];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _[a1 tag];
}

id objc_msgSend_tapGesture(void *a1, const char *a2, ...)
{
  return _[a1 tapGesture];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textRangeFromPosition_toPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textRangeFromPosition:toPosition:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_titleView(void *a1, const char *a2, ...)
{
  return _[a1 titleView];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_unitManager(void *a1, const char *a2, ...)
{
  return _[a1 unitManager];
}

id objc_msgSend_updateDelegate(void *a1, const char *a2, ...)
{
  return _[a1 updateDelegate];
}

id objc_msgSend_updateExternalProvider_enable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateExternalProvider:enable:");
}

id objc_msgSend_updateWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithConfiguration:");
}

id objc_msgSend_updateWorkoutInstallState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWorkoutInstallState:");
}

id objc_msgSend_updateZone_withNewZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateZone:withNewZone:");
}

id objc_msgSend_upperBound(void *a1, const char *a2, ...)
{
  return _[a1 upperBound];
}

id objc_msgSend_upperBoundMaximum(void *a1, const char *a2, ...)
{
  return _[a1 upperBoundMaximum];
}

id objc_msgSend_upperBoundMinimum(void *a1, const char *a2, ...)
{
  return _[a1 upperBoundMinimum];
}

id objc_msgSend_upperBoundSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 upperBoundSpecifier];
}

id objc_msgSend_upperDisplayBound(void *a1, const char *a2, ...)
{
  return _[a1 upperDisplayBound];
}

id objc_msgSend_userActiveEnergyBurnedUnit(void *a1, const char *a2, ...)
{
  return _[a1 userActiveEnergyBurnedUnit];
}

id objc_msgSend_userDistanceUnitForDistanceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDistanceUnitForDistanceType:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_valueLabel(void *a1, const char *a2, ...)
{
  return _[a1 valueLabel];
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_wattUnit(void *a1, const char *a2, ...)
{
  return _[a1 wattUnit];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_workoutPlaylistID(void *a1, const char *a2, ...)
{
  return _[a1 workoutPlaylistID];
}

id objc_msgSend_zone(void *a1, const char *a2, ...)
{
  return _[a1 zone];
}

id objc_msgSend_zoneByMutatingLowerBound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zoneByMutatingLowerBound:");
}

id objc_msgSend_zoneByMutatingUpperBound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zoneByMutatingUpperBound:");
}

id objc_msgSend_zoneIndex(void *a1, const char *a2, ...)
{
  return _[a1 zoneIndex];
}

id objc_msgSend_zoneValueFormatter(void *a1, const char *a2, ...)
{
  return _[a1 zoneValueFormatter];
}

id objc_msgSend_zones(void *a1, const char *a2, ...)
{
  return _[a1 zones];
}

id objc_msgSend_zones_replacingZoneAtIndex_withZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zones:replacingZoneAtIndex:withZone:");
}