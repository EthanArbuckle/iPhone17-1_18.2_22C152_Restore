void sub_5434(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_545C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  CSInitializeLogging();
  v7 = +[NSString stringWithFormat:@"Found assets %@", v5];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[ComfortSoundsDetailViewController init]_block_invoke", 28, v7);
  v9 = (void *)CSEngineeringLog;
  if (os_log_type_enabled(CSEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    v11 = v9;
    *(_DWORD *)buf = 136446210;
    id v15 = [v10 UTF8String];
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ([v5 count])
  {
    objc_copyWeak(&v13, (id *)(a1 + 32));
    id v12 = v5;
    AXPerformBlockOnMainThread();

    objc_destroyWeak(&v13);
  }
}

void sub_562C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_5648(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained availableAssets];
  unsigned __int8 v5 = [v4 isEqualToArray:*(void *)(a1 + 32)];

  if ((v5 & 1) == 0)
  {
    id v6 = objc_loadWeakRetained(v2);
    [v6 setAvailableAssets:*(void *)(a1 + 32)];

    id v7 = objc_loadWeakRetained(v2);
    [v7 reloadSpecifiers];
  }
}

void sub_5708(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AXPerformBlockOnMainThread();
}

id sub_5784(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

BOOL sub_58C4(id a1, AXAsset *a2, unint64_t a3, BOOL *a4)
{
  return [(AXAsset *)a2 isInstalled];
}

void sub_5C6C(uint64_t a1, uint64_t a2)
{
  id v3 = +[HUComfortSound comfortSoundWithAsset:a2];
  [*(id *)(a1 + 32) hcSafeAddObject:v3];
}

void sub_5CCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 localizedName];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v4 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];

  [v7 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v7 setUserInfo:v3];
  id v5 = [*(id *)(a1 + 40) soundGroup];
  id v6 = [v3 soundGroup];

  if (v5 == v6) {
    [*(id *)(a1 + 48) setProperty:v7 forKey:PSRadioGroupCheckedSpecifierKey];
  }
  [*(id *)(a1 + 56) addObject:v7];
}

id sub_6314(uint64_t a1)
{
  CSInitializeLogging();
  v2 = +[NSString stringWithFormat:@"Removing asset %@", *(void *)(a1 + 32)];
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[ComfortSoundsDetailViewController tableView:commitEditingStyle:forRowAtIndexPath:]_block_invoke_2", 232, v2);
  v4 = (void *)CSEngineeringLog;
  if (os_log_type_enabled(CSEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    id v6 = v4;
    *(_DWORD *)buf = 136446210;
    id v11 = [v5 UTF8String];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v7 = +[AXHAServer sharedInstance];
  v8 = [*(id *)(a1 + 32) asset];
  [v7 removeComfortSoundAsset:v8];

  [*(id *)(a1 + 40) setAvailableAssets:0];
  return [*(id *)(a1 + 40) reloadSpecifiers];
}

void sub_6BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_6C10(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockOnMainThread();
  objc_destroyWeak(&v1);
}

void sub_6C98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_6CAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_6CEC(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockOnMainThread();
  objc_destroyWeak(&v1);
}

void sub_6D74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_6D88(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v3 = [WeakRetained playingMedia];

  if ((v3 & 1) == 0)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 reloadSpecifierID:@"CSFeatureToggleSpecID"];
  }
}

id sub_6E14(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 performSelector:"_updateComfortSoundsButtonForOneness" withObject:0 afterDelay:0.0];
  }
  return result;
}

id sub_75C0()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_469C0;
  uint64_t v7 = qword_469C0;
  if (!qword_469C0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_81EC;
    v3[3] = &unk_3C998;
    v3[4] = &v4;
    sub_81EC((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_768C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_81EC(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_469C8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_8330;
    v3[4] = &unk_3C9D0;
    void v3[5] = v3;
    long long v4 = off_3C9B8;
    uint64_t v5 = 0;
    qword_469C8 = _sl_dlopen();
    if (!qword_469C8)
    {
      abort_report_np();
LABEL_8:
      sub_283AC();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AXSpringBoardServer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_469C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_8330()
{
  uint64_t result = _sl_dlopen();
  qword_469C8 = result;
  return result;
}

void sub_8BD0(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) availabilityLabel];
  v2 = hearingLocString();
  if ([*(id *)(*(void *)(a1 + 32) + 120) isPaired])
  {
    unsigned __int8 v3 = hearingLocString();

    long long v4 = +[AXHAServer sharedInstance];
    unsigned int v5 = [v4 hearingAidReachable];

    if (v5)
    {
      v2 = hearingLocString();

      uint64_t v6 = +[AXHAServer sharedInstance];
      uint64_t v7 = [v6 connectedDeviceName];

      if ([v7 length])
      {
        v8 = hearingLocString();
        uint64_t v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v7);

        v2 = (void *)v9;
      }
    }
    else
    {
      v2 = v3;
    }
  }
  [v10 setText:v2];
  [*(id *)(a1 + 32) updateTextColor];
  [*(id *)(a1 + 32) setNeedsLayout];
}

void sub_B560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_B588(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void sub_B610(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_B624(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

id sub_B94C(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_CCF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_CD20(uint64_t a1)
{
  v2 = +[PASettings sharedInstance];
  unsigned int v3 = [v2 configurationCameFromEnrollment];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained reloadSpecifiers];
  }
}

void sub_CDAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained playingMedia] & 1) == 0)
  {
    [WeakRetained reloadSpecifiers];
    id v1 = +[PASettings sharedInstance];
    [v1 personalAudioAccommodationTypes];
    [WeakRetained setMediaEnabled:compoundAttributeContainsAttribute()];
  }
}

id sub_D124(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

uint64_t sub_D350()
{
  return AXPerformBlockOnMainThread();
}

id sub_D3C4(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentRouteSupportsAudioAccomodations:*(unsigned __int8 *)(a1 + 40)];
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)AudioAccommodationsViewController;
  return objc_msgSendSuper2(&v3, "reloadSpecifiers");
}

void sub_E734(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_E7D0;
  v6[3] = &unk_3CA48;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_E7D0(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) address];
  id v3 = +[PAHMSManager sharedInstance];
  objc_msgSend(*(id *)(a1 + 40), "setHearingAssistEnabled:", objc_msgSend(v3, "yodelEnabledForAddress:", v2));

  PAInitializeLogging();
  uint64_t v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The current bluetooth device has hearing assist status changed to %d", [*(id *)(a1 + 40) hearingAssistEnabled]);
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[AudioAccommodationsViewController updateHearingAssistStatus]_block_invoke_2", 465, v4);
  uint64_t v6 = (void *)PAEngineeringLog;
  if (os_log_type_enabled(PAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    uint64_t v8 = v6;
    *(_DWORD *)buf = 136446210;
    id v10 = [v7 UTF8String];
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

id sub_FBC0(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 performSelector:"_updateLiveListenButtonForOneness" withObject:0 afterDelay:0.0];
  }
  return result;
}

void sub_FF54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_FF8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateView];
}

void sub_FF94(uint64_t a1, uint64_t a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateLiveListenWithState:a2 andLevel:a3];
}

void sub_FFF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1014C;
  v5[3] = &unk_3CAE8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
  objc_copyWeak(&v4, (id *)(a1 + 48));
  AXPerformBlockOnMainThread();
  objc_destroyWeak(&v4);

  _Block_object_dispose(v8, 8);
}

