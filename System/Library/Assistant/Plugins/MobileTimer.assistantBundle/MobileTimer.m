void sub_43DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_440C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_441C(uint64_t a1)
{
}

id sub_4424(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v57 = v5;
    __int16 v58 = 2114;
    id v59 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm fetch returned alarms: %{public}@", buf, 0x16u);
  }

  id v6 = [objc_alloc((Class)NSSet) initWithArray:*(void *)(a1 + 40)];
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v3;
  id v8 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v13 = [v12 alarmURL];
        unsigned int v14 = [v6 containsObject:v13];

        if (v14) {
          [v7 addObject:v12];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v9);
  }

  id v15 = [v7 count];
  v16 = MTLogForCategory();
  v17 = v16;
  if (v15)
  {
    id v38 = v6;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v57 = v18;
      __int16 v58 = 2114;
      id v59 = v7;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ found alarms to dismiss: %{public}@", buf, 0x16u);
    }

    id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v15];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v37 = v7;
    id v39 = v7;
    id v20 = [v39 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v45;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v39);
          }
          v24 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
          v25 = MTLogForCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v57 = v26;
            __int16 v58 = 2114;
            id v59 = v24;
            _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing alarm: %{public}@", buf, 0x16u);
          }

          v27 = *(void **)(a1 + 48);
          v28 = [v24 alarmIDString];
          v29 = [v27 dismissAlarmWithIdentifier:v28];

          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_49D4;
          v41[3] = &unk_18428;
          id v42 = *(id *)(a1 + 32);
          v43 = v24;
          id v30 = [v29 addCompletionBlock:v41];
          [v19 addObject:v29];
        }
        id v21 = [v39 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v21);
    }

    v31 = MTLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = *(void *)(a1 + 32);
      id v33 = [v19 count];
      *(_DWORD *)buf = 138543618;
      uint64_t v57 = v32;
      __int16 v58 = 2048;
      id v59 = v33;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ combining dismiss futures. Count: %tu", buf, 0x16u);
    }

    v34 = +[MTScheduler globalAsyncSchedulerWithPriority:](MTScheduler, "globalAsyncSchedulerWithPriority:", +[MTScheduler defaultPriority]);
    v35 = +[NAFuture combineAllFutures:v19 ignoringErrors:0 scheduler:v34];
    id v7 = v37;
    id v6 = v38;
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10130(a1, v17);
    }

    NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
    CFStringRef v54 = @"No alarm matches the alarm IDs.";
    id v19 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    v34 = +[NSError errorWithDomain:@"com.apple.mobiletimer.SAAlarmDismiss" code:2 userInfo:v19];
    v35 = +[NAFuture futureWithError:v34];
  }

  return v35;
}

void sub_49D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_101AC(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ dismiss alarm %{public}@ succeeded", (uint8_t *)&v9, 0x16u);
  }
}

void sub_4AC4(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "na_firstObjectPassingTest:", &stru_18490);
  id v4 = MTLogForCategory();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10240();
    }

    id v6 = objc_alloc((Class)SACommandFailed);
    uint64_t v7 = [v3 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:NSLocalizedDescriptionKey];
    id v9 = [v6 initWithReason:v8];

    objc_msgSend(v9, "setErrorCode:", objc_msgSend(v3, "code"));
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v15 = 138543362;
      uint64_t v16 = v12;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ combined alarm dismiss future succeeded", (uint8_t *)&v15, 0xCu);
    }

    id v13 = objc_alloc_init((Class)SACommandSucceeded);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v11 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

BOOL sub_4C64(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_4CB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10240();
  }

  id v5 = objc_alloc((Class)SACommandFailed);
  id v6 = [v3 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:NSLocalizedDescriptionKey];
  id v8 = [v5 initWithReason:v7];

  objc_msgSend(v8, "setErrorCode:", objc_msgSend(v3, "code"));
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
  id v11 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_4DAC(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  return result;
}

void sub_4DE4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_5354(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_5384(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_5394(uint64_t a1)
{
}

id sub_539C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v57 = v5;
    __int16 v58 = 2114;
    id v59 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm fetch returned alarms: %{public}@", buf, 0x16u);
  }

  id v6 = [objc_alloc((Class)NSSet) initWithArray:*(void *)(a1 + 40)];
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v3;
  id v8 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v13 = [v12 alarmURL];
        unsigned int v14 = [v6 containsObject:v13];

        if (v14) {
          [v7 addObject:v12];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v9);
  }

  id v15 = [v7 count];
  uint64_t v16 = MTLogForCategory();
  v17 = v16;
  if (v15)
  {
    id v38 = v6;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v57 = v18;
      __int16 v58 = 2114;
      id v59 = v7;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ found alarms to snooze: %{public}@", buf, 0x16u);
    }

    id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v15];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v37 = v7;
    id v39 = v7;
    id v20 = [v39 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v45;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v39);
          }
          v24 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
          v25 = MTLogForCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v57 = v26;
            __int16 v58 = 2114;
            id v59 = v24;
            _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ snooze alarm: %{public}@", buf, 0x16u);
          }

          v27 = *(void **)(a1 + 48);
          v28 = [v24 alarmIDString];
          v29 = [v27 snoozeAlarmWithIdentifier:v28];

          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_594C;
          v41[3] = &unk_18428;
          id v42 = *(id *)(a1 + 32);
          v43 = v24;
          id v30 = [v29 addCompletionBlock:v41];
          [v19 addObject:v29];
        }
        id v21 = [v39 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v21);
    }

    v31 = MTLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = *(void *)(a1 + 32);
      id v33 = [v19 count];
      *(_DWORD *)buf = 138543618;
      uint64_t v57 = v32;
      __int16 v58 = 2048;
      id v59 = v33;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ combining snooze futures. Count: %tu", buf, 0x16u);
    }

    v34 = +[MTScheduler globalAsyncSchedulerWithPriority:](MTScheduler, "globalAsyncSchedulerWithPriority:", +[MTScheduler defaultPriority]);
    v35 = +[NAFuture combineAllFutures:v19 ignoringErrors:0 scheduler:v34];
    id v7 = v37;
    id v6 = v38;
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1047C(a1, v17);
    }

    NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
    CFStringRef v54 = @"No alarm matches the alarm IDs.";
    id v19 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    v34 = +[NSError errorWithDomain:@"com.apple.mobiletimer.SAAlarmSnooze" code:2 userInfo:v19];
    v35 = +[NAFuture futureWithError:v34];
  }

  return v35;
}

void sub_594C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_104F8(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ snooze alarm %{public}@ succeeded", (uint8_t *)&v9, 0x16u);
  }
}

