void sub_5880(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogSync;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_FAULT)) {
      sub_24488(a1, (uint64_t)v5, v6);
    }
  }
  else if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Finished end to end Cloud sync", (uint8_t *)&v8, 0xCu);
  }
}

void sub_5B34()
{
  v1 = FIUIHealthStoreForDevice();
  id v0 = v1;
  FIUIUserHasExistingMoveGoal();
}

void sub_5BD0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  if (v5)
  {
    _HKInitializeLogging();
    v6 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_24514((uint64_t)v5, v6);
    }
    a2 = 1;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5CCC;
  block[3] = &unk_35390;
  char v10 = a2;
  v7 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_5CCC(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  if (v2)
  {
    [v3 buddyControllerReleaseHoldAndSkip:v4];

    uint64_t v5 = *(void *)(a1 + 40);
    +[CHASActivitySetupOnboardingViewController performEndToEndCloudSyncOnSkippingSetupForHealthStore:v5];
  }
  else
  {
    [v3 buddyControllerReleaseHold:v4];
  }
}

void *sub_5EDC(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_3D7F8)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_601C;
    v5[4] = &unk_35440;
    v5[5] = v5;
    long long v6 = off_35428;
    uint64_t v7 = 0;
    qword_3D7F8 = _sl_dlopen();
    v3 = (void *)v5[0];
    int v2 = (void *)qword_3D7F8;
    if (qword_3D7F8)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  int v2 = (void *)qword_3D7F8;
LABEL_5:
  result = dlsym(v2, "NRDevicePropertyIsAltAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_3D7F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_601C()
{
  uint64_t result = _sl_dlopen();
  qword_3D7F8 = result;
  return result;
}

void sub_6EE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_6EFC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    long long v6 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_2464C((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2)
    {
      id v15 = *(id *)(a1 + 32);
      FIUIUserHasExistingExerciseAndStandGoals();
    }
    else
    {
      _HKInitializeLogging();
      v14 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v17 = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "CHASActivitySetupMetricsCollectionViewController - hasExistingMoveGoal %d", buf, 8u);
      }
      WeakRetained[7] = 3;
    }
  }
}

void sub_7080(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    long long v6 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR))
    {
      sub_246B8((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
      if (a2) {
        goto LABEL_4;
      }
LABEL_8:
      FIUIUserHasExistingPreKincaidMoveGoal();
      goto LABEL_9;
    }
  }
  if (!a2) {
    goto LABEL_8;
  }
LABEL_4:
  _HKInitializeLogging();
  v13 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v15 = 1;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "CHASActivitySetupMetricsCollectionViewController - hasExistingExerciseAndStandGoals %d", buf, 8u);
  }
  *(void *)(*(void *)(a1 + 32) + 56) = 5;
LABEL_9:
}

void sub_71E8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    long long v6 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_24724((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  _HKInitializeLogging();
  v13 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = a2;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "CHASActivitySetupMetricsCollectionViewController - hasExistingPreKincaidMoveGoal %d", (uint8_t *)v15, 8u);
  }
  uint64_t v14 = 4;
  if (a2) {
    uint64_t v14 = 5;
  }
  *(void *)(*(void *)(a1 + 32) + 56) = v14;
}

void sub_7494(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 buddyControllerReleaseHoldAndSkip:*(void *)(a1 + 32)];
}

void sub_7D80(id a1, UIAlertAction *a2)
{
  id v2 = +[MCProfileConnection sharedConnection];
  [v2 setWheelchairDataSubmissionAllowed:1];
}

void sub_7DCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)BPSAboutDetailViewController);
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v6 = [v5 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_MORE_INFO_TITLE" value:&stru_35EF0 table:@"ActivitySetup"];
  [v4 setTitleString:v6];

  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"FEEDBACK_WHEELCHAIR_MORE_INFO_DESCRIPTION" value:&stru_35EF0 table:@"ActivitySetup"];
  [v4 setHeaderString:v8];

  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v9 = *(void *)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_7F80;
  v10[3] = &unk_35520;
  objc_copyWeak(&v11, &location);
  [v4 presentWithController:v9 onDismiss:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void sub_7F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7F80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _requestWheelchairDiagnosticsSubmissionIfNecessary];
}

void sub_7FC0(id a1, UIAlertAction *a2)
{
  id v2 = +[MCProfileConnection sharedConnection];
  [v2 setWheelchairDataSubmissionAllowed:0];
}

void sub_81C4(id a1, BOOL a2)
{
  _HKInitializeLogging();
  id v2 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "CHASActivitySetupMetricsCollectionViewController opened url to Pregnancy setup in Health", v3, 2u);
  }
}

void sub_82D8(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) tableView];
  id v2 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [*(id *)(a1 + 40) section]);
  [v3 reloadSections:v2 withRowAnimation:5];
}

void sub_8478(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_A34C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleAdvancedMode];
}

void sub_A38C(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateAdvanceViewButton:v3];
}

void sub_A3E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_A4A4;
  v5[3] = &unk_35620;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_A4A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setGoalSchedules:*(void *)(a1 + 32)];
    [v3 _showAdvancedViewIfNeeded];
    [v3 _setGoalQuantityForGoalView:v3[12]];
    id WeakRetained = v3;
  }
}

void sub_A518(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_A5FC;
    v7[3] = &unk_35698;
    objc_copyWeak(&v9, v4);
    id v8 = v3;
    [v6 _fetchActiveMoveGoalSampleWithCompletion:v7];

    objc_destroyWeak(&v9);
  }
}

void sub_A5E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_A5FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A6CC;
  block[3] = &unk_35670;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
}

void sub_A6CC(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && a1[4])
  {
    id v3 = WeakRetained;
    [WeakRetained[10] setAlpha:0.0];
    objc_storeStrong(v3 + 17, a1[5]);
    objc_storeStrong(v3 + 18, a1[4]);
    [v3 _setGoalQuantityForGoalView:v3[12]];
    [v3 updateContinueButton];
    id WeakRetained = v3;
  }
}

void sub_B6A0(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_247F8();
    }
  }
}

intptr_t sub_BF90(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_C42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_C448(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_C52C;
    v7[3] = &unk_35698;
    objc_copyWeak(&v9, v4);
    id v8 = v3;
    [v6 _fetchActiveExerciseGoalSampleWithCompletion:v7];

    objc_destroyWeak(&v9);
  }
}

void sub_C518(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_C52C(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C5FC;
  block[3] = &unk_35670;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
}

void sub_C5FC(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && a1[4])
  {
    id v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 19, a1[5]);
    objc_storeStrong(v3 + 20, a1[4]);
    [v3 _setGoalQuantityForGoalView:v3[13]];
    [v3 _showAdvancedViewIfNeeded];
    [v3 updateHeaderViewContent];
    [v3 updateContinueButton];
    id WeakRetained = v3;
  }
}

void sub_C9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_C9C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_CAAC;
    v7[3] = &unk_35698;
    objc_copyWeak(&v9, v4);
    id v8 = v3;
    [v6 _fetchActiveStandGoalSampleWithCompletion:v7];

    objc_destroyWeak(&v9);
  }
}

void sub_CA98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_CAAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CB7C;
  block[3] = &unk_35670;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
}

void sub_CB7C(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && a1[4])
  {
    id v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 21, a1[5]);
    objc_storeStrong(v3 + 22, a1[4]);
    [v3 _setGoalQuantityForGoalView:v3[14]];
    [v3 _showAdvancedViewIfNeeded];
    [v3 updateHeaderViewContent];
    [v3 updateContinueButton];
    id WeakRetained = v3;
  }
}

void sub_CDDC(id a1, BOOL a2, NSError *a3)
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogSync;
  if (v4 || !a2)
  {
    if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_FAULT)) {
      sub_248A4();
    }
  }
  else if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Finished end to end Cloud sync", v6, 2u);
  }
}

void sub_CE8C(id a1, BOOL a2, NSError *a3)
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogSync;
  if (a2)
  {
    if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Successfully forced nano sync after saving activity goals", v6, 2u);
    }
  }
  else if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_ERROR))
  {
    sub_24918();
  }
}

void *sub_D348(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  uint64_t v3 = result[11];
  if (v3 != result[12])
  {
    if (v3 != result[13])
    {
      if (v3 != result[14]) {
        return result;
      }
      uint64_t v15 = [result currentStandGoal];
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = *(void **)(v16 + 280);
      *(void *)(v16 + 280) = v15;

      uint64_t v8 = *(void *)(a1 + 32);
      goto LABEL_16;
    }
    uint64_t v11 = [result currentExerciseGoal];
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 272);
    *(void *)(v12 + 272) = v11;

    uint64_t v8 = *(void *)(a1 + 32);
    if (*(void *)(v8 + 120) != 1)
    {
      [(id)v8 _removeAdvancedView];
      uint64_t v14 = *(void **)(a1 + 32);
      return _[v14 _displayStandGoalViewAnimated:1];
    }
LABEL_16:
    return _objc_msgSend((id)v8, "_saveGoalsAndDismiss", v7);
  }
  uint64_t v4 = [result currentMoveGoal];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v4;

  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v8 + 288))
  {
    unsigned int v9 = [(id)v8 _isStandalonePhoneFitnessMode];
    uint64_t v8 = *(void *)(a1 + 32);
    if (v9) {
      goto LABEL_16;
    }
  }
  if (!*(void *)(v8 + 120)) {
    goto LABEL_16;
  }
  [(id)v8 _removeAdvancedView];
  uint64_t v10 = *(void **)(a1 + 32);

  return _[v10 _displayExerciseGoalViewAnimated:1];
}

void sub_D4D4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[26];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_D5BC;
  v5[3] = &unk_35790;
  id v6 = *(id *)(a1 + 40);
  uint64_t v4 = objc_msgSend(v3, "hk_filter:", v5);
  [v2 _setGoalSchedules:v4];

  [*(id *)(*(void *)(a1 + 32) + 8) deleteObject:*(void *)(a1 + 40) withCompletion:&stru_357B0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_D5BC(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

void sub_D5E0(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_24980();
    }
  }
}

BOOL sub_DA6C(uint64_t a1, void *a2)
{
  return [a2 goalType] == *(id *)(a1 + 32);
}

id sub_E3F8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _formattingManager];
  id v6 = [v5 localizedStringWithMoveQuantity:v4 activityMoveMode:*(void *)(*(void *)(a1 + 32) + 32)];

  return v6;
}

id sub_E478(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 _formattingManager];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32);
  [v4 _value];
  double v8 = v7;

  unsigned int v9 = [v5 localizedLongMoveUnitStringWithActivityMoveMode:v6 value:(unint64_t)v8];

  uint64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"PER_DAY" value:&stru_35EF0 table:@"ActivitySetup"];

  uint64_t v12 = +[NSString stringWithFormat:@"%@%@", v9, v11];
  v13 = [v12 localizedUppercaseString];

  return v13;
}

id sub_E734(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _formattingManager];
  uint64_t v5 = [v4 localizedStringWithBriskMinutes:v3];

  return v5;
}

id sub_E7A0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _formattingManager];
  [v3 _value];
  double v6 = v5;

  double v7 = [v4 localizedLongBriskMinutesUnitStringForValue:(unint64_t)v6];

  double v8 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v9 = [v8 localizedStringForKey:@"PER_DAY" value:&stru_35EF0 table:@"ActivitySetup"];

  uint64_t v10 = +[NSString stringWithFormat:@"%@%@", v7, v9];
  uint64_t v11 = [v10 localizedUppercaseString];

  return v11;
}

id sub_EA44(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _formattingManager];
  double v5 = [v4 localizedStringWithActiveHours:v3];

  return v5;
}

id sub_EAB0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _formattingManager];
  [v3 _value];
  double v6 = v5;

  double v7 = [v4 localizedLongActiveHoursUnitStringForValue:(unint64_t)v6];

  double v8 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v9 = [v8 localizedStringForKey:@"PER_DAY" value:&stru_35EF0 table:@"ActivitySetup"];

  uint64_t v10 = +[NSString stringWithFormat:@"%@%@", v7, v9];
  uint64_t v11 = [v10 localizedUppercaseString];

  return v11;
}

BOOL sub_EE98(id a1, HKActivityGoalSchedule *a2)
{
  id v2 = a2;
  if ([(HKActivityGoalSchedule *)v2 goalType]) {
    char v3 = [(HKActivityGoalSchedule *)v2 goalType] == (char *)&dword_0 + 1;
  }
  else {
    char v3 = 1;
  }

  return v3;
}

BOOL sub_EF64(id a1, HKActivityGoalSchedule *a2)
{
  return [(HKActivityGoalSchedule *)a2 goalType] == (char *)&dword_0 + 2;
}

BOOL sub_F008(id a1, HKActivityGoalSchedule *a2)
{
  return [(HKActivityGoalSchedule *)a2 goalType] == (char *)&dword_0 + 3;
}

void sub_F380(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_249E8();
    }
  }
  double v8 = [v6 lastObject];
  unsigned int v9 = [v8 quantity];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_F804(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_24A50();
    }
  }
  double v8 = [v6 lastObject];
  unsigned int v9 = [v8 quantity];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_FA48(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_24AB8();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

unint64_t sub_FB9C(uint64_t a1, void *a2)
{
  unint64_t result = (unint64_t)[a2 goalType];
  if (result <= 3) {
    *(unsigned char *)(*(void *)(a1 + 32) + *off_35968[result]) = 1;
  }
  return result;
}

BOOL sub_FD70(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 goalType];
  id v5 = [v3 goalType];

  return v4 == v5;
}

void sub_FDC4(id a1, BOOL a2, NSError *a3)
{
  id v4 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_24B20();
    }
  }
}

void sub_FE24(id a1, BOOL a2, NSError *a3)
{
  id v4 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)) {
      sub_24B88();
    }
  }
}

void *sub_1062C(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_3D808)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_1076C;
    void v5[4] = &unk_35440;
    v5[5] = v5;
    long long v6 = off_35950;
    uint64_t v7 = 0;
    qword_3D808 = _sl_dlopen();
    id v3 = (void *)v5[0];
    id v2 = (void *)qword_3D808;
    if (qword_3D808)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)qword_3D808;
LABEL_5:
  unint64_t result = dlsym(v2, "NRDevicePropertyIsAltAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_3D800 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1076C()
{
  uint64_t result = _sl_dlopen();
  qword_3D808 = result;
  return result;
}

void sub_107F8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10824(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10DE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained buttonControllerDidUpdate];
}

void type metadata accessor for HKActivityGoalType(uint64_t a1)
{
}

void type metadata accessor for CHASActivitySetupPresentationContext(uint64_t a1)
{
}

void sub_117C0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void *sub_11808@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_11818(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t *sub_11824(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24CC0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    uint64_t v11 = a3[7];
    uint64_t v12 = (uint64_t *)((char *)a1 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = (void *)v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    id v15 = v10;
    id v16 = v14;
  }
  return a1;
}

void sub_11914(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  int v5 = *(void **)(a1 + *(int *)(a2 + 28) + 8);
}

uint64_t sub_11998(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24CC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  v13 = (void *)v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  id v14 = v9;
  id v15 = v13;
  return a1;
}

uint64_t sub_11A38(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24CC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  id v14 = (void *)v13[1];
  id v15 = (void *)v12[1];
  v12[1] = v14;
  id v16 = v14;

  return a1;
}

uint64_t sub_11AF4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24CC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_11B84(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24CC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  id v10 = (void *)(a1 + v9);
  uint64_t v11 = (uint64_t *)(a2 + v9);
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  id v14 = (void *)v10[1];
  *id v10 = v13;
  v10[1] = v12;

  return a1;
}

uint64_t sub_11C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_11C40);
}

uint64_t sub_11C40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_11D00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_11D14);
}

