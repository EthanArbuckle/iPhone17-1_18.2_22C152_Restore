void sub_4524(uint64_t a1)
{
  long long v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  if (*(unsigned char *)(a1 + 40))
  {
    *(_OWORD *)&v5.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v5.c = v2;
    *(_OWORD *)&v5.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformScale(&v6, &v5, 0.96, 0.96);
  }
  else
  {
    *(_OWORD *)&v6.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v6.c = v2;
    *(_OWORD *)&v6.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  v3 = [*(id *)(a1 + 32) view];
  v4 = v6;
  [v3 setTransform:&v4];
}

void sub_4A5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  if (!a3
    && [*(id *)(a1 + 40) _updateCachedNetworkLimitIfNeeded:a2 outUpdatedValue:&v6])
  {
    id v4 = objc_retainBlock(*(id *)(a1 + 32));
    v5 = v4;
    if (v4) {
      (*((void (**)(id))v4 + 2))(v4);
    }
  }
}

void sub_57BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_57E0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v6;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  v10 = [v9 responseDictionary];
  v11 = [v10 objectForKeyedSubscript:@"devices"];
  if (![v11 count])
  {
    v12 = BKSettingsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_F488(v6, (uint64_t)v7, v12);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_594C;
  block[3] = &unk_18740;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  uint64_t v13 = *(void *)(a1 + 32);
  id v16 = v11;
  uint64_t v17 = v13;
  id v14 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v18);
}

void sub_594C(id *a1)
{
  objc_copyWeak(&to, a1 + 6);
  id v1 = objc_loadWeakRetained(&to);

  if (v1)
  {
    id v2 = objc_loadWeakRetained(&to);
    [v2 setIsLoadingDevices:0];

    v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a1[4] count]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v4 = a1[4];
    id v5 = [v4 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v37;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v37 != v6) {
            objc_enumerationMutation(v4);
          }
          v8 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v7);
          id v9 = BKSettingsLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v8;
            _os_log_debug_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, "_loadDevices: device: %@", buf, 0xCu);
          }

          if ((_isSupportedIOSDevice(v8) & 1) != 0 || _isSupportedOSXDevice(v8))
          {
            id v10 = objc_loadWeakRetained(&to);
            unsigned int v11 = [v10 _isOutdatedDevice:v8];

            if (v11) {
              [v3 addObject:v8];
            }
          }
          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v4 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v5);
    }

    v12 = BKSettingsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_F524(buf, (uint64_t)[a1[4] count], v12);
    }

    id v13 = objc_loadWeakRetained(&to);
    id v14 = [v13 deviceSpecifiers];

    v15 = [a1[5] _specifiersForDevices:v3 flagNonUpdatable:1];
    id v16 = objc_loadWeakRetained(&to);
    [v16 setDeviceSpecifiers:v15];

    uint64_t v17 = OBJC_IVAR___PSListController__specifiers;
    if (*(void *)((char *)a1[5] + OBJC_IVAR___PSListController__specifiers))
    {
      id v18 = objc_loadWeakRetained(&to);
      v19 = [v18 spinnerSpecifier];

      if (v19)
      {
        id v20 = objc_loadWeakRetained(&to);
        v21 = [v20 spinnerSpecifier];
        [v20 removeSpecifier:v21 animated:0];

        id v22 = objc_loadWeakRetained(&to);
        [v22 setSpinnerSpecifier:0];
      }
      id v23 = objc_loadWeakRetained(&to);
      v24 = [v23 viewIfLoaded];
      v25 = [v24 window];

      if ([v14 count]
        && (v26 = *(void **)((char *)a1[5] + v17),
            [v14 firstObject],
            v27 = objc_claimAutoreleasedReturnValue(),
            LOBYTE(v26) = [v26 indexOfObjectIdenticalTo:v27] == (id)0x7FFFFFFFFFFFFFFFLL,
            v27,
            (v26 & 1) == 0))
      {
        id v28 = objc_loadWeakRetained(&to);
        v29 = [v28 deviceSpecifiers];
        [v28 replaceContiguousSpecifiers:v14 withSpecifiers:v29 animated:v25 != 0];
      }
      else
      {
        id v28 = objc_loadWeakRetained(&to);
        v29 = [v28 deviceSpecifiers];
        id v30 = objc_loadWeakRetained(&to);
        v31 = [v30 groupSpecifier];
        [v28 insertContiguousSpecifiers:v29 afterSpecifier:v31 animated:v25 != 0];
      }
    }
    id v32 = objc_loadWeakRetained(&to);
    v33 = [v32 delegate];
    id v34 = objc_loadWeakRetained(&to);
    [v33 devicesControllerDidLoadDevices:v34];
  }
  objc_destroyWeak(&to);
}