void sub_5A3C(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "na_firstObjectPassingTest:", &stru_18500);
  id v4 = MTLogForCategory();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1058C();
    }

    id v6 = objc_alloc((Class)SACommandFailed);
    uint64_t v7 = [v3 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:NSLocalizedDescriptionKey];
    id v9 = [v6 initWithReason:v8];

    objc_msgSend(v9, "setErrorCode:", objc_msgSend(v3, "code"));
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v15 = 138543362;
      uint64_t v16 = v12;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ combined alarm snooze future succeeded", (uint8_t *)&v15, 0xCu);
    }

    id v13 = objc_alloc_init((Class)SACommandSucceeded);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v11 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

BOOL sub_5BDC(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_5C28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1058C();
  }

  id v5 = objc_alloc((Class)SACommandFailed);
  id v6 = [v3 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:NSLocalizedDescriptionKey];
  id v8 = [v5 initWithReason:v7];

  objc_msgSend(v8, "setErrorCode:", objc_msgSend(v3, "code"));
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
  id v11 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_6534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  objc_destroyWeak(v44);
  objc_destroyWeak(v43);
  _Block_object_dispose(&a43, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_6588(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_6598(uint64_t a1)
{
}

void sub_65A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = WeakRetained;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ create alarm succeeded", (uint8_t *)&v9, 0xCu);
  }

  +[MTAnalytics incrementEventCount:kMTCASiriAlarmAdds];
  id v4 = objc_alloc_init((Class)SAAlarmCreateCompleted);
  id v5 = [*(id *)(a1 + 32) alarmURL];
  [v4 setAlarmId:v5];

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;
  id v8 = v4;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_66D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10830();
  }

  id v6 = objc_alloc_init((Class)SACommandFailed);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_6EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_6F44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_6F54(uint64_t a1)
{
}

id sub_6F5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = WeakRetained;
    __int16 v21 = 2114;
    id v22 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ timer fetch completed with timer: %{public}@", buf, 0x16u);
  }

  [v3 duration];
  double v7 = v6;
  id v8 = [WeakRetained timer];
  int v9 = [v8 timerValue];

  if (v9)
  {
    id v10 = [WeakRetained timer];
    id v11 = [v10 timerValue];
    double v7 = (double)(uint64_t)[v11 integerValue];
  }
  if ([v3 state] == (char *)&dword_0 + 1)
  {
    uint64_t v12 = [*(id *)(a1 + 32) startCurrentTimerWithDuration:v7];
  }
  else
  {
    id v13 = MTLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = WeakRetained;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping current timer before restarting", buf, 0xCu);
    }

    uint64_t v14 = [*(id *)(a1 + 32) stopCurrentTimer];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_71B8;
    v16[3] = &unk_18578;
    id v17 = *(id *)(a1 + 32);
    double v18 = v7;
    uint64_t v12 = [v14 flatMap:v16];
  }

  return v12;
}

id sub_71B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) startCurrentTimerWithDuration:*(double *)(a1 + 40)];
}

void sub_71C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = WeakRetained;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ set timer succeeded", (uint8_t *)&v7, 0xCu);
  }

  id v4 = objc_alloc_init((Class)SATimerSetCompleted);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  double v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_72B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = WeakRetained;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ set timer failed with error: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v6 = objc_alloc_init((Class)SACommandFailed);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_7A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  _Block_object_dispose(&a24, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_7AAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7ABC(uint64_t a1)
{
}

void sub_7AC4(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = WeakRetained;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm update succeeded", (uint8_t *)&v12, 0xCu);
  }

  id v7 = objc_alloc_init((Class)SAAlarmUpdateCompleted);
  id v8 = objc_msgSend(v4, "na_map:", &stru_18608);

  [v7 setAlarmIds:v8];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v11 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

NSURL *__cdecl sub_7BFC(id a1, MTAlarm *a2)
{
  return (NSURL *)[(MTAlarm *)a2 alarmURL];
}

void sub_7C04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10D28();
  }

  id v6 = objc_alloc((Class)SACommandFailed);
  id v7 = [v3 userInfo];
  id v8 = [v7 objectForKeyedSubscript:NSLocalizedDescriptionKey];
  id v9 = [v6 initWithReason:v8];

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
  id v12 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_7E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_7EBC(int8x16_t *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 hour];

  if (v7)
  {
    id v8 = [v6 hour];
    id v9 = [v8 unsignedIntegerValue];
    uint64_t v10 = *(void *)(a1[2].i64[1] + 8);
    id v40 = *(id *)(v10 + 40);
    BOOL v11 = MTValidateAlarmHour((unint64_t)v9, &v40);
    objc_storeStrong((id *)(v10 + 40), v40);
    *(unsigned char *)(*(void *)(a1[2].i64[0] + 8) + 24) = v11;
  }
  if (*(unsigned char *)(*(void *)(a1[2].i64[0] + 8) + 24))
  {
    id v12 = [v6 minute];

    if (v12)
    {
      id v13 = [v6 minute];
      id v14 = [v13 unsignedIntegerValue];
      uint64_t v15 = *(void *)(a1[2].i64[1] + 8);
      id v39 = *(id *)(v15 + 40);
      BOOL v16 = MTValidateAlarmMinute((unint64_t)v14, &v39);
      objc_storeStrong((id *)(v15 + 40), v39);
      *(unsigned char *)(*(void *)(a1[2].i64[0] + 8) + 24) = v16;
    }
  }
  if (*(unsigned char *)(*(void *)(a1[2].i64[0] + 8) + 24))
  {
    id v17 = [v6 addedFrequency];

    if (v17)
    {
      double v18 = [v6 addedFrequency];
      uint64_t v19 = *(void *)(a1[2].i64[1] + 8);
      id obj = *(id *)(v19 + 40);
      char v20 = MTValidateAlarmFrequency(v18, &obj);
      objc_storeStrong((id *)(v19 + 40), obj);
      *(unsigned char *)(*(void *)(a1[2].i64[0] + 8) + 24) = v20;
    }
  }
  if (*(unsigned char *)(*(void *)(a1[2].i64[0] + 8) + 24))
  {
    __int16 v21 = [v6 removedFrequency];

    if (v21)
    {
      id v22 = [v6 removedFrequency];
      uint64_t v23 = *(void *)(a1[2].i64[1] + 8);
      id v37 = *(id *)(v23 + 40);
      char v24 = MTValidateAlarmFrequency(v22, &v37);
      objc_storeStrong((id *)(v23 + 40), v37);
      *(unsigned char *)(*(void *)(a1[2].i64[0] + 8) + 24) = v24;
    }
  }
  if (*(unsigned char *)(*(void *)(a1[2].i64[0] + 8) + 24))
  {
    uint64_t v25 = [v6 addedFrequency];
    if (v25)
    {
      uint64_t v26 = (void *)v25;
      v27 = [v6 removedFrequency];

      if (v27)
      {
        v28 = [v6 addedFrequency];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_8200;
        v34[3] = &unk_18658;
        id v35 = v6;
        int8x16_t v36 = vextq_s8(a1[2], a1[2], 8uLL);
        [v28 enumerateObjectsUsingBlock:v34];
      }
    }
  }
  if (*(unsigned char *)(*(void *)(a1[2].i64[0] + 8) + 24))
  {
    v29 = [v6 label];

    if (v29)
    {
      id v30 = [v6 label];
      uint64_t v31 = *(void *)(a1[2].i64[1] + 8);
      id v33 = *(id *)(v31 + 40);
      BOOL v32 = MTValidateAlarmLabel(v30, &v33);
      objc_storeStrong((id *)(v31 + 40), v33);
      *(unsigned char *)(*(void *)(a1[2].i64[0] + 8) + 24) = v32;
    }
  }
  if (!*(unsigned char *)(*(void *)(a1[2].i64[0] + 8) + 24)) {
    *a4 = 1;
  }
}