uint64_t sub_11D14(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24CC0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for ScheduleDayRowView()
{
  uint64_t result = qword_3CF08;
  if (!qword_3CF08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_11E1C()
{
  uint64_t result = sub_24CC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_11ECC()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_11EE8(uint64_t a1@<X8>)
{
  uint64_t v116 = a1;
  uint64_t v106 = sub_24FB0();
  __chkstk_darwin(v106);
  v109 = (char *)&v104 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_16B84(&qword_3CF48);
  __chkstk_darwin(v108);
  v115 = (char *)&v104 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_16B84(&qword_3CF50);
  uint64_t v4 = __chkstk_darwin(v112);
  uint64_t v114 = (uint64_t)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v113 = (uint64_t)&v104 - v6;
  uint64_t v7 = sub_16B84(&qword_3CF58);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v104 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_16B84(&qword_3CF60);
  __chkstk_darwin(v104);
  uint64_t v11 = (char *)&v104 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_16B84(&qword_3CF68);
  __chkstk_darwin(v105);
  uint64_t v13 = (char *)&v104 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_16B84(&qword_3CF70);
  __chkstk_darwin(v14 - 8);
  v111 = (char *)&v104 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_16B84(&qword_3CF78);
  __chkstk_darwin(v107);
  v110 = (char *)&v104 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (int *)type metadata accessor for ScheduleDayRowView();
  v18 = *(void **)&v1[v17[7] + 8];
  unint64_t v19 = *(void *)&v1[v17[6]];
  swift_getKeyPath();
  swift_getKeyPath();
  id v20 = v18;
  sub_24F00();

  swift_release();
  swift_release();
  id v21 = (id)v117;
  if ((v117 & 0xC000000000000001) == 0)
  {
    if ((v19 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v19 < *(void *)((char *)&dword_10 + (v117 & 0xFFFFFFFFFFFFFF8)))
    {
      v22 = (char *)*(id *)(v117 + 8 * v19 + 32);
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_35;
  }
  v22 = (char *)sub_254B0();
LABEL_5:
  v23 = v22;
  swift_bridgeObjectRelease();
  id v21 = *(id *)&v23[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal];

  swift_getKeyPath();
  swift_getKeyPath();
  id v24 = v20;
  sub_24F00();

  swift_release();
  swift_release();
  if ((v117 & 0xC000000000000001) == 0)
  {
    if ((v19 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v19 < *(void *)((char *)&dword_10 + (v117 & 0xFFFFFFFFFFFFFF8)))
    {
      v25 = (char *)*(id *)(v117 + 8 * v19 + 32);
      goto LABEL_9;
    }
    __break(1u);
    goto LABEL_38;
  }
LABEL_35:
  v25 = (char *)sub_254B0();
LABEL_9:
  v26 = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = *(void *)&v26[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];

  id v28 = [*(id *)&v1[v17[5]] unitManager];
  if (!v28)
  {
LABEL_41:
    __break(1u);
    return;
  }
  v29 = v28;
  id v30 = [v28 unitManager];

  if ((unint64_t)(v27 - 1) < 2)
  {
    v31 = &selRef_minuteUnit;
    goto LABEL_14;
  }
  if (v27)
  {
    v31 = &selRef_countUnit;
LABEL_14:
    v32 = self;
    goto LABEL_16;
  }
  v31 = &selRef_userActiveEnergyBurnedUnit;
  v32 = v30;
LABEL_16:
  id v33 = [v32 *v31];

  [v21 doubleValueForUnit:v33];
  double v35 = v34;

  double v36 = floor(v35);
  if ((~*(void *)&v36 & 0x7FF0000000000000) == 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if (v36 <= -9.22337204e18)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (v36 >= 9.22337204e18)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v37 = (void *)(uint64_t)v36;
  v38 = (void *)sub_128B8();
  *(void *)uint64_t v9 = sub_25080();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v39 = sub_16B84(&qword_3CF80);
  sub_12BD8(v1, v37, v38, &v9[*(int *)(v39 + 44)]);
  unsigned __int8 v40 = sub_25130();
  char v41 = sub_25150();
  char v42 = sub_25140();
  sub_25140();
  if (sub_25140() != v40) {
    char v42 = sub_25140();
  }
  sub_25140();
  char v43 = sub_25140();
  uint64_t v44 = (uint64_t)v111;
  if (v43 != v41) {
    char v42 = sub_25140();
  }
  uint64_t v45 = v104;
  sub_24F30();
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  sub_1738C((uint64_t)v9, (uint64_t)v11, &qword_3CF58);
  v54 = &v11[*(int *)(v45 + 36)];
  char *v54 = v42;
  *((void *)v54 + 1) = v47;
  *((void *)v54 + 2) = v49;
  *((void *)v54 + 3) = v51;
  *((void *)v54 + 4) = v53;
  v54[40] = 0;
  sub_173F0((uint64_t)v9, &qword_3CF58);
  unsigned __int8 v55 = sub_25110();
  char v56 = sub_25120();
  char v57 = sub_25140();
  sub_25140();
  if (sub_25140() != v55) {
    char v57 = sub_25140();
  }
  sub_25140();
  char v58 = sub_25140();
  uint64_t v59 = (uint64_t)v115;
  if (v58 != v56) {
    char v57 = sub_25140();
  }
  v60 = v109;
  sub_24F30();
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v66 = v65;
  uint64_t v68 = v67;
  sub_1738C((uint64_t)v11, (uint64_t)v13, &qword_3CF60);
  v69 = &v13[*(int *)(v105 + 36)];
  char *v69 = v57;
  *((void *)v69 + 1) = v62;
  *((void *)v69 + 2) = v64;
  *((void *)v69 + 3) = v66;
  *((void *)v69 + 4) = v68;
  v69[40] = 0;
  sub_173F0((uint64_t)v11, &qword_3CF60);
  uint64_t v70 = sub_25380();
  sub_1510C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v44, 0.0, 1, 0.0, 1, v70, v71, &qword_3CF68, &qword_3CF70);
  sub_173F0((uint64_t)v13, &qword_3CF68);
  uint64_t v72 = sub_25380();
  uint64_t v74 = v73;
  v75 = (char *)v60 + *(int *)(v106 + 20);
  uint64_t v76 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v77 = sub_250A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v77 - 8) + 104))(v75, v76, v77);
  __asm { FMOV            V0.2D, #14.0 }
  _OWORD *v60 = _Q0;
  id v83 = [self secondarySystemGroupedBackgroundColor];
  uint64_t v84 = sub_252B0();
  sub_16D30((uint64_t)v60, v59, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v85 = v108;
  *(void *)(v59 + *(int *)(v108 + 52)) = v84;
  *(_WORD *)(v59 + *(int *)(v85 + 56)) = 256;
  sub_16BD0((uint64_t)v60);
  unsigned __int8 v86 = sub_25130();
  unsigned __int8 v87 = sub_25150();
  char v88 = sub_25140();
  sub_25140();
  if (sub_25140() != v86) {
    char v88 = sub_25140();
  }
  sub_25140();
  if (sub_25140() != v87) {
    char v88 = sub_25140();
  }
  uint64_t v89 = v116;
  uint64_t v90 = (uint64_t)v110;
  uint64_t v91 = (uint64_t)&v110[*(int *)(v107 + 36)];
  sub_24F30();
  uint64_t v93 = v92;
  uint64_t v95 = v94;
  uint64_t v97 = v96;
  uint64_t v99 = v98;
  uint64_t v100 = v114;
  sub_1738C(v59, v114, &qword_3CF48);
  uint64_t v101 = v100 + *(int *)(v112 + 36);
  *(unsigned char *)uint64_t v101 = v88;
  *(void *)(v101 + 8) = v93;
  *(void *)(v101 + 16) = v95;
  *(void *)(v101 + 24) = v97;
  *(void *)(v101 + 32) = v99;
  *(unsigned char *)(v101 + 40) = 0;
  sub_173F0(v59, &qword_3CF48);
  uint64_t v102 = v113;
  sub_17328(v100, v113, &qword_3CF50);
  sub_17328(v102, v91, &qword_3CF50);
  v103 = (uint64_t *)(v91 + *(int *)(sub_16B84(&qword_3CF88) + 36));
  uint64_t *v103 = v72;
  v103[1] = v74;
  sub_17328(v44, v90, &qword_3CF70);
  sub_17328(v90, v89, &qword_3CF78);
}

uint64_t sub_128B8()
{
  uint64_t v2 = (int *)type metadata accessor for ScheduleDayRowView();
  uint64_t v3 = *(void **)(v0 + v2[7] + 8);
  unint64_t v4 = *(void *)(v0 + v2[6]);
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = v3;
  sub_24F00();

  swift_release();
  swift_release();
  if ((v21 & 0xC000000000000001) == 0)
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v4 < *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8)))
    {
      uint64_t v6 = (char *)*(id *)(v21 + 8 * v4 + 32);
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = (char *)sub_254B0();
LABEL_5:
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  unint64_t v1 = &OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType;
  uint64_t v8 = *(void *)&v7[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];

  id v9 = [*(id *)(v0 + v2[5]) unitManager];
  if (!v9) {
    goto LABEL_29;
  }
  uint64_t v10 = v9;
  id v11 = [v9 unitManager];

  if ((unint64_t)(v8 - 1) < 2)
  {
    uint64_t v12 = &selRef_minuteUnit;
    goto LABEL_10;
  }
  if (v8)
  {
    uint64_t v12 = &selRef_countUnit;
LABEL_10:
    uint64_t v13 = self;
    goto LABEL_12;
  }
  uint64_t v12 = &selRef_userActiveEnergyBurnedUnit;
  uint64_t v13 = v11;
LABEL_12:
  uint64_t v2 = (int *)[v13 *v12];

  swift_getKeyPath();
  swift_getKeyPath();
  id v14 = v5;
  sub_24F00();

  swift_release();
  swift_release();
  if ((v21 & 0xC000000000000001) == 0)
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v4 < *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8)))
    {
      uint64_t v15 = (char *)*(id *)(v21 + 8 * v4 + 32);
      swift_bridgeObjectRelease();
      uint64_t v16 = *(void *)&v15[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];

      switch(v16)
      {
        case 0:
          goto LABEL_16;
        case 1:
          goto LABEL_23;
        case 3:
          goto LABEL_25;
        default:
          goto LABEL_24;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
    JUMPOUT(0x12BB8);
  }
LABEL_22:
  uint64_t v19 = sub_254B0();
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(v19 + *v1);
  swift_unknownObjectRelease();
  switch(v20)
  {
    case 0:
LABEL_16:
      int IsCalorieUnit = FIUIHKUnitIsCalorieUnit();

      if (IsCalorieUnit) {
        uint64_t result = 9990;
      }
      else {
        uint64_t result = 39980;
      }
      break;
    case 1:
LABEL_23:

      uint64_t result = 1000;
      break;
    case 3:
LABEL_25:

      uint64_t result = 16;
      break;
    default:
LABEL_24:

      uint64_t result = 90;
      break;
  }
  return result;
}

uint64_t sub_12BD8@<X0>(char *a1@<X0>, void *a2@<X1>, void *a3@<X2>, char *a4@<X8>)
{
  v109 = a2;
  v110 = a3;
  uint64_t v114 = a4;
  uint64_t v5 = sub_16B84(&qword_3CF90);
  __chkstk_darwin(v5 - 8);
  v111 = (uint64_t *)((char *)&v98 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_16B84(&qword_3CF98);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v98 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v98 - v11;
  uint64_t v118 = sub_16B84(&qword_3CFA0);
  uint64_t v13 = __chkstk_darwin(v118);
  uint64_t v104 = (char *)&v98 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v102 = (char *)&v98 - v15;
  uint64_t v16 = sub_24FA0();
  uint64_t v17 = *(void **)(v16 - 8);
  uint64_t v116 = v16;
  unint64_t v117 = v17;
  uint64_t v18 = __chkstk_darwin(v16);
  v115 = (char *)&v98 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v98 - v20;
  uint64_t v103 = sub_16B84(&qword_3CFA8);
  uint64_t v22 = __chkstk_darwin(v103);
  uint64_t v100 = (char *)&v98 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v101 = (uint64_t)&v98 - v24;
  uint64_t v25 = sub_16B84(&qword_3CFB0);
  __chkstk_darwin(v25 - 8);
  uint64_t v27 = (char *)&v98 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_16B84(&qword_3CFB8);
  uint64_t v107 = *(void *)(v28 - 8);
  uint64_t v108 = v28;
  uint64_t v29 = __chkstk_darwin(v28);
  uint64_t v106 = (char *)&v98 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __chkstk_darwin(v29);
  uint64_t v99 = (char *)&v98 - v32;
  __chkstk_darwin(v31);
  uint64_t v105 = (char *)&v98 - v33;
  uint64_t v34 = type metadata accessor for ScheduleDayRowView();
  double v35 = *(void **)&a1[*(int *)(v34 + 28) + 8];
  double v36 = a1;
  unint64_t v37 = *(void *)&a1[*(int *)(v34 + 24)];
  swift_getKeyPath();
  swift_getKeyPath();
  id v38 = v35;
  sub_24F00();

  swift_release();
  uint64_t result = swift_release();
  uint64_t v112 = v12;
  uint64_t v113 = v10;
  if ((v119 & 0xC000000000000001) == 0)
  {
    if ((v37 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v37 < *(void *)((char *)&dword_10 + (v119 & 0xFFFFFFFFFFFFFF8)))
    {
      id v40 = *(id *)(v119 + 8 * v37 + 32);
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_10;
  }
  id v40 = (id)sub_254B0();
LABEL_5:
  char v41 = v40;
  swift_bridgeObjectRelease();
  uint64_t v98 = v36;
  uint64_t v42 = sub_1BE28((uint64_t)v41);
  uint64_t v44 = v43;

  uint64_t v119 = v42;
  uint64_t v120 = v44;
  sub_16C2C();
  uint64_t v45 = sub_251F0();
  uint64_t v47 = v46;
  char v49 = v48 & 1;
  uint64_t v50 = enum case for Font.Design.rounded(_:);
  uint64_t v51 = sub_25180();
  uint64_t v52 = *(void *)(v51 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v52 + 104))(v27, v50, v51);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v52 + 56))(v27, 0, 1, v51);
  uint64_t v53 = sub_251C0();
  uint64_t v55 = v54;
  LOBYTE(v52) = v56 & 1;
  sub_16C80(v45, v47, v49);
  swift_bridgeObjectRelease();
  sub_173F0((uint64_t)v27, &qword_3CFB0);
  sub_25160();
  uint64_t v57 = sub_251E0();
  uint64_t v59 = v58;
  char v61 = v60;
  uint64_t v63 = v62;
  swift_release();
  sub_16C80(v53, v55, v52);
  swift_bridgeObjectRelease();
  uint64_t v119 = v57;
  uint64_t v120 = v59;
  char v121 = v61 & 1;
  uint64_t v122 = v63;
  uint64_t v64 = v116;
  uint64_t v65 = v117;
  uint64_t v66 = (void (*)(char *, void, uint64_t))v117[13];
  uint64_t v67 = v21;
  v66(v21, enum case for DynamicTypeSize.xSmall(_:), v116);
  uint64_t v68 = v115;
  v66(v115, enum case for DynamicTypeSize.xLarge(_:), v64);
  sub_16C90();
  uint64_t result = sub_253B0();
  if (result)
  {
    uint64_t v69 = v118;
    uint64_t v70 = v102;
    uint64_t v71 = &v102[*(int *)(v118 + 48)];
    uint64_t v72 = (void (*)(char *, char *, uint64_t))v65[4];
    v72(v102, v67, v64);
    v72(v71, v68, v64);
    uint64_t v73 = v104;
    uint64_t v74 = &v104[*(int *)(v69 + 48)];
    uint64_t v75 = v64;
    uint64_t v76 = (void (*)(char *, char *, uint64_t))v65[2];
    v76(v104, v70, v64);
    v76(v74, v71, v64);
    uint64_t v77 = (uint64_t)v100;
    v72(v100, v73, v64);
    v78 = (void (*)(char *, uint64_t))v65[1];
    v78(v74, v75);
    v79 = &v73[*(int *)(v118 + 48)];
    v72(v73, v70, v75);
    v72(v79, v71, v75);
    v72((char *)(v77 + *(int *)(v103 + 36)), v79, v75);
    v78(v73, v75);
    uint64_t v80 = v101;
    sub_17328(v77, v101, &qword_3CFA8);
    sub_17668(&qword_3CFD0, &qword_3CFA8);
    v81 = v99;
    sub_25260();
    sub_173F0(v80, &qword_3CFA8);
    sub_16C80(v119, v120, v121);
    swift_bridgeObjectRelease();
    uint64_t v83 = v107;
    uint64_t v82 = v108;
    uint64_t v84 = v105;
    (*(void (**)(char *, char *, uint64_t))(v107 + 32))(v105, v81, v108);
    uint64_t v85 = sub_25080();
    uint64_t v86 = (uint64_t)v111;
    uint64_t *v111 = v85;
    *(void *)(v86 + 8) = 0;
    *(unsigned char *)(v86 + 16) = 1;
    uint64_t v87 = sub_16B84(&qword_3CFD8);
    sub_135BC(v98, v109, v110, v86 + *(int *)(v87 + 44));
    uint64_t v88 = sub_25390();
    uint64_t v89 = (uint64_t)v113;
    sub_1510C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v113, 0.0, 1, 0.0, 1, v88, v90, &qword_3CF90, &qword_3CF98);
    sub_173F0(v86, &qword_3CF90);
    uint64_t v91 = (uint64_t)v112;
    sub_17328(v89, (uint64_t)v112, &qword_3CF98);
    uint64_t v92 = *(void (**)(char *, char *, uint64_t))(v83 + 16);
    uint64_t v93 = v106;
    v92(v106, v84, v82);
    sub_1738C(v91, v89, &qword_3CF98);
    uint64_t v94 = v114;
    v92(v114, v93, v82);
    uint64_t v95 = sub_16B84(&qword_3CFE0);
    uint64_t v96 = &v94[*(int *)(v95 + 48)];
    *(void *)uint64_t v96 = 0;
    v96[8] = 1;
    sub_1738C(v89, (uint64_t)&v94[*(int *)(v95 + 64)], &qword_3CF98);
    sub_173F0(v91, &qword_3CF98);
    uint64_t v97 = *(void (**)(char *, uint64_t))(v83 + 8);
    v97(v84, v82);
    sub_173F0(v89, &qword_3CF98);
    return ((uint64_t (*)(char *, uint64_t))v97)(v93, v82);
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_135BC@<X0>(char *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  v131 = a3;
  v136 = a2;
  uint64_t v122 = a4;
  uint64_t v5 = sub_16B84(&qword_3CFE8);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v123 = (uint64_t)&v112 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  v130 = (uint64_t *)((char *)&v112 - v9);
  __chkstk_darwin(v8);
  v132 = (char *)&v112 - v10;
  uint64_t v11 = type metadata accessor for ScheduleDayRowView();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v112 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (int *)sub_16B84(&qword_3CFF0);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (void (**)())((char *)&v112 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v16);
  uint64_t v20 = (void (**)())((char *)&v112 - v19);
  uint64_t v133 = sub_16B84(&qword_3CFF8);
  uint64_t v21 = __chkstk_darwin(v133);
  uint64_t v116 = (uint64_t)&v112 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v112 - v23;
  uint64_t v134 = sub_16B84(&qword_3D000);
  uint64_t v25 = __chkstk_darwin(v134);
  uint64_t v118 = (uint64_t)&v112 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v112 - v27;
  uint64_t v29 = sub_16B84(&qword_3D008);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  uint64_t v120 = (uint64_t)&v112 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v121 = (uint64_t)&v112 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  unint64_t v117 = (char *)&v112 - v35;
  uint64_t v36 = __chkstk_darwin(v34);
  uint64_t v119 = (uint64_t)&v112 - v37;
  uint64_t v38 = __chkstk_darwin(v36);
  v124 = (char *)&v112 - v39;
  __chkstk_darwin(v38);
  uint64_t v135 = (uint64_t)&v112 - v40;
  sub_16D30((uint64_t)a1, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for ScheduleDayRowView);
  uint64_t v41 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v42 = (v41 + 16) & ~v41;
  uint64_t v126 = v41 | 7;
  uint64_t v127 = v42 + v13;
  uint64_t v43 = swift_allocObject();
  uint64_t v128 = v42;
  v129 = v14;
  sub_16D9C((uint64_t)v14, v43 + v42);
  uint64_t v44 = v15[10];
  uint64_t v137 = 0;
  uint64_t v125 = sub_16B84(&qword_3D010);
  sub_25310();
  *(_OWORD *)((char *)v20 + v44) = v138;
  uint64_t v45 = v15[11];
  uint64_t v137 = 1;
  sub_25310();
  *(_OWORD *)((char *)v20 + v45) = v138;
  *uint64_t v20 = sub_16E00;
  v20[1] = (void (*)())v43;
  sub_14CD0((uint64_t)v20 + v15[9]);
  uint64_t v46 = sub_145B8();
  uint64_t v113 = v11;
  if ((void *)v46 == v136)
  {
    uint64_t v47 = sub_252D0();
    goto LABEL_9;
  }
  char v48 = *(void **)&a1[*(int *)(v11 + 28) + 8];
  unint64_t v49 = *(void *)&a1[*(int *)(v11 + 24)];
  swift_getKeyPath();
  swift_getKeyPath();
  id v50 = v48;
  sub_24F00();

  swift_release();
  swift_release();
  if ((v138 & 0xC000000000000001) != 0)
  {
    uint64_t v51 = (char *)sub_254B0();
    goto LABEL_8;
  }
  if ((v49 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (v49 >= *(void *)((char *)&dword_10 + (v138 & 0xFFFFFFFFFFFFFF8)))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    uint64_t v85 = (char *)sub_254B0();
    goto LABEL_15;
  }
  uint64_t v51 = (char *)*(id *)(v138 + 8 * v49 + 32);
LABEL_8:
  uint64_t v52 = v51;
  swift_bridgeObjectRelease();
  unint64_t v53 = *(void *)&v52[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];

  uint64_t v47 = sub_195BC(v53);
LABEL_9:
  uint64_t v54 = v47;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)&long long v138 = v54;
  swift_retain();
  uint64_t v56 = sub_24F70();
  sub_1738C((uint64_t)v20, (uint64_t)v24, &qword_3CFF0);
  swift_release();
  uint64_t v57 = (uint64_t *)&v24[*(int *)(v133 + 36)];
  *uint64_t v57 = KeyPath;
  v57[1] = v56;
  sub_173F0((uint64_t)v20, &qword_3CFF0);
  uint64_t v58 = sub_145B8();
  uint64_t v59 = v136;
  LOBYTE(KeyPath) = v58 == (void)v136;
  uint64_t v60 = swift_getKeyPath();
  uint64_t v61 = swift_allocObject();
  *(unsigned char *)(v61 + 16) = KeyPath;
  sub_1738C((uint64_t)v24, (uint64_t)v28, &qword_3CFF8);
  uint64_t v62 = (uint64_t *)&v28[*(int *)(v134 + 36)];
  *uint64_t v62 = v60;
  v62[1] = (uint64_t)sub_16EC8;
  v62[2] = v61;
  sub_173F0((uint64_t)v24, &qword_3CFF8);
  sub_16EE0();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v114 = self;
  uint64_t v115 = ObjCClassFromMetadata;
  id v64 = [v114 bundleForClass:ObjCClassFromMetadata];
  NSString v65 = sub_253D0();
  NSString v66 = sub_253D0();
  id v67 = [v64 localizedStringForKey:v65 value:0 table:v66];

  uint64_t v68 = sub_253E0();
  uint64_t v70 = v69;

  *(void *)&long long v138 = v68;
  *((void *)&v138 + 1) = v70;
  sub_16F20();
  sub_16C2C();
  uint64_t v71 = (uint64_t)v124;
  sub_25280();
  swift_bridgeObjectRelease();
  sub_173F0((uint64_t)v28, &qword_3D000);
  sub_17328(v71, v135, &qword_3D008);
  uint64_t v72 = sub_25380();
  uint64_t v73 = (uint64_t)v130;
  uint64_t *v130 = v72;
  *(void *)(v73 + 8) = v74;
  uint64_t v75 = sub_16B84(&qword_3D058);
  sub_148D8(a1, v59, v131, (char *)(v73 + *(int *)(v75 + 44)));
  uint64_t v28 = v132;
  sub_17328(v73, (uint64_t)v132, &qword_3CFE8);
  uint64_t v76 = (uint64_t)v129;
  sub_16D30((uint64_t)a1, (uint64_t)v129, (uint64_t (*)(void))type metadata accessor for ScheduleDayRowView);
  uint64_t v77 = swift_allocObject();
  sub_16D9C(v76, v77 + v128);
  uint64_t v78 = v15[10];
  uint64_t v137 = 0;
  sub_25310();
  *(_OWORD *)((char *)v18 + v78) = v138;
  uint64_t v79 = v15[11];
  uint64_t v137 = 1;
  sub_25310();
  *(_OWORD *)((char *)v18 + v79) = v138;
  void *v18 = sub_17188;
  v18[1] = (void (*)())v77;
  sub_14CD0((uint64_t)v18 + v15[9]);
  if ((void *)sub_128B8() == v59)
  {
    uint64_t v80 = sub_252D0();
LABEL_16:
    uint64_t v88 = v80;
    uint64_t v89 = swift_getKeyPath();
    *(void *)&long long v138 = v88;
    swift_retain();
    uint64_t v90 = sub_24F70();
    uint64_t v91 = v116;
    sub_1738C((uint64_t)v18, v116, &qword_3CFF0);
    swift_release();
    uint64_t v92 = (uint64_t *)(v91 + *(int *)(v133 + 36));
    *uint64_t v92 = v89;
    v92[1] = v90;
    sub_173F0((uint64_t)v18, &qword_3CFF0);
    LOBYTE(v89) = sub_128B8() == (void)v136;
    uint64_t v93 = swift_getKeyPath();
    uint64_t v94 = swift_allocObject();
    *(unsigned char *)(v94 + 16) = v89;
    uint64_t v95 = v118;
    sub_1738C(v91, v118, &qword_3CFF8);
    uint64_t v96 = (uint64_t *)(v95 + *(int *)(v134 + 36));
    *uint64_t v96 = v93;
    v96[1] = (uint64_t)sub_176AC;
    v96[2] = v94;
    sub_173F0(v91, &qword_3CFF8);
    id v97 = [v114 bundleForClass:v115];
    NSString v98 = sub_253D0();
    NSString v99 = sub_253D0();
    id v100 = [v97 localizedStringForKey:v98 value:0 table:v99];

    uint64_t v101 = sub_253E0();
    uint64_t v103 = v102;

    *(void *)&long long v138 = v101;
    *((void *)&v138 + 1) = v103;
    uint64_t v104 = (uint64_t)v117;
    sub_25280();
    swift_bridgeObjectRelease();
    sub_173F0(v95, &qword_3D000);
    uint64_t v105 = v119;
    sub_17328(v104, v119, &qword_3D008);
    uint64_t v106 = v135;
    uint64_t v107 = v121;
    sub_1738C(v135, v121, &qword_3D008);
    uint64_t v108 = v123;
    sub_1738C((uint64_t)v28, v123, &qword_3CFE8);
    uint64_t v109 = v120;
    sub_1738C(v105, v120, &qword_3D008);
    uint64_t v110 = v122;
    sub_1738C(v107, v122, &qword_3D008);
    uint64_t v111 = sub_16B84(&qword_3D060);
    sub_1738C(v108, v110 + *(int *)(v111 + 48), &qword_3CFE8);
    sub_1738C(v109, v110 + *(int *)(v111 + 64), &qword_3D008);
    sub_173F0(v105, &qword_3D008);
    sub_173F0((uint64_t)v28, &qword_3CFE8);
    sub_173F0(v106, &qword_3D008);
    sub_173F0(v109, &qword_3D008);
    sub_173F0(v108, &qword_3CFE8);
    return sub_173F0(v107, &qword_3D008);
  }
  v81 = *(void **)&a1[*(int *)(v113 + 28) + 8];
  unint64_t v82 = *(void *)&a1[*(int *)(v113 + 24)];
  swift_getKeyPath();
  swift_getKeyPath();
  id v83 = v81;
  sub_24F00();

  swift_release();
  uint64_t result = swift_release();
  if ((v138 & 0xC000000000000001) != 0) {
    goto LABEL_20;
  }
  if ((v82 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v82 < *(void *)((char *)&dword_10 + (v138 & 0xFFFFFFFFFFFFFF8)))
  {
    uint64_t v85 = (char *)*(id *)(v138 + 8 * v82 + 32);
LABEL_15:
    uint64_t v86 = v85;
    swift_bridgeObjectRelease();
    unint64_t v87 = *(void *)&v86[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];

    uint64_t v80 = sub_195BC(v87);
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

void sub_142A8(char a1)
{
  uint64_t v3 = (int *)type metadata accessor for ScheduleDayRowView();
  unint64_t v4 = *(void **)(v1 + v3[7] + 8);
  unint64_t v5 = *(void *)(v1 + v3[6]);
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = v4;
  sub_24F00();

  swift_release();
  swift_release();
  id v7 = (id)v26;
  if ((v26 & 0xC000000000000001) == 0)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v5 < *(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFFF8)))
    {
      uint64_t v8 = (char *)*(id *)(v26 + 8 * v5 + 32);
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v8 = (char *)sub_254B0();
LABEL_5:
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  id v7 = *(id *)&v9[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal];

  swift_getKeyPath();
  swift_getKeyPath();
  id v10 = v6;
  sub_24F00();

  swift_release();
  swift_release();
  if ((v26 & 0xC000000000000001) == 0)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v5 < *(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFFF8)))
    {
      uint64_t v11 = (char *)*(id *)(v26 + 8 * v5 + 32);
      goto LABEL_9;
    }
    __break(1u);
    goto LABEL_34;
  }
LABEL_31:
  uint64_t v11 = (char *)sub_254B0();
LABEL_9:
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)&v12[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];

  id v14 = [*(id *)(v1 + v3[5]) unitManager];
  if (!v14)
  {
LABEL_38:
    __break(1u);
    return;
  }
  uint64_t v15 = v14;
  id v16 = [v14 unitManager];

  if ((unint64_t)(v13 - 1) < 2)
  {
    uint64_t v17 = &selRef_minuteUnit;
    goto LABEL_14;
  }
  if (v13)
  {
    uint64_t v17 = &selRef_countUnit;
LABEL_14:
    uint64_t v18 = self;
    goto LABEL_16;
  }
  uint64_t v17 = &selRef_userActiveEnergyBurnedUnit;
  uint64_t v18 = v16;
LABEL_16:
  id v19 = [v18 *v17];

  [v7 doubleValueForUnit:v19];
  double v21 = v20;

  double v22 = floor(v21);
  if ((~*(void *)&v22 & 0x7FF0000000000000) == 0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v22 <= -9.22337204e18)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (v22 >= 9.22337204e18)
  {
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v23 = (uint64_t)v22;
  uint64_t v24 = sub_163B4();
  if ((a1 & 1) == 0) {
    goto LABEL_23;
  }
  uint64_t v25 = (void *)(v23 + v24);
  if (__OFADD__(v23, v24))
  {
    __break(1u);
LABEL_23:
    uint64_t v25 = (void *)(v23 - v24);
    if (!__OFSUB__(v23, v24)) {
      goto LABEL_24;
    }
    goto LABEL_37;
  }
LABEL_24:
  if ((uint64_t)v25 >= sub_145B8() && sub_128B8() >= (uint64_t)v25) {
    sub_166D4(v25);
  }
}

uint64_t sub_145B8()
{
  uint64_t v2 = (int *)type metadata accessor for ScheduleDayRowView();
  uint64_t v3 = *(void **)(v0 + v2[7] + 8);
  unint64_t v4 = *(void *)(v0 + v2[6]);
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = v3;
  sub_24F00();

  swift_release();
  swift_release();
  if ((v21 & 0xC000000000000001) == 0)
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v4 < *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8)))
    {
      id v6 = (char *)*(id *)(v21 + 8 * v4 + 32);
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_22;
  }
  id v6 = (char *)sub_254B0();
LABEL_5:
  id v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v1 = &OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType;
  uint64_t v8 = *(void *)&v7[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];

  id v9 = [*(id *)(v0 + v2[5]) unitManager];
  if (!v9) {
    goto LABEL_29;
  }
  id v10 = v9;
  id v11 = [v9 unitManager];

  if ((unint64_t)(v8 - 1) < 2)
  {
    uint64_t v12 = &selRef_minuteUnit;
    goto LABEL_10;
  }
  if (v8)
  {
    uint64_t v12 = &selRef_countUnit;
LABEL_10:
    uint64_t v13 = self;
    goto LABEL_12;
  }
  uint64_t v12 = &selRef_userActiveEnergyBurnedUnit;
  uint64_t v13 = v11;
LABEL_12:
  uint64_t v2 = (int *)[v13 *v12];

  swift_getKeyPath();
  swift_getKeyPath();
  id v14 = v5;
  sub_24F00();

  swift_release();
  swift_release();
  if ((v21 & 0xC000000000000001) == 0)
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v4 < *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8)))
    {
      uint64_t v15 = (char *)*(id *)(v21 + 8 * v4 + 32);
      swift_bridgeObjectRelease();
      uint64_t v16 = *(void *)&v15[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];

      switch(v16)
      {
        case 0:
          goto LABEL_16;
        case 1:
          goto LABEL_23;
        case 3:
          goto LABEL_25;
        default:
          goto LABEL_24;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
    JUMPOUT(0x148B8);
  }
LABEL_22:
  uint64_t v19 = sub_254B0();
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(v19 + *v1);
  swift_unknownObjectRelease();
  switch(v20)
  {
    case 0:
LABEL_16:
      int IsCalorieUnit = FIUIHKUnitIsCalorieUnit();

      if (IsCalorieUnit) {
        uint64_t result = 10;
      }
      else {
        uint64_t result = 20;
      }
      break;
    case 1:
LABEL_23:

      uint64_t result = 10;
      break;
    case 3:
LABEL_25:

      uint64_t result = 6;
      break;
    default:
LABEL_24:

      uint64_t result = 5;
      break;
  }
  return result;
}

