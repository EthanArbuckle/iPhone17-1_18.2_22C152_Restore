id sub_100002A78(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hostDidTerminate];
}

void sub_100002BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002C00(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 objectForKeyedSubscript:BKSApplicationStateKey];

  [WeakRetained _hostApplicationStateDidChange:[v4 integerValue]];
}

void sub_1000031F0(uint64_t a1)
{
  id v2 = +[NSError hk_error:7 description:@"The user canceled request to recalibrate estimates."];
  [*(id *)(a1 + 32) _finishWithError:v2];
}

id sub_100003258(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  id v3 = *(void **)(v2 + 8);
  uint64_t v4 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000032DC;
  v6[3] = &unk_10000C3E0;
  v6[4] = v2;
  return [v3 recalibrateEstimatesForSampleType:v1 effectiveDate:v4 completion:v6];
}

void sub_1000032DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003378;
  v6[3] = &unk_10000C3B8;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

id sub_100003378(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:*(void *)(a1 + 40)];
}

uint64_t start(int a1, char **a2)
{
  id v5 = +[UIColor hk_appTintColor];
  v6 = +[UIView appearance];
  [v6 setTintColor:v5];

  uint64_t v7 = UIApplicationMain(a1, a2, 0, 0);
  _HKInitializeLogging();
  v8 = (void *)HKLogAuthorization;
  if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = +[NSProcessInfo processInfo];
    v11 = [v10 processName];
    int v13 = 138543362;
    v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ exiting", (uint8_t *)&v13, 0xCu);
  }
  return v7;
}

int64_t sub_100003BB0(id a1, HKVerifiableClinicalRecord *a2, HKVerifiableClinicalRecord *a3)
{
  id v4 = a2;
  id v5 = [(HKVerifiableClinicalRecord *)a3 relevantDate];
  v6 = [(HKVerifiableClinicalRecord *)v4 relevantDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

int64_t sub_100003CF8(id a1, HKVisionPrescription *a2, HKVisionPrescription *a3)
{
  id v4 = a3;
  id v5 = [(HKVisionPrescription *)a2 dateIssued];
  v6 = [(HKVisionPrescription *)v4 dateIssued];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

BOOL sub_100003D68(id a1, HKSample *a2, HKObjectAuthorizationRecord *a3)
{
  return [(HKObjectAuthorizationRecord *)a3 status] == (id)2;
}

id sub_100003FD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hostDidTerminate];
}

void sub_100004130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000415C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 objectForKeyedSubscript:BKSApplicationStateKey];

  [WeakRetained _hostApplicationStateDidChange:[v4 integerValue]];
}

void sub_1000043F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000044A8;
  block[3] = &unk_10000C4F0;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1000044A8(void *a1)
{
  uint64_t v3 = a1[4];
  id v2 = (id)a1[5];
  id result = *(id *)(v3 + 48);
  if (result != v2)
  {
    if (!v2) {
      return result;
    }
    id result = [result isEqual:];
    if (!result) {
      return result;
    }
    uint64_t v3 = a1[4];
    id result = *(id *)(v3 + 48);
  }
  *(void *)(v3 + 48) = 0;

  id v5 = (void *)a1[4];
  uint64_t v6 = a1[6];

  return [v5 _finishWithError:v6];
}

void sub_100004520(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000045BC;
  v5[3] = &unk_10000C3B8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

id sub_1000045BC(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);

  return [v2 _configureNavigationController];
}

void sub_100004C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004C8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004C9C(uint64_t a1)
{
}

void sub_100004CA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100004E28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000520C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_100005250(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000053C8(id *a1)
{
  id v2 = a1[4];
  _HKInitializeLogging();
  id v3 = HKLogAuthorization;
  BOOL v4 = os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = a1[4];
      *(_DWORD *)buf = 138412290;
      id v36 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Object selection failed with error: %@.", buf, 0xCu);
    }
    objc_storeStrong((id *)a1[6] + 4, a1[4]);
    [a1[6] _finishWithError:a1[4]];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Successfully selected authorization for object picker.", buf, 2u);
    }
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v7 = [a1[5] allSamples];
    id v8 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)v11) UUID];
          [v6 setObject:&off_10000C9D0 forKeyedSubscript:v12];

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v9);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v13 = [a1[5] enabledSamples];
    id v14 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)v17) UUID];
          [v6 setObject:&off_10000C9E8 forKeyedSubscript:v18];

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v15);
    }

    v19 = a1[6];
    v20 = (void *)v19[2];
    uint64_t v21 = v19[10];
    v22 = (void *)v19[5];
    v23 = v19;
    v24 = [v22 bundleIdentifier];
    v25 = [a1[5] sessionIdentifier];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100005730;
    v26[3] = &unk_10000C5B8;
    v26[4] = a1[6];
    v26[5] = v23;
    [v20 setObjectAuthorizationStatuses:v6 forObjectType:v21 bundleIdentifier:v24 sessionIdentifier:v25 completion:v26];
  }
}