void sub_8200(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) removedFrequency];
  unsigned int v8 = [v7 containsObject:v6];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) addedFrequency];
    uint64_t v10 = [*(id *)(a1 + 32) removedFrequency];
    BOOL v11 = +[NSString stringWithFormat:@"Cannot add a frequency (%@) that is also being removed. Added: %@, Removed: %@", v6, v9, v10];

    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    id v17 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v13 = +[NSError errorWithDomain:@"com.apple.mobiletimer.assistant" code:4 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void sub_850C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_8530(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = WeakRetained;
    __int16 v18 = 2114;
    id v19 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm fetch returned alarms: %{public}@", buf, 0x16u);
  }

  id v6 = [WeakRetained modifications];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_8708;
  v12[3] = &unk_186F8;
  id v13 = v3;
  id v14 = WeakRetained;
  id v15 = *(id *)(a1 + 32);
  id v7 = v3;
  unsigned int v8 = objc_msgSend(v6, "na_map:", v12);

  id v9 = +[MTScheduler globalAsyncSchedulerWithPriority:](MTScheduler, "globalAsyncSchedulerWithPriority:", +[MTScheduler defaultPriority]);
  uint64_t v10 = +[NAFuture combineAllFutures:v8 ignoringErrors:0 scheduler:v9];

  return v10;
}

id sub_8708(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_8A20;
  v20[3] = &unk_186A8;
  id v5 = v3;
  id v21 = v5;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v20);
  id v7 = MTLogForCategory();
  unsigned int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v9;
      __int16 v24 = 2114;
      uint64_t v25 = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ found matching alarm: %{public}@", buf, 0x16u);
    }

    uint64_t v10 = [*(id *)(a1 + 40) updateAlarm:v6 withModification:v5];
    BOOL v11 = MTLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v12;
      __int16 v24 = 2114;
      uint64_t v25 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ updating alarm: %{public}@", buf, 0x16u);
    }

    id v13 = [*(id *)(a1 + 48) updateAlarm:v10];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_8A84;
    v18[3] = &unk_186D0;
    id v19 = v10;
    id v14 = v10;
    id v15 = [v13 flatMap:v18];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10D90(a1, v8);
    }

    id v13 = +[NSString stringWithFormat:&stru_18A80];
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    v27 = v13;
    NSErrorUserInfoKey v16 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v14 = +[NSError errorWithDomain:@"com.apple.mobiletimer.assistant" code:0 userInfo:v16];

    id v15 = +[NAFuture futureWithError:v14];
  }

  return v15;
}

id sub_8A20(uint64_t a1, void *a2)
{
  id v3 = [a2 alarmURL];
  id v4 = [*(id *)(a1 + 32) alarmId];
  id v5 = [v3 isEqual:v4];

  return v5;
}

id sub_8A84(uint64_t a1)
{
  return +[NAFuture futureWithResult:*(void *)(a1 + 32)];
}

void sub_9548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  objc_destroyWeak(v53);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v54 - 224), 8);
  _Block_object_dispose((const void *)(v54 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_95C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_95D0(uint64_t a1)
{
}

void sub_95D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  unsigned int v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543874;
    id v16 = WeakRetained;
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep alarm fetch returned: %{public}@, error: %{public}@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v9 = MTNilify();
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
  id v14 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_9714(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  unsigned int v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543874;
    id v16 = WeakRetained;
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm fetch returned alarms: %{public}@, error: %{public}@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
  id v14 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

intptr_t sub_984C(uint64_t a1)
{
  id v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v16 = 138543362;
    uint64_t v17 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm search completed", (uint8_t *)&v16, 0xCu);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    || *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v4 = objc_alloc_init((Class)SACommandFailed);
    goto LABEL_6;
  }
  if (MTShouldHandleForEucalyptus())
  {
    uint64_t v12 = [*(id *)(a1 + 32) includesSleepAlarms];
    if (![v12 BOOLValue])
    {
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);

    if (v13)
    {
      uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) arrayByAddingObject:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
      uint64_t v15 = *(void *)(*(void *)(a1 + 88) + 8);
      uint64_t v12 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
      goto LABEL_15;
    }
  }
LABEL_16:
  id v4 = [*(id *)(a1 + 32) searchWithAlarms:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
LABEL_6:
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = MTLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1107C(a1);
  }

  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) dictionary];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  uint64_t v10 = MTLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10FD4(a1, a1 + 72);
  }

  +[MTAnalytics incrementEventCount:kMTCASiriAlarmSearches];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_A6C8(id a1)
{
  uint64_t v1 = +[NSCharacterSet punctuationCharacterSet];
  id v2 = (void *)qword_206F8;
  qword_206F8 = v1;

  qword_20700 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];

  _objc_release_x1();
}

void sub_A74C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_AB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  _Block_object_dispose((const void *)(v26 - 160), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_ABB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_ABC0(uint64_t a1)
{
}

void sub_ABC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = WeakRetained;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ timer fetch completed with timer: %@", (uint8_t *)&v11, 0x16u);
  }

  id v6 = SATimerObjectForMTTimer(v3);
  id v7 = objc_alloc_init((Class)SATimerGetCompleted);
  [v7 setTimer:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
  id v10 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_ACFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_112F4((uint64_t)WeakRetained, (uint64_t)v3, v5);
  }

  id v6 = objc_alloc_init((Class)SACommandFailed);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t MTAlarmRepeatDayFromSAAlarmDayOfWeek(unsigned int a1)
{
  if (a1 > 8) {
    return 1;
  }
  else {
    return qword_14270[a1];
  }
}