uint64_t sub_148D8@<X0>(char *a1@<X0>, void *a2@<X1>, void *a3@<X2>, char *a4@<X8>)
{
  uint64_t v35 = a3;
  uint64_t v36 = a4;
  uint64_t v34 = sub_16B84(&qword_3D088) - 8;
  uint64_t v6 = __chkstk_darwin(v34);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v33 = (uint64_t)&v29 - v9;
  uint64_t v10 = sub_250E0();
  uint64_t v31 = *(void *)(v10 - 8);
  uint64_t v32 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_16B84(&qword_3D090);
  __chkstk_darwin(v30);
  id v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_16B84(&qword_3D098);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v29 - v20;
  *(void *)id v14 = sub_25070();
  *((void *)v14 + 1) = 0;
  v14[16] = 0;
  uint64_t v22 = sub_16B84(&qword_3D0A0);
  sub_152DC(a2, a1, &v14[*(int *)(v22 + 44)]);
  sub_250D0();
  sub_17668(&qword_3D0A8, &qword_3D090);
  sub_252A0();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v32);
  sub_173F0((uint64_t)v14, &qword_3D090);
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v19, v15);
  *(void *)id v14 = sub_25070();
  *((void *)v14 + 1) = 0;
  v14[16] = 0;
  sub_152DC(v35, a1, &v14[*(int *)(v22 + 44)]);
  sub_1738C((uint64_t)v14, (uint64_t)v8, &qword_3D090);
  *(void *)&v8[*(int *)(v34 + 44)] = 0;
  sub_173F0((uint64_t)v14, &qword_3D090);
  uint64_t v23 = v33;
  sub_17328((uint64_t)v8, v33, &qword_3D088);
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  v24(v19, v21, v15);
  sub_1738C(v23, (uint64_t)v8, &qword_3D088);
  uint64_t v25 = v36;
  v24(v36, v19, v15);
  uint64_t v26 = sub_16B84(&qword_3D0B0);
  sub_1738C((uint64_t)v8, (uint64_t)&v25[*(int *)(v26 + 48)], &qword_3D088);
  sub_173F0(v23, &qword_3D088);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v16 + 8);
  v27(v21, v15);
  sub_173F0((uint64_t)v8, &qword_3D088);
  return ((uint64_t (*)(char *, uint64_t))v27)(v19, v15);
}

uint64_t sub_14CD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v39 = a1;
  uint64_t v40 = sub_16B84(&qword_3CFA0);
  uint64_t v1 = __chkstk_darwin(v40);
  uint64_t v38 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  unint64_t v4 = (char *)&v34 - v3;
  uint64_t v5 = sub_24FA0();
  uint64_t v6 = *(void **)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v34 - v10;
  uint64_t v12 = sub_16B84(&qword_3CFA8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v37 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v34 - v15;
  uint64_t v17 = sub_25300();
  uint64_t v18 = sub_251A0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v41 = v17;
  uint64_t v42 = KeyPath;
  uint64_t v43 = v18;
  uint64_t v20 = v6;
  uint64_t v21 = (void (*)(char *, void, uint64_t))v6[13];
  v21(v11, enum case for DynamicTypeSize.xSmall(_:), v5);
  v21(v9, enum case for DynamicTypeSize.xLarge(_:), v5);
  sub_16C90();
  uint64_t result = sub_253B0();
  if (result)
  {
    uint64_t v35 = v12;
    uint64_t v36 = v16;
    uint64_t v23 = v40;
    uint64_t v24 = &v4[*(int *)(v40 + 48)];
    uint64_t v25 = (void (*)(char *, char *, uint64_t))v20[4];
    v25(v4, v11, v5);
    uint64_t v34 = v24;
    v25(v24, v9, v5);
    uint64_t v26 = *(int *)(v23 + 48);
    uint64_t v27 = v38;
    uint64_t v28 = &v38[v26];
    uint64_t v29 = (void (*)(char *, char *, uint64_t))v20[2];
    v29(v38, v4, v5);
    v29(v28, v24, v5);
    uint64_t v30 = (uint64_t)v37;
    v25(v37, v27, v5);
    uint64_t v31 = (void (*)(char *, uint64_t))v20[1];
    v31(v28, v5);
    uint64_t v32 = &v27[*(int *)(v40 + 48)];
    v25(v27, v4, v5);
    v25(v32, v34, v5);
    v25((char *)(v30 + *(int *)(v35 + 36)), v32, v5);
    v31(v27, v5);
    uint64_t v33 = (uint64_t)v36;
    sub_17328(v30, (uint64_t)v36, &qword_3CFA8);
    sub_16B84(&qword_3D068);
    sub_1720C();
    sub_17668(&qword_3CFD0, &qword_3CFA8);
    sub_25260();
    sub_173F0(v33, &qword_3CFA8);
    swift_release();
    swift_release();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

__n128 sub_1510C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_25430();
    uint64_t v28 = (void *)sub_250F0();
    sub_24CD0();

    uint64_t v19 = a17;
  }
  sub_24FC0();
  sub_1738C(v17, a9, a16);
  uint64_t v29 = (_OWORD *)(a9 + *(int *)(sub_16B84(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  _OWORD *v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

uint64_t sub_152DC@<X0>(void *a1@<X0>, char *a2@<X1>, char *a3@<X8>)
{
  v153 = a2;
  v143 = a3;
  uint64_t v166 = sub_16B84(&qword_3CFA0);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v163 = (char *)&v126 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v160 = (char *)&v126 - v6;
  uint64_t v7 = sub_24FA0();
  v167 = *(void **)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  v169 = (char *)&v126 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v168 = (char *)&v126 - v10;
  uint64_t v161 = sub_16B84(&qword_3CFA8);
  uint64_t v11 = __chkstk_darwin(v161);
  v155 = (char *)&v126 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v159 = (uint64_t)&v126 - v13;
  uint64_t v14 = sub_16B84(&qword_3CFB0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v126 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = sub_16B84(&qword_3CFB8);
  uint64_t v165 = *(void *)(v158 - 8);
  __chkstk_darwin(v158);
  v154 = (char *)&v126 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = sub_16B84(&qword_3D0B8);
  uint64_t v162 = *(void *)(v164 - 8);
  uint64_t v18 = __chkstk_darwin(v164);
  v142 = (char *)&v126 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  v141 = (char *)&v126 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  v157 = (char *)&v126 - v23;
  __chkstk_darwin(v22);
  v156 = (char *)&v126 - v24;
  v170 = a1;
  v170 = (void *)sub_25500();
  uint64_t v171 = v25;
  unint64_t v151 = sub_16C2C();
  uint64_t v26 = sub_251F0();
  uint64_t v28 = v27;
  char v30 = v29 & 1;
  uint64_t v31 = enum case for Font.Design.rounded(_:);
  uint64_t v32 = sub_25180();
  uint64_t v33 = *(void *)(v32 - 8);
  __n128 v34 = *(void (**)(char *, void, uint64_t))(v33 + 104);
  unsigned int v148 = v31;
  uint64_t v147 = v33 + 104;
  v146 = v34;
  v34(v16, v31, v32);
  long long v35 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v33 + 56);
  uint64_t v150 = v32;
  uint64_t v149 = v33 + 56;
  v145 = v35;
  v35((uint64_t)v16, 0, 1, v32);
  uint64_t v36 = sub_251C0();
  uint64_t v38 = v37;
  LOBYTE(v33) = v39 & 1;
  sub_16C80(v26, v28, v30);
  swift_bridgeObjectRelease();
  v152 = v16;
  sub_173F0((uint64_t)v16, &qword_3CFB0);
  sub_25190();
  uint64_t v40 = sub_251D0();
  uint64_t v42 = v41;
  LOBYTE(v28) = v43 & 1;
  sub_16C80(v36, v38, v33);
  swift_bridgeObjectRelease();
  sub_25170();
  uint64_t v44 = (void *)sub_251E0();
  uint64_t v46 = v45;
  LOBYTE(v36) = v47;
  uint64_t v49 = v48;
  swift_release();
  uint64_t v50 = v42;
  uint64_t v51 = v167;
  sub_16C80(v40, v50, v28);
  swift_bridgeObjectRelease();
  v170 = v44;
  uint64_t v171 = v46;
  LOBYTE(v172) = v36 & 1;
  uint64_t v173 = v49;
  unsigned int v52 = enum case for DynamicTypeSize.xSmall(_:);
  unint64_t v53 = (void (*)(char *, void, uint64_t))v51[13];
  v53(v168, enum case for DynamicTypeSize.xSmall(_:), v7);
  unsigned int v54 = enum case for DynamicTypeSize.xLarge(_:);
  v53(v169, enum case for DynamicTypeSize.xLarge(_:), v7);
  unint64_t v144 = sub_16C90();
  uint64_t result = sub_253B0();
  if (result)
  {
    unsigned int v139 = v52;
    uint64_t v56 = *(int *)(v166 + 48);
    uint64_t v57 = v166;
    unsigned int v140 = v54;
    uint64_t v58 = v160;
    long long v138 = v51 + 13;
    uint64_t v59 = &v160[v56];
    uint64_t v60 = (void (*)(char *, char *, uint64_t))v51[4];
    v60(v160, v168, v7);
    v60(v59, v169, v7);
    uint64_t v61 = *(int *)(v57 + 48);
    uint64_t v137 = v53;
    uint64_t v62 = v163;
    uint64_t v63 = &v163[v61];
    id v64 = (void (*)(char *, char *, uint64_t))v51[2];
    v64(v163, v58, v7);
    uint64_t v133 = v51 + 2;
    v132 = v64;
    v64(v63, v59, v7);
    uint64_t v65 = (uint64_t)v155;
    v60(v155, v62, v7);
    NSString v66 = (void (*)(char *, uint64_t))v51[1];
    v66(v63, v7);
    id v67 = &v62[*(int *)(v166 + 48)];
    v60(v62, v58, v7);
    v60(v67, v59, v7);
    uint64_t v68 = v161;
    uint64_t v69 = v65 + *(int *)(v161 + 36);
    v136 = v51 + 4;
    uint64_t v135 = v60;
    v60((char *)v69, v67, v7);
    v167 = v51 + 1;
    uint64_t v134 = v66;
    v66(v62, v7);
    uint64_t v70 = v159;
    sub_17328(v65, v159, &qword_3CFA8);
    uint64_t v71 = sub_17668(&qword_3CFD0, &qword_3CFA8);
    uint64_t v72 = v154;
    sub_25260();
    sub_173F0(v70, &qword_3CFA8);
    sub_16C80((uint64_t)v170, v171, (char)v172);
    swift_bridgeObjectRelease();
    v170 = &type metadata for Text;
    uint64_t v171 = v68;
    v172 = &protocol witness table for Text;
    uint64_t v173 = v71;
    uint64_t v131 = v71;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v74 = v157;
    uint64_t v75 = v158;
    uint64_t v130 = OpaqueTypeConformance2;
    sub_25270();
    uint64_t v76 = *(void (**)(char *, uint64_t))(v165 + 8);
    v165 += 8;
    v129 = v76;
    v76(v72, v75);
    uint64_t v77 = *(void (**)(char *, char *, uint64_t))(v162 + 32);
    uint64_t v128 = v162 + 32;
    uint64_t v127 = v77;
    v77(v156, v74, v164);
    v170 = (void *)sub_16154();
    uint64_t v171 = v78;
    uint64_t v79 = (void *)sub_25480();
    uint64_t v81 = v80;
    swift_bridgeObjectRelease();
    v170 = v79;
    uint64_t v171 = v81;
    uint64_t v82 = sub_251F0();
    uint64_t v84 = v83;
    LOBYTE(v81) = v85 & 1;
    uint64_t v86 = (uint64_t)v152;
    uint64_t v87 = v150;
    v146(v152, v148, v150);
    v145(v86, 0, 1, v87);
    uint64_t v88 = sub_251C0();
    uint64_t v90 = v89;
    LOBYTE(v60) = v91 & 1;
    sub_16C80(v82, v84, v81);
    swift_bridgeObjectRelease();
    sub_173F0(v86, &qword_3CFB0);
    sub_25190();
    uint64_t v92 = sub_251D0();
    uint64_t v94 = v93;
    LOBYTE(v81) = v95 & 1;
    sub_16C80(v88, v90, (char)v60);
    swift_bridgeObjectRelease();
    sub_251A0();
    uint64_t v96 = (void *)sub_251E0();
    uint64_t v98 = v97;
    LOBYTE(v60) = v99;
    uint64_t v101 = v100;
    swift_release();
    sub_16C80(v92, v94, v81);
    swift_bridgeObjectRelease();
    v170 = v96;
    uint64_t v171 = v98;
    LOBYTE(v172) = v60 & 1;
    uint64_t v173 = v101;
    uint64_t v102 = v137;
    v137(v168, v139, v7);
    v102(v169, v140, v7);
    uint64_t result = sub_253B0();
    if (result)
    {
      uint64_t v103 = v166;
      uint64_t v104 = v160;
      uint64_t v105 = &v160[*(int *)(v166 + 48)];
      uint64_t v106 = v135;
      v135(v160, v168, v7);
      v153 = v105;
      v106(v105, v169, v7);
      uint64_t v107 = v163;
      uint64_t v108 = &v163[*(int *)(v103 + 48)];
      uint64_t v109 = v132;
      v132(v163, v104, v7);
      v109(v108, v105, v7);
      uint64_t v110 = (uint64_t)v155;
      v106(v155, v107, v7);
      uint64_t v111 = v134;
      v134(v108, v7);
      uint64_t v112 = &v107[*(int *)(v103 + 48)];
      v106(v107, v104, v7);
      v106(v112, v153, v7);
      v106((char *)(v110 + *(int *)(v161 + 36)), v112, v7);
      v111(v107, v7);
      uint64_t v113 = v159;
      sub_17328(v110, v159, &qword_3CFA8);
      id v114 = v154;
      sub_25260();
      sub_173F0(v113, &qword_3CFA8);
      sub_16C80((uint64_t)v170, v171, (char)v172);
      swift_bridgeObjectRelease();
      uint64_t v115 = v141;
      uint64_t v116 = v158;
      sub_25270();
      v129(v114, v116);
      unint64_t v117 = v157;
      uint64_t v118 = v164;
      v127(v157, v115, v164);
      uint64_t v119 = v162;
      uint64_t v120 = *(void (**)(char *, char *, uint64_t))(v162 + 16);
      uint64_t v121 = v156;
      v120(v115, v156, v118);
      uint64_t v122 = v142;
      v120(v142, v117, v118);
      uint64_t v123 = v143;
      v120(v143, v115, v118);
      uint64_t v124 = sub_16B84(&qword_3D0C0);
      v120(&v123[*(int *)(v124 + 48)], v122, v118);
      uint64_t v125 = *(void (**)(char *, uint64_t))(v119 + 8);
      v125(v117, v118);
      v125(v121, v118);
      v125(v122, v118);
      return ((uint64_t (*)(char *, uint64_t))v125)(v115, v118);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_16154()
{
  uint64_t v1 = (int *)type metadata accessor for ScheduleDayRowView();
  uint64_t v2 = *(void **)(v0 + v1[7] + 8);
  unint64_t v3 = *(void *)(v0 + v1[6]);
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  sub_24F00();

  swift_release();
  swift_release();
  if ((v11 & 0xC000000000000001) != 0)
  {
LABEL_7:
    uint64_t v7 = sub_254B0();
    swift_bridgeObjectRelease();
    uint64_t v8 = *(void *)(v7 + OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType);
    swift_unknownObjectRelease();
    switch(v8)
    {
      case 0:
        goto LABEL_5;
      case 1:
        goto LABEL_8;
      case 2:
        goto LABEL_10;
      case 3:
        goto LABEL_12;
      default:
        return 0;
    }
  }
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v3 >= *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8)))
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    JUMPOUT(0x16394);
  }
  uint64_t v5 = (char *)*(id *)(v11 + 8 * v3 + 32);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)&v5[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];

  switch(v6)
  {
    case 0:
LABEL_5:
      uint64_t v1 = (int *)[*(id *)(v0 + v1[5]) localizedShortActiveEnergyUnitString];
      if (v1) {
        goto LABEL_13;
      }
      __break(1u);
      goto LABEL_7;
    case 1:
LABEL_8:
      uint64_t v1 = (int *)[*(id *)(v0 + v1[5]) localizedShortBriskMinutesUnitString];
      if (v1) {
        goto LABEL_13;
      }
      __break(1u);
LABEL_10:
      uint64_t v1 = (int *)[*(id *)(v0 + v1[5]) localizedShortBriskMinutesUnitString];
      if (!v1)
      {
        __break(1u);
LABEL_12:
        uint64_t v1 = (int *)[*(id *)(v0 + v1[5]) localizedShortActiveHoursUnitString];
        if (!v1) {
          goto LABEL_18;
        }
      }
LABEL_13:
      uint64_t v9 = sub_253E0();

      return v9;
    case 2:
      goto LABEL_10;
    case 3:
      goto LABEL_12;
    default:
      return 0;
  }
}

uint64_t sub_163B4()
{
  uint64_t v2 = (int *)type metadata accessor for ScheduleDayRowView();
  unint64_t v3 = *(void **)(v0 + v2[7] + 8);
  unint64_t v4 = *(void *)(v0 + v2[6]);
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = v3;
  sub_24F00();

  swift_release();
  swift_release();
  if ((v21 & 0xC000000000000001) == 0)
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v4 < *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8)))
    {
      uint64_t v6 = (char *)*(id *)(v21 + 8 * v4 + 32);
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = (char *)sub_254B0();
LABEL_5:
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v1 = &OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType;
  uint64_t v8 = *(void *)&v7[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];

  id v9 = [*(id *)(v0 + v2[5]) unitManager];
  if (!v9) {
    goto LABEL_29;
  }
  uint64_t v10 = v9;
  id v11 = [v9 unitManager];

  if ((unint64_t)(v8 - 1) < 2)
  {
    uint64_t v12 = &selRef_minuteUnit;
    goto LABEL_10;
  }
  if (v8)
  {
    uint64_t v12 = &selRef_countUnit;
LABEL_10:
    uint64_t v13 = self;
    goto LABEL_12;
  }
  uint64_t v12 = &selRef_userActiveEnergyBurnedUnit;
  uint64_t v13 = v11;
LABEL_12:
  uint64_t v2 = (int *)[v13 *v12];

  swift_getKeyPath();
  swift_getKeyPath();
  id v14 = v5;
  sub_24F00();

  swift_release();
  swift_release();
  if ((v21 & 0xC000000000000001) == 0)
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v4 < *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8)))
    {
      uint64_t v15 = (char *)*(id *)(v21 + 8 * v4 + 32);
      swift_bridgeObjectRelease();
      uint64_t v16 = *(void *)&v15[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];

      switch(v16)
      {
        case 0:
          goto LABEL_16;
        case 1:
          goto LABEL_23;
        case 2:
          goto LABEL_25;
        default:
          goto LABEL_24;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
    JUMPOUT(0x166B4);
  }
LABEL_22:
  uint64_t v19 = sub_254B0();
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(v19 + *v1);
  swift_unknownObjectRelease();
  switch(v20)
  {
    case 0:
LABEL_16:
      int IsCalorieUnit = FIUIHKUnitIsCalorieUnit();

      if (IsCalorieUnit) {
        uint64_t result = 10;
      }
      else {
        uint64_t result = 20;
      }
      break;
    case 1:
LABEL_23:

      uint64_t result = 10;
      break;
    case 2:
LABEL_25:

      uint64_t result = 5;
      break;
    default:
LABEL_24:

      uint64_t result = 1;
      break;
  }
  return result;
}

id sub_166D4(id a1)
{
  unint64_t v3 = (int *)type metadata accessor for ScheduleDayRowView();
  uint64_t v4 = v3[6];
  uint64_t v5 = v1 + v3[7];
  uint64_t v6 = *(void **)(v5 + 8);
  unint64_t v7 = *(void *)(v1 + v4);
  swift_getKeyPath();
  swift_getKeyPath();
  id v8 = v6;
  sub_24F00();

  swift_release();
  swift_release();
  if (((unint64_t)v37 & 0xC000000000000001) == 0)
  {
    if ((v7 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v7 < *(void *)((char *)&dword_10 + ((unint64_t)v37 & 0xFFFFFFFFFFFFFF8)))
    {
      id v9 = (char *)v37[v7 + 4];
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_30;
  }
  id v9 = (char *)sub_254B0();
LABEL_5:
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)&v10[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];

  id result = [*(id *)(v1 + v3[5]) unitManager];
  if (result)
  {
    uint64_t v13 = result;
    id v14 = [result unitManager];

    if ((unint64_t)(v11 - 1) < 2)
    {
      uint64_t v15 = &selRef_minuteUnit;
    }
    else
    {
      if (!v11)
      {
        uint64_t v15 = &selRef_userActiveEnergyBurnedUnit;
        uint64_t v16 = v14;
LABEL_12:
        id v17 = [v16 *v15];

        a1 = [self quantityWithUnit:v17 doubleValue:(double)(uint64_t)a1];
        swift_getKeyPath();
        swift_getKeyPath();
        unint64_t v3 = (int *)v8;
        sub_24F00();

        swift_release();
        swift_release();
        uint64_t v18 = v37;
        if (((unint64_t)v37 & 0xC000000000000001) == 0)
        {
          if ((v7 & 0x8000000000000000) != 0)
          {
            __break(1u);
          }
          else if (v7 < *(void *)((char *)&dword_10 + ((unint64_t)v37 & 0xFFFFFFFFFFFFFF8)))
          {
            uint64_t v19 = v37[v7 + 4];
            goto LABEL_16;
          }
          __break(1u);
          goto LABEL_33;
        }
LABEL_30:
        uint64_t v19 = (unsigned char *)sub_254B0();
LABEL_16:
        uint64_t v20 = v19;
        swift_bridgeObjectRelease();
        LOBYTE(v11) = v20[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day];

        swift_getKeyPath();
        swift_getKeyPath();
        uint64_t v18 = (id *)a1;
        uint64_t v21 = v3;
        sub_24F00();

        swift_release();
        id result = (id)swift_release();
        if (((unint64_t)v37 & 0xC000000000000001) == 0)
        {
          if ((v7 & 0x8000000000000000) != 0)
          {
            __break(1u);
          }
          else if (v7 < *(void *)((char *)&dword_10 + ((unint64_t)v37 & 0xFFFFFFFFFFFFFF8)))
          {
            uint64_t v22 = (char *)v37[v7 + 4];
LABEL_20:
            uint64_t v23 = v22;
            swift_bridgeObjectRelease();
            uint64_t v24 = *(void *)&v23[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];

            uint64_t v25 = (objc_class *)type metadata accessor for GoalDay();
            uint64_t v26 = objc_allocWithZone(v25);
            v26[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] = v11;
            *(void *)&v26[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal] = v18;
            *(void *)&v26[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType] = v24;
            v38.receiver = v26;
            v38.super_class = v25;
            id v27 = objc_msgSendSuper2(&v38, "init");
            uint64_t v28 = *(void **)(v5 + 8);
            unint64_t v29 = *(void *)(v1 + v4);
            swift_getKeyPath();
            swift_getKeyPath();
            id v30 = v28;
            id v31 = v27;
            uint64_t v32 = (void (*)(id **, void))sub_24EF0();
            __n128 v34 = v33;
            unint64_t v35 = *v33;
            id result = (id)swift_isUniquelyReferenced_nonNull_bridgeObject();
            *__n128 v34 = v35;
            if (!result || (v35 & 0x8000000000000000) != 0 || (v35 & 0x4000000000000000) != 0)
            {
              id result = (id)sub_172AC(v35);
              unint64_t v35 = (unint64_t)result;
              *__n128 v34 = (unint64_t)result;
            }
            if ((v29 & 0x8000000000000000) == 0)
            {
              if (v29 < *(void *)((char *)&dword_10 + (v35 & 0xFFFFFFFFFFFFFF8)))
              {
                uint64_t v36 = *(void **)((char *)&stru_20.cmd + 8 * v29 + (v35 & 0xFFFFFFFFFFFFFF8));
                *(void *)((char *)&stru_20.cmd + 8 * v29 + (v35 & 0xFFFFFFFFFFFFFF8)) = v31;

                sub_25420();
                v32(&v37, 0);

                swift_release();
                return (id)swift_release();
              }
              goto LABEL_37;
            }
LABEL_36:
            __break(1u);
LABEL_37:
            __break(1u);
            goto LABEL_38;
          }
          __break(1u);
          goto LABEL_36;
        }
LABEL_33:
        uint64_t v22 = (char *)sub_254B0();
        goto LABEL_20;
      }
      uint64_t v15 = &selRef_countUnit;
    }
    uint64_t v16 = self;
    goto LABEL_12;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_16B64()
{
  return sub_25250();
}

uint64_t sub_16B84(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_16BD0(uint64_t a1)
{
  uint64_t v2 = sub_24FB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_16C2C()
{
  unint64_t result = qword_3CFC0;
  if (!qword_3CFC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CFC0);
  }
  return result;
}

uint64_t sub_16C80(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_16C90()
{
  unint64_t result = qword_3CFC8;
  if (!qword_3CFC8)
  {
    sub_24FA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3CFC8);
  }
  return result;
}

uint64_t sub_16CE8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_16D30(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_16D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScheduleDayRowView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_16E00()
{
}

uint64_t sub_16E08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24FF0();
  *a1 = result;
  return result;
}

uint64_t sub_16E34()
{
  return sub_25000();
}

uint64_t sub_16E60@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25030();
  *a1 = result & 1;
  return result;
}

uint64_t sub_16E90()
{
  return sub_25040();
}

uint64_t sub_16EB8()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_16EC8(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_16EE0()
{
  unint64_t result = qword_3D018;
  if (!qword_3D018)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_3D018);
  }
  return result;
}

unint64_t sub_16F20()
{
  unint64_t result = qword_3D020;
  if (!qword_3D020)
  {
    sub_16CE8(&qword_3D000);
    sub_16FC0();
    sub_17668(&qword_3D048, &qword_3D050);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D020);
  }
  return result;
}

unint64_t sub_16FC0()
{
  unint64_t result = qword_3D028;
  if (!qword_3D028)
  {
    sub_16CE8(&qword_3CFF8);
    sub_17668(&qword_3D030, &qword_3CFF0);
    sub_17668(&qword_3D038, &qword_3D040);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D028);
  }
  return result;
}