void sub_100005730(uint64_t a1, uint64_t a2, void *a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000057D0;
  block[3] = &unk_10000C4F0;
  id v6 = a3;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1000057D0(uint64_t a1)
{
  _HKInitializeLogging();
  id v2 = HKLogAuthorization;
  if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished setting status with error: %@.", (uint8_t *)&v5, 0xCu);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 32), *(id *)(a1 + 32));
  return [*(id *)(a1 + 48) _finishWithError:*(void *)(a1 + 32)];
}

void sub_100005CC4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_100006968(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hostDidTerminate];
}

void sub_100006ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006AF8(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 objectForKeyedSubscript:BKSApplicationStateKey];

  [WeakRetained _hostApplicationStateDidChange:[v4 integerValue]];
}

void sub_100006E4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006EFC;
  block[3] = &unk_10000C4F0;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100006EFC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentTransactionSessionIdentifier];
  id v3 = *(void **)(a1 + 40);
  if (v2 == v3)
  {

LABEL_6:
    [*(id *)(a1 + 32) setCurrentTransactionSessionIdentifier:0];
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    [v6 _finishWithError:v7];
    return;
  }
  if (v3)
  {
    id v8 = v2;
    id v4 = [*(id *)(a1 + 32) currentTransactionSessionIdentifier];
    unsigned int v5 = [v4 isEqual:*(void *)(a1 + 40)];

    if (!v5) {
      return;
    }
    goto LABEL_6;
  }
}

void sub_100006FD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007088;
  block[3] = &unk_10000C4F0;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100007088(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentTransactionSessionIdentifier];
  id v3 = *(void **)(a1 + 40);
  if (v2 == v3)
  {

LABEL_6:
    [*(id *)(a1 + 32) setCurrentTransactionSource:*(void *)(a1 + 48)];
    uint64_t v6 = *(unsigned char **)(a1 + 32);
    if (v6[9])
    {
      [v6 show];
    }
    return;
  }
  if (v3)
  {
    id v7 = v2;
    id v4 = [*(id *)(a1 + 32) currentTransactionSessionIdentifier];
    unsigned int v5 = [v4 isEqual:*(void *)(a1 + 40)];

    if (!v5) {
      return;
    }
    goto LABEL_6;
  }
}

id sub_100007238(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 _didFinishPresentingRequestWithError:v4];
  }
  else {
    return [v3 _finishWithError:v4];
  }
}

void sub_1000074F0(unsigned int a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Host application state changed to %ld, terminating recalibrate estimates session.", (uint8_t *)&v2, 0xCu);
}

void sub_10000756C(void *a1, void *a2, uint64_t a3)
{
  unsigned int v5 = a1;
  uint64_t v6 = [a2 sessionIdentifier];
  int v7 = 138543618;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to locate context to authorize session %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_10000762C(unsigned int a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Host application state changed to %ld, terminating authorization session.", (uint8_t *)&v2, 0xCu);
}

void sub_1000076A8(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  sub_100005CC4((void *)&_mh_execute_header, v3, v4, "%{public}@: beginning authorization delegate transaction", v5, v6, v7, v8, 2u);
}

void sub_100007740(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  sub_100005CC4((void *)&_mh_execute_header, v3, v4, "%{public}@: finishing authorization delegate transaction", v5, v6, v7, v8, 2u);
}

void sub_1000077D8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@: Timed out waiting for signed clinical data record", (uint8_t *)&v2, 0xCu);
}

void sub_100007850(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@: Timed out waiting for medical records", (uint8_t *)&v2, 0xCu);
}

void sub_1000078C8(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  sub_100005CC4((void *)&_mh_execute_header, v3, v4, "%@: dismissing", v5, v6, v7, v8, 2u);
}

void sub_100007960(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v6 = 138412546;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@: beginning authorization delegate transaction with identifier %{public}@", (uint8_t *)&v6, 0x16u);
}