id SAAlarmFrequencyFromRepeatSchedule(uint64_t a1)
{
  id v2 = objc_opt_new();
  id v3 = v2;
  if (a1)
  {
    id v6 = v2;
    MTAlarmRepeatScheduleEnumerateDays();
  }
  else
  {
    id v4 = stringForSAAlarmDayOfWeek();
    [v3 addObject:v4];
  }

  return v3;
}

void sub_AE90(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      id v3 = *(void **)(a1 + 32);
      goto LABEL_9;
    case 1:
      id v3 = *(void **)(a1 + 32);
      goto LABEL_9;
    case 2:
      id v3 = *(void **)(a1 + 32);
      goto LABEL_9;
    case 3:
      id v3 = *(void **)(a1 + 32);
      goto LABEL_9;
    case 4:
      id v3 = *(void **)(a1 + 32);
      goto LABEL_9;
    case 5:
      id v3 = *(void **)(a1 + 32);
      goto LABEL_9;
    case 6:
      id v3 = *(void **)(a1 + 32);
LABEL_9:
      stringForSAAlarmDayOfWeek();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:");

      break;
    default:
      return;
  }
}

uint64_t MTValidateAlarmRelativeOffsetMinutes(unint64_t a1, void *a2)
{
  if (a1 < 0x2D1) {
    return 1;
  }
  id v4 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  uint64_t v5 = +[NSTimeZone defaultTimeZone];
  [v4 setTimeZone:v5];

  id v6 = +[NSDate date];
  id v7 = objc_alloc_init((Class)NSDateComponents);
  [v7 setDay:1];
  uint64_t v8 = [v4 dateByAddingComponents:v7 toDate:v6 options:0];
  id v9 = objc_alloc_init((Class)NSDateComponents);
  [v9 setMinute:a1];
  id v10 = [v4 dateByAddingComponents:v9 toDate:v6 options:0];
  int v11 = [v8 laterDate:v10];

  BOOL v12 = v11 == v10;
  BOOL v13 = v11 != v10;
  if (v12)
  {
    +[NSString stringWithFormat:@"Relative offset must not be more than one day. Offset: %lu", a1];
    v18 = id v14 = a2;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    id v20 = v18;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    int v16 = +[NSError errorWithDomain:@"com.apple.mobiletimer.assistant" code:1 userInfo:v15];

    if (v14) {
      *id v14 = v16;
    }
  }
  return v13;
}

BOOL MTValidateAlarmHour(unint64_t a1, void *a2)
{
  if (a1 >= 0x18)
  {
    id v4 = +[NSString stringWithFormat:@"Hour must be between 0 and 23, inclusive. Hour = %lu", a1];
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    id v9 = v4;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    id v6 = +[NSError errorWithDomain:@"com.apple.mobiletimer.assistant" code:2 userInfo:v5];

    if (a2) {
      *a2 = v6;
    }
  }
  return a1 < 0x18;
}

BOOL MTValidateAlarmMinute(unint64_t a1, void *a2)
{
  if (a1 >= 0x3C)
  {
    id v4 = +[NSString stringWithFormat:@"Minute must be between 0 and 59, inclusive. Minute = %lu", a1];
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    id v9 = v4;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    id v6 = +[NSError errorWithDomain:@"com.apple.mobiletimer.assistant" code:3 userInfo:v5];

    if (a2) {
      *a2 = v6;
    }
  }
  return a1 < 0x3C;
}

uint64_t MTValidateAlarmFrequency(void *a1, void *a2)
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a1;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (SAAlarmDayOfWeekForString() == 1)
        {
          if ([v3 count] != (char *)&dword_0 + 1)
          {
            id v14 = +[NSString stringWithFormat:@"SAClockAlarmDayNever must be specified alone. Frequency: %@", v3];
            NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
            v28 = v14;
            uint64_t v15 = &v28;
            int v16 = &v27;
LABEL_22:
            uint64_t v17 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v16 count:1];
            BOOL v12 = +[NSError errorWithDomain:@"com.apple.mobiletimer.assistant" code:4 userInfo:v17];

            uint64_t v13 = 0;
            goto LABEL_23;
          }
        }
        else
        {
          if (SAAlarmDayOfWeekForString() < 2 || SAAlarmDayOfWeekForString() >= 9)
          {
            id v14 = +[NSString stringWithFormat:@"Frequency contains invalid day: %@. Frequency: %@", v9, v3, (void)v19];
            NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
            uint64_t v26 = v14;
            uint64_t v15 = &v26;
            int v16 = &v25;
            goto LABEL_22;
          }
          unsigned int v10 = SAAlarmDayOfWeekForString();
          if (v10 > 8) {
            uint64_t v11 = 1;
          }
          else {
            uint64_t v11 = qword_14270[v10];
          }
          if ((v11 & v6) != 0)
          {
            id v14 = +[NSString stringWithFormat:@"Frequency contains %@ multiple times. Frequency: %@", v9, v3, (void)v19];
            NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
            __int16 v24 = v14;
            uint64_t v15 = &v24;
            int v16 = &v23;
            goto LABEL_22;
          }
          v6 |= v11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
      BOOL v12 = 0;
      uint64_t v13 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 0;
    uint64_t v13 = 1;
  }
LABEL_23:

  if (a2) {
    *a2 = v12;
  }

  return v13;
}

BOOL MTValidateAlarmLabel(void *a1, void *a2)
{
  id v3 = [a1 length];
  if (!v3)
  {
    id v4 = +[NSString stringWithFormat:@"A zero-length label is not allowed"];
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    uint64_t v9 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    uint64_t v6 = +[NSError errorWithDomain:@"com.apple.mobiletimer.assistant" code:5 userInfo:v5];

    if (a2) {
      *a2 = v6;
    }
  }
  return v3 != 0;
}