void sub_10124(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1014C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v8 = [*(id *)(a1 + 32) containsPeripheralWithUUID:v6];
    if ((v8 & 1) != 0
      || ([*(id *)(a1 + 32) deviceUUID],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v6 rangeOfString:v3] != (id)0x7FFFFFFFFFFFFFFFLL))
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((v8 & 1) == 0) {

      }
      if (isKindOfClass)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1038C;
        v17[3] = &unk_3CAC0;
        id v10 = *(id *)(a1 + 32);
        uint64_t v11 = *(void *)(a1 + 40);
        id v18 = v10;
        uint64_t v19 = v11;
        [v7 enumerateKeysAndObjectsUsingBlock:v17];
        id v12 = v18;
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  HAInitializeLogging();
  id v12 = +[NSString stringWithFormat:@"Ignoring update %@ - %@", v6, *(void *)(a1 + 32)];
  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HearingAidDetailController _setupListeners]_block_invoke_4", 166, v12);
  v14 = (void *)HAEngineeringLog;
  if (os_log_type_enabled(HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v13;
    v16 = v14;
    *(_DWORD *)buf = 136446210;
    id v21 = [v15 UTF8String];
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
LABEL_12:
}

void sub_1038C(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unsigned int v7 = [v5 availableEars];
  unsigned __int8 v8 = [*(id *)(a1 + 32) valueForProperty:0x200000];
  char v9 = [*(id *)(a1 + 32) valueForProperty:0x40000000];
  id v10 = [*(id *)(a1 + 32) valueForProperty:0x10000];
  uint64_t v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "setValue:forProperty:", v6, objc_msgSend(v16, "unsignedLongLongValue"));

  if (([v16 unsignedLongLongValue] & 8) != 0
    && [*(id *)(a1 + 32) availableEars] != v7)
  {
    goto LABEL_24;
  }
  unsigned int v12 = [v16 unsignedLongLongValue];
  if ((v12 & 0x200000) != 0)
  {
    id v6 = [*(id *)(a1 + 32) valueForProperty:0x200000];
    if (![v8 isEqualToArray:v6])
    {

LABEL_24:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_25;
    }
  }
  unsigned int v13 = [v16 unsignedLongLongValue];
  if ((v13 & 0x40000000) != 0)
  {
    uint64_t v11 = [*(id *)(a1 + 32) valueForProperty:0x40000000];
    if (![v9 isEqualToArray:v11])
    {
      LODWORD(v14) = 1;
      goto LABEL_22;
    }
  }
  if (([v16 unsignedLongLongValue] & 0x10000) == 0)
  {
    if (([v16 unsignedLongLongValue] & 0x400) != 0)
    {
      LODWORD(v14) = 1;
      if ((v13 & 0x40000000) != 0) {
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v14 = ((unint64_t)[v16 unsignedLongLongValue] >> 35) & 1;
      if ((v13 & 0x40000000) != 0) {
        goto LABEL_22;
      }
    }
LABEL_17:
    if ((v12 & 0x200000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_18;
  }
  id v15 = [*(id *)(a1 + 32) valueForProperty:0x10000];
  if (([v10 isEqualToArray:v15] & 1) == 0
    || ([v16 unsignedLongLongValue] & 0x400) != 0)
  {
    LODWORD(v14) = 1;
  }
  else
  {
    unint64_t v14 = ((unint64_t)[v16 unsignedLongLongValue] >> 35) & 1;
  }

  if ((v13 & 0x40000000) == 0) {
    goto LABEL_17;
  }
LABEL_22:

  if ((v12 & 0x200000) != 0)
  {
LABEL_23:

    if ((v14 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_18:
  if (v14) {
    goto LABEL_24;
  }
LABEL_25:
}

void sub_105B4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v3 = [*(id *)(a1 + 32) hysteresisTimer];
  [v3 invalidate];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  double v5 = 0.2;
  if (v2) {
    double v5 = 0.5;
  }
  id v6 = &selRef_updateView;
  if (v2) {
    id v6 = &selRef_reloadSpecifiers;
  }
  unsigned int v7 = +[NSTimer scheduledTimerWithTimeInterval:WeakRetained target:*v6 selector:0 userInfo:0 repeats:v5];
  [*(id *)(a1 + 32) setHysteresisTimer:v7];
}

id sub_10724(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_1099C(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

uint64_t sub_10A10()
{
  return AXPerformBlockOnMainThread();
}

id sub_10A84(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 186) = *(unsigned char *)(a1 + 40);
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)HearingAidDetailController;
  return objc_msgSendSuper2(&v2, "reloadSpecifiers");
}

void sub_10CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10CCC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10CDC(uint64_t a1)
{
}

id sub_10CE4(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) reloadSpecifierID:@"LeftStream"];
}

id sub_10CFC(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) reloadSpecifierID:@"RightStream"];
}

id sub_13F3C()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_469D0;
  uint64_t v7 = qword_469D0;
  if (!qword_469D0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_161AC;
    v3[3] = &unk_3C998;
    v3[4] = &v4;
    sub_161AC((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_14008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_143F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_14418(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    unsigned int v6 = [*(id *)(a1 + 32) index];
    if (v6 < [*(id *)(a1 + 40) index])
    {
      unsigned int v7 = [v13 index];
      if (v7 == [*(id *)(a1 + 32) index])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        id v8 = [*(id *)(a1 + 48) device];
        [v8 selectProgram:v13 forEar:4];
      }
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    unsigned int v9 = [*(id *)(a1 + 56) index];
    if (v9 < [*(id *)(a1 + 64) index])
    {
      unsigned int v10 = [v13 index];
      if (v10 == [*(id *)(a1 + 56) index])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
        uint64_t v11 = [*(id *)(a1 + 48) device];
        [v11 selectProgram:v13 forEar:4];
      }
    }
  }
  char v12 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v12) {
    char v12 = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) != 0;
  }
  *a4 = v12;
}

void sub_14580(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    unsigned int v6 = [*(id *)(a1 + 32) index];
    if (v6 < [*(id *)(a1 + 40) index])
    {
      unsigned int v7 = [v13 index];
      if (v7 == [*(id *)(a1 + 32) index])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        id v8 = [*(id *)(a1 + 48) device];
        [v8 selectProgram:v13 forEar:2];
      }
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    unsigned int v9 = [*(id *)(a1 + 56) index];
    if (v9 < [*(id *)(a1 + 64) index])
    {
      unsigned int v10 = [v13 index];
      if (v10 == [*(id *)(a1 + 56) index])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
        uint64_t v11 = [*(id *)(a1 + 48) device];
        [v11 selectProgram:v13 forEar:2];
      }
    }
  }
  char v12 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v12) {
    char v12 = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) != 0;
  }
  *a4 = v12;
}

void sub_14C08(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v7 userInfo];
  id v5 = [v3 indexOfObject:v4];

  unsigned int v6 = [v7 propertyForKey:PSTableCellKey];
  if ((v5 != (id)0x7FFFFFFFFFFFFFFFLL) != [v6 isChecked])
  {
    [v6 setChecked:v5 != (id)0x7FFFFFFFFFFFFFFFLL];
    [*(id *)(a1 + 40) reloadSpecifier:v7];
  }
}

void sub_14FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_15014(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v6 = -1;
    [*(id *)(a1 + 32) getGroup:&v6 row:0 ofSpecifier:v3];
    if (v6 != -1)
    {
      id v4 = [*(id *)(*(void *)(a1 + 32) + OBJC_IVAR___PSListController__specifiers) indexOfObject:v3];
      id v5 = [*(id *)(a1 + 40) specifiersInGroupAtGroupIndex:v6];
      v7.length = (NSUInteger)[v5 count];
      v7.location = (NSUInteger)v4;
      *(NSRange *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = NSUnionRange(*(NSRange *)(*(void *)(*(void *)(a1 + 48)+ 8)+ 32), v7);
    }
  }
}

id sub_1542C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) reloadSpecifier:a2];
}

id sub_15438(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) reloadSpecifier:a2];
}

id sub_15444(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) reloadSpecifier:a2];
}

void sub_15640(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 184) = *(unsigned char *)(a1 + 40);
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 specifierForID:@"LiveListenButtonCell"];
  [v1 updateLiveListenCell:v2];
}

Class sub_161AC(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_469D8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_162F0;
    v3[4] = &unk_3C9D0;
    void v3[5] = v3;
    long long v4 = off_3CBF8;
    uint64_t v5 = 0;
    qword_469D8 = _sl_dlopen();
    if (!qword_469D8)
    {
      abort_report_np();
LABEL_8:
      sub_283AC();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AXSpringBoardServer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_469D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_162F0()
{
  uint64_t result = _sl_dlopen();
  qword_469D8 = result;
  return result;
}

id sub_167C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateHeadphoneState];
}