void sub_5DDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

id _isSupportedIOSDevice(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKeyedSubscript:@"swVersion"];
  if ([v2 hasPrefix:@"iOS"])
  {
    v3 = [v1 objectForKeyedSubscript:@"model"];
    if (([v3 hasPrefix:@"iPhone"] & 1) != 0
      || ([v3 hasPrefix:@"iPad"] & 1) != 0)
    {
      id v4 = &dword_0 + 1;
    }
    else
    {
      id v4 = [v3 hasPrefix:@"iPod"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id _isSupportedOSXDevice(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"swVersion"];
  id v2 = [v1 hasPrefix:@"OSX"];

  return v2;
}

id _versionString(void *a1, const char *a2)
{
  return [a1 objectForKeyedSubscript:@"swVersion"];
}

id BKSettingsBundle()
{
  if (qword_1E660 != -1) {
    dispatch_once(&qword_1E660, &stru_187A8);
  }
  v0 = (void *)qword_1E658;

  return v0;
}

void sub_6258(id a1)
{
  qword_1E658 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id BKSettingsLog()
{
  if (qword_1E670 != -1) {
    dispatch_once(&qword_1E670, &stru_187C8);
  }
  v0 = (void *)qword_1E668;

  return v0;
}

void sub_6308(id a1)
{
  qword_1E668 = (uint64_t)os_log_create("com.apple.iBooksSettings", "BKSettings");

  _objc_release_x1();
}

void sub_63A0(id a1)
{
  id v6 = 0;
  id v1 = +[LSBundleRecord bundleRecordWithApplicationIdentifier:@"com.apple.iBooks" error:&v6];
  id v2 = v6;
  if (v2)
  {
    v3 = BKSettingsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_F56C((uint64_t)v2, v3);
    }
  }
  else
  {
    v3 = [v1 groupContainerURLs];
    uint64_t v4 = [v3 objectForKey:@"group.com.apple.iBooks"];
    id v5 = (void *)qword_1E678;
    qword_1E678 = v4;
  }
}

id sub_8D80(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadForLowPowerModeChange];
}

id sub_A7B8(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  id v2 = BKSettingsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = [*(id *)(a1 + 40) isEqualToNumber:&off_1A070];
    uint64_t v4 = "OFF";
    if (v3) {
      uint64_t v4 = "ON";
    }
    int v6 = 136315138;
    id v7 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Successfully set Reading Goals to %s. Telling BooksWidget to refresh.", (uint8_t *)&v6, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 32) + 328) reloadTimelineWithReason:@"iBooksSettings"];
}

void sub_B4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_B4D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 312);
  *(void *)(v4 + 312) = 0;

  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_B588;
    block[3] = &unk_18860;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v7);
  }
}

void sub_B588(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadAutomaticDownloadsSection];
}

void sub_BAB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_BAD4(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BB64;
  block[3] = &unk_18860;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_BB64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadCellularDataSection];
}

void sub_BC70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_BC8C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BD1C;
  block[3] = &unk_18860;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_BD1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadCellularDataSection];
}

void sub_C904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_C934(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [a1[4] setObject:&__kCFBooleanFalse forKeyedSubscript:PSEnabledKey];
  [WeakRetained reloadSpecifier:a1[4]];
  [a1[5] setPreferenceValue:&__kCFBooleanTrue specifier:a1[4]];
}