uint64_t sub_17088()
{
  uint64_t v1 = (int *)(type metadata accessor for ScheduleDayRowView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_24CC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v4, v5);
}

void sub_17188()
{
}

void sub_17190(char a1)
{
}

uint64_t sub_171F4()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_1720C()
{
  unint64_t result = qword_3D070;
  if (!qword_3D070)
  {
    sub_16CE8(&qword_3D068);
    sub_17668(&qword_3D078, &qword_3D080);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D070);
  }
  return result;
}

uint64_t sub_172AC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_254F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

uint64_t sub_17328(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_16B84(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1738C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_16B84(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_173F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_16B84(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_17450()
{
  unint64_t result = qword_3D0C8;
  if (!qword_3D0C8)
  {
    sub_16CE8(&qword_3CF78);
    sub_1754C(&qword_3D0D0, &qword_3CF70, (void (*)(void))sub_1751C);
    sub_17668(&qword_3D0F0, &qword_3CF88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D0C8);
  }
  return result;
}

uint64_t sub_1751C()
{
  return sub_1754C(&qword_3D0D8, &qword_3CF68, (void (*)(void))sub_175C8);
}

uint64_t sub_1754C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_16CE8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_175C8()
{
  unint64_t result = qword_3D0E0;
  if (!qword_3D0E0)
  {
    sub_16CE8(&qword_3CF60);
    sub_17668(&qword_3D0E8, &qword_3CF58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D0E0);
  }
  return result;
}

uint64_t sub_17668(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_16CE8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *sub_176B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OBJC_IVAR____TtC19ActivityBridgeSetup19ActivityGoalDayCell_dayLabel;
  id v7 = objc_allocWithZone((Class)UILabel);
  id v8 = v3;
  *(void *)&v3[v6] = objc_msgSend(v7, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(void *)&v8[OBJC_IVAR____TtC19ActivityBridgeSetup19ActivityGoalDayCell_goalView] = 0;
  *(void *)&v8[OBJC_IVAR____TtC19ActivityBridgeSetup19ActivityGoalDayCell_delegate + 8] = 0;
  swift_unknownObjectWeakInit();

  if (a3)
  {
    NSString v9 = sub_253D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v32.receiver = v8;
  v32.super_class = (Class)type metadata accessor for ActivityGoalDayCell();
  uint64_t v10 = (char *)objc_msgSendSuper2(&v32, "initWithStyle:reuseIdentifier:", a1, v9);

  uint64_t v11 = OBJC_IVAR____TtC19ActivityBridgeSetup19ActivityGoalDayCell_dayLabel;
  uint64_t v12 = *(void **)&v10[OBJC_IVAR____TtC19ActivityBridgeSetup19ActivityGoalDayCell_dayLabel];
  uint64_t v13 = v10;
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v14 = [v13 contentView];
  [v14 addSubview:v12];

  id v15 = [*(id *)&v10[v11] topAnchor];
  id v16 = [v13 contentView];
  id v17 = [v16 topAnchor];

  id v18 = [v15 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  id v19 = [*(id *)&v10[v11] leadingAnchor];
  id v20 = [v13 contentView];
  id v21 = [v20 leadingAnchor];

  id v22 = [v19 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  id v23 = [*(id *)&v10[v11] bottomAnchor];
  id v24 = [v13 contentView];
  id v25 = [v24 bottomAnchor];

  id v26 = [v23 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  id v27 = *(void **)&v10[v11];
  uint64_t v28 = self;
  id v29 = v27;
  id v30 = [v28 preferredFontForTextStyle:UIFontTextStyleBody];
  [v29 setFont:v30];

  return v13;
}

id sub_17B2C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityGoalDayCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActivityGoalDayCell()
{
  return self;
}

uint64_t sub_17CB8(uint64_t a1)
{
  return a1;
}

id sub_17DB4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AdvancedGoalViewFactory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AdvancedGoalViewFactory()
{
  return self;
}

uint64_t sub_17E0C(uint64_t a1)
{
  uint64_t v2 = sub_24CC0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25020();
}

uint64_t sub_17ED4(void *a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  int v27 = a5;
  uint64_t v29 = a4;
  uint64_t v26 = a3;
  int v25 = a2;
  uint64_t v6 = (int *)type metadata accessor for AdvancedChangeGoalView();
  __chkstk_darwin(v6);
  id v8 = (uint64_t *)&v24[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v28 = sub_16B84(&qword_3D1C0);
  uint64_t v9 = *(void *)(v28 - 8);
  uint64_t v10 = __chkstk_darwin(v28);
  uint64_t v12 = &v24[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  id v14 = &v24[-v13];
  *id v8 = swift_getKeyPath();
  sub_16B84(&qword_3D1C8);
  swift_storeEnumTagMultiPayload();
  id v15 = (char *)v8 + v6[5];
  sub_18214();
  sub_18254(&qword_3D1D8, (void (*)(uint64_t))sub_18214);
  id v16 = a1;
  *(void *)id v15 = sub_24F50();
  v15[8] = v17 & 1;
  id v18 = (uint64_t *)((char *)v8 + v6[6]);
  type metadata accessor for GoalDaysModel();
  sub_18254(&qword_3D1E0, (void (*)(uint64_t))type metadata accessor for GoalDaysModel);
  uint64_t *v18 = sub_24F80();
  v18[1] = v19;
  *((unsigned char *)v8 + v6[7]) = v25;
  *(uint64_t *)((char *)v8 + v6[8]) = v26;
  *((unsigned char *)v8 + v6[9]) = v27;
  sub_18254(&qword_3D1E8, (void (*)(uint64_t))type metadata accessor for AdvancedChangeGoalView);
  sub_25240();
  sub_1829C((uint64_t)v8);
  uint64_t v20 = v28;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 16))(v12, v14, v28);
  id v21 = objc_allocWithZone((Class)sub_16B84(&qword_3D1F0));
  uint64_t v22 = sub_24F90();
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v14, v20);
  return v22;
}

uint64_t sub_181EC()
{
  return sub_25010();
}

unint64_t sub_18214()
{
  unint64_t result = qword_3D1D0;
  if (!qword_3D1D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_3D1D0);
  }
  return result;
}

uint64_t sub_18254(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1829C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AdvancedChangeGoalView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_182F8()
{
  sub_16B84(&qword_3D1F8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_29D40;
  id v2 = [v0 mondayGoal];
  id v3 = [v0 goalType];
  uint64_t v4 = (objc_class *)type metadata accessor for GoalDay();
  uint64_t v5 = objc_allocWithZone(v4);
  v5[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] = 0;
  *(void *)&v5[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal] = v2;
  *(void *)&v5[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType] = v3;
  v31.receiver = v5;
  v31.super_class = v4;
  *(void *)(v1 + 32) = objc_msgSendSuper2(&v31, "init");
  id v6 = [v0 tuesdayGoal];
  id v7 = [v0 goalType];
  id v8 = objc_allocWithZone(v4);
  v8[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] = 1;
  *(void *)&v8[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal] = v6;
  *(void *)&v8[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType] = v7;
  v30.receiver = v8;
  v30.super_class = v4;
  *(void *)(v1 + 40) = objc_msgSendSuper2(&v30, "init");
  id v9 = [v0 wednesdayGoal];
  id v10 = [v0 goalType];
  uint64_t v11 = objc_allocWithZone(v4);
  v11[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] = 2;
  *(void *)&v11[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal] = v9;
  *(void *)&v11[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType] = v10;
  v29.receiver = v11;
  v29.super_class = v4;
  *(void *)(v1 + 48) = objc_msgSendSuper2(&v29, "init");
  id v12 = [v0 thursdayGoal];
  id v13 = [v0 goalType];
  id v14 = objc_allocWithZone(v4);
  v14[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] = 3;
  *(void *)&v14[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal] = v12;
  *(void *)&v14[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType] = v13;
  v28.receiver = v14;
  v28.super_class = v4;
  *(void *)(v1 + 56) = objc_msgSendSuper2(&v28, "init");
  id v15 = [v0 fridayGoal];
  id v16 = [v0 goalType];
  char v17 = objc_allocWithZone(v4);
  v17[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] = 4;
  *(void *)&v17[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal] = v15;
  *(void *)&v17[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType] = v16;
  v27.receiver = v17;
  v27.super_class = v4;
  *(void *)(v1 + 64) = objc_msgSendSuper2(&v27, "init");
  id v18 = [v0 saturdayGoal];
  id v19 = [v0 goalType];
  uint64_t v20 = objc_allocWithZone(v4);
  v20[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] = 5;
  *(void *)&v20[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal] = v18;
  *(void *)&v20[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType] = v19;
  v26.receiver = v20;
  v26.super_class = v4;
  *(void *)(v1 + 72) = objc_msgSendSuper2(&v26, "init");
  id v21 = [v0 sundayGoal];
  id v22 = [v0 goalType];
  id v23 = objc_allocWithZone(v4);
  v23[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] = 6;
  *(void *)&v23[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal] = v21;
  *(void *)&v23[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType] = v22;
  v25.receiver = v23;
  v25.super_class = v4;
  *(void *)(v1 + 80) = objc_msgSendSuper2(&v25, "init");
  sub_25420();
  return v1;
}

id sub_186B8()
{
  uint64_t v19 = sub_24C80();
  uint64_t v0 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  id v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24CC0();
  uint64_t v3 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_24C20();
  uint64_t v6 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA0();
  sub_16B84(&qword_3D200);
  uint64_t v9 = sub_24CB0();
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_29D50;
  (*(void (**)(unint64_t, void, uint64_t))(v10 + 104))(v12 + v11, enum case for Calendar.Component.weekday(_:), v9);
  sub_19288(v12);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_24C70();
  sub_24C90();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v19);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v18);
  uint64_t v13 = sub_24C10();
  LOBYTE(v10) = v14;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v17);
  id result = 0;
  if ((v10 & 1) == 0)
  {
    if ((unint64_t)(v13 - 1) > 6) {
      return 0;
    }
    else {
      return objc_msgSend(v16, *(SEL *)off_35BC8[v13 - 1]);
    }
  }
  return result;
}

char *sub_18A50(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_24C80();
  uint64_t v5 = (char *)*(v4 - 1);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_105;
  }
  uint64_t v8 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v8) {
    goto LABEL_39;
  }
LABEL_3:
  unint64_t v9 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
LABEL_108:
  }
    uint64_t v10 = (char *)sub_254B0();
  else {
    uint64_t v10 = (char *)*(id *)(a1 + 32);
  }
  unint64_t v11 = v10;
  if (!v10[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day])
  {
    uint64_t v79 = a2;
    uint64_t v80 = v7;
    swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_21;
    }
    goto LABEL_23;
  }

  if (v8 == 1) {
    goto LABEL_39;
  }
  if (!v9)
  {
    uint64_t v15 = 5;
    while (1)
    {
      uint64_t v16 = v15 - 3;
      if (__OFADD__(v15 - 4, 1)) {
        goto LABEL_104;
      }
      uint64_t v17 = *(unsigned char **)(a1 + 8 * v15);
      if (!v17[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day]) {
        break;
      }
      ++v15;
      if (v16 == v8) {
        goto LABEL_39;
      }
    }
    uint64_t v79 = a2;
    uint64_t v80 = v7;
    unint64_t v11 = v17;
    swift_bridgeObjectRelease();
LABEL_23:
    uint64_t v18 = *(void **)(a1 + 32);
    swift_bridgeObjectRetain();
    uint64_t v7 = v18;
    a2 = 1;
    goto LABEL_24;
  }
  uint64_t v12 = 1;
  while (1)
  {
    uint64_t v13 = sub_254B0();
    uint64_t v14 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
LABEL_103:
      __break(1u);
LABEL_104:
      __break(1u);
LABEL_105:
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_254F0();
      if (!v8) {
        goto LABEL_39;
      }
      goto LABEL_3;
    }
    unint64_t v11 = (char *)v13;
    if (!*(unsigned char *)(v13 + OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day)) {
      break;
    }
    swift_unknownObjectRelease();
    ++v12;
    if (v14 == v8) {
      goto LABEL_39;
    }
  }
  uint64_t v79 = a2;
  uint64_t v80 = v7;
  swift_bridgeObjectRelease();
LABEL_21:
  swift_bridgeObjectRetain();
  uint64_t v7 = (char *)sub_254B0();
  a2 = 0;
LABEL_24:
  if (v7[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] != 1)
  {

    if (v8 != 1)
    {
      uint64_t v23 = 5;
      do
      {
        id v24 = a2 ? (char *)*(id *)(a1 + 8 * v23) : (char *)sub_254B0();
        uint64_t v7 = v24;
        uint64_t v25 = v23 - 3;
        if (__OFADD__(v23 - 4, 1)) {
          goto LABEL_103;
        }
        if (v24[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] == 1) {
          goto LABEL_25;
        }

        ++v23;
      }
      while (v25 != v8);
    }

LABEL_39:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_25:
  uint64_t v78 = v5;
  swift_bridgeObjectRelease();
  if (a2)
  {
    uint64_t v19 = *(void **)(a1 + 32);
    swift_bridgeObjectRetain();
    uint64_t v20 = v19;
    goto LABEL_27;
  }
  while (2)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = (char *)sub_254B0();
LABEL_27:
    uint64_t v5 = v20;
    if (v20[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] != 2)
    {

      if (v8 == 1)
      {
LABEL_50:

        swift_bridgeObjectRelease();
        return 0;
      }
      unint64_t v9 = 5;
      while (1)
      {
        objc_super v28 = a2 ? (char *)*(id *)(a1 + 8 * v9) : (char *)sub_254B0();
        uint64_t v5 = v28;
        unint64_t v29 = v9 - 3;
        if (__OFADD__(v9 - 4, 1)) {
          break;
        }
        if (v28[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] == 2) {
          goto LABEL_28;
        }

        ++v9;
        if (v29 == v8) {
          goto LABEL_50;
        }
      }
      __break(1u);
      goto LABEL_108;
    }
LABEL_28:
    uint64_t v77 = v4;
    swift_bridgeObjectRelease();
    if (a2)
    {
      id v21 = *(void **)(a1 + 32);
      swift_bridgeObjectRetain();
      id v22 = v21;
    }
    else
    {
      swift_bridgeObjectRetain();
      id v22 = (void *)sub_254B0();
    }
    uint64_t v4 = v22;
    if (*((unsigned char *)v22 + OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day) != 3)
    {

      if (v8 == 1)
      {
LABEL_63:

        swift_bridgeObjectRelease();
        return 0;
      }
      uint64_t v32 = 5;
      while (1)
      {
        uint64_t v33 = a2 ? *(id *)(a1 + 8 * v32) : (void *)sub_254B0();
        uint64_t v4 = v33;
        uint64_t v34 = v32 - 3;
        if (__OFADD__(v32 - 4, 1)) {
          break;
        }
        if (*((unsigned char *)v33 + OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day) == 3) {
          goto LABEL_53;
        }

        ++v32;
        if (v34 == v8) {
          goto LABEL_63;
        }
      }
      __break(1u);
LABEL_110:
      __break(1u);
      continue;
    }
    break;
  }
LABEL_53:
  swift_bridgeObjectRelease();
  if (a2)
  {
    objc_super v30 = *(void **)(a1 + 32);
    swift_bridgeObjectRetain();
    objc_super v31 = v30;
  }
  else
  {
    swift_bridgeObjectRetain();
    objc_super v31 = (char *)sub_254B0();
  }
  if (v31[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] != 4)
  {

    if (v8 == 1)
    {
LABEL_76:

      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v36 = 5;
    while (1)
    {
      objc_super v31 = a2 ? (char *)*(id *)(a1 + 8 * v36) : (char *)sub_254B0();
      uint64_t v37 = v36 - 3;
      if (__OFADD__(v36 - 4, 1)) {
        goto LABEL_110;
      }
      if (v31[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] == 4) {
        break;
      }

      ++v36;
      if (v37 == v8) {
        goto LABEL_76;
      }
    }
  }
  uint64_t v76 = v31;
  swift_bridgeObjectRelease();
  if (a2)
  {
    unint64_t v35 = *(void **)(a1 + 32);
    swift_bridgeObjectRetain();
    id result = v35;
  }
  else
  {
    swift_bridgeObjectRetain();
    id result = (char *)sub_254B0();
  }
  if (result[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] == 5)
  {
LABEL_79:
    uint64_t v75 = result;
    swift_bridgeObjectRelease();
    if (a2)
    {
      objc_super v38 = *(void **)(a1 + 32);
      swift_bridgeObjectRetain();
      id result = v38;
    }
    else
    {
      swift_bridgeObjectRetain();
      id result = (char *)sub_254B0();
    }
    if (result[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] == 6)
    {
LABEL_92:
      uint64_t v41 = result;
      swift_bridgeObjectRelease();
      sub_24C70();
      uint64_t v42 = *(void **)&v11[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal];
      char v43 = *(void **)&v7[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal];
      uint64_t v44 = *(void **)&v5[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal];
      uint64_t v45 = *(void **)((char *)v4 + OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal);
      uint64_t v46 = *(void **)&v76[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal];
      Class v69 = *(Class *)&v75[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal];
      id v74 = v41;
      char v47 = *(void **)&v41[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal];
      id v70 = self;
      id v73 = v42;
      id v72 = v43;
      id v71 = v44;
      id v48 = v45;
      id v49 = v46;
      uint64_t v50 = v69;
      id v67 = v50;
      id v51 = v47;
      id v68 = v51;
      id v52 = [v70 localDevice];
      id v70 = v52;
      Class isa = sub_24C60().super.isa;
      Class v69 = isa;
      unsigned int v54 = self;
      id v66 = v52;
      id v64 = v50;
      id v65 = v51;
      id v63 = v49;
      uint64_t v55 = v49;
      Class v56 = isa;
      uint64_t v58 = v72;
      uint64_t v57 = v73;
      uint64_t v59 = v71;
      uint64_t v60 = v48;
      id v26 = [v54 activityGoalScheduleWithDate:v56 goalType:v79 mondayGoal:v73 tuesdayGoal:v72 wednesdayGoal:v71 thursdayGoal:v48 fridayGoal:v63 saturdayGoal:v64 sundayGoal:v65 device:v66 metadata:0];

      (*((void (**)(char *, void *))v78 + 1))(v80, v77);
      return (char *)v26;
    }

    if (v8 == 1)
    {
LABEL_101:

      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v61 = 5;
    while (1)
    {
      id result = a2 ? (char *)*(id *)(a1 + 8 * v61) : (char *)sub_254B0();
      uint64_t v62 = v61 - 3;
      if (__OFADD__(v61 - 4, 1)) {
        break;
      }
      if (result[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] == 6) {
        goto LABEL_92;
      }

      ++v61;
      if (v62 == v8) {
        goto LABEL_101;
      }
    }
  }
  else
  {

    if (v8 == 1)
    {
LABEL_89:

      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v39 = 5;
    while (1)
    {
      id result = a2 ? (char *)*(id *)(a1 + 8 * v39) : (char *)sub_254B0();
      uint64_t v40 = v39 - 3;
      if (__OFADD__(v39 - 4, 1)) {
        break;
      }
      if (result[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day] == 5) {
        goto LABEL_79;
      }

      ++v39;
      if (v40 == v8) {
        goto LABEL_89;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_19288(uint64_t a1)
{
  uint64_t v2 = sub_24CB0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_16B84(&qword_3D208);
    uint64_t v9 = sub_25490();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    unint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    objc_super v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_19578(&qword_3D210);
      uint64_t v16 = sub_253A0();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_19578(&qword_3D218);
          char v23 = sub_253C0();
          id v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        id result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return (void *)v9;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_19578(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24CB0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_195BC(unint64_t a1)
{
  if (a1 >= 2)
  {
    if (a1 != 2)
    {
      if (a1 != 3)
      {
        return static Color.red.getter();
      }
      id v1 = [self sedentaryColors];
      if (v1)
      {
        uint64_t v2 = v1;
        id v3 = [v1 nonGradientTextColor];

        if (v3)
        {
          return Color.init(_:)(v3);
        }
        goto LABEL_22;
      }
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    goto LABEL_12;
  }
  id v4 = [self energyColors];
  if (!v4)
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v5 = v4;
  id v6 = [v4 nonGradientTextColor];

  if (!v6)
  {
    __break(1u);
LABEL_12:
    id v7 = [self briskColors];
    if (!v7)
    {
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    uint64_t v8 = v7;
    id v9 = [v7 nonGradientTextColor];

    if (!v9)
    {
LABEL_24:
      __break(1u);
      return static Color.red.getter();
    }
  }

  return sub_252B0();
}

id sub_1972C(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_videoView] = 0;
  *(void *)&v1[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_observers] = &_swiftEmptyArrayStorage;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_presentationContext] = a1;
  sub_1AC5C(0, (unint64_t *)&qword_3D018);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v4 = self;
  id v5 = [v4 bundleForClass:ObjCClassFromMetadata];
  NSString v6 = sub_253D0();
  NSString v7 = sub_253D0();
  id v8 = [v5 localizedStringForKey:v6 value:0 table:v7];

  sub_253E0();
  NSString v9 = sub_253D0();
  swift_bridgeObjectRelease();
  id v10 = [v4 bundleForClass:ObjCClassFromMetadata];
  NSString v11 = sub_253D0();
  NSString v12 = sub_253D0();
  id v13 = [v10 localizedStringForKey:v11 value:0 table:v12];

  sub_253E0();
  NSString v14 = sub_253D0();
  swift_bridgeObjectRelease();
  v17.receiver = v1;
  v17.super_class = (Class)type metadata accessor for ActivitySetupThreeRingsOnboardingViewController();
  id v15 = objc_msgSendSuper2(&v17, "initWithTitle:detailText:icon:contentLayout:", v9, v14, 0, 3);

  return v15;
}

void sub_199CC()
{
  id v1 = v0;
  uint64_t v2 = sub_16B84(&qword_3D280);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  id v5 = &v29[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  NSString v7 = &v29[-v6];
  id v8 = (objc_class *)type metadata accessor for ActivitySetupThreeRingsOnboardingViewController();
  v30.receiver = v0;
  v30.super_class = v8;
  objc_msgSendSuper2(&v30, "viewDidLoad");
  id v9 = [self boldButton];
  [v9 addTarget:v1 action:"didTapAcceptButton" forControlEvents:64];
  sub_1AC5C(0, (unint64_t *)&qword_3D018);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  NSString v11 = self;
  id v12 = [v11 bundleForClass:ObjCClassFromMetadata];
  NSString v13 = sub_253D0();
  NSString v14 = sub_253D0();
  id v15 = [v12 localizedStringForKey:v13 value:0 table:v14];

  sub_253E0();
  NSString v16 = sub_253D0();
  swift_bridgeObjectRelease();
  [v9 setTitle:v16 forState:0];

  id v17 = v9;
  sub_25460();
  uint64_t v18 = sub_25450();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v7, 1, v18))
  {
    sub_1AC98((uint64_t)v7, (uint64_t)v5);
    sub_25470();

    sub_1AD00((uint64_t)v7);
  }
  else
  {
    id v19 = (id)BPSPillSelectedColor();
    uint64_t v20 = (void (*)(unsigned char *, void))sub_25440();
    sub_24CE0();
    v20(v29, 0);
    sub_25470();
  }
  id v21 = [v1 buttonTray];
  [v21 addButton:v17];

  if (*(void *)&v1[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_presentationContext] == 4)
  {
    id v22 = [self linkButton];
    [v22 addTarget:v1 action:"didTapSkipButton" forControlEvents:64];
    id v23 = [v11 bundleForClass:ObjCClassFromMetadata];
    NSString v24 = sub_253D0();
    NSString v25 = sub_253D0();
    id v26 = [v23 localizedStringForKey:v24 value:0 table:v25];

    sub_253E0();
    NSString v27 = sub_253D0();
    swift_bridgeObjectRelease();
    [v22 setTitle:v27 forState:0];

    id v28 = [v1 buttonTray];
    [v28 addButton:v22];
  }
  sub_1A230();
}

void sub_19E9C(char a1)
{
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for ActivitySetupThreeRingsOnboardingViewController();
  objc_msgSendSuper2(&v7, "viewDidAppear:", a1 & 1);
  sub_1A76C();
  uint64_t v3 = *(char **)&v1[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_videoView];
  if (v3)
  {
    uint64_t v4 = *(void **)&v3[OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_playerLayer];
    id v5 = v3;
    id v6 = [v4 player];
    [v6 play];
  }
}

void sub_19F90(char a1)
{
  uint64_t v2 = v1;
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for ActivitySetupThreeRingsOnboardingViewController();
  objc_msgSendSuper2(&v8, "viewDidDisappear:", a1 & 1);
  uint64_t v4 = OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_videoView;
  id v5 = *(void **)&v2[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_videoView];
  if (v5)
  {
    id v6 = v5;
    sub_1B820();

    objc_super v7 = *(void **)&v2[v4];
    if (v7)
    {
      [v7 removeFromSuperview];
      id v5 = *(void **)&v2[v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  *(void *)&v2[v4] = 0;
}

void sub_1A07C()
{
  id v3 = [objc_allocWithZone((Class)CHASActivitySetupViewController) initWithPresentationContext:*(void *)&v0[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_presentationContext]];
  objc_msgSend(v3, "setDelegate:", objc_msgSend(v0, "delegate"));
  swift_unknownObjectRelease();
  id v1 = [v0 navigationController];
  if (v1)
  {
    uint64_t v2 = v1;
    [v1 pushViewController:v3 animated:1];
  }
}

uint64_t sub_1A230()
{
  id v1 = self;
  id v2 = [v1 defaultCenter];
  id v3 = self;
  id v4 = [v3 mainQueue];
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v19 = sub_1AC34;
  uint64_t v20 = v5;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  id v17 = sub_1A5D8;
  uint64_t v18 = &unk_35C28;
  id v6 = _Block_copy(&v15);
  swift_release();
  id v7 = [v2 addObserverForName:UIApplicationWillEnterForegroundNotification object:0 queue:v4 usingBlock:v6];
  _Block_release(v6);

  id v8 = [v1 defaultCenter];
  id v9 = [v3 mainQueue];
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v19 = sub_1AC54;
  uint64_t v20 = v10;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  id v17 = sub_1A5D8;
  uint64_t v18 = &unk_35C50;
  NSString v11 = _Block_copy(&v15);
  swift_release();
  id v12 = [v8 addObserverForName:UIApplicationDidEnterBackgroundNotification object:0 queue:v9 usingBlock:v11];
  _Block_release(v11);

  sub_16B84(&qword_3D278);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_29E10;
  *(void *)(v13 + 56) = swift_getObjectType();
  *(void *)(v13 + 32) = v7;
  *(void *)(v13 + 88) = swift_getObjectType();
  *(void *)(v13 + 64) = v12;
  *(void *)(v0 + OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_observers) = v13;
  return swift_bridgeObjectRelease();
}

void sub_1A500()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (void *)Strong;
    sub_1A76C();
  }
  swift_beginAccess();
  uint64_t v2 = swift_unknownObjectWeakLoadStrong();
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = *(void **)(v2 + OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_videoView);
    uint64_t v5 = v4;

    if (v4)
    {
      id v6 = [*(id *)&v5[OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_playerLayer] player];
      [v6 play];
    }
  }
}

uint64_t sub_1A5D8(uint64_t a1)
{
  uint64_t v2 = sub_24C00();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(void (**)(char *))(a1 + 32);
  sub_24BF0();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_1A6CC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (char *)Strong;
    uint64_t v2 = OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_videoView;
    uint64_t v3 = *(void **)(Strong + OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_videoView);
    if (v3 && (v4 = v3, sub_1B820(), v4, (uint64_t v5 = *(void **)&v1[v2]) != 0))
    {
      [v5 removeFromSuperview];
      id v6 = *(void **)&v1[v2];
    }
    else
    {
      id v6 = 0;
    }
    *(void *)&v1[v2] = 0;
  }
}

void sub_1A76C()
{
  id v1 = v0;
  id v2 = [objc_allocWithZone((Class)type metadata accessor for ActivitySetupThreeRingsOnboardingVideoView()) init];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [v0 contentView];
  [v3 addSubview:v2];

  id v4 = self;
  sub_16B84(&qword_3D1F8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_29E20;
  id v6 = [v2 leadingAnchor];
  id v7 = [v1 contentView];
  id v8 = [v7 leadingAnchor];

  id v9 = [v6 constraintEqualToAnchor:v8];
  *(void *)(v5 + 32) = v9;
  id v10 = [v2 trailingAnchor];
  id v11 = [v1 contentView];
  id v12 = [v11 trailingAnchor];

  id v13 = [v10 constraintEqualToAnchor:v12];
  *(void *)(v5 + 40) = v13;
  id v14 = [v2 topAnchor];
  id v15 = [v1 contentView];
  id v16 = [v15 topAnchor];

  id v17 = [v14 constraintEqualToAnchor:v16 constant:30.0];
  *(void *)(v5 + 48) = v17;
  id v18 = [v2 bottomAnchor];
  id v19 = [v1 contentView];
  id v20 = [v19 bottomAnchor];

  id v21 = [v18 constraintEqualToAnchor:v20];
  *(void *)(v5 + 56) = v21;
  sub_25420();
  sub_1AC5C(0, &qword_3D270);
  Class isa = sub_25400().super.isa;
  swift_bridgeObjectRelease();
  [v4 activateConstraints:isa];

  id v23 = *(void **)&v1[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_videoView];
  *(void *)&v1[OBJC_IVAR___CHASActivitySetupThreeRingsOnboardingViewController_videoView] = v2;
}

id sub_1AB00()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySetupThreeRingsOnboardingViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActivitySetupThreeRingsOnboardingViewController()
{
  return self;
}

uint64_t sub_1ABFC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1AC34()
{
}

uint64_t sub_1AC3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1AC4C()
{
  return swift_release();
}

void sub_1AC54()
{
}

uint64_t sub_1AC5C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1AC98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_16B84(&qword_3D280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AD00(uint64_t a1)
{
  uint64_t v2 = sub_16B84(&qword_3D280);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AE1C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24F00();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1AF18@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24F00();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1AF98(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_24F10();
}

id sub_1B138()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GoalDaysModel();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1B1E0()
{
  return type metadata accessor for GoalDaysModel();
}

uint64_t type metadata accessor for GoalDaysModel()
{
  uint64_t result = qword_3D2B8;
  if (!qword_3D2B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1B234()
{
  sub_1B2D0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1B2D0()
{
  if (!qword_3D2C8)
  {
    sub_16CE8(&qword_3D2D0);
    unint64_t v0 = sub_24F20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_3D2C8);
    }
  }
}

void *sub_1B32C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_1B338@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for GoalDaysModel();
  uint64_t result = sub_24ED0();
  *a1 = result;
  return result;
}

uint64_t sub_1B3FC()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_16B84(&qword_3D318);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24C50();
  uint64_t v6 = __chkstk_darwin(v5);
  id v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v6);
  id v12 = (char *)&v33 - v11;
  uint64_t v13 = OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_player;
  if (!*(void *)&v1[OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_player]
    && !*(void *)&v1[OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_playerLayer])
  {
    uint64_t v33 = OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_playerLayer;
    uint64_t v34 = v10;
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v15 = [self bundleForClass:ObjCClassFromMetadata];
    NSString v16 = sub_253D0();
    NSString v17 = sub_253D0();
    id v18 = [v15 URLForResource:v16 withExtension:v17];

    if (v18)
    {
      sub_24C40();

      uint64_t v19 = v34;
      id v20 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
      v20(v4, v8, v5);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v4, 0, 1, v5);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v4, 1, v5) != 1)
      {
        v20(v12, v4, v5);
        sub_24C30(v21);
        id v23 = v22;
        id v24 = [self assetWithURL:v22];

        id v25 = [objc_allocWithZone((Class)AVPlayerItem) initWithAsset:v24];
        id v26 = [objc_allocWithZone((Class)AVPlayer) init];
        [v26 _setParticipatesInAudioSession:0];
        [v26 setPreventsDisplaySleepDuringVideoPlayback:0];
        [v26 setAllowsExternalPlayback:0];
        [v26 replaceCurrentItemWithPlayerItem:v25];
        id v27 = [self playerLayerWithPlayer:v26];
        id v28 = *(void **)&v1[v13];
        *(void *)&v1[v13] = v26;
        id v29 = v26;

        objc_super v30 = *(void **)&v1[v33];
        *(void *)&v1[v33] = v27;
        id v31 = v27;

        id v32 = [v1 layer];
        [v32 addSublayer:v31];

        return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v12, v5);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56))(v4, 1, 1, v5);
    }
    return sub_1BBA4((uint64_t)v4);
  }
  return result;
}

void sub_1B820()
{
  uint64_t v1 = OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_player;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_player);
  if (v2) {
    [v2 replaceCurrentItemWithPlayerItem:0];
  }
  uint64_t v3 = OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_playerLayer;
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC19ActivityBridgeSetup42ActivitySetupThreeRingsOnboardingVideoView_playerLayer);
  if (v4)
  {
    [v4 setPlayer:0];
    uint64_t v5 = *(void **)(v0 + v3);
    if (v5) {
      [v5 removeFromSuperlayer];
    }
  }
  uint64_t v6 = *(void **)(v0 + v1);
  *(void *)(v0 + v1) = 0;

  uint64_t v7 = *(void **)(v0 + v3);
  *(void *)(v0 + v3) = 0;
}

id sub_1BB00()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySetupThreeRingsOnboardingVideoView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActivitySetupThreeRingsOnboardingVideoView()
{
  return self;
}

uint64_t sub_1BBA4(uint64_t a1)
{
  uint64_t v2 = sub_16B84(&qword_3D318);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BC04()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19ActivityBridgeSetup31DailyGoalChartPointDataProvider__dailyGoals;
  uint64_t v2 = sub_16B84(&qword_3D418);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_1BCA8()
{
  return type metadata accessor for DailyGoalChartPointDataProvider();
}

uint64_t type metadata accessor for DailyGoalChartPointDataProvider()
{
  uint64_t result = qword_3D350;
  if (!qword_3D350) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1BCFC()
{
  sub_1BD8C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1BD8C()
{
  if (!qword_3D360)
  {
    sub_16CE8((uint64_t *)&unk_3D368);
    unint64_t v0 = sub_24F20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_3D360);
    }
  }
}

uint64_t sub_1BDE8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for DailyGoalChartPointDataProvider();
  uint64_t result = sub_24ED0();
  *a1 = result;
  return result;
}

uint64_t sub_1BE28(uint64_t a1)
{
  return sub_1BE58(a1, (uint64_t (*)(void))&Calendar.weekdaySymbols.getter);
}

uint64_t sub_1BE40(uint64_t a1)
{
  return sub_1BE58(a1, (uint64_t (*)(void))&Calendar.shortWeekdaySymbols.getter);
}

uint64_t sub_1BE58(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2();
  switch(*(unsigned char *)(a1 + OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day))
  {
    case 1:
      if (*(void *)(v3 + 16) < 3uLL) {
        goto LABEL_18;
      }
      uint64_t v4 = 64;
      break;
    case 2:
      if (*(void *)(v3 + 16) < 4uLL) {
        goto LABEL_19;
      }
      uint64_t v4 = 80;
      break;
    case 3:
      if (*(void *)(v3 + 16) < 5uLL) {
        goto LABEL_20;
      }
      uint64_t v4 = 96;
      break;
    case 4:
      if (*(void *)(v3 + 16) < 6uLL) {
        goto LABEL_21;
      }
      uint64_t v4 = 112;
      break;
    case 5:
      if (*(void *)(v3 + 16) < 7uLL) {
        goto LABEL_22;
      }
      uint64_t v4 = 128;
      break;
    case 6:
      if (!*(void *)(v3 + 16)) {
        goto LABEL_23;
      }
      uint64_t v4 = 32;
      break;
    default:
      if (*(void *)(v3 + 16) < 2uLL)
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BF98);
      }
      uint64_t v4 = 48;
      break;
  }
  uint64_t v5 = *(void *)(v3 + v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v5;
}

BOOL sub_1BFB4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1BFC8()
{
  Swift::UInt v1 = *v0;
  sub_25510();
  sub_25520(v1);
  return sub_25530();
}

void sub_1C010()
{
  sub_25520(*v0);
}

Swift::Int sub_1C03C()
{
  Swift::UInt v1 = *v0;
  sub_25510();
  sub_25520(v1);
  return sub_25530();
}

unint64_t sub_1C080@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1C440(*a1);
  *a2 = result;
  return result;
}