void sub_16838(uint64_t a1, int a2)
{
  if (a2
    && (+[HUUtilities sharedUtilities],
        id v2 = objc_claimAutoreleasedReturnValue(),
        unsigned int v3 = [v2 wirelessSplitterEnabled],
        v2,
        !v3))
  {
    long long v4 = &stru_3D6D8;
  }
  else
  {
    paLocString();
    long long v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = v4;
  uint64_t v5 = v4;
  AXPerformBlockOnMainThread();
}

id sub_16914(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setEnabled:", objc_msgSend(*(id *)(a1 + 40), "length") == 0);
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 updateIntroButtonTrayCaption:v3];
}

id sub_16B44(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) stimuli];
  [v2 enumerateObjectsUsingBlock:&stru_3CC30];

  uint64_t v3 = +[PASettings sharedInstance];
  long long v4 = [*(id *)(a1 + 32) currentPersonalAudioConfiguration];
  [v3 setPersonalMediaConfiguration:v4];

  uint64_t v5 = +[PASettings sharedInstance];
  objc_msgSend(v5, "setPersonalMediaEnabled:", objc_msgSend(*(id *)(a1 + 32), "personalAudioWasEnabled"));

  uint64_t v6 = +[PASettings sharedInstance];
  objc_msgSend(v6, "setPersonalAudioAccommodationTypes:", objc_msgSend(*(id *)(a1 + 32), "currentPersonalAudioAccommodationTypes"));

  NSRange v7 = *(void **)(a1 + 32);

  return [v7 dismissViewControllerAnimated:1 completion:&stru_3CC70];
}

void sub_16C40(id a1, PAStimulus *a2, unint64_t a3, BOOL *a4)
{
}

void sub_16E04(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [*(id *)(a1 + 32) stimuli];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_16EF4;
  v10[3] = &unk_3CCE0;
  id v5 = v3;
  id v11 = v5;
  id v6 = [v4 indexOfObjectPassingTest:v10];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL
    || (NSRange v7 = *(void **)(a1 + 32)) == 0
    || ([v7 stimuli],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 count],
        v8,
        !v9))
  {
    [v5 stop];
  }
}

id sub_16EF4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqual:a2];
}

id sub_1765C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateHeadphoneState];
}

id sub_17F24(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&stru_3CD48];
}

void sub_17F34(id a1, PAStimulus *a2, unint64_t a3, BOOL *a4)
{
}

uint64_t sub_1A740(uint64_t a1)
{
  return AXPerformBlockOnMainThread();
}

void sub_1A7C8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (void *)v1[17];
  id v3 = [v1 valueString];
  [v2 setText:v3];
}

void sub_1C34C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C36C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C37C(uint64_t a1)
{
}

void sub_1C384(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isSelected] && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_1C408(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isSelected] && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_1C48C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isSelected] && objc_msgSend(v7, "isStream"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_1CDAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_1CDDC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  [*(id *)(a1 + 32) setText:a2];
  id result = objc_msgSend(*(id *)(a1 + 32), "sizeThatFits:", 1.79769313e308, UITableViewAutomaticDimension);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  if (v7 >= *(double *)(a1 + 56))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void sub_1E014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E038(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    CSInitializeLogging();
    double v7 = +[NSString stringWithFormat:@"Download progress %@", v6];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HearingSettingsAssetCell initWithStyle:reuseIdentifier:specifier:]_block_invoke", 293, v7);
    uint64_t v9 = (void *)CSEngineeringLog;
    if (os_log_type_enabled(CSEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v8;
      id v11 = v9;
      *(_DWORD *)buf = 136446210;
      id v17 = [v10 UTF8String];
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id v12 = v6;
    id v13 = *(id *)(a1 + 32);
    objc_copyWeak(&v15, (id *)(a1 + 40));
    id v14 = v5;
    AXPerformBlockOnMainThread();

    objc_destroyWeak(&v15);
  }
}

void sub_1E228(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E244(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) asset];
  long long v4 = [v3 assetId];
  id v5 = [v2 objectForKey:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CSInitializeLogging();
    id v21 = +[NSString stringWithFormat:@"Progress not a number %@", v5];
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HearingSettingsAssetCell initWithStyle:reuseIdentifier:specifier:]_block_invoke", 330, v21);
    v23 = (void *)CSEngineeringLog;
    if (os_log_type_enabled(CSEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = v22;
      v25 = v23;
      *(_DWORD *)buf = 136446210;
      id v44 = [v24 UTF8String];
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
LABEL_9:

    goto LABEL_10;
  }
  [v5 floatValue];
  if (v6 != 1.0)
  {
    [v5 floatValue];
    if (v26 <= 0.0) {
      goto LABEL_10;
    }
    v27 = (id *)(a1 + 56);
    id WeakRetained = objc_loadWeakRetained(v27);
    v29 = [WeakRetained downloadSize];
    v30 = hearingLocString();
    [v5 floatValue];
    v31 = AXFormatFloatWithPercentage();
    v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, v31);
    [v29 setText:v32];

    id v33 = objc_loadWeakRetained(v27);
    v34 = [v33 downloadSize];
    [v34 setHidden:0];

    id v35 = objc_loadWeakRetained(v27);
    v36 = [v35 spinner];
    LODWORD(v32) = [v36 isHidden];

    if (v32)
    {
      id v37 = objc_loadWeakRetained(v27);
      v38 = [v37 spinner];
      [v38 setHidden:0];

      id v39 = objc_loadWeakRetained(v27);
      v40 = [v39 spinner];
      [v40 startAnimating];
    }
    id v21 = objc_loadWeakRetained(v27);
    [v21 configureConstraints];
    goto LABEL_9;
  }
  double v7 = (id *)(a1 + 56);
  id v8 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v9 = [v8 spinner];
  [v9 setHidden:1];

  id v10 = objc_loadWeakRetained((id *)(a1 + 56));
  id v11 = [v10 spinner];
  [v11 stopAnimating];

  id v12 = objc_loadWeakRetained((id *)(a1 + 56));
  id v13 = [v12 downloadSize];
  [v13 setText:&stru_3D6D8];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1E694;
  v41[3] = &unk_3CDC0;
  id v14 = *(void **)(a1 + 48);
  id v42 = *(id *)(a1 + 40);
  id v15 = [v14 indexOfObjectPassingTest:v41];
  if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = [*(id *)(a1 + 48) objectAtIndex:v15];
    id v17 = +[HUComfortSound comfortSoundWithAsset:v16];

    id v18 = objc_loadWeakRetained(v7);
    uint64_t v19 = [v18 specifier];
    [v19 setUserInfo:v17];

    id v20 = objc_loadWeakRetained(v7);
    [v20 updateInfoLabelText];
  }
LABEL_10:
}

id sub_1E694(uint64_t a1, void *a2)
{
  id v3 = [a2 assetId];
  long long v4 = [*(id *)(a1 + 32) asset];
  id v5 = [v4 assetId];
  id v6 = [v3 isEqualToString:v5];

  return v6;
}

void sub_1EC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_1F900(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_469E8)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_1FA40;
    void v5[4] = &unk_3C9D0;
    v5[5] = v5;
    long long v6 = off_3CE30;
    uint64_t v7 = 0;
    qword_469E8 = _sl_dlopen();
    id v3 = (void *)v5[0];
    id v2 = (void *)qword_469E8;
    if (qword_469E8)
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
  id v2 = (void *)qword_469E8;
LABEL_5:
  id result = dlsym(v2, "CPFSSizeStrings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_469E0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1FA40()
{
  uint64_t result = _sl_dlopen();
  qword_469E8 = result;
  return result;
}

id sub_20080(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateHeadphoneState];
}

void sub_200F4(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    long long v4 = +[HUUtilities sharedUtilities];
    unsigned int v5 = [v4 wirelessSplitterEnabled] ^ 1;
  }
  else
  {
    unsigned int v5 = 0;
  }
  int v6 = paHeadphoneRouteAvailable();
  PAInitializeLogging();
  uint64_t v7 = +[HUUtilities sharedUtilities];
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Updating headphones %d, %d, %d", a2, [v7 wirelessSplitterEnabled], paHeadphoneRouteAvailable());

  uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[PersonalAudioStimuliViewController updateHeadphoneState]_block_invoke", 172, v8);
  id v10 = (void *)PAEngineeringLog;
  if (os_log_type_enabled(PAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    id v12 = v10;
    *(_DWORD *)buf = 136446210;
    id v15 = [v11 UTF8String];
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v13 + 8) != v5 || *(unsigned __int8 *)(v13 + 9) != v6)
  {
    *(unsigned char *)(v13 + 8) = v5;
    *(unsigned char *)(*(void *)(a1 + 32) + 9) = v6;
    AXPerformBlockOnMainThread();
  }
}