void sub_CC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_CC68(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [a1[4] setObject:&__kCFBooleanFalse forKeyedSubscript:PSEnabledKey];
  [WeakRetained reloadSpecifier:a1[4]];
  [a1[5] setPreferenceValue:&__kCFBooleanTrue specifier:a1[4]];
}

void sub_D4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_D518(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) setObject:&__kCFBooleanFalse forKeyedSubscript:PSEnabledKey];
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
  [WeakRetained setPreferenceValue:&__kCFBooleanTrue specifier:*(void *)(a1 + 32)];
}

id sub_DFC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_E14C(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_E1C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_E2D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_E7B4(id a1)
{
  v4.height = 40.0;
  v4.width = 29.0;
  UIGraphicsBeginImageContextWithOptions(v4, 0, 0.0);
  uint64_t v1 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v2 = (void *)qword_1E688;
  qword_1E688 = v1;
}

uint64_t sub_EB30()
{
  uint64_t v0 = sub_F7A0();
  sub_F2F0(v0, qword_1E590);
  sub_F1C0(v0, (uint64_t)qword_1E590);
  return sub_F790();
}

Swift::Void __swiftcall BKSettingsController._donateSettingsNavigationEvent()()
{
  sub_F7C0();
  __chkstk_darwin();
  id v23 = (char *)&v20 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_F770();
  __chkstk_darwin();
  uint64_t v1 = sub_F710();
  uint64_t v21 = *(void *)(v1 - 8);
  uint64_t v22 = v1;
  __chkstk_darwin();
  unsigned int v3 = (unint64_t *)((char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v24 = sub_F720();
  uint64_t v4 = *(void *)(v24 - 8);
  __chkstk_darwin();
  int v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_F11C(&qword_1E5A8);
  __chkstk_darwin();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_F750();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_F7F0();
  uint64_t v25 = sub_F7E0();
  sub_F7D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_F740();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_F160((uint64_t)v8);
    if (qword_1E588 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_F7A0();
    sub_F1C0(v13, (uint64_t)qword_1E590);
    id v14 = sub_F780();
    os_log_type_t v15 = sub_F800();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_0, v14, v15, "Unable to construct deepLink URL", v16, 2u);
      swift_slowDealloc();
    }
    swift_release();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    sub_F7B0();
    unint64_t *v3 = sub_F2B0();
    (*(void (**)(unint64_t *, void, uint64_t))(v21 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v22);
    sub_F760();
    sub_F730();
    sub_F11C(&qword_1E5B8);
    unint64_t v17 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_17560;
    uint64_t v19 = v24;
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 16))(v18 + v17, v6, v24);
    sub_F810();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v19);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    swift_release();
  }
}

uint64_t sub_F11C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_F160(uint64_t a1)
{
  uint64_t v2 = sub_F11C(&qword_1E5A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_F1C0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_F2B0()
{
  unint64_t result = qword_1E5B0;
  if (!qword_1E5B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E5B0);
  }
  return result;
}

uint64_t *sub_F2F0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_F354()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_F388(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "No cellular identity available: %{public}@", (uint8_t *)&v1, 0xCu);
}

void sub_F408(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "No subscription context available: %{public}@", (uint8_t *)&v1, 0xCu);
}

void sub_F488(void *a1, uint64_t a2, NSObject *a3)
{
  int v5 = 134218242;
  id v6 = [a1 statusCode];
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "_loadDevices: no devices. response status: %ld error: %@", (uint8_t *)&v5, 0x16u);
}

void sub_F524(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "_loadDevices: outdatedDevices.count: %ld", buf, 0xCu);
}

void sub_F56C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error retrieving bundleRecord:%@", (uint8_t *)&v2, 0xCu);
}

void sub_F5E4(int a1, NSObject *a2)
{
  int v2 = 138543618;
  CFStringRef v3 = @"com.apple.librarian.account-token-changed";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "iBooksSettings: Failure to notify_post(%{public}@), error=%u", (uint8_t *)&v2, 0x12u);
}