uint64_t HKLocalizedStringForDateAndTemplate()
{
  return _HKLocalizedStringForDateAndTemplate();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__appStateTerminationUpperBound(void *a1, const char *a2, ...)
{
  return [a1 _appStateTerminationUpperBound];
}

id objc_msgSend__configureApplicationStateMonitor(void *a1, const char *a2, ...)
{
  return [a1 _configureApplicationStateMonitor];
}

id objc_msgSend__healthPrivacyHostViewController(void *a1, const char *a2, ...)
{
  return [a1 _healthPrivacyHostViewController];
}

id objc_msgSend__hostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _hostApplicationBundleIdentifier];
}

id objc_msgSend__isPresentingLastRequest(void *a1, const char *a2, ...)
{
  return [a1 _isPresentingLastRequest];
}

id objc_msgSend__pickerControllerForDocuments(void *a1, const char *a2, ...)
{
  return [a1 _pickerControllerForDocuments];
}

id objc_msgSend__pickerControllerForSignedClinicalData(void *a1, const char *a2, ...)
{
  return [a1 _pickerControllerForSignedClinicalData];
}

id objc_msgSend__pickerControllerForVisionPrescriptions(void *a1, const char *a2, ...)
{
  return [a1 _pickerControllerForVisionPrescriptions];
}

id objc_msgSend__presentNextRequest(void *a1, const char *a2, ...)
{
  return [a1 _presentNextRequest];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allSamples(void *a1, const char *a2, ...)
{
  return [a1 allSamples];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentTransactionSessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 currentTransactionSessionIdentifier];
}

id objc_msgSend_currentTransactionSource(void *a1, const char *a2, ...)
{
  return [a1 currentTransactionSource];
}

id objc_msgSend_dateIssued(void *a1, const char *a2, ...)
{
  return [a1 dateIssued];
}

id objc_msgSend_effectiveDate(void *a1, const char *a2, ...)
{
  return [a1 effectiveDate];
}

id objc_msgSend_enabledSamples(void *a1, const char *a2, ...)
{
  return [a1 enabledSamples];
}

id objc_msgSend_expectedObjectType(void *a1, const char *a2, ...)
{
  return [a1 expectedObjectType];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return [a1 healthStore];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_isiPad(void *a1, const char *a2, ...)
{
  return [a1 isiPad];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_originIdentifier(void *a1, const char *a2, ...)
{
  return [a1 originIdentifier];
}

id objc_msgSend_presentationRequests(void *a1, const char *a2, ...)
{
  return [a1 presentationRequests];
}

id objc_msgSend_presentedRequest(void *a1, const char *a2, ...)
{
  return [a1 presentedRequest];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_readUsageDescription(void *a1, const char *a2, ...)
{
  return [a1 readUsageDescription];
}

id objc_msgSend_recordTypes(void *a1, const char *a2, ...)
{
  return [a1 recordTypes];
}

id objc_msgSend_relevantDate(void *a1, const char *a2, ...)
{
  return [a1 relevantDate];
}

id objc_msgSend_requestRecord(void *a1, const char *a2, ...)
{
  return [a1 requestRecord];
}

id objc_msgSend_researchStudyUsageDescription(void *a1, const char *a2, ...)
{
  return [a1 researchStudyUsageDescription];
}

id objc_msgSend_sampleType(void *a1, const char *a2, ...)
{
  return [a1 sampleType];
}

id objc_msgSend_samplesRequiringAuthorization(void *a1, const char *a2, ...)
{
  return [a1 samplesRequiringAuthorization];
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sessionIdentifier];
}

id objc_msgSend_shareUsageDescription(void *a1, const char *a2, ...)
{
  return [a1 shareUsageDescription];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_shouldDismissWhenBackgrounded(void *a1, const char *a2, ...)
{
  return [a1 shouldDismissWhenBackgrounded];
}

id objc_msgSend_shouldPresent(void *a1, const char *a2, ...)
{
  return [a1 shouldPresent];
}

id objc_msgSend_show(void *a1, const char *a2, ...)
{
  return [a1 show];
}

id objc_msgSend_signedClinicalDataRecordType(void *a1, const char *a2, ...)
{
  return [a1 signedClinicalDataRecordType];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typesRequiringReadAuthorization(void *a1, const char *a2, ...)
{
  return [a1 typesRequiringReadAuthorization];
}

id objc_msgSend_typesRequiringShareAuthorization(void *a1, const char *a2, ...)
{
  return [a1 typesRequiringShareAuthorization];
}

id objc_msgSend_visionPrescriptionType(void *a1, const char *a2, ...)
{
  return [a1 visionPrescriptionType];
}