void sub_BB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  _Block_object_dispose((const void *)(v24 - 160), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_BBC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_BBD4(uint64_t a1)
{
}

id sub_BBDC(uint64_t a1, void *a2)
{
  id v31 = a2;
  id val = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v47 = val;
    __int16 v48 = 2114;
    id v49 = v31;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm fetch returned alarms: %{public}@", buf, 0x16u);
  }

  id obj = (id)objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v3 = [val alarmIds];
  id v4 = [v3 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v41;
    *(void *)&long long v5 = 138543618;
    long long v26 = v5;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v41 != v6) {
          objc_enumerationMutation(v3);
        }
        NSErrorUserInfoKey v8 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v7);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_C204;
        v39[3] = &unk_186A8;
        v39[4] = v8;
        uint64_t v9 = objc_msgSend(v31, "na_firstObjectPassingTest:", v39, v26);
        if (v9)
        {
          [obj addObject:v9];
        }
        else
        {
          unsigned int v10 = MTLogForCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            id v47 = val;
            __int16 v48 = 2114;
            id v49 = v8;
            _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "%{public}@ Attempt to delete unknown alarm: %{public}@", buf, 0x16u);
          }
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [v3 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v4);
  }

  if (![obj count])
  {
    uint64_t v11 = MTLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1154C((uint64_t)val, v11);
    }
  }
  BOOL v12 = MTLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v47 = val;
    __int16 v48 = 2114;
    id v49 = obj;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ found alarms to delete: %{public}@", buf, 0x16u);
  }

  uint64_t v13 = objc_opt_new();
  objc_initWeak(&location, val);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obja = obj;
  id v14 = [obja countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v35;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(obja);
        }
        uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v18 = MTLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v47 = val;
          __int16 v48 = 2114;
          id v49 = v17;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ deleting alarm: %{public}@", buf, 0x16u);
        }

        long long v19 = [*(id *)(a1 + 32) removeAlarm:v17];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_C248;
        v32[3] = &unk_18858;
        objc_copyWeak(&v33, &location);
        v32[4] = v17;
        id v20 = [v19 addCompletionBlock:v32];
        [v13 addObject:v19];
        objc_destroyWeak(&v33);
      }
      id v14 = [obja countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v14);
  }

  long long v21 = MTLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [v13 count];
    *(_DWORD *)buf = 138543618;
    id v47 = val;
    __int16 v48 = 2048;
    id v49 = v22;
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ combining delete futures. Count: %lu", buf, 0x16u);
  }

  NSErrorUserInfoKey v23 = +[MTScheduler globalAsyncSchedulerWithPriority:](MTScheduler, "globalAsyncSchedulerWithPriority:", +[MTScheduler defaultPriority]);
  uint64_t v24 = +[NAFuture combineAllFutures:v13 ignoringErrors:0 scheduler:v23];

  objc_destroyWeak(&location);

  return v24;
}

void sub_C1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
}

id sub_C204(uint64_t a1, void *a2)
{
  id v3 = [a2 alarmURL];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_C248(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = MTLogForCategory();
  uint64_t v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543874;
      id v11 = WeakRetained;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%{public}@ delete alarm %{public}@ failed with error: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543618;
    id v11 = WeakRetained;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ delete alarm %{public}@ succeeded", (uint8_t *)&v10, 0x16u);
  }
}

void sub_C384(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", &stru_18878);

  uint64_t v7 = MTLogForCategory();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_115C4((uint64_t)WeakRetained, (uint64_t)v6, v8);
    }

    id v9 = objc_alloc((Class)SACommandFailed);
    int v10 = [v6 userInfo];
    id v11 = [v10 objectForKeyedSubscript:NSLocalizedDescriptionKey];
    id v12 = [v9 initWithReason:v11];

    objc_msgSend(v12, "setErrorCode:", objc_msgSend(v6, "code"));
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    __int16 v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = WeakRetained;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ combined alarm delete future succeeded", (uint8_t *)&v17, 0xCu);
    }

    +[MTAnalytics incrementEventCount:kMTCASiriAlarmRemoves];
    id v15 = objc_alloc_init((Class)SAAlarmDeleteCompleted);
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    __int16 v14 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL sub_C558(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_CB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  _Block_object_dispose(&a25, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_CB7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_CB8C(uint64_t a1)
{
}

void sub_CB94(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = WeakRetained;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm fetch completed with alarms: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
  id v8 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_CC90(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1182C((uint64_t)WeakRetained, (uint64_t)v3, v5);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_CFE8(uint64_t a1, void *a2)
{
  id v3 = [a2 displayTitle];
  if (![v3 length]) {
    NSLog(@"Unexpected zero-length displayTitle: %@", v3);
  }
  [*(id *)(a1 + 32) appendString:v3];
}

void sub_D358(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_D7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_D84C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_D85C(uint64_t a1)
{
}

id sub_D864(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = WeakRetained;
    __int16 v17 = 2114;
    id v18 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ timer fetch completed with timer: %{public}@", buf, 0x16u);
  }

  if (v3)
  {
    uint64_t v6 = [v3 timerByUpdatingWithState:1];
    uint64_t v7 = MTLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = WeakRetained;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping timer: %{public}@", buf, 0x16u);
    }

    uint64_t v8 = [*(id *)(a1 + 32) updateTimer:v6];
  }
  else
  {
    uint64_t v9 = MTLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_11A84((uint64_t)WeakRetained, v9);
    }

    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    CFStringRef v14 = @"No existing timer to cancel";
    id v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v6 = +[NSError errorWithDomain:@"com.apple.mobiletimer.SATimerCancel" code:1 userInfo:v10];

    uint64_t v8 = +[NAFuture futureWithError:v6];
  }
  __int16 v11 = (void *)v8;

  return v11;
}

void sub_DA94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = WeakRetained;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ cancel timer succeeded", (uint8_t *)&v7, 0xCu);
  }

  id v4 = objc_alloc_init((Class)SATimerCancelCompleted);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_DB7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_11AFC((uint64_t)WeakRetained, (uint64_t)v3, v5);
  }

  id v6 = objc_alloc_init((Class)SACommandFailed);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_E134(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_E164(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_E174(uint64_t a1)
{
}

id sub_E17C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v60 = v5;
    __int16 v61 = 2114;
    id v62 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ timer fetch completed with timers: %{public}@", buf, 0x16u);
  }

  id v6 = [objc_alloc((Class)NSSet) initWithArray:*(void *)(a1 + 40)];
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v8 = v3;
  uint64_t v9 = v7;
  id obj = v8;
  id v10 = [v8 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v52;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        id v15 = [v14 timerURL];
        unsigned int v16 = [v6 containsObject:v15];

        if (v16) {
          [v9 addObject:v14];
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v11);
  }

  id v17 = [v9 count];
  id v18 = MTLogForCategory();
  long long v19 = v18;
  if (v17)
  {
    id v41 = v6;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v60 = v20;
      __int16 v61 = 2114;
      id v62 = v9;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ found timers to dismiss: %{public}@", buf, 0x16u);
    }

    id v21 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v17];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v40 = v9;
    id v42 = v9;
    id v22 = [v42 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v48;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v48 != v24) {
            objc_enumerationMutation(v42);
          }
          long long v26 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
          NSErrorUserInfoKey v27 = MTLogForCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v28 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138543618;
            uint64_t v60 = v28;
            __int16 v61 = 2114;
            id v62 = v26;
            _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing timer: %{public}@", buf, 0x16u);
          }

          v29 = *(void **)(a1 + 56);
          id v30 = [v26 timerID];
          id v31 = [v30 UUIDString];
          BOOL v32 = [v29 dismissTimerWithIdentifier:v31];

          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_E740;
          v44[3] = &unk_18428;
          id v45 = *(id *)(a1 + 48);
          long long v46 = v26;
          id v33 = [v32 addCompletionBlock:v44];
          [v21 addObject:v32];
        }
        id v23 = [v42 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v23);
    }

    long long v34 = MTLogForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = *(void *)(a1 + 48);
      id v36 = [v21 count];
      *(_DWORD *)buf = 138543618;
      uint64_t v60 = v35;
      __int16 v61 = 2048;
      id v62 = v36;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ combining dismiss futures. Count: %tu", buf, 0x16u);
    }

    long long v37 = +[MTScheduler globalAsyncSchedulerWithPriority:](MTScheduler, "globalAsyncSchedulerWithPriority:", +[MTScheduler defaultPriority]);
    id v38 = +[NAFuture combineAllFutures:v21 ignoringErrors:0 scheduler:v37];
    uint64_t v9 = v40;
    id v6 = v41;
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_11D54(a1, v19);
    }

    NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
    CFStringRef v57 = @"No timer matches the timer IDs.";
    id v21 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    long long v37 = +[NSError errorWithDomain:@"com.apple.mobiletimer.SATimerDismiss" code:2 userInfo:v21];
    id v38 = +[NAFuture futureWithError:v37];
  }

  return v38;
}