void sub_1C0AC(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_1C0B8(void *a1@<X8>)
{
  *a1 = &off_35AC0;
}

id sub_1C0F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GoalDay();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for GoalDay()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for GoalDay.Day(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GoalDay.Day(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GoalDay.Day(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    void *result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1C2CCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          void *result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_1C2F4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1C300(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GoalDay.Day()
{
  return &type metadata for GoalDay.Day;
}

unint64_t sub_1C31C()
{
  unint64_t result = qword_3D460;
  if (!qword_3D460)
  {
    sub_16CE8(&qword_3D468);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D460);
  }
  return result;
}

unint64_t sub_1C37C()
{
  unint64_t result = qword_3D470;
  if (!qword_3D470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D470);
  }
  return result;
}

unint64_t sub_1C3D4()
{
  unint64_t result = qword_3D478;
  if (!qword_3D478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D478);
  }
  return result;
}

void sub_1C428(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(*v1 + OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_day);
}

unint64_t sub_1C440(unint64_t result)
{
  if (result >= 7) {
    return 7;
  }
  return result;
}

uint64_t sub_1C450@<X0>(uint64_t *a1@<X8>)
{
  sub_1AC5C(0, &qword_3D480);
  uint64_t result = sub_24ED0();
  *a1 = result;
  return result;
}

void *sub_1C4A0(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_16B84(&qword_3D1C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24CC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    id v12 = *(id *)v11;
    char v13 = v11[8];
    sub_1C614(*(id *)v11, v13);
    *(void *)uint64_t v10 = v12;
    v10[8] = v13;
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    NSString v16 = (void *)((char *)a1 + v14);
    NSString v17 = (void *)((char *)a2 + v14);
    uint64_t v19 = *v17;
    id v18 = (void *)v17[1];
    *NSString v16 = v19;
    v16[1] = v18;
    *((unsigned char *)a1 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v20 = a3[9];
    *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
    *((unsigned char *)a1 + v20) = *((unsigned char *)a2 + v20);
    id v21 = v18;
  }
  return a1;
}

id sub_1C614(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

void sub_1C620(uint64_t a1, uint64_t a2)
{
  sub_16B84(&qword_3D1C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_24CC0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_1C6D8(*(id *)(a1 + *(int *)(a2 + 20)), *(unsigned char *)(a1 + *(int *)(a2 + 20) + 8));
  int v5 = *(void **)(a1 + *(int *)(a2 + 24) + 8);
}

void sub_1C6D8(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

void *sub_1C6E4(void *a1, void *a2, int *a3)
{
  sub_16B84(&qword_3D1C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24CC0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  id v10 = *(id *)v9;
  char v11 = v9[8];
  sub_1C614(*(id *)v9, v11);
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v12);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v17 = *v15;
  NSString v16 = (void *)v15[1];
  void *v14 = v17;
  v14[1] = v16;
  *((unsigned char *)a1 + v13) = *((unsigned char *)a2 + v13);
  uint64_t v18 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *((unsigned char *)a1 + v18) = *((unsigned char *)a2 + v18);
  id v19 = v16;
  return a1;
}

void *sub_1C808(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_173F0((uint64_t)a1, &qword_3D1C8);
    sub_16B84(&qword_3D1C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24CC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  id v10 = *(id *)v9;
  char v11 = v9[8];
  sub_1C614(*(id *)v9, v11);
  uint64_t v12 = *(void **)v8;
  char v13 = v8[8];
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  sub_1C6D8(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = (void *)((char *)a1 + v14);
  NSString v16 = (void *)((char *)a2 + v14);
  *uint64_t v15 = *v16;
  uint64_t v17 = (void *)v16[1];
  uint64_t v18 = (void *)v15[1];
  v15[1] = v17;
  id v19 = v17;

  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  return a1;
}

char *sub_1C968(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_16B84(&qword_3D1C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24CC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  id v10 = &a1[v8];
  char v11 = &a2[v8];
  *(void *)id v10 = *(void *)v11;
  v10[8] = v11[8];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  uint64_t v12 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  a1[a3[9]] = a2[a3[9]];
  return a1;
}

char *sub_1CA74(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_173F0((uint64_t)a1, &qword_3D1C8);
    uint64_t v6 = sub_16B84(&qword_3D1C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  id v10 = &a2[v8];
  uint64_t v11 = *(void *)v10;
  LOBYTE(v10) = v10[8];
  uint64_t v12 = *(void **)v9;
  char v13 = v9[8];
  *(void *)uint64_t v9 = v11;
  v9[8] = (char)v10;
  sub_1C6D8(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  NSString v16 = &a2[v14];
  uint64_t v18 = *(void *)v16;
  uint64_t v17 = *((void *)v16 + 1);
  id v19 = (void *)*((void *)v15 + 1);
  *(void *)uint64_t v15 = v18;
  *((void *)v15 + 1) = v17;

  uint64_t v20 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(void *)&a1[v20] = *(void *)&a2[v20];
  a1[a3[9]] = a2[a3[9]];
  return a1;
}

uint64_t sub_1CBB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1CBCC);
}

uint64_t sub_1CBCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_16B84(&qword_3D488);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1CC94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1CCA8);
}

uint64_t sub_1CCA8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_16B84(&qword_3D488);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for AdvancedChangeGoalView()
{
  uint64_t result = qword_3D4E8;
  if (!qword_3D4E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1CDB8()
{
  sub_1CE70();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1CE70()
{
  if (!qword_3D4F8)
  {
    sub_24CC0();
    unint64_t v0 = sub_24F40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_3D4F8);
    }
  }
}

uint64_t sub_1CEC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1CEE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_16B84(&qword_3D538);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_16B84(&qword_3D540);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_16B84(&qword_3D548);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_250B0();
  *((void *)v6 + 1) = 0x4014000000000000;
  uint8_t v6[16] = 0;
  uint64_t v13 = sub_16B84(&qword_3D550);
  sub_1D17C(v2, (uint64_t)&v6[*(int *)(v13 + 44)]);
  unsigned __int8 v14 = sub_25130();
  unsigned __int8 v15 = sub_25150();
  char v16 = sub_25140();
  sub_25140();
  if (sub_25140() != v14) {
    char v16 = sub_25140();
  }
  sub_25140();
  if (sub_25140() != v15) {
    char v16 = sub_25140();
  }
  sub_24F30();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  sub_1738C((uint64_t)v6, (uint64_t)v9, &qword_3D538);
  id v25 = &v9[*(int *)(v7 + 36)];
  char *v25 = v16;
  *((void *)v25 + 1) = v18;
  *((void *)v25 + 2) = v20;
  *((void *)v25 + 3) = v22;
  *((void *)v25 + 4) = v24;
  v25[40] = 0;
  sub_173F0((uint64_t)v6, &qword_3D538);
  char v26 = sub_25120();
  sub_24F30();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  sub_1738C((uint64_t)v9, (uint64_t)v12, &qword_3D540);
  unint64_t v35 = &v12[*(int *)(v10 + 36)];
  *unint64_t v35 = v26;
  *((void *)v35 + 1) = v28;
  *((void *)v35 + 2) = v30;
  *((void *)v35 + 3) = v32;
  *((void *)v35 + 4) = v34;
  v35[40] = 0;
  sub_173F0((uint64_t)v9, &qword_3D540);
  return sub_17328((uint64_t)v12, a1, &qword_3D548);
}

uint64_t sub_1D17C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v74 = a2;
  int v3 = (int *)type metadata accessor for AdvancedChangeGoalView();
  uint64_t v69 = *((void *)v3 - 1);
  __chkstk_darwin(v3);
  uint64_t v70 = v4;
  uint64_t KeyPath = (uint64_t)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_16B84(&qword_3D558);
  uint64_t v80 = *(void *)(v75 - 8);
  uint64_t v5 = __chkstk_darwin(v75);
  uint64_t v79 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v82 = (char *)&v67 - v7;
  uint64_t v81 = sub_24CC0();
  uint64_t v78 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ActivityDailyGoalChartView();
  uint64_t v11 = (int *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (uint64_t *)((char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_16B84(&qword_3D560);
  uint64_t v15 = v14 - 8;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v67 - v19;
  uint64_t v77 = sub_195BC(*(void *)(a1 + v3[8]));
  sub_1DB44((uint64_t)v9);
  uint64_t v21 = a1 + v3[5];
  id v22 = *(id *)v21;
  char v23 = *(unsigned char *)(v21 + 8);
  sub_1C614(*(id *)v21, v23);
  id v76 = sub_1DDCC(v22, v23);
  sub_1C6D8(v22, v23);
  id v72 = v3;
  uint64_t v73 = a1;
  uint64_t v24 = a1 + v3[6];
  id v25 = *(void **)(v24 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v26 = v25;
  sub_24F00();

  swift_release();
  swift_release();
  unint64_t v27 = v83;
  uint64_t v28 = v78;
  uint64_t *v13 = v77;
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))((char *)v13 + v11[7], v9, v81);
  *(uint64_t *)((char *)v13 + v11[8]) = (uint64_t)v76;
  *(uint64_t *)((char *)v13 + v11[9]) = v27;
  LOBYTE(v11) = sub_25100();
  sub_1E050((uint64_t)v13, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for ActivityDailyGoalChartView);
  uint64_t v29 = &v18[*(int *)(v15 + 44)];
  char *v29 = (char)v11;
  *(_OWORD *)(v29 + 8) = xmmword_2A150;
  *(_OWORD *)(v29 + 24) = xmmword_2A160;
  v29[40] = 0;
  sub_1DFF4((uint64_t)v13);
  uint64_t v30 = (uint64_t)v20;
  sub_17328((uint64_t)v18, (uint64_t)v20, &qword_3D560);
  uint64_t v31 = *(void **)(v24 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v32 = v31;
  sub_24F00();

  swift_release();
  swift_release();
  if (v83 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_254F0();
    uint64_t result = swift_bridgeObjectRelease_n();
    if (v33 < 0)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t v33 = *(void *)((char *)&dword_10 + (v83 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRelease();
  }
  unint64_t v83 = 0;
  uint64_t v84 = v33;
  swift_getKeyPath();
  uint64_t v34 = v73;
  uint64_t v35 = KeyPath;
  sub_1E050(v73, KeyPath, (uint64_t (*)(void))type metadata accessor for AdvancedChangeGoalView);
  unint64_t v36 = (*(unsigned __int8 *)(v69 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
  uint64_t v37 = swift_allocObject();
  sub_1E1F0(v35, v37 + v36);
  sub_16B84(&qword_3D568);
  type metadata accessor for ScheduleDayRowView();
  sub_1E2D4();
  sub_1E524(&qword_3D580, (void (*)(uint64_t))type metadata accessor for ScheduleDayRowView);
  sub_25370();
  if (*(unsigned char *)(v34 + v72[9]) == 1)
  {
    sub_1AC5C(0, (unint64_t *)&qword_3D018);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v39 = [self bundleForClass:ObjCClassFromMetadata];
    NSString v40 = sub_253D0();
    NSString v41 = sub_253D0();
    id v42 = [v39 localizedStringForKey:v40 value:0 table:v41];

    uint64_t v43 = sub_253E0();
    uint64_t v45 = v44;

    unint64_t v83 = v43;
    uint64_t v84 = v45;
    sub_16C2C();
    uint64_t v81 = sub_251F0();
    uint64_t v77 = v47;
    uint64_t v78 = v46;
    id v76 = (id)(v48 & 1);
    LOBYTE(v45) = sub_25100();
    uint64_t v49 = sub_250C0();
    uint64_t v73 = sub_251B0();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v50 = v45;
    uint64_t v51 = (v49 << 32) | 1;
    LODWORD(v72) = 256;
  }
  else
  {
    uint64_t v81 = 0;
    uint64_t v77 = 0;
    uint64_t v78 = 0;
    id v76 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    uint64_t KeyPath = 0;
    uint64_t v73 = 0;
    LODWORD(v72) = 0;
  }
  uint64_t v67 = v30;
  id v68 = v18;
  id v52 = v18;
  sub_1738C(v30, (uint64_t)v18, &qword_3D560);
  unint64_t v53 = v79;
  unsigned int v54 = *(void (**)(char *, char *, uint64_t))(v80 + 16);
  uint64_t v55 = v75;
  v54(v79, v82, v75);
  uint64_t v56 = (uint64_t)v52;
  uint64_t v57 = v74;
  sub_1738C(v56, v74, &qword_3D560);
  uint64_t v58 = sub_16B84(&qword_3D588);
  v54((char *)(v57 + *(int *)(v58 + 48)), v53, v55);
  uint64_t v59 = v57 + *(int *)(v58 + 64);
  uint64_t v60 = v81;
  uint64_t v62 = v77;
  uint64_t v61 = v78;
  *(void *)uint64_t v59 = v81;
  *(void *)(v59 + 8) = v61;
  char v63 = (char)v76;
  *(void *)(v59 + 16) = v76;
  *(void *)(v59 + 24) = v62;
  *(void *)(v59 + 32) = v50;
  *(_OWORD *)(v59 + 40) = 0u;
  *(_OWORD *)(v59 + 56) = 0u;
  *(void *)(v59 + 72) = v51;
  uint64_t v70 = v51;
  uint64_t v64 = v73;
  *(void *)(v59 + 80) = KeyPath;
  *(void *)(v59 + 88) = v64;
  *(_WORD *)(v59 + 96) = (_WORD)v72;
  sub_1E3A4(v60, v61, v63, v62);
  id v65 = *(void (**)(char *, uint64_t))(v80 + 8);
  v65(v82, v55);
  sub_173F0(v67, &qword_3D560);
  sub_1E414(v81, v61, v63, v62);
  v65(v79, v55);
  return sub_173F0((uint64_t)v68, &qword_3D560);
}

uint64_t sub_1DA34@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  sub_1DB44(a3);
  uint64_t v6 = type metadata accessor for AdvancedChangeGoalView();
  uint64_t v7 = a2 + *(int *)(v6 + 20);
  id v8 = *(id *)v7;
  char v9 = *(unsigned char *)(v7 + 8);
  sub_1C614(*(id *)v7, v9);
  id v10 = sub_1DDCC(v8, v9);
  sub_1C6D8(v8, v9);
  uint64_t v11 = *(void **)(a2 + *(int *)(v6 + 24) + 8);
  uint64_t v12 = (int *)type metadata accessor for ScheduleDayRowView();
  *(void *)(a3 + v12[5]) = v10;
  *(void *)(a3 + v12[6]) = v5;
  uint64_t v13 = (uint64_t *)(a3 + v12[7]);
  type metadata accessor for GoalDaysModel();
  sub_1E524(&qword_3D1E0, (void (*)(uint64_t))type metadata accessor for GoalDaysModel);
  id v14 = v11;
  uint64_t result = sub_24F80();
  uint64_t *v13 = result;
  v13[1] = v16;
  return result;
}

uint64_t sub_1DB44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25060();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_16B84(&qword_3D1C8);
  __chkstk_darwin(v8);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1738C(v2, (uint64_t)v10, &qword_3D1C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_24CC0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_25430();
    id v14 = sub_250F0();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_1E56C(0x7261646E656C6143, 0xE800000000000000, &v17);
      _os_log_impl(&dword_0, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_25050();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

id sub_1DDCC(void *a1, char a2)
{
  id v15 = a1;
  uint64_t v3 = sub_25060();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v14 = v15;
    return v14;
  }
  else
  {
    swift_retain();
    os_log_type_t v7 = sub_25430();
    uint64_t v8 = sub_250F0();
    os_log_type_t v9 = v7;
    if (os_log_type_enabled(v8, v7))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      sub_1AC5C(0, (unint64_t *)&qword_3D1D0);
      uint64_t v11 = sub_25540();
      *(void *)(v10 + 4) = sub_1E56C(v11, v12, &v16);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v8, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_25050();
    swift_getAtKeyPath();
    sub_1C6D8(v15, 0);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (id)v16;
  }
}

uint64_t sub_1DFF4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ActivityDailyGoalChartView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E050(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1E0B8()
{
  uint64_t v1 = type metadata accessor for AdvancedChangeGoalView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  sub_16B84(&qword_3D1C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24CC0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  sub_1C6D8(*(id *)(v5 + *(int *)(v1 + 20)), *(unsigned char *)(v5 + *(int *)(v1 + 20) + 8));

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1E1F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AdvancedChangeGoalView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E254@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for AdvancedChangeGoalView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1DA34(a1, v6, a2);
}

unint64_t sub_1E2D4()
{
  unint64_t result = qword_3D570;
  if (!qword_3D570)
  {
    sub_16CE8(&qword_3D568);
    sub_1E350();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D570);
  }
  return result;
}

unint64_t sub_1E350()
{
  unint64_t result = qword_3D578;
  if (!qword_3D578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D578);
  }
  return result;
}

uint64_t sub_1E3A4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1E404(result, a2, a3 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_1E404(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1E414(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_16C80(result, a2, a3 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_1E474@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24FD0();
  *a1 = result;
  return result;
}

uint64_t sub_1E4A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24FD0();
  *a1 = result;
  return result;
}

uint64_t sub_1E4CC()
{
  return sub_24FE0();
}

uint64_t sub_1E4F8()
{
  return sub_24FE0();
}

uint64_t sub_1E524(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1E56C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_1E640(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1E790((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1E790((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1E740((uint64_t)v12);
  return v7;
}

unint64_t sub_1E640(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_1E7EC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_254D0();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1E740(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1E790(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_1E7EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_1E884(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1E988(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1E988((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_1E884(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1E920(v2, 0);
      unint64_t result = (void *)sub_254A0();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_253F0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1E920(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_16B84(&qword_3D590);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1E988(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_16B84(&qword_3D590);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1EA78()
{
  return sub_1EADC(&qword_3D598, &qword_3D548, (void (*)(void))sub_1EAB4);
}

uint64_t sub_1EAB4()
{
  return sub_1EADC(&qword_3D5A0, &qword_3D540, (void (*)(void))sub_1EB5C);
}

uint64_t sub_1EADC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_16CE8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1EB5C()
{
  unint64_t result = qword_3D5A8[0];
  if (!qword_3D5A8[0])
  {
    sub_16CE8(&qword_3D538);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_3D5A8);
  }
  return result;
}

uint64_t sub_1EBB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_1EBC0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_1EC6C(void *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7;
  uint64_t v8 = *a2;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    *a1 = v8;
    unint64_t v3 = (void *)(v8 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
  }
  else
  {
    uint64_t v11 = a2[1];
    void *v3 = v8;
    v3[1] = v11;
    uint64_t v12 = ((unint64_t)v3 + v6 + 16) & ~v6;
    uint64_t v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    id v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v14(v12, v13, v4);
    id v15 = (void *)((v7 + v12) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v16 = (v7 + v13) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v17 = *(void **)v16;
    *id v15 = *(void *)v16;
    v15[1] = *(void *)(v16 + 8);
    uint64_t v18 = (void *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v19 = (void *)((v16 + 23) & 0xFFFFFFFFFFFFFFF8);
    void *v18 = *v19;
    v18[1] = v19[1];
    id v20 = v17;
    swift_retain();
  }
  swift_retain();
  return v3;
}

uint64_t sub_1EDE0(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = v4 + 8;
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v6);

  swift_release();

  return swift_release();
}

void *sub_1EE90(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(void *)(v5 - 8) + 16;
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  swift_retain();
  v6(v9, v10, v5);
  uint64_t v11 = *(void *)(v7 + 48) + 7;
  uint64_t v12 = (void *)((v11 + v9) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v13 = (v11 + v10) & 0xFFFFFFFFFFFFFFF8;
  id v14 = *(void **)v13;
  *uint64_t v12 = *(void *)v13;
  v12[1] = *(void *)(v13 + 8);
  id v15 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v16 = (void *)((v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  *id v15 = *v16;
  v15[1] = v16[1];
  id v17 = v14;
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1EF7C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 16) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v10, v11);
  uint64_t v12 = *(void *)(v8 + 40) + 7;
  unint64_t v13 = (v12 + v10) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v12 + v11) & 0xFFFFFFFFFFFFFFF8;
  id v15 = *(void **)v13;
  unint64_t v16 = *(void **)v14;
  *(void *)unint64_t v13 = *(void *)v14;
  id v17 = v16;

  *(void *)(v13 + 8) = *(void *)(v14 + 8);
  swift_retain();
  swift_release();
  uint64_t v18 = (void *)((v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (void *)((v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v18 = *v19;
  v18[1] = v19[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1F088(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 16) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 16) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  uint64_t v9 = *(void *)(v5 + 32) + 7;
  uint64_t v10 = (_OWORD *)((v9 + v7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v11 = (_OWORD *)((v9 + v8) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v10 = *v11;
  *(_OWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

_OWORD *sub_1F138(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 40;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(v9, v10);
  uint64_t v11 = *(void *)(v7 + 24) + 7;
  unint64_t v12 = (v11 + v9) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = (void *)((v11 + v10) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v14 = *(void **)v12;
  *(void *)unint64_t v12 = *v13;

  *(void *)(v12 + 8) = v13[1];
  swift_release();
  id v15 = (void *)((v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v16 = (void *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  *id v15 = *v16;
  v15[1] = v16[1];
  swift_release();
  return a1;
}

uint64_t sub_1F228(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + ((v6 + 16) & ~v6) + 7) & 0xFFFFFFFFFFFFFFF8)
         + 23) & 0xFFFFFFFFFFFFFFF8)
       + 16;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1F388);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if ((v5 & 0x80000000) != 0) {
    return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 16) & ~v6);
  }
  uint64_t v17 = *(void *)a1;
  if (*(void *)a1 >= 0xFFFFFFFFuLL) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_1F39C(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((((*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if ((v7 & 0x80000000) != 0)
            {
              unint64_t v19 = (unint64_t)&a1[v9 + 16] & ~v9;
              id v20 = *(void (**)(unint64_t))(v6 + 56);
              v20(v19);
            }
            else
            {
              if ((a2 & 0x80000000) != 0)
              {
                uint64_t v18 = a2 ^ 0x80000000;
                *((void *)a1 + 1) = 0;
              }
              else
              {
                uint64_t v18 = a2 - 1;
              }
              *(void *)a1 = v18;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      unsigned int v12 = v11 + 1;
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
    int v16 = v15;
  else {
    int v16 = 1;
  }
  if (((((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x1F598);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for ScheduleDayRowButton()
{
  return sub_20314();
}

uint64_t sub_1F5D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1F61C()
{
  sub_16B84(&qword_3D638);
  sub_25320();
  return v1;
}

uint64_t sub_1F668()
{
  return sub_25330();
}

uint64_t sub_1F6B8()
{
  sub_16B84(&qword_3D630);
  sub_25320();
  return v1;
}

uint64_t sub_1F704()
{
  return sub_25330();
}

uint64_t sub_1F754@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v36 = *(void *)(a1 - 8);
  uint64_t v4 = *(void *)(v36 + 64);
  uint64_t v5 = __chkstk_darwin(a1);
  uint64_t v43 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v5);
  unsigned int v8 = (char *)&v33 - v7;
  uint64_t v10 = *(void *)(v6 + 16);
  uint64_t v9 = *(void *)(v6 + 24);
  uint64_t v11 = sub_25350();
  uint64_t v40 = v11;
  uint64_t v45 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v37 = (char *)&v33 - v12;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v50 = v11;
  uint64_t v51 = WitnessTable;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v42 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v13 = __chkstk_darwin(OpaqueTypeMetadata2);
  objc_super v38 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  id v39 = (char *)&v33 - v15;
  uint64_t v47 = v10;
  uint64_t v48 = v9;
  uint64_t v35 = v2;
  uint64_t v49 = v2;
  uint64_t v33 = v9;
  sub_25340();
  uint64_t v16 = v36;
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 16);
  int v17 = v8;
  v34(v8, v2, a1);
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v10;
  *(void *)(v19 + 24) = v9;
  id v20 = *(void (**)(unint64_t, char *, uint64_t))(v16 + 32);
  v20(v19 + v18, v17, a1);
  uint64_t v21 = v43;
  v34(v43, v35, a1);
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v33;
  *(void *)(v22 + 16) = v10;
  *(void *)(v22 + 24) = v23;
  v20(v22 + v18, v21, a1);
  uint64_t v24 = v37;
  id v25 = v38;
  uint64_t v26 = v40;
  sub_25290();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v24, v26);
  uint64_t v27 = v42;
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  uint64_t v29 = v39;
  uint64_t v30 = OpaqueTypeMetadata2;
  v28(v39, v25, OpaqueTypeMetadata2);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v27 + 8);
  v31(v25, v30);
  v28(v46, v29, v30);
  return ((uint64_t (*)(char *, uint64_t))v31)(v29, v30);
}

uint64_t sub_1FBA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  __chkstk_darwin(a1);
  unsigned int v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1 + *(int *)(type metadata accessor for ScheduleDayRowButton() + 36);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v10(v8, v9, a2);
  v10(a3, (uint64_t)v8, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

void sub_1FCA8()
{
  type metadata accessor for ScheduleDayRowButton();
  id v0 = (id)sub_1F61C();
  [v0 invalidate];
}

uint64_t sub_1FD00(char a1)
{
  uint64_t v2 = type metadata accessor for ScheduleDayRowButton();
  if (a1) {
    return sub_1FD78(v2);
  }
  uint64_t v4 = (void *)sub_1F61C();
  [v4 invalidate];

  return sub_1F704();
}

uint64_t sub_1FD78(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1);
  uint64_t v6 = (char *)&aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v8 = (void ***)((char *)v1 + *(int *)(v7 + 52));
  uint64_t v10 = *v8;
  uint64_t v9 = (uint64_t)v8[1];
  aBlock = *v8;
  uint64_t v20 = v9;
  swift_retain();
  sub_16B84(&qword_3D630);
  uint64_t result = sub_25320();
  if (__OFADD__(v26, 1))
  {
    __break(1u);
  }
  else
  {
    aBlock = v10;
    uint64_t v20 = v9;
    uint64_t v25 = v26 + 1;
    sub_25330();
    uint64_t v12 = swift_release();
    (*v1)(v12);
    double v13 = fmax(0.5 / (double)sub_1F6B8(), 0.01);
    uint64_t v14 = self;
    (*(void (**)(char *, void (**)(uint64_t), uint64_t))(v4 + 16))((char *)&aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
    unint64_t v15 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = *(_OWORD *)(a1 + 16);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v16 + v15, v6, a1);
    uint64_t v23 = sub_20298;
    uint64_t v24 = v16;
    aBlock = _NSConcreteStackBlock;
    uint64_t v20 = 1107296256;
    uint64_t v21 = sub_1FFEC;
    uint64_t v22 = &unk_35E00;
    int v17 = _Block_copy(&aBlock);
    swift_release();
    id v18 = [v14 scheduledTimerWithTimeInterval:0 repeats:v17 block:v13];
    _Block_release(v17);
    return sub_1F668();
  }
  return result;
}

void sub_1FFEC(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_20058@<X0>(char *a1@<X8>)
{
  return sub_1FBA4(*(void *)(v1 + 32), *(void *)(v1 + 16), a1);
}

void sub_20068()
{
  type metadata accessor for ScheduleDayRowButton();

  sub_1FCA8();
}

uint64_t sub_200F0(char a1)
{
  type metadata accessor for ScheduleDayRowButton();

  return sub_1FD00(a1);
}

uint64_t sub_20180()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for ScheduleDayRowButton() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v7 + v2[11], v1);

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_20298()
{
  return sub_1FD78();
}

uint64_t sub_202FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2030C()
{
  return swift_release();
}

uint64_t sub_20314()
{
  return swift_getGenericMetadata();
}

uint64_t sub_20344()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for DailyGoalChartPoint()
{
  return swift_bridgeObjectRelease();
}

void *_s19ActivityBridgeSetup19DailyGoalChartPointVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DailyGoalChartPoint(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

__n128 initializeWithTake for DailyGoalChartPoint(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for DailyGoalChartPoint(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for DailyGoalChartPoint(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DailyGoalChartPoint(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DailyGoalChartPoint()
{
  return &type metadata for DailyGoalChartPoint;
}

void *sub_20540()
{
  return &protocol witness table for String;
}

uint64_t sub_2054C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t *sub_20558(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24CC0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_retain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    unint64_t v15 = *(void **)((char *)a2 + v13);
    *(uint64_t *)((char *)v7 + v13) = (uint64_t)v15;
    *(uint64_t *)((char *)v7 + v14) = *(uint64_t *)((char *)a2 + v14);
    id v16 = v15;
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t sub_2066C(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24CC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

void *sub_20704(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24CC0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_retain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = *(void **)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = v13;
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  id v14 = v13;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_207CC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24CC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = *(void **)((char *)a2 + v10);
  uint64_t v12 = *(void **)((char *)a1 + v10);
  *(void *)((char *)a1 + v10) = v11;
  id v13 = v11;

  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_2089C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24CC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  return a1;
}

void *sub_2093C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24CC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = *(void **)((char *)a1 + v10);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);

  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_209F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_20A0C);
}

uint64_t sub_20A0C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24CC0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_20ABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_20AD0);
}

void *sub_20AD0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    void *result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24CC0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ActivityDailyGoalChartView()
{
  uint64_t result = qword_3D698;
  if (!qword_3D698) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20BC4()
{
  uint64_t result = sub_24CC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_20C7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20C98(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ActivityDailyGoalChartView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = __chkstk_darwin(v2 - 8);
  v9[1] = sub_20E2C(*(void *)(a1 + *(int *)(v5 + 36)));
  sub_23F34(a1, (uint64_t)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  sub_240A4((uint64_t)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  sub_16B84((uint64_t *)&unk_3D368);
  sub_16B84(&qword_3D700);
  sub_17668(&qword_3D7A8, (uint64_t *)&unk_3D368);
  sub_23A0C();
  sub_24188();
  return sub_25360();
}

char *sub_20E2C(unint64_t a1)
{
  if (a1 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_254F0();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      uint64_t v25 = type metadata accessor for ActivityDailyGoalChartView();
      id v26 = *(id *)(v27 + *(int *)(v25 + 24));
      uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v4 = 4;
      uint64_t v5 = &off_3B000;
      while (1)
      {
        if ((a1 & 0xC000000000000001) != 0) {
          unint64_t v6 = (char *)sub_254B0();
        }
        else {
          unint64_t v6 = (char *)*(id *)(a1 + 8 * v4);
        }
        uint64_t v7 = v6;
        uint64_t v8 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
        {
          __break(1u);
LABEL_24:
          __break(1u);
LABEL_25:
          __break(1u);
LABEL_26:
          __break(1u);
          goto LABEL_27;
        }
        uint64_t v9 = *(void *)&v6[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goalType];
        id v10 = *(id *)&v6[OBJC_IVAR____TtC19ActivityBridgeSetup7GoalDay_goal];
        uint64_t result = (char *)objc_msgSend(v26, v5[469], v25);
        if (!result)
        {
          __break(1u);
          return result;
        }
        uint64_t v12 = result;
        id v13 = [result v5[469]];

        id v14 = &selRef_minuteUnit;
        if ((unint64_t)(v9 - 1) < 2) {
          goto LABEL_12;
        }
        if (v9) {
          break;
        }
        id v14 = &selRef_userActiveEnergyBurnedUnit;
        unint64_t v15 = v13;
LABEL_13:
        id v16 = [v15 *v14];

        [v10 doubleValueForUnit:v16];
        double v18 = v17;

        if ((~*(void *)&v18 & 0x7FF0000000000000) == 0) {
          goto LABEL_24;
        }
        if (v18 <= -9.22337204e18) {
          goto LABEL_25;
        }
        if (v18 >= 9.22337204e18) {
          goto LABEL_26;
        }
        uint64_t v19 = sub_1BE40((uint64_t)v7);
        uint64_t v21 = v20;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v3 = sub_24208(0, *((void *)v3 + 2) + 1, 1, v3);
        }
        unint64_t v23 = *((void *)v3 + 2);
        unint64_t v22 = *((void *)v3 + 3);
        if (v23 >= v22 >> 1) {
          uint64_t v3 = sub_24208((char *)(v22 > 1), v23 + 1, 1, v3);
        }
        *((void *)v3 + 2) = v23 + 1;
        uint64_t v24 = &v3[24 * v23];
        *((void *)v24 + 4) = v19;
        *((void *)v24 + 5) = v21;
        *((void *)v24 + 6) = (uint64_t)v18;

        ++v4;
        uint64_t v5 = &off_3B000;
        if (v8 == v2) {
          goto LABEL_29;
        }
      }
      id v14 = &selRef_countUnit;
LABEL_12:
      unint64_t v15 = self;
      goto LABEL_13;
    }
  }
  uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
LABEL_29:
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_210FC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  char v91 = a2;
  uint64_t v78 = a3;
  uint64_t v77 = sub_16B84(&qword_3D7B8);
  __chkstk_darwin(v77);
  id v76 = (char *)v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_24E90();
  uint64_t v69 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  id v68 = (char *)v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_16B84(&qword_3D718);
  uint64_t v72 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  uint64_t v70 = (char *)v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_16B84(&qword_3D7C0);
  uint64_t v74 = *(void *)(v75 - 8);
  uint64_t v7 = __chkstk_darwin(v75);
  uint64_t v89 = (char *)v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v88 = (char *)v67 - v9;
  uint64_t v83 = sub_24FB0();
  __chkstk_darwin(v83);
  uint64_t v11 = (_OWORD *)((char *)v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = sub_16B84(&qword_3D7C8);
  __chkstk_darwin(v12 - 8);
  id v14 = (char *)v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_16B84(&qword_3D7D0);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v87 = (char *)v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v90 = (void (*)(char *, char *, uint64_t))((char *)v67 - v18);
  uint64_t v80 = sub_24E30();
  uint64_t v82 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v20 = (char *)v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_16B84(&qword_3D708);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v84 = v21;
  uint64_t v85 = v22;
  __chkstk_darwin(v21);
  uint64_t v79 = (char *)v67 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_16B84(&qword_3D7D8);
  uint64_t v94 = *(void **)(v92 - 8);
  uint64_t v24 = __chkstk_darwin(v92);
  uint64_t v93 = (char *)v67 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  char v95 = (char *)v67 - v26;
  uint64_t v28 = a1[1];
  uint64_t v81 = *a1;
  uint64_t v27 = v81;
  uint64_t v86 = (void *)a1[2];
  uint64_t v29 = v86;
  sub_25090();
  uint64_t v100 = v27;
  uint64_t v101 = v28;
  swift_bridgeObjectRetain();
  sub_24DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25090();
  uint64_t v100 = (uint64_t)v29;
  sub_24DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v67[1] = v14;
  sub_24E20();
  uint64_t v30 = v83;
  uint64_t v31 = (char *)v11 + *(int *)(v83 + 20);
  uint64_t v32 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v33 = sub_250A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 104))(v31, v32, v33);
  __asm { FMOV            V0.2D, #5.0 }
  *uint64_t v11 = _Q0;
  uint64_t v39 = sub_23E30(&qword_3D710, (void (*)(uint64_t))&type metadata accessor for RoundedRectangle);
  uint64_t v40 = v79;
  uint64_t v41 = v80;
  sub_24D20();
  sub_16BD0((uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v82 + 8))(v20, v41);
  uint64_t v96 = sub_252E0();
  uint64_t v100 = v41;
  uint64_t v101 = v30;
  uint64_t v102 = &protocol witness table for BarMark;
  uint64_t v103 = v39;
  swift_getOpaqueTypeConformance2();
  uint64_t v42 = v93;
  uint64_t v43 = v84;
  sub_24D10();
  swift_release();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v40, v43);
  uint64_t v44 = v94 + 4;
  uint64_t v85 = v94[4];
  ((void (*)(char *, char *, uint64_t))v85)(v95, v42, v92);
  sub_25090();
  uint64_t v45 = v81;
  uint64_t v100 = v81;
  uint64_t v101 = v28;
  swift_bridgeObjectRetain();
  sub_24DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25090();
  uint64_t v100 = v45;
  uint64_t v101 = v28;
  swift_bridgeObjectRetain();
  sub_24DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = sub_25090();
  if (__OFADD__(v86, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v100 = (uint64_t)v86 + 1;
    uint64_t v86 = v44;
    sub_24DA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v47 = v68;
    sub_24E80();
    uint64_t v100 = *v91;
    uint64_t v48 = v70;
    uint64_t v49 = v71;
    sub_24D10();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v47, v49);
    sub_16B84(&qword_3D7E0);
    uint64_t v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = xmmword_29D50;
    *(void *)(v50 + 32) = 0x4014000000000000;
    sub_24F60();
    uint64_t v96 = v49;
    uint64_t v97 = &type metadata for Color;
    uint64_t v98 = &protocol witness table for RuleMark;
    char v99 = &protocol witness table for Color;
    swift_getOpaqueTypeConformance2();
    uint64_t v51 = v89;
    uint64_t v52 = v73;
    sub_24D30();
    sub_241DC((uint64_t)&v100);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v48, v52);
    uint64_t v53 = v74;
    uint64_t v90 = *(void (**)(char *, char *, uint64_t))(v74 + 32);
    char v91 = (uint64_t *)(v74 + 32);
    unsigned int v54 = v88;
    uint64_t v55 = v51;
    uint64_t v56 = v75;
    v90(v88, v51, v75);
    uint64_t v57 = v93;
    uint64_t v58 = (void (*)(char *, char *, uint64_t))v94[2];
    uint64_t v59 = v92;
    v58(v93, v95, v92);
    uint64_t v60 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
    v60(v55, v54, v56);
    uint64_t v61 = v76;
    v58(v76, v57, v59);
    uint64_t v62 = v77;
    char v63 = &v61[*(int *)(v77 + 48)];
    v60(v63, v55, v56);
    uint64_t v64 = v78;
    ((void (*)(uint64_t, char *, uint64_t))v85)(v78, v61, v59);
    v90((char *)(v64 + *(int *)(v62 + 48)), v63, v56);
    id v65 = *(void (**)(char *, uint64_t))(v53 + 8);
    v65(v88, v56);
    id v66 = (void (*)(char *, uint64_t))v94[1];
    v66(v95, v59);
    v65(v89, v56);
    return ((uint64_t (*)(char *, uint64_t))v66)(v93, v59);
  }
  return result;
}

uint64_t sub_21D28()
{
  uint64_t v0 = sub_24D80();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_24DC0();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_24D50();
  __chkstk_darwin(v2 - 8);
  sub_24D40();
  sub_24DB0();
  sub_24D70();
  sub_16B84(&qword_3D790);
  sub_23E78();
  return sub_24EA0();
}

uint64_t sub_21E88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v3 = sub_24E50();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_24E70();
  uint64_t v46 = *(void *)(v4 - 8);
  uint64_t v47 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v43 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v37 - v7;
  uint64_t v9 = sub_24D00();
  uint64_t v44 = *(void *)(v9 - 8);
  uint64_t v45 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v42 = (char *)&v37 - v13;
  uint64_t v14 = sub_24DE0();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_24E00();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_16B84(&qword_3D760);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v39 = v16;
  uint64_t v40 = v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v37 - v21;
  uint64_t v49 = a1;
  sub_24DF0();
  sub_24DD0();
  sub_16B84(&qword_3D780);
  sub_23CE0();
  sub_24D90();
  uint64_t v53 = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v23 = v42;
  sub_24CF0();
  sub_24E40();
  sub_24E60();
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  uint64_t v41 = v20;
  v24(v20, v22, v16);
  v50[0] = v20;
  uint64_t v25 = v44;
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  objc_super v38 = v12;
  uint64_t v27 = v45;
  v26(v12, v23, v45);
  v50[1] = v12;
  uint64_t v29 = v46;
  uint64_t v28 = v47;
  uint64_t v30 = v43;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v43, v8, v47);
  v50[2] = v30;
  sub_228B4(v50, v48);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v29 + 8);
  v31(v8, v28);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v25 + 8);
  v32(v23, v27);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v40 + 8);
  uint64_t v34 = v22;
  uint64_t v35 = v39;
  v33(v34, v39);
  v31(v30, v28);
  v32(v38, v27);
  return ((uint64_t (*)(char *, uint64_t))v33)(v41, v35);
}

uint64_t sub_22364@<X0>(uint64_t a1@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v44 = sub_16B84(&qword_3CFA0);
  uint64_t v1 = __chkstk_darwin(v44);
  uint64_t v3 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v38 - v4;
  uint64_t v6 = sub_24FA0();
  uint64_t v7 = *(void **)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v38 - v11;
  uint64_t v43 = sub_16B84(&qword_3CFA8);
  uint64_t v13 = __chkstk_darwin(v43);
  uint64_t v40 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v42 = (uint64_t)&v38 - v15;
  uint64_t v16 = sub_16B84(&qword_3CFB8);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v41 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EB0();
  if (!v47)
  {
    uint64_t v37 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(v45, v37, 1, v16);
  }
  uint64_t v39 = v17;
  sub_16C2C();
  uint64_t v46 = sub_251F0();
  uint64_t v47 = v19;
  char v48 = v20 & 1;
  uint64_t v49 = v21;
  uint64_t v22 = (void (*)(char *, void, uint64_t))v7[13];
  v22(v12, enum case for DynamicTypeSize.xSmall(_:), v6);
  v22(v10, enum case for DynamicTypeSize.xxxLarge(_:), v6);
  sub_23E30((unint64_t *)&qword_3CFC8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = sub_253B0();
  if (result)
  {
    uint64_t v24 = v3;
    uint64_t v25 = v44;
    uint64_t v26 = v10;
    uint64_t v27 = &v5[*(int *)(v44 + 48)];
    uint64_t v38 = v16;
    uint64_t v28 = (void (*)(char *, char *, uint64_t))v7[4];
    v28(v5, v12, v6);
    uint64_t v29 = v27;
    v28(v27, v26, v6);
    uint64_t v30 = &v24[*(int *)(v25 + 48)];
    uint64_t v31 = (void (*)(char *, char *, uint64_t))v7[2];
    v31(v24, v5, v6);
    v31(v30, v29, v6);
    uint64_t v32 = (uint64_t)v40;
    v28(v40, v24, v6);
    uint64_t v33 = (void (*)(char *, uint64_t))v7[1];
    v33(v30, v6);
    uint64_t v34 = &v24[*(int *)(v44 + 48)];
    v28(v24, v5, v6);
    v28(v34, v29, v6);
    v28((char *)(v32 + *(int *)(v43 + 36)), v34, v6);
    uint64_t v16 = v38;
    v33(v24, v6);
    uint64_t v35 = v42;
    sub_17328(v32, v42, &qword_3CFA8);
    sub_17668(&qword_3CFD0, &qword_3CFA8);
    uint64_t v36 = v41;
    sub_25260();
    sub_173F0(v35, &qword_3CFA8);
    sub_16C80(v46, v47, v48);
    swift_bridgeObjectRelease();
    uint64_t v17 = v39;
    (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v45, v36, v16);
    uint64_t v37 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(v45, v37, 1, v16);
  }
  __break(1u);
  return result;
}

uint64_t sub_228B4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_16B84(&qword_3D7A0);
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_16B84(&qword_3D760);
  sub_17668(&qword_3D758, &qword_3D760);
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, void, uint64_t))(v9 + 16))(v7, *a1, v8);
  uint64_t v10 = sub_24D00();
  uint64_t v18 = &v7[*(int *)(v5 + 56)];
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(void))(v11 + 16))();
  uint64_t v12 = sub_24E70();
  uint64_t v13 = &v7[*(int *)(v5 + 72)];
  uint64_t v14 = a1[2];
  uint64_t v15 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, v14, v12);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v7, v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a2 + *(int *)(v5 + 56), v18, v10);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(a2 + *(int *)(v5 + 72), v13, v12);
}

uint64_t sub_22AEC()
{
  uint64_t v0 = sub_24DC0();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_24D50();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_24D80();
  __chkstk_darwin(v2 - 8);
  sub_24D60();
  sub_24D40();
  sub_24DB0();
  sub_16B84(&qword_3D748);
  sub_23BC4();
  return sub_24EA0();
}

uint64_t sub_22C5C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v37 = sub_16B84(&qword_3D778);
  __chkstk_darwin(v37);
  uint64_t v36 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_16B84(&qword_3D770);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v35 = (uint64_t)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v33 - v7;
  uint64_t v9 = sub_24DE0();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_24E00();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_16B84(&qword_3D760);
  uint64_t v12 = *(void **)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v33 - v17;
  __chkstk_darwin(v16);
  char v20 = (char *)&v33 - v19;
  uint64_t v39 = a1;
  sub_24DF0();
  sub_24DD0();
  sub_16B84(&qword_3D780);
  sub_23CE0();
  sub_24D90();
  uint64_t v34 = (void (*)(char *, char *, uint64_t))v12[4];
  v34(v20, v18, v11);
  if (sub_24EC0())
  {
    uint64_t v21 = sub_24D00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 1, 1, v21);
  }
  else
  {
    sub_24F60();
    long long v43 = v40;
    long long v44 = v41;
    uint64_t v45 = v42;
    sub_24CF0();
    uint64_t v22 = sub_24D00();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v8, 0, 1, v22);
  }
  uint64_t v23 = (void (*)(char *, char *, uint64_t))v12[2];
  v23(v15, v20, v11);
  uint64_t v33 = v20;
  uint64_t v24 = v15;
  uint64_t v25 = (uint64_t)v8;
  uint64_t v26 = v35;
  sub_23DC8((uint64_t)v8, v35);
  sub_17668(&qword_3D758, &qword_3D760);
  uint64_t v27 = v36;
  v23(v36, v24, v11);
  sub_23C6C();
  uint64_t v28 = v37;
  uint64_t v29 = (uint64_t)&v27[*(int *)(v37 + 48)];
  sub_23DC8(v26, v29);
  uint64_t v30 = v38;
  v34(v38, v27, v11);
  sub_17328(v29, (uint64_t)&v30[*(int *)(v28 + 48)], &qword_3D770);
  sub_173F0(v25, &qword_3D770);
  uint64_t v31 = (void (*)(char *, uint64_t))v12[1];
  v31(v33, v11);
  sub_173F0(v26, &qword_3D770);
  return ((uint64_t (*)(char *, uint64_t))v31)(v24, v11);
}

uint64_t sub_23144@<X0>(uint64_t a1@<X8>)
{
  uint64_t v45 = sub_16B84(&qword_3CFA0);
  uint64_t v2 = __chkstk_darwin(v45);
  uint64_t v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v38 - v5;
  uint64_t v7 = sub_24FA0();
  uint64_t v46 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v38 - v11;
  uint64_t v13 = sub_16B84(&qword_3CFA8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v42 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v44 = (uint64_t)&v38 - v16;
  uint64_t v47 = sub_16B84(&qword_3CFB8);
  uint64_t v17 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  long long v43 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EB0();
  if (v49 == 1)
  {
    uint64_t v19 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(a1, v19, 1, v47);
  }
  uint64_t v41 = v13;
  uint64_t v48 = sub_25500();
  uint64_t v49 = v20;
  sub_16C2C();
  uint64_t v48 = sub_251F0();
  uint64_t v49 = v21;
  char v50 = v22 & 1;
  uint64_t v51 = v23;
  uint64_t v24 = *(void (**)(char *, void, uint64_t))(v46 + 104);
  v24(v12, enum case for DynamicTypeSize.xSmall(_:), v7);
  v24(v10, enum case for DynamicTypeSize.xxxLarge(_:), v7);
  sub_23E30((unint64_t *)&qword_3CFC8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = sub_253B0();
  if (result)
  {
    uint64_t v39 = v17;
    uint64_t v40 = a1;
    uint64_t v26 = v45;
    uint64_t v27 = &v6[*(int *)(v45 + 48)];
    uint64_t v28 = v4;
    uint64_t v29 = v46;
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v46 + 32);
    v30(v6, v12, v7);
    uint64_t v38 = v27;
    v30(v27, v10, v7);
    uint64_t v31 = &v28[*(int *)(v26 + 48)];
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
    v32(v28, v6, v7);
    v32(v31, v27, v7);
    uint64_t v33 = (uint64_t)v42;
    v30(v42, v28, v7);
    uint64_t v34 = *(void (**)(char *, uint64_t))(v29 + 8);
    v34(v31, v7);
    uint64_t v17 = v39;
    uint64_t v35 = &v28[*(int *)(v45 + 48)];
    v30(v28, v6, v7);
    v30(v35, v38, v7);
    v30((char *)(v33 + *(int *)(v41 + 36)), v35, v7);
    a1 = v40;
    v34(v28, v7);
    uint64_t v36 = v44;
    sub_17328(v33, v44, &qword_3CFA8);
    sub_17668(&qword_3CFD0, &qword_3CFA8);
    uint64_t v37 = v43;
    sub_25260();
    sub_173F0(v36, &qword_3CFA8);
    sub_16C80(v48, v49, v50);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a1, v37, v47);
    uint64_t v19 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(a1, v19, 1, v47);
  }
  __break(1u);
  return result;
}

uint64_t sub_236B8@<X0>(uint64_t a1@<X8>)
{
  v14[1] = a1;
  uint64_t v2 = sub_16B84(&qword_3D6D8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = sub_16B84(&qword_3D6E0);
  uint64_t v6 = *(void *)(v14[0] - 8);
  __chkstk_darwin(v14[0]);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = v1;
  sub_16B84(&qword_3D6E8);
  sub_23998();
  sub_24E10();
  uint64_t v9 = sub_16B84(&qword_3D720);
  uint64_t v10 = sub_17668(&qword_3D728, &qword_3D6D8);
  uint64_t v11 = sub_17668(&qword_3D730, &qword_3D720);
  sub_25200();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_16B84(&qword_3D738);
  uint64_t v16 = v2;
  uint64_t v17 = v9;
  uint64_t v18 = v10;
  uint64_t v19 = v11;
  swift_getOpaqueTypeConformance2();
  sub_17668(&qword_3D740, &qword_3D738);
  uint64_t v12 = v14[0];
  sub_25210();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v12);
}

uint64_t sub_23990()
{
  return sub_20C98(*(void *)(v0 + 16));
}

unint64_t sub_23998()
{
  unint64_t result = qword_3D6F0;
  if (!qword_3D6F0)
  {
    sub_16CE8(&qword_3D6E8);
    sub_23A0C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D6F0);
  }
  return result;
}

unint64_t sub_23A0C()
{
  unint64_t result = qword_3D6F8;
  if (!qword_3D6F8)
  {
    sub_16CE8(&qword_3D700);
    sub_16CE8(&qword_3D708);
    sub_24E30();
    sub_24FB0();
    sub_23E30(&qword_3D710, (void (*)(uint64_t))&type metadata accessor for RoundedRectangle);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_16CE8(&qword_3D718);
    sub_24E90();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D6F8);
  }
  return result;
}

unint64_t sub_23BC4()
{
  unint64_t result = qword_3D750;
  if (!qword_3D750)
  {
    sub_16CE8(&qword_3D748);
    sub_17668(&qword_3D758, &qword_3D760);
    sub_23C6C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D750);
  }
  return result;
}

unint64_t sub_23C6C()
{
  unint64_t result = qword_3D768;
  if (!qword_3D768)
  {
    sub_16CE8(&qword_3D770);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D768);
  }
  return result;
}

uint64_t sub_23CD8@<X0>(uint64_t a1@<X8>)
{
  return sub_23144(a1);
}

unint64_t sub_23CE0()
{
  unint64_t result = qword_3D788;
  if (!qword_3D788)
  {
    sub_16CE8(&qword_3D780);
    sub_16CE8(&qword_3CFA8);
    sub_17668(&qword_3CFD0, &qword_3CFA8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D788);
  }
  return result;
}

uint64_t sub_23DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_16B84(&qword_3D770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E30(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_23E78()
{
  unint64_t result = qword_3D798;
  if (!qword_3D798)
  {
    sub_16CE8(&qword_3D790);
    sub_17668(&qword_3D758, &qword_3D760);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D798);
  }
  return result;
}

uint64_t sub_23F2C@<X0>(uint64_t a1@<X8>)
{
  return sub_22364(a1);
}

uint64_t sub_23F34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActivityDailyGoalChartView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23F98()
{
  uint64_t v1 = (int *)(type metadata accessor for ActivityDailyGoalChartView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_24CC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_240A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActivityDailyGoalChartView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24108@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ActivityDailyGoalChartView() - 8);
  uint64_t v6 = (uint64_t *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));

  return sub_210FC(a1, v6, a2);
}

unint64_t sub_24188()
{
  unint64_t result = qword_3D7B0;
  if (!qword_3D7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3D7B0);
  }
  return result;
}

uint64_t sub_241DC(uint64_t a1)
{
  return a1;
}

char *sub_24208(char *result, int64_t a2, char a3, char *a4)
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
    sub_16B84(&qword_3D7E8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24324()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_24464()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  sub_24488(v0, v1, v2);
}

void sub_24488(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "[sharing-setup] %{public}@ Failed to complete end to end Cloud sync with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_24514(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Existing move goal lookup failed with error %@", (uint8_t *)&v2, 0xCu);
}

void sub_2458C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Existing move goal lookup timed out", v1, 2u);
}

void sub_245D0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "CHASActivitySetupMetricsCollectionViewController found unexpected presentation context %ld", (uint8_t *)&v3, 0xCu);
}

void sub_2464C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246B8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24724(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24790()
{
  sub_10818();
  sub_8478(&dword_0, v0, v1, "Error reading activity mode characteristic with error=%@", v2, v3, v4, v5, v6);
}

void sub_247F8()
{
  sub_10824(__stack_chk_guard);
  sub_107E0();
  sub_107F8(&dword_0, v0, v1, "Error deleting future goals of type %@: %@");
}

void sub_24860(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Saving first daily goals and activity move mode timed out.", v1, 2u);
}

void sub_248A4()
{
  sub_10818();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "[sharing-setup] Failed to complete end to end Cloud sync with error: %{public}@", v1, 0xCu);
}

void sub_24918()
{
  sub_10818();
  sub_8478(&dword_0, v0, v1, "[sharing-setup] Could not force nano sync after saving activity goals: %{public}@", v2, v3, v4, v5, v6);
}

void sub_24980()
{
  sub_10818();
  sub_8478(&dword_0, v0, v1, "Error deleting goal schedule: %@", v2, v3, v4, v5, v6);
}

void sub_249E8()
{
  sub_10824(__stack_chk_guard);
  sub_107E0();
  sub_107F8(&dword_0, v0, v1, "Failed to fetch active sample for type %@ error %@");
}

void sub_24A50()
{
  sub_10824(__stack_chk_guard);
  sub_107E0();
  sub_107F8(&dword_0, v0, v1, "Failed to fetch most recent sample for type %@ error %@");
}

void sub_24AB8()
{
  sub_10824(__stack_chk_guard);
  sub_107E0();
  sub_107F8(&dword_0, v0, v1, "Failed to fetch most recent samples for type %@ error %@");
}

void sub_24B20()
{
  sub_10818();
  sub_8478(&dword_0, v0, v1, "Error deleting existing goal schedule: %@", v2, v3, v4, v5, v6);
}

void sub_24B88()
{
  sub_10818();
  sub_8478(&dword_0, v0, v1, "Error saving goal schedule: %@", v2, v3, v4, v5, v6);
}

uint64_t sub_24BF0()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_24C00()
{
  return type metadata accessor for Notification();
}

uint64_t sub_24C10()
{
  return DateComponents.weekday.getter();
}

uint64_t sub_24C20()
{
  return type metadata accessor for DateComponents();
}

void sub_24C30(NSURL *retstr@<X8>)
{
}

uint64_t sub_24C40()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_24C50()
{
  return type metadata accessor for URL();
}

NSDate sub_24C60()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_24C70()
{
  return Date.init()();
}

uint64_t sub_24C80()
{
  return type metadata accessor for Date();
}

uint64_t sub_24C90()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t sub_24CA0()
{
  return static Calendar.current.getter();
}

uint64_t sub_24CB0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_24CC0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_24CD0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_24CE0()
{
  return UIBackgroundConfiguration.backgroundColor.setter();
}

uint64_t sub_24CF0()
{
  return AxisGridLine.init(centered:stroke:)();
}

uint64_t sub_24D00()
{
  return type metadata accessor for AxisGridLine();
}

uint64_t sub_24D10()
{
  return ChartContent.foregroundStyle<A>(_:)();
}

uint64_t sub_24D20()
{
  return ChartContent.clipShape<A>(_:style:)();
}

uint64_t sub_24D30()
{
  return ChartContent.lineStyle(_:)();
}

uint64_t sub_24D40()
{
  return static AxisMarkPreset.automatic.getter();
}

uint64_t sub_24D50()
{
  return type metadata accessor for AxisMarkPreset();
}

uint64_t sub_24D60()
{
  return static AxisMarkValues.automatic(desiredCount:roundLowerBound:roundUpperBound:)();
}

uint64_t sub_24D70()
{
  return static AxisMarkValues.automatic.getter();
}

uint64_t sub_24D80()
{
  return type metadata accessor for AxisMarkValues();
}

uint64_t sub_24D90()
{
  return AxisValueLabel.init(centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:content:)();
}

uint64_t sub_24DA0()
{
  return static PlottableValue.value(_:_:)();
}

uint64_t sub_24DB0()
{
  return static AxisMarkPosition.automatic.getter();
}

uint64_t sub_24DC0()
{
  return type metadata accessor for AxisMarkPosition();
}

uint64_t sub_24DD0()
{
  return static AxisValueLabelOrientation.automatic.getter();
}

uint64_t sub_24DE0()
{
  return type metadata accessor for AxisValueLabelOrientation();
}

uint64_t sub_24DF0()
{
  return static AxisValueLabelCollisionResolution.automatic.getter();
}

uint64_t sub_24E00()
{
  return type metadata accessor for AxisValueLabelCollisionResolution();
}

uint64_t sub_24E10()
{
  return Chart.init(content:)();
}

uint64_t sub_24E20()
{
  return BarMark.init<A, B>(x:y:width:height:stacking:)();
}

uint64_t sub_24E30()
{
  return type metadata accessor for BarMark();
}

uint64_t sub_24E40()
{
  return static AxisTick.Length.automatic.getter();
}

uint64_t sub_24E50()
{
  return type metadata accessor for AxisTick.Length();
}

uint64_t sub_24E60()
{
  return AxisTick.init(centered:length:stroke:)();
}

uint64_t sub_24E70()
{
  return type metadata accessor for AxisTick();
}

uint64_t sub_24E80()
{
  return RuleMark.init<A, B>(xStart:xEnd:y:)();
}

uint64_t sub_24E90()
{
  return type metadata accessor for RuleMark();
}

uint64_t sub_24EA0()
{
  return AxisMarks.init(preset:position:values:content:)();
}

uint64_t sub_24EB0()
{
  return AxisValue.as<A>(_:)();
}

uint64_t sub_24EC0()
{
  return AxisValue.index.getter();
}

uint64_t sub_24ED0()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_24EE0()
{
  return Published.init(initialValue:)();
}

uint64_t sub_24EF0()
{
  return static Published.subscript.modify();
}

uint64_t sub_24F00()
{
  return static Published.subscript.getter();
}

uint64_t sub_24F10()
{
  return static Published.subscript.setter();
}

uint64_t sub_24F20()
{
  return type metadata accessor for Published();
}

uint64_t sub_24F30()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_24F40()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_24F50()
{
  return Environment.init<A>(_:)();
}

uint64_t sub_24F60()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_24F70()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t sub_24F80()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_24F90()
{
  return _UIHostingView.init(rootView:)();
}

uint64_t sub_24FA0()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_24FB0()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_24FC0()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_24FD0()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_24FE0()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_24FF0()
{
  return EnvironmentValues.tint.getter();
}

uint64_t sub_25000()
{
  return EnvironmentValues.tint.setter();
}

uint64_t sub_25010()
{
  return EnvironmentValues.calendar.getter();
}

uint64_t sub_25020()
{
  return EnvironmentValues.calendar.setter();
}

uint64_t sub_25030()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_25040()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_25050()
{
  return EnvironmentValues.init()();
}

uint64_t sub_25060()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_25070()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t sub_25080()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_25090()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_250A0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_250B0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_250C0()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_250D0()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_250E0()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_250F0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_25100()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_25110()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_25120()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_25130()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_25140()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_25150()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_25160()
{
  return static Font.body.getter();
}

uint64_t sub_25170()
{
  return static Font.title.getter();
}

uint64_t sub_25180()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_25190()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_251A0()
{
  return static Font.title2.getter();
}

uint64_t sub_251B0()
{
  return static Font.footnote.getter();
}

uint64_t sub_251C0()
{
  return Text.fontDesign(_:)();
}

uint64_t sub_251D0()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_251E0()
{
  return Text.font(_:)();
}

uint64_t sub_251F0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_25200()
{
  return View.chartXAxis<A>(content:)();
}

uint64_t sub_25210()
{
  return View.chartYAxis<A>(content:)();
}

uint64_t sub_25220()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_25230()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_25240()
{
  return View.environment<A>(_:)();
}

uint64_t sub_25250()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_25260()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t sub_25270()
{
  return View.monospacedDigit()();
}

uint64_t sub_25280()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t sub_25290()
{
  return View.onLongPressGesture(minimumDuration:maximumDistance:pressing:perform:)();
}

uint64_t sub_252A0()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_252B0()
{
  return Color.init(uiColor:)();
}

uint64_t sub_252D0()
{
  return static Color.gray.getter();
}

uint64_t sub_252E0()
{
  return Color.gradient.getter();
}

uint64_t sub_25300()
{
  return Image.init(systemName:)();
}

uint64_t sub_25310()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_25320()
{
  return State.wrappedValue.getter();
}

uint64_t sub_25330()
{
  return State.wrappedValue.setter();
}

uint64_t sub_25340()
{
  return Button.init(action:label:)();
}

uint64_t sub_25350()
{
  return type metadata accessor for Button();
}

uint64_t sub_25360()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_25370()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_25380()
{
  return static Alignment.center.getter();
}

uint64_t sub_25390()
{
  return static Alignment.trailing.getter();
}

uint64_t sub_253A0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_253B0()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t sub_253C0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_253D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_253E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_253F0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_25400()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_25410()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_25420()
{
  return specialized Array._endMutation()();
}

uint64_t sub_25430()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_25440()
{
  return UIButton.Configuration.background.modify();
}

uint64_t sub_25450()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t sub_25460()
{
  return UIButton.configuration.getter();
}

uint64_t sub_25470()
{
  return UIButton.configuration.setter();
}

uint64_t sub_25480()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t sub_25490()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_254A0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_254B0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_254D0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_254E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_254F0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_25500()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_25510()
{
  return Hasher.init(_seed:)();
}

void sub_25520(Swift::UInt a1)
{
}

Swift::Int sub_25530()
{
  return Hasher._finalize()();
}

uint64_t sub_25540()
{
  return _typeName(_:qualified:)();
}

uint64_t BPSAccessoryColor()
{
  return _BPSAccessoryColor();
}

uint64_t BPSCellHightlightColor()
{
  return _BPSCellHightlightColor();
}

uint64_t BPSForegroundColor()
{
  return _BPSForegroundColor();
}

uint64_t BPSPillSelectedColor()
{
  return _BPSPillSelectedColor();
}

uint64_t BPSScreenValueGetRelevantValue()
{
  return _BPSScreenValueGetRelevantValue();
}

uint64_t BPSSeparatorColor()
{
  return _BPSSeparatorColor();
}

uint64_t BPSSetupBackgroundColor()
{
  return _BPSSetupBackgroundColor();
}

uint64_t BPSTextColor()
{
  return _BPSTextColor();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

uint64_t FIActivityAnalyticsSubmission()
{
  return _FIActivityAnalyticsSubmission();
}

uint64_t FIAgeInYearsForDateOfBirth()
{
  return _FIAgeInYearsForDateOfBirth();
}

uint64_t FICMotionConditionForWheelchairUse()
{
  return _FICMotionConditionForWheelchairUse();
}

uint64_t FIDefaultActivityMoveModeWithAge()
{
  return _FIDefaultActivityMoveModeWithAge();
}

uint64_t FIGetActivePairedDevice()
{
  return _FIGetActivePairedDevice();
}

uint64_t FIUIActivityLevelsForBMRAndIsStandalonePhoneFitnessMode()
{
  return _FIUIActivityLevelsForBMRAndIsStandalonePhoneFitnessMode();
}

uint64_t FIUIActivityLevelsForFitnessJrAndIsStandalonePhoneFitnessMode()
{
  return _FIUIActivityLevelsForFitnessJrAndIsStandalonePhoneFitnessMode();
}

uint64_t FIUIBundle()
{
  return _FIUIBundle();
}

uint64_t FIUICalculateBMR()
{
  return _FIUICalculateBMR();
}

uint64_t FIUIDeviceScale()
{
  return _FIUIDeviceScale();
}

uint64_t FIUIHKUnitIsCalorieUnit()
{
  return _FIUIHKUnitIsCalorieUnit();
}

uint64_t FIUIHealthStoreForDevice()
{
  return _FIUIHealthStoreForDevice();
}

uint64_t FIUILocaleIsRightToLeft()
{
  return _FIUILocaleIsRightToLeft();
}

uint64_t FIUISetNeedsActivityRingExplanation()
{
  return _FIUISetNeedsActivityRingExplanation();
}

uint64_t FIUIUserHasExistingExerciseAndStandGoals()
{
  return _FIUIUserHasExistingExerciseAndStandGoals();
}

uint64_t FIUIUserHasExistingMoveGoal()
{
  return _FIUIUserHasExistingMoveGoal();
}

uint64_t FIUIUserHasExistingPreKincaidMoveGoal()
{
  return _FIUIUserHasExistingPreKincaidMoveGoal();
}

uint64_t UIRectCenteredXInRectScale()
{
  return _UIRectCenteredXInRectScale();
}

uint64_t UIRectIntegralWithScale()
{
  return _UIRectIntegralWithScale();
}

uint64_t UIRoundToScale()
{
  return _UIRoundToScale();
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

uint64_t _HKCacheIndexFromDateComponents()
{
  return __HKCacheIndexFromDateComponents();
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__activityGoalTypeForCurrentPage(void *a1, const char *a2, ...)
{
  return _[a1 _activityGoalTypeForCurrentPage];
}

id objc_msgSend__activityLevelView(void *a1, const char *a2, ...)
{
  return _[a1 _activityLevelView];
}

id objc_msgSend__activityMoveModeWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activityMoveModeWithError:");
}

id objc_msgSend__createGoalViewWithFrame_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createGoalViewWithFrame:configuration:");
}

id objc_msgSend__currentPageHasGoalSchedule(void *a1, const char *a2, ...)
{
  return _[a1 _currentPageHasGoalSchedule];
}

id objc_msgSend__determinePresentationContextIfNeededWithHealthStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_determinePresentationContextIfNeededWithHealthStore:");
}

id objc_msgSend__endEditingAndDiscardChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endEditingAndDiscardChanges:");
}

id objc_msgSend__exerciseGoalViewConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _exerciseGoalViewConfiguration];
}

id objc_msgSend__exerciseQuantityForToday(void *a1, const char *a2, ...)
{
  return _[a1 _exerciseQuantityForToday];
}

id objc_msgSend__existingActivityGoalScheduleForCurrentPage(void *a1, const char *a2, ...)
{
  return _[a1 _existingActivityGoalScheduleForCurrentPage];
}

id objc_msgSend__fetchActiveExerciseGoalSampleWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchActiveExerciseGoalSampleWithCompletion:");
}

id objc_msgSend__fetchActiveMoveGoalSampleWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchActiveMoveGoalSampleWithCompletion:");
}

id objc_msgSend__fetchActiveSampleForQuantityType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchActiveSampleForQuantityType:completion:");
}

id objc_msgSend__fetchActiveStandGoalSampleWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchActiveStandGoalSampleWithCompletion:");
}

id objc_msgSend__fetchMostRecentDailyExerciseGoalSampleWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMostRecentDailyExerciseGoalSampleWithCompletion:");
}

id objc_msgSend__fetchMostRecentDailyGoalSampleForQuantityType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMostRecentDailyGoalSampleForQuantityType:completion:");
}

id objc_msgSend__fetchMostRecentDailyMoveGoalSampleWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMostRecentDailyMoveGoalSampleWithCompletion:");
}

id objc_msgSend__fetchMostRecentDailyStandGoalSampleWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMostRecentDailyStandGoalSampleWithCompletion:");
}

id objc_msgSend__fetchMostRecentGoalSchedulesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMostRecentGoalSchedulesWithCompletion:");
}

id objc_msgSend__fitGoalLabel(void *a1, const char *a2, ...)
{
  return _[a1 _fitGoalLabel];
}

id objc_msgSend__footerString(void *a1, const char *a2, ...)
{
  return _[a1 _footerString];
}

id objc_msgSend__formatGoalLabel(void *a1, const char *a2, ...)
{
  return _[a1 _formatGoalLabel];
}

id objc_msgSend__formattingManager(void *a1, const char *a2, ...)
{
  return _[a1 _formattingManager];
}

id objc_msgSend__isGoalSchedule_theSameAs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isGoalSchedule:theSameAs:");
}

id objc_msgSend__isStandalonePhoneFitnessMode(void *a1, const char *a2, ...)
{
  return _[a1 _isStandalonePhoneFitnessMode];
}

id objc_msgSend__loadExerciseAndStandGoalViews(void *a1, const char *a2, ...)
{
  return _[a1 _loadExerciseAndStandGoalViews];
}

id objc_msgSend__loadMoveGoalView(void *a1, const char *a2, ...)
{
  return _[a1 _loadMoveGoalView];
}

id objc_msgSend__makeFooterView(void *a1, const char *a2, ...)
{
  return _[a1 _makeFooterView];
}

id objc_msgSend__moveGoalViewConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _moveGoalViewConfiguration];
}

id objc_msgSend__moveQuantityForToday(void *a1, const char *a2, ...)
{
  return _[a1 _moveQuantityForToday];
}

id objc_msgSend__removeAdvancedView(void *a1, const char *a2, ...)
{
  return _[a1 _removeAdvancedView];
}

id objc_msgSend__removeGoalsOfType_after_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeGoalsOfType:after:");
}

id objc_msgSend__requestWheelchairDiagnosticsSubmissionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _requestWheelchairDiagnosticsSubmissionIfNecessary];
}

id objc_msgSend__setAccessoryBaseColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAccessoryBaseColor:");
}

id objc_msgSend__setActivityLevel_activityMoveMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setActivityLevel:activityMoveMode:");
}