id sub_20320(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateViewForCurrentNode];
}

id sub_20424(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateViewForCurrentNode];
}

void sub_204D4(uint64_t a1)
{
  float v13 = 0.0;
  id v2 = +[AVSystemController sharedAVSystemController];
  [v2 getActiveCategoryVolume:&v13 andName:0];

  if (fabs(v13 + -0.5) >= 0.001)
  {
    PAInitializeLogging();
    id v3 = +[NSString stringWithFormat:@"Changing volume from %lf to %lf", v13, 0x3FE0000000000000];
    long long v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[PersonalAudioStimuliViewController volumeDidChanged:]_block_invoke", 208, v3);
    unsigned int v5 = (void *)PAEngineeringLog;
    if (os_log_type_enabled(PAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v4;
      uint64_t v7 = v5;
      id v8 = [v6 UTF8String];
      *(_DWORD *)buf = 136446210;
      id v15 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v9 = +[AVSystemController sharedAVSystemController];
    LODWORD(v10) = 0.5;
    [v9 setActiveCategoryVolumeTo:v10];

    id v11 = *(void **)(a1 + 32);
    id v12 = paLocString();
    [v11 updateButtonTrayCaption:v12];
  }
}

void sub_20DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2192C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21964(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21974(uint64_t a1)
{
}

void sub_2197C(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6 = [a2 configuration];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

id sub_219D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutButtonTray];
}

void sub_219E0(id a1, PAStimulus *a2, unint64_t a3, BOOL *a4)
{
  [(PAStimulus *)a2 stop];

  UIAccessibilityPostNotification(0x42Fu, &__kCFBooleanFalse);
}

void sub_21AF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21B1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 play];
  UIAccessibilityPostNotification(0x42Fu, &__kCFBooleanTrue);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_21BEC;
  v4[3] = &unk_3CE98;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  [v3 registerListener:v4 forBucketCount:30];
  objc_destroyWeak(&v5);
}

void sub_21BD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21BEC(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  long long v4 = [WeakRetained visualizerView];
  [v4 updateWithMagnitudes:v3];
}

void sub_21F2C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 selectedNode];
  objc_msgSend(v3, "setSelected:", objc_msgSend(v3, "isEqual:", v4));
}

void sub_2215C(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) selectedNode];
  id v4 = [v3 stimuli];
  id v5 = [v4 indexOfObject:v6];

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [v6 stop];
    UIAccessibilityPostNotification(0x42Fu, &__kCFBooleanFalse);
  }
}

Class sub_224FC(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_46A18)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_22640;
    v3[4] = &unk_3C9D0;
    void v3[5] = v3;
    long long v4 = off_3CF08;
    uint64_t v5 = 0;
    qword_46A18 = _sl_dlopen();
    if (!qword_46A18)
    {
      abort_report_np();
LABEL_8:
      sub_283F8();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("MPVolumeSlider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_46A10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_22640()
{
  uint64_t result = _sl_dlopen();
  qword_46A18 = result;
  return result;
}

void sub_22BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22BDC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22BEC(uint64_t a1)
{
}

void sub_22BF4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 userInfo];
  if (([v3 leftAvailable] & 1) != 0
    || ([v3 rightAvailable] & 1) != 0)
  {
    long long v4 = [v5 propertyForKey:PSTableCellKey];
    objc_msgSend(v4, "setChecked:", objc_msgSend(v3, "isPaired"));
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
  }
}

id sub_235F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) insertObject:a2 atIndex:a3 + 1];
}

id sub_2389C(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_23E3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_23E80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained availableDevices];
  [v1 enumerateObjectsUsingBlock:&stru_3CF90];
}

void sub_23EE0(id a1, id a2, unint64_t a3, BOOL *a4)
{
  objc_msgSend(a2, "propertyForKey:", PSTableCellKey, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 updateAvailability];
}

void sub_23F30(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  AXPerformBlockAsynchronouslyOnMainThread();

  objc_destroyWeak(&v5);
}

void sub_23FE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23FF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleAvailableDevicesChanged:*(void *)(a1 + 32)];
}

void sub_24048(uint64_t a1, void *a2)
{
  id v3 = a2;
  HAInitializeLogging();
  id v4 = +[NSString stringWithFormat:@"Received control message %@", v3];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HearingAidController refreshAvailableDevices]_block_invoke_5", 461, v4);
  id v6 = (void *)HAEngineeringLog;
  if (os_log_type_enabled(HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    id v8 = v6;
    *(_DWORD *)buf = 136446210;
    id v12 = [v7 UTF8String];
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_24204;
  v9[3] = &unk_3D020;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  [v3 enumerateKeysAndObjectsUsingBlock:v9];
  objc_destroyWeak(&v10);
}

void sub_241E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_24204(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v5 isEqualToString:AXHAMessageKeyPayload]
    && [v6 unsignedLongLongValue] == (char *)&dword_0 + 1)
  {
    objc_copyWeak(&v7, (id *)(a1 + 32));
    AXPerformBlockOnMainThread();
    objc_destroyWeak(&v7);
  }
}

void sub_242F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2430C(uint64_t a1)
{
  uint64_t v2 = hearingSettingsLocString(@"HearingAidRemovedPairingTitle", @"HearingAidSettings");
  id v3 = hearingSettingsLocString(@"HearingAidRemovedPairingMessage", @"HearingAidSettings");
  id v9 = +[UIAlertController alertControllerWithTitle:v2 message:v3 preferredStyle:1];

  id v4 = hearingSettingsLocString(@"HearingAidCancel", @"HearingAidSettings");
  id v5 = +[UIAlertAction actionWithTitle:v4 style:0 handler:&stru_3CFD8];
  [v9 addAction:v5];

  id v6 = hearingSettingsLocString(@"HearingAlertButtonTitle", @"HearingAidSettings");
  id v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:&stru_3CFF8];
  [v9 addAction:v7];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentViewController:v9 animated:1 completion:0];
}

void sub_24480(id a1, UIAlertAction *a2)
{
  HAInitializeLogging();
  uint64_t v2 = +[NSString stringWithFormat:@"User decided not to repair pairing"];
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HearingAidController refreshAvailableDevices]_block_invoke_3", 468, v2);
  id v4 = (void *)HAEngineeringLog;
  if (os_log_type_enabled(HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    id v6 = v4;
    *(_DWORD *)buf = 136446210;
    id v8 = [v5 UTF8String];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

void sub_2459C(id a1, UIAlertAction *a2)
{
  HAInitializeLogging();
  uint64_t v2 = +[NSString stringWithFormat:@"Removing pairing"];
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HearingAidController refreshAvailableDevices]_block_invoke", 472, v2);
  id v4 = (void *)HAEngineeringLog;
  if (os_log_type_enabled(HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    id v6 = v4;
    *(_DWORD *)buf = 136446210;
    id v10 = [v5 UTF8String];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v7 = +[HUHearingAidSettings sharedInstance];
  [v7 setClearPartialPairing:1];

  id v8 = +[HUHearingAidSettings sharedInstance];
  [v8 setPairedHearingAids:0];
}

void sub_24A10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) availableDevices];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  float v13 = sub_24BC8;
  id v14 = &unk_3D048;
  id v15 = v3;
  id v5 = v3;
  id v6 = [v4 indexOfObjectPassingTest:&v11];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [v5 name];
    id v8 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, *(void *)(a1 + 32), 0, "valueForSpecifier:", objc_opt_class(), 4, 0, v11, v12, v13, v14, v15);

    [v8 setUserInfo:v5];
    [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) availableDevices];
    id v8 = [v9 objectAtIndex:v6];

    id v10 = [v8 propertyForKey:PSTableCellKey];
    [v10 updateAvailability];
  }
  [*(id *)(a1 + 40) addObject:v8];
}

id sub_24BC8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 userInfo];
  id v4 = [v3 deviceUUID];
  id v5 = [v2 containsPeripheralWithUUID:v4];

  return v5;
}

void sub_24F30(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 216) dismissViewControllerAnimated:1 completion:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 216);
  *(void *)(v2 + 216) = 0;
}