void sub_E740(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_11DD0(a1, (uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ dismiss timer %{public}@ succeeded", (uint8_t *)&v9, 0x16u);
  }
}

void sub_E830(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "na_firstObjectPassingTest:", &stru_18910);
  id v4 = MTLogForCategory();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_11E64();
    }

    id v6 = objc_alloc((Class)SACommandFailed);
    uint64_t v7 = [v3 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:NSLocalizedDescriptionKey];
    id v9 = [v6 initWithReason:v8];

    objc_msgSend(v9, "setErrorCode:", objc_msgSend(v3, "code"));
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v15 = 138543362;
      uint64_t v16 = v12;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ combined timer dismiss future succeeded", (uint8_t *)&v15, 0xCu);
    }

    id v13 = objc_alloc_init((Class)SACommandSucceeded);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v11 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

BOOL sub_E9D0(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_EA1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_11E64();
  }

  id v5 = objc_alloc((Class)SACommandFailed);
  id v6 = [v3 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:NSLocalizedDescriptionKey];
  id v8 = [v5 initWithReason:v7];

  objc_msgSend(v8, "setErrorCode:", objc_msgSend(v3, "code"));
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
  id v11 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_EFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location)
{
  objc_destroyWeak(v40);
  objc_destroyWeak(v39);
  objc_destroyWeak(v38);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v41 - 160), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_F04C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_F05C(uint64_t a1)
{
}

id sub_F064(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = WeakRetained;
    __int16 v20 = 2114;
    id v21 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ timer fetch completed with timer: %{public}@", buf, 0x16u);
  }

  if (v3)
  {
    uint64_t v6 = [v3 timerByUpdatingWithState:2];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = MTLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      id v19 = WeakRetained;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ pausing timer: %{public}@", buf, 0x16u);
    }

    id v11 = [*(id *)(a1 + 32) updateTimer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  else
  {
    uint64_t v12 = MTLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_120A0((uint64_t)WeakRetained, v12);
    }

    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    CFStringRef v17 = @"No existing timer to pause";
    id v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v14 = +[NSError errorWithDomain:@"com.apple.mobiletimer.SATimerPause" code:1 userInfo:v13];

    id v11 = +[NAFuture futureWithError:v14];
  }

  return v11;
}

void sub_F2B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = WeakRetained;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ pause timer succeeded", (uint8_t *)&v9, 0xCu);
  }

  id v4 = objc_alloc_init((Class)SATimerPauseCompleted);
  if ([WeakRetained requiresResponse])
  {
    id v5 = SATimerObjectForMTTimer(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    [v4 setTimer:v5];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;
  id v8 = v4;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_F3E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_12118((uint64_t)WeakRetained, (uint64_t)v3, v5);
  }

  id v6 = objc_alloc_init((Class)SACommandFailed);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id SATimerObjectForMTTimer(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)SATimerObject);
  switch((unint64_t)[v1 state])
  {
    case 0uLL:
    case 4uLL:
      NSLog(@"Unexpected timer state %ld", [v1 state]);
      [v2 setState:SATimerStateUndefinedValue];
      [v2 setTimerValue:&off_18E60];
      break;
    case 1uLL:
      id v3 = &SATimerStateStoppedValue;
      goto LABEL_6;
    case 2uLL:
      id v3 = &SATimerStatePausedValue;
      goto LABEL_6;
    case 3uLL:
      id v3 = &SATimerStateRunningValue;
LABEL_6:
      [v2 setState:*v3];
      [v1 remainingTime];
      id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v2 setTimerValue:v4];

      break;
    default:
      break;
  }
  id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 isFiring]);
  [v2 setIsFiring:v5];

  return v2;
}

void sub_FAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location)
{
  objc_destroyWeak(v40);
  objc_destroyWeak(v39);
  objc_destroyWeak(v38);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v41 - 160), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_FB28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_FB38(uint64_t a1)
{
}

id sub_FB40(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = WeakRetained;
    __int16 v20 = 2114;
    id v21 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ timer fetch completed with timer: %{public}@", buf, 0x16u);
  }

  if (v3)
  {
    uint64_t v6 = [v3 timerByUpdatingWithState:3];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    int v9 = MTLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      id v19 = WeakRetained;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming timer: %{public}@", buf, 0x16u);
    }

    id v11 = [*(id *)(a1 + 32) updateTimer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  else
  {
    uint64_t v12 = MTLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_12370((uint64_t)WeakRetained, v12);
    }

    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    CFStringRef v17 = @"No existing timer to resume";
    id v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v14 = +[NSError errorWithDomain:@"com.apple.mobiletimer.SATimerResume" code:1 userInfo:v13];

    id v11 = +[NAFuture futureWithError:v14];
  }

  return v11;
}