id objc_msgSend__setGoalQuantity_goalView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGoalQuantity:goalView:");
}

id objc_msgSend__setGoalQuantityForGoalView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGoalQuantityForGoalView:");
}

id objc_msgSend__setGoalSchedules_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGoalSchedules:");
}

id objc_msgSend__shouldShowChangeGoalFooter(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowChangeGoalFooter];
}

id objc_msgSend__showAdvancedViewForCurrentGoalPage(void *a1, const char *a2, ...)
{
  return _[a1 _showAdvancedViewForCurrentGoalPage];
}

id objc_msgSend__showAdvancedViewIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _showAdvancedViewIfNeeded];
}

id objc_msgSend__standGoalViewConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _standGoalViewConfiguration];
}

id objc_msgSend__standQuantityForToday(void *a1, const char *a2, ...)
{
  return _[a1 _standQuantityForToday];
}

id objc_msgSend__startEdit(void *a1, const char *a2, ...)
{
  return _[a1 _startEdit];
}

id objc_msgSend__storeGoals(void *a1, const char *a2, ...)
{
  return _[a1 _storeGoals];
}

id objc_msgSend__systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemImageNamed:withConfiguration:");
}

id objc_msgSend__systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
}

id objc_msgSend__titleForConfirmButton(void *a1, const char *a2, ...)
{
  return _[a1 _titleForConfirmButton];
}