void sub_25294(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) specifier];
  unsigned __int8 v4 = [v7 isEqual:v3];

  if ((v4 & 1) == 0)
  {
    id v5 = [v7 propertyForKey:PSTableCellKey];
    [v5 setChecked:0];

    id v6 = [v7 userInfo];
    [v6 disconnectAndUnpair:0];
  }
}

void sub_25D50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25D74(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v3 = a2;
  [WeakRetained audioLevelDidChange:v3];
}

id sub_25E34(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMeterLevel:(int)(float)(*(float *)(a1 + 40) * 5.0)];
}

void sub_25EE4(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = (void *)UIApp;
  id v8 = a2;
  id v6 = [v5 userInterfaceLayoutDirection];
  unint64_t v7 = 5 - a3;
  if (!v6) {
    unint64_t v7 = a3;
  }
  [v8 setHighlighted:v7 < *(int *)(a1 + 32)];
}

void sub_260E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CGFloat sub_260FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  objc_msgSend(v3, "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  CGFloat Width = CGRectGetWidth(v15);
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  CGFloat result = Width + 11.0 + *(double *)(v13 + 32);
  *(CGFloat *)(v13 + 32) = result;
  return result;
}

id HearingSettingsBundle()
{
  v0 = (void *)qword_46A20;
  if (!qword_46A20)
  {
    uint64_t v1 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v2 = (void *)qword_46A20;
    qword_46A20 = v1;

    v0 = (void *)qword_46A20;
  }

  return v0;
}

id hearingSettingsLocString(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  CGFloat v5 = HearingSettingsBundle();
  double v6 = [v5 localizedStringForKey:v4 value:v4 table:v3];

  return v6;
}

void sub_27510(uint64_t a1)
{
  unint64_t v2 = (unint64_t)[*(id *)(a1 + 32) numberOfPips];
  [*(id *)(a1 + 32) bounds];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  double v7 = CGRectGetWidth(v20) / (double)(2 * v2 - 1);
  if (v7 <= 50.0) {
    double v8 = v7;
  }
  else {
    double v8 = 50.0;
  }
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat v9 = (CGRectGetWidth(v21) - v8 * (double)v2 - v8 * (double)(v2 - 1)) * 0.5;
  id v10 = [*(id *)(a1 + 40) count];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_27664;
  v12[3] = &unk_3D150;
  CGFloat v11 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v14 = v10;
  id v13 = v11;
  uint64_t v15 = 0x405E000000000000;
  CGFloat v16 = v9;
  double v17 = v8;
  double v18 = v8;
  uint64_t v19 = 0x4052C00000000000;
  +[UIView _animateWithFrictionBounceAnimations:v12 completion:0];
}

void sub_27664(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) levels];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_27720;
  v5[3] = &unk_3D128;
  id v3 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v6 = v3;
  long long v4 = *(_OWORD *)(a1 + 72);
  long long v8 = *(_OWORD *)(a1 + 56);
  long long v9 = v4;
  uint64_t v10 = *(void *)(a1 + 88);
  [v2 enumerateObjectsUsingBlock:v5];
}

void sub_27720(uint64_t a1, void *a2, unint64_t a3)
{
  id v11 = a2;
  if (*(void *)(a1 + 40) <= a3)
  {
    CGFloat v5 = &off_3FF90;
  }
  else
  {
    CGFloat v5 = [*(id *)(a1 + 32) objectAtIndex:a3];
  }
  double v6 = *(double *)(a1 + 48);
  [v5 floatValue];
  double v8 = v6 / 18.0 + v6 * v7;
  if (v6 >= v8) {
    double v9 = v8;
  }
  else {
    double v9 = v6;
  }
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 56) + (double)a3 * *(double *)(a1 + 64) + (double)a3 * *(double *)(a1 + 72), *(double *)(a1 + 80) + v9 * -0.5, *(double *)(a1 + 64), v9, fmax(*(double *)(a1 + 64), 1.5));
  id v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPath:", objc_msgSend(v10, "CGPath"));
}

void sub_281E8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:v3 set:0 get:0 detail:0 cell:4 edit:0];
  [v5 setProperty:v4 forKey:@"controller"];

  [*(id *)(a1 + 40) addObject:v5];
}

void sub_283AC()
{
  uint64_t v0 = abort_report_np();
  sub_283D4(v0);
}

void sub_283D4()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  sub_283F8(v0);
}

void sub_283F8()
{
}

uint64_t AXFormatFloatWithPercentage()
{
  return _AXFormatFloatWithPercentage();
}

uint64_t AXFormatNumberWithOptions()
{
  return _AXFormatNumberWithOptions();
}

uint64_t AXHACHearingAidComplianceEnabled()
{
  return _AXHACHearingAidComplianceEnabled();
}

uint64_t AXHACHearingAidComplianceSetEnabled()
{
  return _AXHACHearingAidComplianceSetEnabled();
}

uint64_t AXLogUltron()
{
  return _AXLogUltron();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXPerformBlockOnMainThread()
{
  return _AXPerformBlockOnMainThread();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return _AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t AXPerformSafeBlock()
{
  return _AXPerformSafeBlock();
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

void CFRelease(CFTypeRef cf)
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

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CSInitializeLogging()
{
  return _CSInitializeLogging();
}

uint64_t HAInitializeLogging()
{
  return _HAInitializeLogging();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSUnionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

uint64_t PAInitializeLogging()
{
  return _PAInitializeLogging();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
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

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t _AXSAutomationEnabled()
{
  return __AXSAutomationEnabled();
}

uint64_t _AXSEarpieceNoiseCancellationEnabled()
{
  return __AXSEarpieceNoiseCancellationEnabled();
}

uint64_t _AXSEarpieceNoiseCancellationSetEnabled()
{
  return __AXSEarpieceNoiseCancellationSetEnabled();
}

uint64_t _AXSHearingAidRingtoneStreamingEnabled()
{
  return __AXSHearingAidRingtoneStreamingEnabled();
}

uint64_t _AXSHearingAidRingtoneStreamingSetEnabled()
{
  return __AXSHearingAidRingtoneStreamingSetEnabled();
}

uint64_t _AXSTripleClickContainsOption()
{
  return __AXSTripleClickContainsOption();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return __AXSTripleClickCopyOptions();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __AXStringForVariables()
{
  return ___AXStringForVariables();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint64_t accessibilityHearingAidImageNamed()
{
  return _accessibilityHearingAidImageNamed();
}

uint64_t accessibilityHearingAidSupportBundle()
{
  return _accessibilityHearingAidSupportBundle();
}

uint64_t compoundAttributeByAddingAttribute()
{
  return _compoundAttributeByAddingAttribute();
}

uint64_t compoundAttributeByRemovingAttribute()
{
  return _compoundAttributeByRemovingAttribute();
}

uint64_t compoundAttributeContainsAttribute()
{
  return _compoundAttributeContainsAttribute();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

uint64_t hearingAidStreamAvailableAsync()
{
  return _hearingAidStreamAvailableAsync();
}

uint64_t hearingLocString()
{
  return _hearingLocString();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

uint64_t paAnyRouteSupportsAudioAccommodations()
{
  return _paAnyRouteSupportsAudioAccommodations();
}

uint64_t paAvailableBluetoothDevicesSupportingTransparencyAccommodations()
{
  return _paAvailableBluetoothDevicesSupportingTransparencyAccommodations();
}

uint64_t paCurrentBluetoothDeviceSupportingANCAndHeadphoneAccommodations()
{
  return _paCurrentBluetoothDeviceSupportingANCAndHeadphoneAccommodations();
}

uint64_t paCurrentBluetoothDeviceSupportingTransparencyAccommodations()
{
  return _paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
}

uint64_t paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync()
{
  return _paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync();
}

uint64_t paCurrentRouteSupportsAudioAccommodationsAsync()
{
  return _paCurrentRouteSupportsAudioAccommodationsAsync();
}

uint64_t paDescriptionForLevel()
{
  return _paDescriptionForLevel();
}

uint64_t paDescriptionForShape()
{
  return _paDescriptionForShape();
}

uint64_t paHeadphoneRouteAvailable()
{
  return _paHeadphoneRouteAvailable();
}

uint64_t paLocString()
{
  return _paLocString();
}

uint64_t paPairedDeviceSupportsTransparencyAccommodations()
{
  return _paPairedDeviceSupportsTransparencyAccommodations();
}

uint64_t supportsBinauralStreamingForHearingAid()
{
  return _supportsBinauralStreamingForHearingAid();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__combinedProgramSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _combinedProgramSpecifiers];
}

id objc_msgSend__labelColor(void *a1, const char *a2, ...)
{
  return [a1 _labelColor];
}

id objc_msgSend__leftProgramSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _leftProgramSpecifiers];
}

id objc_msgSend__programSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _programSpecifiers];
}

id objc_msgSend__reloadProgramSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _reloadProgramSpecifiers];
}

id objc_msgSend__rightProgramSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _rightProgramSpecifiers];
}