void sub_FD94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = WeakRetained;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resume timer succeeded", (uint8_t *)&v9, 0xCu);
  }

  id v4 = objc_alloc_init((Class)SATimerResumeCompleted);
  if ([WeakRetained requiresResponse])
  {
    id v5 = SATimerObjectForMTTimer(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    [v4 setTimer:v5];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;
  id v8 = v4;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_FEC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_123E8((uint64_t)WeakRetained, (uint64_t)v3, v5);
  }

  id v6 = objc_alloc_init((Class)SACommandFailed);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_FF60(os_log_t log)
{
  int v1 = 136315138;
  id v2 = "-[MobileTimerAssistantAlarmDismiss performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== exiting %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_FFE4(os_log_t log)
{
  int v1 = 136315138;
  id v2 = "-[MobileTimerAssistantAlarmDismiss performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_10068(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ did call completion handler with %@", v4, 0x20u);
}

void sub_100CC(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ will call completion handler with %@", v4, 0x20u);
}

void sub_10130(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ found no alarms to dismiss", (uint8_t *)&v3, 0xCu);
}

void sub_101AC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ dismiss alarm %{public}@ failed with error: %{public}@", (uint8_t *)&v5, 0x20u);
}

void sub_10240()
{
  sub_4DCC();
  sub_4DE4(&dword_0, v0, v1, "%{public}@ combined alarm dismiss future failed with error: %{public}@");
}

void sub_102AC(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantAlarmSnooze performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== exiting %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_10330(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantAlarmSnooze performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_103B4(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ did call completion handler with %@", v4, 0x20u);
}

void sub_10418(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ will call completion handler with %@", v4, 0x20u);
}

void sub_1047C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ found no alarms to snooze", (uint8_t *)&v3, 0xCu);
}

void sub_104F8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ snooze alarm %{public}@ failed with error: %{public}@", (uint8_t *)&v5, 0x20u);
}

void sub_1058C()
{
  sub_4DCC();
  sub_4DE4(&dword_0, v0, v1, "%{public}@ combined alarm snooze future failed with error: %{public}@");
}

void sub_105F8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantAlarmCreate performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== exiting %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_1067C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantAlarmCreate performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_10700(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ did call completion handler with %@", v4, 0x20u);
}

void sub_10764(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ will call completion handler with %@", v4, 0x20u);
}

void sub_107C8()
{
  sub_69E8();
  sub_4DE4(&dword_0, v0, v1, "%{public}@ alarm create failed: %{public}@");
}

void sub_10830()
{
  sub_69E8();
  sub_4DE4(&dword_0, v0, v1, "%{public}@ create alarm failed with error: %{public}@");
}

void sub_10898(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantTimerSet performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== exiting %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_1091C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantTimerSet performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_109A0(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ did call completion handler with %@", v4, 0x20u);
}

void sub_10A04(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ will call completion handler with %@", v4, 0x20u);
}

void sub_10A68(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ timer set failed: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_10AF0(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantAlarmUpdate performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== exiting %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_10B74(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantAlarmUpdate performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_10BF8(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ did call completion handler with %@", v4, 0x20u);
}

void sub_10C5C(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ will call completion handler with %@", v4, 0x20u);
}

void sub_10CC0()
{
  sub_69E8();
  sub_4DE4(&dword_0, v0, v1, "%{public}@ alarm update failed: %{public}@");
}

void sub_10D28()
{
  sub_69E8();
  sub_4DE4(&dword_0, v0, v1, "%{public}@ alarm update failed with error: %{public}@");
}

void sub_10D90(uint64_t a1, NSObject *a2)
{
  int v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 alarmId];
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ no alarm found with alarmIDURL: %{public}@", (uint8_t *)&v5, 0x16u);
}

void sub_10E44(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantAlarmSearch performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== exiting %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_10EC8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantAlarmSearch performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_10F4C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ alarm search failed: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_10FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)a2 + 8) + 40) dictionary];
  sub_A72C();
  sub_A74C(&dword_0, v3, v4, "%s %{public}@ did call completion handler with %@", v5, v6, v7, v8, 2u);
}

void sub_1107C(uint64_t a1)
{
  int v1 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) dictionary];
  sub_A72C();
  sub_A74C(&dword_0, v2, v3, "%s %{public}@ will call completion handler with %@", v4, v5, v6, v7, 2u);
}