id objc_msgSend__toggleAdvancedMode(void *a1, const char *a2, ...)
{
  return _[a1 _toggleAdvancedMode];
}

id objc_msgSend__unitManager(void *a1, const char *a2, ...)
{
  return _[a1 _unitManager];
}

id objc_msgSend__updateAdvanceViewButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAdvanceViewButton:");
}

id objc_msgSend__updateGoalLabelWithGoal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateGoalLabelWithGoal:");
}

id objc_msgSend__value(void *a1, const char *a2, ...)
{
  return _[a1 _value];
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return _[a1 accessoryView];
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activePairingDevice(void *a1, const char *a2, ...)
{
  return _[a1 activePairingDevice];
}

id objc_msgSend_activityGoalScheduleType(void *a1, const char *a2, ...)
{
  return _[a1 activityGoalScheduleType];
}

id objc_msgSend_activityGoalScheduleWithDate_goalType_goal_device_metadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityGoalScheduleWithDate:goalType:goal:device:metadata:");
}

id objc_msgSend_activityLevelForSegmentedControlIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityLevelForSegmentedControlIndex:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addButton:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_advanceGoalHeaderTitle(void *a1, const char *a2, ...)
{
  return _[a1 advanceGoalHeaderTitle];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alignGoalViews(void *a1, const char *a2, ...)
{
  return _[a1 alignGoalViews];
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_biologicalSex(void *a1, const char *a2, ...)
{
  return _[a1 biologicalSex];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return _[a1 boldButton];
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

id objc_msgSend_briskColors(void *a1, const char *a2, ...)
{
  return _[a1 briskColors];
}

id objc_msgSend_buddyControllerDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buddyControllerDone:");
}

id objc_msgSend_buddyControllerDone_nextControllerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buddyControllerDone:nextControllerClass:");
}

id objc_msgSend_buddyControllerReleaseHold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buddyControllerReleaseHold:");
}