id objc_msgSend__setupListeners(void *a1, const char *a2, ...)
{
  return [a1 _setupListeners];
}

id objc_msgSend__shouldReverseLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 _shouldReverseLayoutDirection];
}

id objc_msgSend__startPlayingStimuli(void *a1, const char *a2, ...)
{
  return [a1 _startPlayingStimuli];
}

id objc_msgSend__volumeSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _volumeSpecifiers];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_accessibilityTraits(void *a1, const char *a2, ...)
{
  return [a1 accessibilityTraits];
}

id objc_msgSend_accessibilityValue(void *a1, const char *a2, ...)
{
  return [a1 accessibilityValue];
}

id objc_msgSend_addAudiogramTapped(void *a1, const char *a2, ...)
{
  return [a1 addAudiogramTapped];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return [a1 assetId];
}

id objc_msgSend_audiogramConfiguration(void *a1, const char *a2, ...)
{
  return [a1 audiogramConfiguration];
}

id objc_msgSend_audiograms(void *a1, const char *a2, ...)
{
  return [a1 audiograms];
}

id objc_msgSend_availabilityLabel(void *a1, const char *a2, ...)
{
  return [a1 availabilityLabel];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_availableAssets(void *a1, const char *a2, ...)
{
  return [a1 availableAssets];
}

id objc_msgSend_availableControllers(void *a1, const char *a2, ...)
{
  return [a1 availableControllers];
}

id objc_msgSend_availableDevices(void *a1, const char *a2, ...)
{
  return [a1 availableDevices];
}

id objc_msgSend_availableEars(void *a1, const char *a2, ...)
{
  return [a1 availableEars];
}

id objc_msgSend_beginSearching(void *a1, const char *a2, ...)
{
  return [a1 beginSearching];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return [a1 boldButton];
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

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return [a1 buttonTray];
}

id objc_msgSend_callAudioRoute(void *a1, const char *a2, ...)
{
  return [a1 callAudioRoute];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_combinedPrograms(void *a1, const char *a2, ...)
{
  return [a1 combinedPrograms];
}

id objc_msgSend_comfortSoundsEnabled(void *a1, const char *a2, ...)
{
  return [a1 comfortSoundsEnabled];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationCameFromEnrollment(void *a1, const char *a2, ...)
{
  return [a1 configurationCameFromEnrollment];
}

id objc_msgSend_configurationCameFromUser(void *a1, const char *a2, ...)
{
  return [a1 configurationCameFromUser];
}

id objc_msgSend_configureBarButton(void *a1, const char *a2, ...)
{
  return [a1 configureBarButton];
}

id objc_msgSend_configureConstraints(void *a1, const char *a2, ...)
{
  return [a1 configureConstraints];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_connectedDeviceName(void *a1, const char *a2, ...)
{
  return [a1 connectedDeviceName];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return [a1 constraints];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentEnrollmentProgress(void *a1, const char *a2, ...)
{
  return [a1 currentEnrollmentProgress];
}

id objc_msgSend_currentNode(void *a1, const char *a2, ...)
{
  return [a1 currentNode];
}

id objc_msgSend_currentPersonalAudioAccommodationTypes(void *a1, const char *a2, ...)
{
  return [a1 currentPersonalAudioAccommodationTypes];
}

id objc_msgSend_currentPersonalAudioConfiguration(void *a1, const char *a2, ...)
{
  return [a1 currentPersonalAudioConfiguration];
}

id objc_msgSend_currentRouteSupportsAudioAccomodations(void *a1, const char *a2, ...)
{
  return [a1 currentRouteSupportsAudioAccomodations];
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

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_denylistEnabled(void *a1, const char *a2, ...)
{
  return [a1 denylistEnabled];
}

id objc_msgSend_detailString(void *a1, const char *a2, ...)
{
  return [a1 detailString];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceHasHomeButton(void *a1, const char *a2, ...)
{
  return [a1 deviceHasHomeButton];
}

id objc_msgSend_deviceIsBigPhone(void *a1, const char *a2, ...)
{
  return [a1 deviceIsBigPhone];
}

id objc_msgSend_deviceIsPad(void *a1, const char *a2, ...)
{
  return [a1 deviceIsPad];
}

id objc_msgSend_deviceIsPhone(void *a1, const char *a2, ...)
{
  return [a1 deviceIsPhone];
}

id objc_msgSend_deviceIsPod(void *a1, const char *a2, ...)
{
  return [a1 deviceIsPod];
}

id objc_msgSend_deviceIsSmallPhone(void *a1, const char *a2, ...)
{
  return [a1 deviceIsSmallPhone];
}

id objc_msgSend_deviceSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 deviceSpecifiers];
}

id objc_msgSend_deviceUUID(void *a1, const char *a2, ...)
{
  return [a1 deviceUUID];
}

id objc_msgSend_deviceUpdateLock(void *a1, const char *a2, ...)
{
  return [a1 deviceUpdateLock];
}

id objc_msgSend_didLoadRequiredProperties(void *a1, const char *a2, ...)
{
  return [a1 didLoadRequiredProperties];
}

id objc_msgSend_disconnectedSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 disconnectedSpecifiers];
}

id objc_msgSend_dotImageViews(void *a1, const char *a2, ...)
{
  return [a1 dotImageViews];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadSize(void *a1, const char *a2, ...)
{
  return [a1 downloadSize];
}

id objc_msgSend_ear(void *a1, const char *a2, ...)
{
  return [a1 ear];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_enrollment(void *a1, const char *a2, ...)
{
  return [a1 enrollment];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hasActiveOrPendingCallOrFaceTime(void *a1, const char *a2, ...)
{
  return [a1 hasActiveOrPendingCallOrFaceTime];
}

id objc_msgSend_hasConnected(void *a1, const char *a2, ...)
{
  return [a1 hasConnected];
}

id objc_msgSend_hasEnded(void *a1, const char *a2, ...)
{
  return [a1 hasEnded];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return [a1 headerView];
}

id objc_msgSend_heading(void *a1, const char *a2, ...)
{
  return [a1 heading];
}

id objc_msgSend_hearingAidReachable(void *a1, const char *a2, ...)
{
  return [a1 hearingAidReachable];
}

id objc_msgSend_hearingAssistEnabled(void *a1, const char *a2, ...)
{
  return [a1 hearingAssistEnabled];
}

id objc_msgSend_hysteresisTimer(void *a1, const char *a2, ...)
{
  return [a1 hysteresisTimer];
}

id objc_msgSend_imageFlippedForRightToLeftLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 imageFlippedForRightToLeftLayoutDirection];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_imageWithHorizontallyFlippedOrientation(void *a1, const char *a2, ...)
{
  return [a1 imageWithHorizontallyFlippedOrientation];
}

id objc_msgSend_independentHearingAidSettings(void *a1, const char *a2, ...)
{
  return [a1 independentHearingAidSettings];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_instructions(void *a1, const char *a2, ...)
{
  return [a1 instructions];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isBluetoothPaired(void *a1, const char *a2, ...)
{
  return [a1 isBluetoothPaired];
}

id objc_msgSend_isChecked(void *a1, const char *a2, ...)
{
  return [a1 isChecked];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isContinuitySessionActive(void *a1, const char *a2, ...)
{
  return [a1 isContinuitySessionActive];
}

id objc_msgSend_isDownloading(void *a1, const char *a2, ...)
{
  return [a1 isDownloading];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isLeftConnected(void *a1, const char *a2, ...)
{
  return [a1 isLeftConnected];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return [a1 isPaired];
}

id objc_msgSend_isPairedWithFakeHearingAids(void *a1, const char *a2, ...)
{
  return [a1 isPairedWithFakeHearingAids];
}

id objc_msgSend_isPlaying(void *a1, const char *a2, ...)
{
  return [a1 isPlaying];
}

id objc_msgSend_isRightConnected(void *a1, const char *a2, ...)
{
  return [a1 isRightConnected];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_isStream(void *a1, const char *a2, ...)
{
  return [a1 isStream];
}

id objc_msgSend_isStreamOrMixingStream(void *a1, const char *a2, ...)
{
  return [a1 isStreamOrMixingStream];
}

id objc_msgSend_isiCloudPaired(void *a1, const char *a2, ...)
{
  return [a1 isiCloudPaired];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leftAvailable(void *a1, const char *a2, ...)
{
  return [a1 leftAvailable];
}

id objc_msgSend_leftBass(void *a1, const char *a2, ...)
{
  return [a1 leftBass];
}

id objc_msgSend_leftBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 leftBatteryLevel];
}

id objc_msgSend_leftFirmwareVersion(void *a1, const char *a2, ...)
{
  return [a1 leftFirmwareVersion];
}

id objc_msgSend_leftHardwareVersion(void *a1, const char *a2, ...)
{
  return [a1 leftHardwareVersion];
}

id objc_msgSend_leftMicrophoneVolume(void *a1, const char *a2, ...)
{
  return [a1 leftMicrophoneVolume];
}

id objc_msgSend_leftMicrophoneVolumeSteps(void *a1, const char *a2, ...)
{
  return [a1 leftMicrophoneVolumeSteps];
}

id objc_msgSend_leftMixedVolume(void *a1, const char *a2, ...)
{
  return [a1 leftMixedVolume];
}

id objc_msgSend_leftMixedVolumeSteps(void *a1, const char *a2, ...)
{
  return [a1 leftMixedVolumeSteps];
}

id objc_msgSend_leftNode(void *a1, const char *a2, ...)
{
  return [a1 leftNode];
}

id objc_msgSend_leftPrograms(void *a1, const char *a2, ...)
{
  return [a1 leftPrograms];
}

id objc_msgSend_leftSelectedProgram(void *a1, const char *a2, ...)
{
  return [a1 leftSelectedProgram];
}

id objc_msgSend_leftSelectedStreamingProgram(void *a1, const char *a2, ...)
{
  return [a1 leftSelectedStreamingProgram];
}

id objc_msgSend_leftSensitivity(void *a1, const char *a2, ...)
{
  return [a1 leftSensitivity];
}

id objc_msgSend_leftSensitivitySteps(void *a1, const char *a2, ...)
{
  return [a1 leftSensitivitySteps];
}

id objc_msgSend_leftStreamVolume(void *a1, const char *a2, ...)
{
  return [a1 leftStreamVolume];
}

id objc_msgSend_leftStreamVolumeSteps(void *a1, const char *a2, ...)
{
  return [a1 leftStreamVolumeSteps];
}

id objc_msgSend_leftTreble(void *a1, const char *a2, ...)
{
  return [a1 leftTreble];
}

id objc_msgSend_leftUUID(void *a1, const char *a2, ...)
{
  return [a1 leftUUID];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return [a1 level];
}

id objc_msgSend_levels(void *a1, const char *a2, ...)
{
  return [a1 levels];
}

id objc_msgSend_lineBreakMode(void *a1, const char *a2, ...)
{
  return [a1 lineBreakMode];
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return [a1 linkButton];
}

id objc_msgSend_listeningMode(void *a1, const char *a2, ...)
{
  return [a1 listeningMode];
}

id objc_msgSend_loadRequiredProperties(void *a1, const char *a2, ...)
{
  return [a1 loadRequiredProperties];
}

id objc_msgSend_loadView(void *a1, const char *a2, ...)
{
  return [a1 loadView];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return [a1 manufacturer];
}

id objc_msgSend_mediaAudioRoute(void *a1, const char *a2, ...)
{
  return [a1 mediaAudioRoute];
}

id objc_msgSend_mediaVolume(void *a1, const char *a2, ...)
{
  return [a1 mediaVolume];
}

id objc_msgSend_mixesWithMedia(void *a1, const char *a2, ...)
{
  return [a1 mixesWithMedia];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_multideviceAudioEnabled(void *a1, const char *a2, ...)
{
  return [a1 multideviceAudioEnabled];
}

id objc_msgSend_multideviceSettingsEnabled(void *a1, const char *a2, ...)
{
  return [a1 multideviceSettingsEnabled];
}

id objc_msgSend_musicStimulus(void *a1, const char *a2, ...)
{
  return [a1 musicStimulus];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
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

id objc_msgSend_numberOfAudiograms(void *a1, const char *a2, ...)
{
  return [a1 numberOfAudiograms];
}

id objc_msgSend_numberOfLines(void *a1, const char *a2, ...)
{
  return [a1 numberOfLines];
}

id objc_msgSend_numberOfPips(void *a1, const char *a2, ...)
{
  return [a1 numberOfPips];
}

id objc_msgSend_numberOfSteps(void *a1, const char *a2, ...)
{
  return [a1 numberOfSteps];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_pairedHearingAids(void *a1, const char *a2, ...)
{
  return [a1 pairedHearingAids];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return [a1 parentController];
}

id objc_msgSend_pauseSoundRecognitionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 pauseSoundRecognitionIfNecessary];
}

id objc_msgSend_performGetter(void *a1, const char *a2, ...)
{
  return [a1 performGetter];
}

id objc_msgSend_personalAudioAccommodationTypes(void *a1, const char *a2, ...)
{
  return [a1 personalAudioAccommodationTypes];
}

id objc_msgSend_personalAudioWasEnabled(void *a1, const char *a2, ...)
{
  return [a1 personalAudioWasEnabled];
}

id objc_msgSend_personalMediaAutomationSkipHeadphoneRequirement(void *a1, const char *a2, ...)
{
  return [a1 personalMediaAutomationSkipHeadphoneRequirement];
}

id objc_msgSend_personalMediaConfiguration(void *a1, const char *a2, ...)
{
  return [a1 personalMediaConfiguration];
}

id objc_msgSend_personalMediaDebugMode(void *a1, const char *a2, ...)
{
  return [a1 personalMediaDebugMode];
}

id objc_msgSend_personalMediaEnabled(void *a1, const char *a2, ...)
{
  return [a1 personalMediaEnabled];
}

id objc_msgSend_personalSoundVisible(void *a1, const char *a2, ...)
{
  return [a1 personalSoundVisible];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_playingMedia(void *a1, const char *a2, ...)
{
  return [a1 playingMedia];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_powered(void *a1, const char *a2, ...)
{
  return [a1 powered];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return [a1 presentationController];
}

id objc_msgSend_previousNode(void *a1, const char *a2, ...)
{
  return [a1 previousNode];
}

id objc_msgSend_programs(void *a1, const char *a2, ...)
{
  return [a1 programs];
}

id objc_msgSend_programsRange(void *a1, const char *a2, ...)
{
  return [a1 programsRange];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_registerNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerNotifications];
}

id objc_msgSend_relativeVolume(void *a1, const char *a2, ...)
{
  return [a1 relativeVolume];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return [a1 reload];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_restartSoundRecognitionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 restartSoundRecognitionIfNecessary];
}

id objc_msgSend_rightAvailable(void *a1, const char *a2, ...)
{
  return [a1 rightAvailable];
}

id objc_msgSend_rightBass(void *a1, const char *a2, ...)
{
  return [a1 rightBass];
}

id objc_msgSend_rightBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 rightBatteryLevel];
}

id objc_msgSend_rightFirmwareVersion(void *a1, const char *a2, ...)
{
  return [a1 rightFirmwareVersion];
}

id objc_msgSend_rightHardwareVersion(void *a1, const char *a2, ...)
{
  return [a1 rightHardwareVersion];
}

id objc_msgSend_rightMicrophoneVolume(void *a1, const char *a2, ...)
{
  return [a1 rightMicrophoneVolume];
}

id objc_msgSend_rightMicrophoneVolumeSteps(void *a1, const char *a2, ...)
{
  return [a1 rightMicrophoneVolumeSteps];
}

id objc_msgSend_rightMixedVolume(void *a1, const char *a2, ...)
{
  return [a1 rightMixedVolume];
}

id objc_msgSend_rightMixedVolumeSteps(void *a1, const char *a2, ...)
{
  return [a1 rightMixedVolumeSteps];
}

id objc_msgSend_rightNode(void *a1, const char *a2, ...)
{
  return [a1 rightNode];
}

id objc_msgSend_rightPrograms(void *a1, const char *a2, ...)
{
  return [a1 rightPrograms];
}

id objc_msgSend_rightSelectedProgram(void *a1, const char *a2, ...)
{
  return [a1 rightSelectedProgram];
}

id objc_msgSend_rightSelectedStreamingProgram(void *a1, const char *a2, ...)
{
  return [a1 rightSelectedStreamingProgram];
}

id objc_msgSend_rightSensitivity(void *a1, const char *a2, ...)
{
  return [a1 rightSensitivity];
}

id objc_msgSend_rightSensitivitySteps(void *a1, const char *a2, ...)
{
  return [a1 rightSensitivitySteps];
}

id objc_msgSend_rightStreamVolume(void *a1, const char *a2, ...)
{
  return [a1 rightStreamVolume];
}

id objc_msgSend_rightStreamVolumeSteps(void *a1, const char *a2, ...)
{
  return [a1 rightStreamVolumeSteps];
}

id objc_msgSend_rightTreble(void *a1, const char *a2, ...)
{
  return [a1 rightTreble];
}

id objc_msgSend_rightUUID(void *a1, const char *a2, ...)
{
  return [a1 rightUUID];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_saveNewConfiguration(void *a1, const char *a2, ...)
{
  return [a1 saveNewConfiguration];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return [a1 scrollView];
}

id objc_msgSend_secondarySystemFillColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemFillColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_selectCommonProgramsForLeftAndRightDevices(void *a1, const char *a2, ...)
{
  return [a1 selectCommonProgramsForLeftAndRightDevices];
}

id objc_msgSend_selectedAudiogram(void *a1, const char *a2, ...)
{
  return [a1 selectedAudiogram];
}

id objc_msgSend_selectedComfortSound(void *a1, const char *a2, ...)
{
  return [a1 selectedComfortSound];
}

id objc_msgSend_selectedIndexPath(void *a1, const char *a2, ...)
{
  return [a1 selectedIndexPath];
}

id objc_msgSend_selectedNode(void *a1, const char *a2, ...)
{
  return [a1 selectedNode];
}

id objc_msgSend_selectedPrograms(void *a1, const char *a2, ...)
{
  return [a1 selectedPrograms];
}

id objc_msgSend_sendMessagesPriorityDefault(void *a1, const char *a2, ...)
{
  return [a1 sendMessagesPriorityDefault];
}

id objc_msgSend_sendMessagesPriorityHigh(void *a1, const char *a2, ...)
{
  return [a1 sendMessagesPriorityHigh];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_shape(void *a1, const char *a2, ...)
{
  return [a1 shape];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return [a1 sharedAVSystemController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedUtilities(void *a1, const char *a2, ...)
{
  return [a1 sharedUtilities];
}

id objc_msgSend_shouldShowCombinedStreamingVolume(void *a1, const char *a2, ...)
{
  return [a1 shouldShowCombinedStreamingVolume];
}

id objc_msgSend_shouldStreamSystemSounds(void *a1, const char *a2, ...)
{
  return [a1 shouldStreamSystemSounds];
}

id objc_msgSend_shouldStreamToLeftAid(void *a1, const char *a2, ...)
{
  return [a1 shouldStreamToLeftAid];
}

id objc_msgSend_shouldStreamToRightAid(void *a1, const char *a2, ...)
{
  return [a1 shouldStreamToRightAid];
}

id objc_msgSend_showCombinedPrograms(void *a1, const char *a2, ...)
{
  return [a1 showCombinedPrograms];
}

id objc_msgSend_showHeadphoneCheckConfirmationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 showHeadphoneCheckConfirmationIfNeeded];
}

id objc_msgSend_showOverview(void *a1, const char *a2, ...)
{
  return [a1 showOverview];
}

id objc_msgSend_sinStimulus(void *a1, const char *a2, ...)
{
  return [a1 sinStimulus];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_slider(void *a1, const char *a2, ...)
{
  return [a1 slider];
}

id objc_msgSend_sliderValue(void *a1, const char *a2, ...)
{
  return [a1 sliderValue];
}

id objc_msgSend_soundDetectionState(void *a1, const char *a2, ...)
{
  return [a1 soundDetectionState];
}

id objc_msgSend_soundGroup(void *a1, const char *a2, ...)
{
  return [a1 soundGroup];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return [a1 spinner];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startLiveListen(void *a1, const char *a2, ...)
{
  return [a1 startLiveListen];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stimuli(void *a1, const char *a2, ...)
{
  return [a1 stimuli];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_stopLiveListen(void *a1, const char *a2, ...)
{
  return [a1 stopLiveListen];
}

id objc_msgSend_stopPlayingSample(void *a1, const char *a2, ...)
{
  return [a1 stopPlayingSample];
}

id objc_msgSend_stopsOnLock(void *a1, const char *a2, ...)
{
  return [a1 stopsOnLock];
}

id objc_msgSend_supportsCombinedPresets(void *a1, const char *a2, ...)
{
  return [a1 supportsCombinedPresets];
}

id objc_msgSend_supportsCombinedVolumes(void *a1, const char *a2, ...)
{
  return [a1 supportsCombinedVolumes];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemLightGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemLightGrayColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_tableCellBlueTextColor(void *a1, const char *a2, ...)
{
  return [a1 tableCellBlueTextColor];
}

id objc_msgSend_tableCellGrayTextColor(void *a1, const char *a2, ...)
{
  return [a1 tableCellGrayTextColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tableViewHeightConstraint(void *a1, const char *a2, ...)
{
  return [a1 tableViewHeightConstraint];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transparencyDeviceAddress(void *a1, const char *a2, ...)
{
  return [a1 transparencyDeviceAddress];
}

id objc_msgSend_tuningDescription(void *a1, const char *a2, ...)
{
  return [a1 tuningDescription];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateAvailability(void *a1, const char *a2, ...)
{
  return [a1 updateAvailability];
}

id objc_msgSend_updateBluetoothAvailability(void *a1, const char *a2, ...)
{
  return [a1 updateBluetoothAvailability];
}

id objc_msgSend_updateDetails(void *a1, const char *a2, ...)
{
  return [a1 updateDetails];
}

id objc_msgSend_updateHeadphoneState(void *a1, const char *a2, ...)
{
  return [a1 updateHeadphoneState];
}

id objc_msgSend_updateHearingAssistStatus(void *a1, const char *a2, ...)
{
  return [a1 updateHearingAssistStatus];
}

id objc_msgSend_updateInfoLabelText(void *a1, const char *a2, ...)
{
  return [a1 updateInfoLabelText];
}

id objc_msgSend_updateLevelAndShape(void *a1, const char *a2, ...)
{
  return [a1 updateLevelAndShape];
}

id objc_msgSend_updateTableViewHeight(void *a1, const char *a2, ...)
{
  return [a1 updateTableViewHeight];
}

id objc_msgSend_updateTextColor(void *a1, const char *a2, ...)
{
  return [a1 updateTextColor];
}

id objc_msgSend_updateValue(void *a1, const char *a2, ...)
{
  return [a1 updateValue];
}

id objc_msgSend_updateViewForCurrentNode(void *a1, const char *a2, ...)
{
  return [a1 updateViewForCurrentNode];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirection];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueLabel(void *a1, const char *a2, ...)
{
  return [a1 valueLabel];
}

id objc_msgSend_valueLabels(void *a1, const char *a2, ...)
{
  return [a1 valueLabels];
}

id objc_msgSend_valueString(void *a1, const char *a2, ...)
{
  return [a1 valueString];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_visualizerView(void *a1, const char *a2, ...)
{
  return [a1 visualizerView];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_wirelessSplitterEnabled(void *a1, const char *a2, ...)
{
  return [a1 wirelessSplitterEnabled];
}

id objc_msgSend_yodelEnabledForAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "yodelEnabledForAddress:");
}