void sub_11124(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantTimerGet performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== exiting %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_111A8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantTimerGet performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_1122C(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ did call completion handler with %@", v4, 0x20u);
}

void sub_11290(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ will call completion handler with %@", v4, 0x20u);
}

void sub_112F4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ timer fetch failed with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1137C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantAlarmDelete performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== exiting %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_11400(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantAlarmDelete performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_11484(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ did call completion handler with %@", v4, 0x20u);
}

void sub_114E8(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ will call completion handler with %@", v4, 0x20u);
}

void sub_1154C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ found no alarms to delete", (uint8_t *)&v2, 0xCu);
}

void sub_115C4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ combined alarm delete future failed with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1164C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_D358(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
}

void sub_116C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_D358(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
}

void sub_1173C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_D358(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
}

void sub_117B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_D358(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
}

void sub_1182C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ alarm fetch failed with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_118B4(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[MobileTimerAssistantTimerCancel performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== exiting %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_11938(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[MobileTimerAssistantTimerCancel performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_119BC(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ did call completion handler with %@", v4, 0x20u);
}

void sub_11A20(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ will call completion handler with %@", v4, 0x20u);
}

void sub_11A84(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ No existing timer to cancel", (uint8_t *)&v2, 0xCu);
}

void sub_11AFC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ cancel timer failed with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_11B84(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[MobileTimerAssistantTimerDismiss performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== exiting %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_11C08(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[MobileTimerAssistantTimerDismiss performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_11C8C(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ did call completion handler with %@", v4, 0x20u);
}

void sub_11CF0(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ will call completion handler with %@", v4, 0x20u);
}

void sub_11D54(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ found no timers to dismiss", (uint8_t *)&v3, 0xCu);
}

void sub_11DD0(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ dismiss timer %{public}@ failed with error: %{public}@", (uint8_t *)&v5, 0x20u);
}

void sub_11E64()
{
  sub_4DCC();
  sub_4DE4(&dword_0, v0, v1, "%{public}@ combined timer dismiss future failed with error: %{public}@");
}

void sub_11ED0(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantTimerPause performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== exiting %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_11F54(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MobileTimerAssistantTimerPause performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_11FD8(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ did call completion handler with %@", v4, 0x20u);
}

void sub_1203C(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ will call completion handler with %@", v4, 0x20u);
}

void sub_120A0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ No existing timer to pause", (uint8_t *)&v2, 0xCu);
}

void sub_12118(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ pause timer failed with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_121A0(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[MobileTimerAssistantTimerResume performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== exiting %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_12224(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[MobileTimerAssistantTimerResume performWithCompletion:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "===== %s =====", (uint8_t *)&v1, 0xCu);
}

void sub_122A8(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ did call completion handler with %@", v4, 0x20u);
}

void sub_1230C(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_4DAC(a1, (uint64_t)a2, (uint64_t)a3);
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@ will call completion handler with %@", v4, 0x20u);
}

void sub_12370(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ No existing timer to resumt", (uint8_t *)&v2, 0xCu);
}

void sub_123E8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ resume timer failed with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

uint64_t MTAlarmRepeatScheduleEnumerateDays()
{
  return _MTAlarmRepeatScheduleEnumerateDays();
}

uint64_t MTLogForCategory()
{
  return _MTLogForCategory();
}

uint64_t MTNilify()
{
  return _MTNilify();
}

uint64_t MTShouldHandleForEucalyptus()
{
  return _MTShouldHandleForEucalyptus();
}

void NSLog(NSString *format, ...)
{
}

uint64_t SAAlarmDayOfWeekForString()
{
  return _SAAlarmDayOfWeekForString();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

uint64_t stringForSAAlarmDayOfWeek()
{
  return _stringForSAAlarmDayOfWeek();
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__alarmManager(void *a1, const char *a2, ...)
{
  return [a1 _alarmManager];
}

id objc_msgSend__timerManager(void *a1, const char *a2, ...)
{
  return [a1 _timerManager];
}

id objc_msgSend_addedFrequency(void *a1, const char *a2, ...)
{
  return [a1 addedFrequency];
}

id objc_msgSend_alarmIDString(void *a1, const char *a2, ...)
{
  return [a1 alarmIDString];
}

id objc_msgSend_alarmId(void *a1, const char *a2, ...)
{
  return [a1 alarmId];
}

id objc_msgSend_alarmIds(void *a1, const char *a2, ...)
{
  return [a1 alarmIds];
}

id objc_msgSend_alarmToCreate(void *a1, const char *a2, ...)
{
  return [a1 alarmToCreate];
}

id objc_msgSend_alarmURL(void *a1, const char *a2, ...)
{
  return [a1 alarmURL];
}

id objc_msgSend_alarms(void *a1, const char *a2, ...)
{
  return [a1 alarms];
}

id objc_msgSend_bedtimeHour(void *a1, const char *a2, ...)
{
  return [a1 bedtimeHour];
}

id objc_msgSend_bedtimeMinute(void *a1, const char *a2, ...)
{
  return [a1 bedtimeMinute];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentTimer(void *a1, const char *a2, ...)
{
  return [a1 currentTimer];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_defaultPriority(void *a1, const char *a2, ...)
{
  return [a1 defaultPriority];
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeZone];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayTitle(void *a1, const char *a2, ...)
{
  return [a1 displayTitle];
}

id objc_msgSend_domainObjects(void *a1, const char *a2, ...)
{
  return [a1 domainObjects];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_finalAnchor(void *a1, const char *a2, ...)
{
  return [a1 finalAnchor];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return [a1 frequency];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_includesSleepAlarms(void *a1, const char *a2, ...)
{
  return [a1 includesSleepAlarms];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isFiring(void *a1, const char *a2, ...)
{
  return [a1 isFiring];
}

id objc_msgSend_isSilent(void *a1, const char *a2, ...)
{
  return [a1 isSilent];
}

id objc_msgSend_isSingleTimeAlarm(void *a1, const char *a2, ...)
{
  return [a1 isSingleTimeAlarm];
}

id objc_msgSend_isSleepAlarm(void *a1, const char *a2, ...)
{
  return [a1 isSleepAlarm];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_modifications(void *a1, const char *a2, ...)
{
  return [a1 modifications];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nextSleepAlarm(void *a1, const char *a2, ...)
{
  return [a1 nextSleepAlarm];
}

id objc_msgSend_postAnchors(void *a1, const char *a2, ...)
{
  return [a1 postAnchors];
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 punctuationCharacterSet];
}

id objc_msgSend_relativeOffsetMinutes(void *a1, const char *a2, ...)
{
  return [a1 relativeOffsetMinutes];
}

id objc_msgSend_remainingTime(void *a1, const char *a2, ...)
{
  return [a1 remainingTime];
}

id objc_msgSend_removedFrequency(void *a1, const char *a2, ...)
{
  return [a1 removedFrequency];
}

id objc_msgSend_repeatSchedule(void *a1, const char *a2, ...)
{
  return [a1 repeatSchedule];
}

id objc_msgSend_requiresResponse(void *a1, const char *a2, ...)
{
  return [a1 requiresResponse];
}

id objc_msgSend_sanitizedAlarmLabelForComparison(void *a1, const char *a2, ...)
{
  return [a1 sanitizedAlarmLabelForComparison];
}

id objc_msgSend_sharedToneManager(void *a1, const char *a2, ...)
{
  return [a1 sharedToneManager];
}

id objc_msgSend_sound(void *a1, const char *a2, ...)
{
  return [a1 sound];
}

id objc_msgSend_soundVolume(void *a1, const char *a2, ...)
{
  return [a1 soundVolume];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stopCurrentTimer(void *a1, const char *a2, ...)
{
  return [a1 stopCurrentTimer];
}

id objc_msgSend_syncDidEnd(void *a1, const char *a2, ...)
{
  return [a1 syncDidEnd];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return [a1 timer];
}

id objc_msgSend_timerID(void *a1, const char *a2, ...)
{
  return [a1 timerID];
}

id objc_msgSend_timerIds(void *a1, const char *a2, ...)
{
  return [a1 timerIds];
}

id objc_msgSend_timerURL(void *a1, const char *a2, ...)
{
  return [a1 timerURL];
}

id objc_msgSend_timerValue(void *a1, const char *a2, ...)
{
  return [a1 timerValue];
}

id objc_msgSend_timers(void *a1, const char *a2, ...)
{
  return [a1 timers];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_validateCommandArguments(void *a1, const char *a2, ...)
{
  return [a1 validateCommandArguments];
}

id objc_msgSend_vibrationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 vibrationIdentifier];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}