id objc_msgSend_buddyControllerReleaseHoldAndSkip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buddyControllerReleaseHoldAndSkip:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_buttonControllerDidUpdate(void *a1, const char *a2, ...)
{
  return _[a1 buttonControllerDidUpdate];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return _[a1 buttonTray];
}

id objc_msgSend_buttonWithConfiguration_primaryAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithConfiguration:primaryAction:");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_calorieGoal(void *a1, const char *a2, ...)
{
  return _[a1 calorieGoal];
}

id objc_msgSend_categorySampleWithType_value_startDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:");
}

id objc_msgSend_categoryTypeForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryTypeForIdentifier:");
}

id objc_msgSend_cellDidBecomeFirstResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellDidBecomeFirstResponder:");
}

id objc_msgSend_cellDidResignFirstResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellDidResignFirstResponder:");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_commmitWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commmitWithError:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_computeMaxYForGoalViews(void *a1, const char *a2, ...)
{
  return _[a1 computeMaxYForGoalViews];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationWithFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithFont:");
}

id objc_msgSend_configurationWithPointSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithPointSize:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_continueButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 continueButtonTitle];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countUnit(void *a1, const char *a2, ...)
{
  return _[a1 countUnit];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentExerciseGoal(void *a1, const char *a2, ...)
{
  return _[a1 currentExerciseGoal];
}

id objc_msgSend_currentMoveGoal(void *a1, const char *a2, ...)
{
  return _[a1 currentMoveGoal];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentStandGoal(void *a1, const char *a2, ...)
{
  return _[a1 currentStandGoal];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:");
}

id objc_msgSend_dateOfBirth(void *a1, const char *a2, ...)
{
  return _[a1 dateOfBirth];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultFontForTextStyle:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteObject_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteObject:withCompletion:");
}

id objc_msgSend_deleteObjectsOfType_predicate_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteObjectsOfType:predicate:withCompletion:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didTapEditPregnancy(void *a1, const char *a2, ...)
{
  return _[a1 didTapEditPregnancy];
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 directionalLayoutMargins];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_doubleValueForUnit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValueForUnit:");
}

id objc_msgSend_editedSettingsController(void *a1, const char *a2, ...)
{
  return _[a1 editedSettingsController];
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endEditing:");
}

id objc_msgSend_energyColors(void *a1, const char *a2, ...)
{
  return _[a1 energyColors];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_executeQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:");
}

id objc_msgSend_exerciseGoal(void *a1, const char *a2, ...)
{
  return _[a1 exerciseGoal];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return _[a1 features];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return _[a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fitnessMode(void *a1, const char *a2, ...)
{
  return _[a1 fitnessMode];
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_forceNanoSyncWithOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceNanoSyncWithOptions:completion:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_fridayGoal(void *a1, const char *a2, ...)
{
  return _[a1 fridayGoal];
}

id objc_msgSend_fu_monospacedFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fu_monospacedFont");
}

id objc_msgSend_fu_sausageFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fu_sausageFontOfSize:");
}

id objc_msgSend_generateHeaders(void *a1, const char *a2, ...)
{
  return _[a1 generateHeaders];
}

id objc_msgSend_goalColor(void *a1, const char *a2, ...)
{
  return _[a1 goalColor];
}

id objc_msgSend_goalDays(void *a1, const char *a2, ...)
{
  return _[a1 goalDays];
}

id objc_msgSend_goalQuantityForToday(void *a1, const char *a2, ...)
{
  return _[a1 goalQuantityForToday];
}

id objc_msgSend_goalType(void *a1, const char *a2, ...)
{
  return _[a1 goalType];
}

id objc_msgSend_goalUnitStringFormatter(void *a1, const char *a2, ...)
{
  return _[a1 goalUnitStringFormatter];
}

id objc_msgSend_goalValueStringFormatter(void *a1, const char *a2, ...)
{
  return _[a1 goalValueStringFormatter];
}

id objc_msgSend_gramUnitWithMetricPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gramUnitWithMetricPrefix:");
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return _[a1 grayColor];
}

id objc_msgSend_hasWheelchairDataSubmissionAllowedBeenSet(void *a1, const char *a2, ...)
{
  return _[a1 hasWheelchairDataSubmissionAllowedBeenSet];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return _[a1 headerView];
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return _[a1 healthStore];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return _[a1 height];
}

id objc_msgSend_hk_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hk_filter:");
}

id objc_msgSend_hk_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hk_firstObjectPassingTest:");
}

id objc_msgSend_hk_gregorianCalendar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hk_gregorianCalendar");
}

id objc_msgSend_hk_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hk_preferredFontForTextStyle:");
}

id objc_msgSend_imageWithTintColor_renderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithTintColor:renderingMode:");
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSetWithIndex:");
}

id objc_msgSend_initWithActivitySettingsController_showWheelchair_pregnancyStateProvider_showPregnancy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivitySettingsController:showWheelchair:pregnancyStateProvider:showPregnancy:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithComponent:");
}

id objc_msgSend_initWithCustomView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCustomView:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:configuration:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithGoalSchedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGoalSchedule:");
}

id objc_msgSend_initWithHealthStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHealthStore:");
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItems:");
}

id objc_msgSend_initWithPresentationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPresentationContext:");
}

id objc_msgSend_initWithSampleType_predicate_limit_sortDescriptors_resultsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUnitManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnitManager:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_isDescendantOfView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDescendantOfView:");
}

id objc_msgSend_isDiagnosticSubmissionAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isDiagnosticSubmissionAllowed];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isNavigationBarHidden(void *a1, const char *a2, ...)
{
  return _[a1 isNavigationBarHidden];
}

id objc_msgSend_isStandalonePhoneFitnessMode(void *a1, const char *a2, ...)
{
  return _[a1 isStandalonePhoneFitnessMode];
}

id objc_msgSend_keyColors(void *a1, const char *a2, ...)
{
  return _[a1 keyColors];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leanBodyMass(void *a1, const char *a2, ...)
{
  return _[a1 leanBodyMass];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return _[a1 linkButton];
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return _[a1 localDevice];
}

id objc_msgSend_localizedCapitalizedString(void *a1, const char *a2, ...)
{
  return _[a1 localizedCapitalizedString];
}

id objc_msgSend_localizedLongActiveHoursUnitStringForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedLongActiveHoursUnitStringForValue:");
}

id objc_msgSend_localizedLongBriskMinutesUnitStringForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedLongBriskMinutesUnitStringForValue:");
}

id objc_msgSend_localizedLongMoveUnitStringWithActivityMoveMode_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedLongMoveUnitStringWithActivityMoveMode:value:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithActiveHours_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithActiveHours:");
}

id objc_msgSend_localizedStringWithBriskMinutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithBriskMinutes:");
}

id objc_msgSend_localizedStringWithMoveQuantity_activityMoveMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithMoveQuantity:activityMoveMode:");
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 localizedUppercaseString];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeViewWithGoalSchedule_goalDaysModel_wheelchairUser_goalType_formattingManager_showFooter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeViewWithGoalSchedule:goalDaysModel:wheelchairUser:goalType:formattingManager:showFooter:");
}

id objc_msgSend_maximumValue(void *a1, const char *a2, ...)
{
  return _[a1 maximumValue];
}

id objc_msgSend_meterUnitWithMetricPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "meterUnitWithMetricPrefix:");
}

id objc_msgSend_minimumValue(void *a1, const char *a2, ...)
{
  return _[a1 minimumValue];
}

id objc_msgSend_minuteUnit(void *a1, const char *a2, ...)
{
  return _[a1 minuteUnit];
}

id objc_msgSend_mondayGoal(void *a1, const char *a2, ...)
{
  return _[a1 mondayGoal];
}

id objc_msgSend_moveMinuteGoal(void *a1, const char *a2, ...)
{
  return _[a1 moveMinuteGoal];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_nonGradientTextColor(void *a1, const char *a2, ...)
{
  return _[a1 nonGradientTextColor];
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return _[a1 numberOfSections];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:options:completionHandler:");
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return _[a1 pairingID];
}

id objc_msgSend_performEndToEndCloudSyncOnSkippingSetupForHealthStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performEndToEndCloudSyncOnSkippingSetupForHealthStore:");
}

id objc_msgSend_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performEndToEndCloudSyncWithNRDeviceUUID:syncParticipantFirst:completion:");
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 plainButtonConfiguration];
}

id objc_msgSend_populateExistingCharacteristics(void *a1, const char *a2, ...)
{
  return _[a1 populateExistingCharacteristics];
}

id objc_msgSend_predicateForObjectsWithMetadataKey_operatorType_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForObjectsWithMetadataKey:operatorType:value:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_pregnancySectionIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 pregnancySectionIndexPath];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentWithController_onDismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentWithController:onDismiss:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return _[a1 quantity];
}

id objc_msgSend_quantitySampleWithType_quantity_startDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quantitySampleWithType:quantity:startDate:endDate:");
}

id objc_msgSend_quantitySampleWithType_quantity_startDate_endDate_metadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quantitySampleWithType:quantity:startDate:endDate:metadata:");
}

id objc_msgSend_quantityWithUnit_doubleValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quantityWithUnit:doubleValue:");
}

id objc_msgSend_reloadSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSections:withRowAnimation:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTarget:action:forControlEvents:");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_saturdayGoal(void *a1, const char *a2, ...)
{
  return _[a1 saturdayGoal];
}

id objc_msgSend_saveObject_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveObject:withCompletion:");
}

id objc_msgSend_saveObjects_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveObjects:withCompletion:");
}

id objc_msgSend_scheduleFrom_goalType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleFrom:goalType:");
}

id objc_msgSend_scheduledGoals(void *a1, const char *a2, ...)
{
  return _[a1 scheduledGoals];
}

id objc_msgSend_seahorse(void *a1, const char *a2, ...)
{
  return _[a1 seahorse];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sedentaryColors(void *a1, const char *a2, ...)
{
  return _[a1 sedentaryColors];
}

id objc_msgSend_segmentedControl(void *a1, const char *a2, ...)
{
  return _[a1 segmentedControl];
}

id objc_msgSend_selectedSegmentIndex(void *a1, const char *a2, ...)
{
  return _[a1 selectedSegmentIndex];
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setAccessibilityViewIsModal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityViewIsModal:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActivityLevels_activityMoveMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityLevels:activityMoveMode:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBaseForegroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaseForegroundColor:");
}

id objc_msgSend_setCanCancelContentTouches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanCancelContentTouches:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConfigurationUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurationUpdateHandler:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInsets:");
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:animated:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDetailText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailText:");
}

id objc_msgSend_setExclusiveTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExclusiveTouch:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGoalColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGoalColor:");
}

id objc_msgSend_setGoalUnitStringFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGoalUnitStringFormatter:");
}

id objc_msgSend_setGoalValueStringFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGoalValueStringFormatter:");
}

id objc_msgSend_setHeaderString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderString:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:forState:");
}

id objc_msgSend_setImagePadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImagePadding:");
}

id objc_msgSend_setIncrementButton_decrementButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncrementButton:decrementButton:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setMaxValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxValue:");
}

id objc_msgSend_setMaximumValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumValue:");
}

id objc_msgSend_setMinValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinValue:");
}

id objc_msgSend_setMinimumValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumValue:");
}

id objc_msgSend_setMinumumStepValueIncrement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinumumStepValueIncrement:");
}

id objc_msgSend_setNavigationBarHidden_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNavigationBarHidden:animated:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsUpdateConfiguration];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setPagingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPagingEnabled:");
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredAction:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSelectedBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedBackgroundView:");
}

id objc_msgSend_setSelectedSegmentIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedSegmentIndex:");
}

id objc_msgSend_setSeparatorColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorColor:");
}

id objc_msgSend_setShouldAdjustButtonTrayForKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldAdjustButtonTrayForKeyboard:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableView:");
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

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleString:");
}

id objc_msgSend_setTitleTextAttributes_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleTextAttributes:forState:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUnit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnit:");
}

id objc_msgSend_setUnitTextYOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnitTextYOffset:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValueIncrement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueIncrement:");
}

id objc_msgSend_setValueStepIncremement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueStepIncremement:");
}

id objc_msgSend_setValueUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueUpdateHandler:");
}

id objc_msgSend_setWheelchairDataSubmissionAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWheelchairDataSubmissionAllowed:");
}

id objc_msgSend_setupFlowUserInfo(void *a1, const char *a2, ...)
{
  return _[a1 setupFlowUserInfo];
}

id objc_msgSend_setupGoalViewValueChanged_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupGoalViewValueChanged:value:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return _[a1 sharedBehavior];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_shouldAccountForHeaderHeight(void *a1, const char *a2, ...)
{
  return _[a1 shouldAccountForHeaderHeight];
}

id objc_msgSend_shouldBypassFirstResponderAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldBypassFirstResponderAction:");
}

id objc_msgSend_showPregnancy(void *a1, const char *a2, ...)
{
  return _[a1 showPregnancy];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_standGoal(void *a1, const char *a2, ...)
{
  return _[a1 standGoal];
}

id objc_msgSend_startEditing(void *a1, const char *a2, ...)
{
  return _[a1 startEditing];
}

id objc_msgSend_startOfDayForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOfDayForDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_sundayGoal(void *a1, const char *a2, ...)
{
  return _[a1 sundayGoal];
}

id objc_msgSend_supportsCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsCapability:");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemFontOfSize_weight_design_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:weight:design:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_tableView_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:cellForRowAtIndexPath:");
}

id objc_msgSend_tappedContinue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tappedContinue:");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_thursdayGoal(void *a1, const char *a2, ...)
{
  return _[a1 thursdayGoal];
}

id objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_tuesdayGoal(void *a1, const char *a2, ...)
{
  return _[a1 tuesdayGoal];
}

id objc_msgSend_unit(void *a1, const char *a2, ...)
{
  return _[a1 unit];
}

id objc_msgSend_unitManager(void *a1, const char *a2, ...)
{
  return _[a1 unitManager];
}

id objc_msgSend_unitTextYOffset(void *a1, const char *a2, ...)
{
  return _[a1 unitTextYOffset];
}

id objc_msgSend_updateContinueButton(void *a1, const char *a2, ...)
{
  return _[a1 updateContinueButton];
}

id objc_msgSend_updateHeaderViewContent(void *a1, const char *a2, ...)
{
  return _[a1 updateHeaderViewContent];
}

id objc_msgSend_userActiveEnergyBurnedUnit(void *a1, const char *a2, ...)
{
  return _[a1 userActiveEnergyBurnedUnit];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_valueIncrement(void *a1, const char *a2, ...)
{
  return _[a1 valueIncrement];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_wednesdayGoal(void *a1, const char *a2, ...)
{
  return _[a1 wednesdayGoal];
}

id objc_msgSend_weight(void *a1, const char *a2, ...)
{
  return _[a1 weight];
}

id objc_msgSend_wheelchairSectionIndex(void *a1, const char *a2, ...)
{
  return _[a1 wheelchairSectionIndex];
}

id objc_msgSend_wheelchairUse(void *a1, const char *a2, ...)
{
  return _[a1 wheelchairUse];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}