void sub_F670(uint64_t a1, char a2, os_log_t log)
{
  CFStringRef v3 = @"on";
  if ((a2 & 1) == 0) {
    CFStringRef v3 = @"off";
  }
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  CFStringRef v7 = v3;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "iBooksSettings: Error setting %{public}@ to %{public}@", (uint8_t *)&v4, 0x16u);
}

uint64_t sub_F710()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_F720()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_F730()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_F740()
{
  return URL.init(string:)();
}

uint64_t sub_F750()
{
  return type metadata accessor for URL();
}

uint64_t sub_F760()
{
  return static Locale.current.getter();
}

uint64_t sub_F770()
{
  return type metadata accessor for Locale();
}

uint64_t sub_F780()
{
  return Logger.logObject.getter();
}

uint64_t sub_F790()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_F7A0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_F7B0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_F7C0()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_F7D0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_F7E0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_F7F0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_F800()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_F810()
{
  return PSViewController.emitNavigationEventForApplicationSetting(applicationBundleIdentifier:title:localizedNavigationComponents:deepLink:)();
}

uint64_t BUDynamicCast()
{
  return _BUDynamicCast();
}

uint64_t BUOnboardingAllBundleIDs()
{
  return _BUOnboardingAllBundleIDs();
}

uint64_t BUOnboardingBooksBundleID()
{
  return _BUOnboardingBooksBundleID();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return _CFBundleGetBundleWithIdentifier(bundleID);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

uint64_t TCCAccessCopyInformationForBundle()
{
  return _TCCAccessCopyInformationForBundle();
}

uint64_t TCCAccessSetForBundleId()
{
  return _TCCAccessSetForBundleId();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return _swift_task_reportUnexpectedExecutor();
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__cellularSettings(void *a1, const char *a2, ...)
{
  return [a1 _cellularSettings];
}

id objc_msgSend__currentLocalAutomaticDownloadForPurchasesFromOtherDevicesEnabled(void *a1, const char *a2, ...)
{
  return [a1 _currentLocalAutomaticDownloadForPurchasesFromOtherDevicesEnabled];
}

id objc_msgSend__donateSettingsNavigationEvent(void *a1, const char *a2, ...)
{
  return [a1 _donateSettingsNavigationEvent];
}

id objc_msgSend__formattedNetworkLimit(void *a1, const char *a2, ...)
{
  return [a1 _formattedNetworkLimit];
}

id objc_msgSend__formattedNetworkLimitAndReloadIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _formattedNetworkLimitAndReloadIfNeeded];
}

id objc_msgSend__insertOutdatedDevicesCell(void *a1, const char *a2, ...)
{
  return [a1 _insertOutdatedDevicesCell];
}

id objc_msgSend__isGlobalICloudDriveEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isGlobalICloudDriveEnabled];
}

id objc_msgSend__isOutdatedDevicesCellInstalled(void *a1, const char *a2, ...)
{
  return [a1 _isOutdatedDevicesCellInstalled];
}

id objc_msgSend__isSignedInToICloud(void *a1, const char *a2, ...)
{
  return [a1 _isSignedInToICloud];
}

id objc_msgSend__isSyncSectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isSyncSectionEnabled];
}

id objc_msgSend__isSyncSectionForCloudKitEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isSyncSectionForCloudKitEnabled];
}

id objc_msgSend__isSyncSectionForICloudDriveEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isSyncSectionForICloudDriveEnabled];
}

id objc_msgSend__isUbiquityTCCEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isUbiquityTCCEnabled];
}

id objc_msgSend__loadSizeLimitsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _loadSizeLimitsIfNeeded];
}

id objc_msgSend__makeOutdatedDevicesControllerIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _makeOutdatedDevicesControllerIfNeeded];
}

id objc_msgSend__makeOutdatedDevicesSpecifierIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _makeOutdatedDevicesSpecifierIfNeeded];
}

id objc_msgSend__refreshOutdatedDevicesCell(void *a1, const char *a2, ...)
{
  return [a1 _refreshOutdatedDevicesCell];
}

id objc_msgSend__reloadAutomaticDownloadsSection(void *a1, const char *a2, ...)
{
  return [a1 _reloadAutomaticDownloadsSection];
}

id objc_msgSend__reloadCellularDataSection(void *a1, const char *a2, ...)
{
  return [a1 _reloadCellularDataSection];
}

id objc_msgSend__removeOutdatedDevicesCell(void *a1, const char *a2, ...)
{
  return [a1 _removeOutdatedDevicesCell];
}

id objc_msgSend__shouldShowCellularDataSwitch(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowCellularDataSwitch];
}

id objc_msgSend__updateAutomaticDownloadsSection(void *a1, const char *a2, ...)
{
  return [a1 _updateAutomaticDownloadsSection];
}

id objc_msgSend__updateSyncingSectionSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _updateSyncingSectionSpecifiers];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_activeStoreAccount(void *a1, const char *a2, ...)
{
  return [a1 activeStoreAccount];
}

id objc_msgSend_allowAutomaticDownloads(void *a1, const char *a2, ...)
{
  return [a1 allowAutomaticDownloads];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_books(void *a1, const char *a2, ...)
{
  return [a1 books];
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

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_cellularDataPrompt(void *a1, const char *a2, ...)
{
  return [a1 cellularDataPrompt];
}

id objc_msgSend_cellularSettingsForCurrentIdentity(void *a1, const char *a2, ...)
{
  return [a1 cellularSettingsForCurrentIdentity];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
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

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_defaultBag(void *a1, const char *a2, ...)
{
  return [a1 defaultBag];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_deviceSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 deviceSpecifiers];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_externalControlGroup(void *a1, const char *a2, ...)
{
  return [a1 externalControlGroup];
}

id objc_msgSend_filterBrightImagesKey(void *a1, const char *a2, ...)
{
  return [a1 filterBrightImagesKey];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return [a1 groupContainerURLs];
}

id objc_msgSend_groupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 groupSpecifier];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_iOSRequiredVersion(void *a1, const char *a2, ...)
{
  return [a1 iOSRequiredVersion];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_isBookstoreAllowed(void *a1, const char *a2, ...)
{
  return [a1 isBookstoreAllowed];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return [a1 isLoaded];
}

id objc_msgSend_isLoadingDevices(void *a1, const char *a2, ...)
{
  return [a1 isLoadingDevices];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isLowPowerModeEnabled];
}

id objc_msgSend_isUserSignedInToiTunes(void *a1, const char *a2, ...)
{
  return [a1 isUserSignedInToiTunes];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedButtonTitle];
}

id objc_msgSend_macOSRequiredVersion(void *a1, const char *a2, ...)
{
  return [a1 macOSRequiredVersion];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_menuOnLeft(void *a1, const char *a2, ...)
{
  return [a1 menuOnLeft];
}

id objc_msgSend_mobileNetworkConstraints(void *a1, const char *a2, ...)
{
  return [a1 mobileNetworkConstraints];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_numberOfDevices(void *a1, const char *a2, ...)
{
  return [a1 numberOfDevices];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentationController];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_pressed(void *a1, const char *a2, ...)
{
  return [a1 pressed];
}

id objc_msgSend_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return [a1 primaryAppleAccount];
}

id objc_msgSend_privacyFlow(void *a1, const char *a2, ...)
{
  return [a1 privacyFlow];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return [a1 reload];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_responseDictionary(void *a1, const char *a2, ...)
{
  return [a1 responseDictionary];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_selected(void *a1, const char *a2, ...)
{
  return [a1 selected];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return [a1 sharedProvider];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_spinnerSpecifier(void *a1, const char *a2, ...)
{
  return [a1 spinnerSpecifier];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_tableHeaderView(void *a1, const char *a2, ...)
{
  return [a1 tableHeaderView];
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

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_userDefaults(void *a1, const char *a2, ...)
{
  return [a1 userDefaults];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return [a1 viewIfLoaded];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}