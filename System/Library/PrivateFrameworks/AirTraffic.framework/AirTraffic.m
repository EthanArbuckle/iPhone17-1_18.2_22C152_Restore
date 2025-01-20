os_log_t _ATLogCategoryFramework()
{
  os_log_t v0;
  uint64_t vars8;

  v0 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  return v0;
}

void sub_2164B2C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v16 - 128));
  _Unwind_Resume(a1);
}

os_log_t _ATLogCategoryXPC()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  return v0;
}

void *__Copy(void *a1, uint64_t a2, void *a3)
{
  v5 = a1;
  v6 = objc_msgSend((id)objc_msgSend(a3, "allocWithZone:", a2), "init");
  if (v6)
  {
    uint64_t v7 = [v5[1] copyWithZone:a2];
    v8 = (void *)v6[1];
    v6[1] = v7;

    uint64_t v9 = [v5[2] copyWithZone:a2];
    v10 = (void *)v6[2];
    v6[2] = v9;

    uint64_t v11 = [v5[3] copyWithZone:a2];
    v12 = (void *)v6[3];
    v6[3] = v11;
  }
  return v6;
}

void sub_2164B3680(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2164B39DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2164B3C28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2164B3DA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2164B438C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2164B463C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2164B4850(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2164B4A64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2164B4D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ATStringWithArray(void *a1)
{
  id v1 = a1;
  v2 = [MEMORY[0x263F089D8] stringWithString:@"["];
  v3 = [v1 objectEnumerator];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      if ([v2 length] != 1) {
        [v2 appendString:@", "];
      }
      v6 = [v5 description];
      [v2 appendString:v6];

      uint64_t v7 = [v3 nextObject];

      v5 = (void *)v7;
    }
    while (v7);
  }
  [v2 appendString:@"]"];

  return v2;
}

unint64_t ATGetPhysicalSizeForLogicalSize(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = __blockMask;
  if (!__blockMask)
  {
    memset(&v6, 0, 512);
    if (statfs((const char *)[@"/var/mobile/Media/" UTF8String], &v6))
    {
      v3 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_DEFAULT, "Could not determine system block size", v5, 2u);
      }

      uint64_t v2 = 4095;
    }
    else
    {
      uint64_t v2 = v6.f_bsize - 1;
    }
    __blockMask = v2;
  }
  return ~v2 & (unint64_t)(v2 + a1);
}

uint64_t ATGetDiskUsageForPath(void *a1)
{
  return ATGetUsageForPath(a1, 0);
}

uint64_t ATGetUsageForPath(void *a1, _DWORD *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    [v5 UTF8String];
    if (dirstat_np() == -1)
    {
      statfs v6 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = __error();
        v8 = strerror(*v7);
        *(_DWORD *)buf = 138543618;
        id v11 = v5;
        __int16 v12 = 2080;
        v13 = v8;
        _os_log_impl(&dword_2164B1000, v6, OS_LOG_TYPE_ERROR, "ATGetUsageForPath encountered error. path=%{public}@ err=%s", buf, 0x16u);
      }
    }
    else if (a2)
    {
      *a2 = 0;
    }
  }

  return 0;
}

uint64_t ATGetLibrarianDocumentUsage(int a1, int a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  id v44 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v32 = MEMORY[0x263EF8330];
  uint64_t v33 = 3221225472;
  v34 = __ATGetLibrarianDocumentUsage_block_invoke;
  v35 = &unk_264280D20;
  v37 = &v39;
  v38 = &v45;
  dispatch_semaphore_t v36 = v3;
  BRGetTotalApplicationDocumentUsage();
  dispatch_semaphore_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
  if (!v40[5])
  {
    objc_msgSend((id)v46[5], "description", v36);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v53 = obj;
      _os_log_impl(&dword_2164B1000, v19, OS_LOG_TYPE_DEFAULT, "no usage info. err=%{public}@", buf, 0xCu);
    }

    goto LABEL_20;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = (id)v40[5];
  uint64_t v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v51, 16, v36);
  if (!v4)
  {
LABEL_20:
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    goto LABEL_21;
  }
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v5 = *(void *)v29;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v29 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void *)(*((void *)&v28 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v7];
        uint64_t v9 = [v8 applicationType];
        int v10 = [v9 isEqualToString:@"User"];

        if (v10) {
          int v11 = a1;
        }
        else {
          int v11 = a2;
        }
        if (v11 == 1)
        {
          __int16 v12 = [v8 bundleIdentifier];
          v13 = [(id)v40[5] objectForKey:v12];
          uint64_t v14 = [v13 valueForKey:@"Total Size"];
          uint64_t v15 = [v14 unsignedLongLongValue];

          unint64_t v16 = ATGetPhysicalSizeForLogicalSize(v15);
          v17 = [v13 valueForKey:@"Document Count"];
          uint64_t v18 = [v17 unsignedLongLongValue];

          v26 += v16;
          v25 += v18;
        }
      }
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v51 count:16];
  }
  while (v4);
LABEL_21:

  if (a3) {
    *a3 = v25;
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v26;
}

void sub_2164B5994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __ATGetLibrarianDocumentUsage_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t ATIsRecoverableError(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 domain];
  unint64_t v3 = [v1 code];

  if ([v2 isEqualToString:@"ATError"])
  {
    if (v3 >= 0x1A) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = (0x3154390u >> v3) & 1;
    }
  }
  else
  {
    unsigned int v5 = [v2 isEqualToString:*MEMORY[0x263F08570]] ^ 1;
    if (v3 == -1100) {
      uint64_t v4 = v5;
    }
    else {
      uint64_t v4 = 1;
    }
  }

  return v4;
}

void ATReportEventIncrementingScalarKey(void *a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = countKeyForScalarReportingEvent(v1);
  unint64_t v3 = (void *)v2;
  if (v1)
  {
    uint64_t v12 = v2;
    v13[0] = &unk_26C7137B8;
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    AnalyticsSendEvent();
    unsigned int v5 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      uint64_t v9 = v4;
      __int16 v10 = 2114;
      id v11 = v1;
      _os_log_impl(&dword_2164B1000, v5, OS_LOG_TYPE_DEFAULT, "Reporting payload=%{public}@ for %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"void ATReportEventIncrementingScalarKey(NSString *__strong)"];
    [v6 handleFailureInFunction:v7 file:@"ATReporting.m" lineNumber:144 description:@"unable to find reporting key"];

    uint64_t v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      uint64_t v9 = 0;
      _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_DEFAULT, "Could not find reporting key for %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

id countKeyForScalarReportingEvent(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (countKeyForScalarReportingEvent_onceToken == -1)
  {
    if (v1)
    {
LABEL_3:
      unint64_t v3 = [(id)countKeyForScalarReportingEvent_eventKeyToReportingEventMap objectForKey:v2];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&countKeyForScalarReportingEvent_onceToken, &__block_literal_global);
    if (v2) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
LABEL_6:

  return v3;
}

uint64_t __countKeyForScalarReportingEvent_block_invoke()
{
  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"ids_wakeupdelivery", @"com.apple.atc.ids.wakeupdelivery", @"ids_wakeupattempt", @"com.apple.atc.ids.wakeupattempt", @"ids_wakeupfailure", @"com.apple.atc.ids.wakeupfailure", @"ids_wakeuptimeout", @"com.apple.atc.ids.wakeuptimeout", @"storedownload_duration", @"com.apple.atc.storedownload.duration", @"storedownload_cancelled", @"com.apple.atc.storedownload.cancelled", @"storedownload_authfailure", @"com.apple.atc.storedownload.authfailure", @"storedownload_networkfailure", @"com.apple.atc.storedownload.connectivityfailure", @"storedownload_failure",
    @"com.apple.atc.storedownload.failure",
    @"storedownload_success",
    @"com.apple.atc.storedownload.success",
    @"storedownload_attempt",
    @"com.apple.atc.storedownload.attempt",
    @"asset_attempt",
    @"com.apple.atc.asset.attempt",
    @"asset_success",
    @"com.apple.atc.asset.success",
    @"asset_failure",
    @"com.apple.atc.asset.failure",
    @"asset_cancelled",
    @"com.apple.atc.asset.cancelled",
    @"itunessync_attempt",
    @"com.apple.atc.sync_attempt",
    @"itunessync_success",
    @"com.apple.atc.sync_success",
    @"itunessync_failure",
    @"com.apple.atc.sync_failure",
    @"devicesync_attempt",
    @"com.apple.atc.devicesync.attempt",
    @"devicesync_success",
    @"com.apple.atc.devicesync.success",
    @"devicesync_failure",
    @"com.apple.atc.devicesync.failed",
    @"devicesync_linkinitialize",
    @"com.apple.atc.devicesync.linkinitialize",
    @"com.apple.atc.sync.device.initial_delay",
    @"com.apple.atc.devicesync.initialsyncdelay",
    @"devicesync_smallreconcilerate",
    @"com.apple.atc.devicesync.smallreconcilerate",
    @"devicesync_largereconcilerate",
    @"com.apple.atc.devicesync.largereconcilerate",
    @"devicesync_smallassetrate",
    @"com.apple.atc.devicesync.smallassetrate",
    @"devicesync_largeassetrate",
    @"devicesync_largeassetrate",
    @"devicesync_assetcount",
    @"com.apple.atc.devicesync.assetcount",
    @"devicesync_assetsize",
    @"com.apple.atc.devicesync.assetsize",
  countKeyForScalarReportingEvent_eventKeyToReportingEventMap = 0);
  return MEMORY[0x270F9A758]();
}

void ATReportEventAddDoubleToScalarKey(void *a1, double a2)
{
  unint64_t v3 = NSNumber;
  id v4 = a1;
  id v5 = [v3 numberWithDouble:a2];
  ATReportEventAddValueToScalarKey(v4, v5);
}

void ATReportEventAddValueToScalarKey(void *a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = a1;
  id v4 = a2;
  if (v3)
  {
    uint64_t v5 = countKeyForScalarReportingEvent(v3);
    id v6 = (void *)v5;
    if (v5)
    {
      uint64_t v13 = v5;
      v14[0] = v4;
      uint64_t v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      AnalyticsSendEvent();
      int v8 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543618;
        __int16 v10 = v7;
        __int16 v11 = 2114;
        uint64_t v12 = v3;
        _os_log_impl(&dword_2164B1000, v8, OS_LOG_TYPE_DEFAULT, "Reporting payload=%{public}@ for %{public}@", (uint8_t *)&v9, 0x16u);
      }
    }
    else
    {
      uint64_t v7 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        __int16 v10 = v3;
        _os_log_impl(&dword_2164B1000, v7, OS_LOG_TYPE_DEFAULT, "Could not find reporting key for %{public}@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

void ATReportEventAddIntToScalarKey(void *a1, uint64_t a2)
{
  unint64_t v3 = NSNumber;
  id v4 = a1;
  id v5 = [v3 numberWithLongLong:a2];
  ATReportEventAddValueToScalarKey(v4, v5);
}

void sub_2164B6F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__199(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__200(uint64_t a1)
{
}

void sub_2164B732C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__277(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__278(uint64_t a1)
{
}

void sub_2164BB01C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2164BB32C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2164BB79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_2164BBCA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2164BC0AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2164BC4C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ATLogLevel()
{
  return 7;
}

void sub_2164BCAC4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__363(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__364(uint64_t a1)
{
}

os_log_t _ATLogCategoryDefault()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "Default");
  return v0;
}

os_log_t _ATLogCategoryDefault_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "Default_Oversize");
  return v0;
}

os_log_t _ATLogCategoryFramework_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "Framework_Oversize");
  return v0;
}

os_log_t _ATLogCategoryiTunesSync()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "iTunesSync");
  return v0;
}

os_log_t _ATLogCategoryiTunesSync_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "iTunesSync_Oversize");
  return v0;
}

os_log_t _ATLogCategoryDeviceSync()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "DeviceSync");
  return v0;
}

os_log_t _ATLogCategoryDeviceSync_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "DeviceSync_Oversize");
  return v0;
}

os_log_t _ATLogCategoryRestore()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "Restore");
  return v0;
}

os_log_t _ATLogCategoryRestore_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "Restore_Oversize");
  return v0;
}

os_log_t _ATLogCategoryStoreDownloads()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "StoreDownloads");
  return v0;
}

os_log_t _ATLogCategoryStoreDownloads_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "StoreDownloads_Oversize");
  return v0;
}

os_log_t _ATLogCategoryWakeUp()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "WakeUp");
  return v0;
}

os_log_t _ATLogCategoryWakeUp_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "WakeUp_Oversize");
  return v0;
}

os_log_t _ATLogCategorySettings()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "Settings");
  return v0;
}

os_log_t _ATLogCategorySettings_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "Settings_Oversize");
  return v0;
}

os_log_t _ATLogCategoryMigrator()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "Migrator");
  return v0;
}

os_log_t _ATLogCategoryMigrator_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "Migrator_Oversize");
  return v0;
}

os_log_t _ATLogCategorySyncBundle()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "SyncBundle");
  return v0;
}

os_log_t _ATLogCategorySyncBundle_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "SyncBundle_Oversize");
  return v0;
}

os_log_t _ATLogCategoryXPC_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "XPC_Oversize");
  return v0;
}

os_log_t _ATLogCategoryDeprecated()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "Deprecated");
  return v0;
}

os_log_t _ATLogCategoryDeprecated_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "Deprecated_Oversize");
  return v0;
}

os_log_t _ATLogCategoryAssetUtils()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "AssetUtils");
  return v0;
}

os_log_t _ATLogCategoryAssetUtils_Oversize()
{
  os_log_t v0 = os_log_create("com.apple.amp.AirTraffic", "AssetUtils_Oversize");
  return v0;
}

void sub_2164C0244(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_2164C34D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1186(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1187(uint64_t a1)
{
}

void sub_2164C3E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2164C42AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2164C45B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1249(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1250(uint64_t a1)
{
}

void sub_2164C48E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2164C4DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1399(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1400(uint64_t a1)
{
}

void sub_2164C7DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2164C80CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1679(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1680(uint64_t a1)
{
}

const char *_StringForXPCType(uint64_t a1)
{
  if (a1 == MEMORY[0x263EF86F0]) {
    return "XPC_TYPE_CONNECTION";
  }
  if (a1 == MEMORY[0x263EF8758]) {
    return "XPC_TYPE_NULL";
  }
  if (a1 == MEMORY[0x263EF86E0]) {
    return "XPC_TYPE_BOOL";
  }
  if (a1 == MEMORY[0x263EF8738]) {
    return "XPC_TYPE_INT64";
  }
  if (a1 == MEMORY[0x263EF87A0]) {
    return "XPC_TYPE_UINT64";
  }
  if (a1 == MEMORY[0x263EF8710]) {
    return "XPC_TYPE_DOUBLE";
  }
  if (a1 == MEMORY[0x263EF8700]) {
    return "XPC_TYPE_DATE";
  }
  if (a1 == MEMORY[0x263EF86F8]) {
    return "XPC_TYPE_DATA";
  }
  if (a1 == MEMORY[0x263EF8798]) {
    return "XPC_TYPE_STRING";
  }
  if (a1 == MEMORY[0x263EF87A8]) {
    return "XPC_TYPE_UUID";
  }
  if (a1 == MEMORY[0x263EF8728]) {
    return "XPC_TYPE_FD";
  }
  if (a1 == MEMORY[0x263EF8790]) {
    return "XPC_TYPE_SHMEM";
  }
  if (a1 == MEMORY[0x263EF86D8]) {
    return "XPC_TYPE_ARRAY";
  }
  if (a1 == MEMORY[0x263EF8708]) {
    return "XPC_TYPE_DICTIONARY";
  }
  if (a1 == MEMORY[0x263EF8720]) {
    return "XPC_TYPE_ERROR";
  }
  return "Unknown type";
}

void sub_2164C9BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2164C9F18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v7 - 112));
  objc_destroyWeak((id *)(v7 - 104));
  _Unwind_Resume(a1);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t BRGetTotalApplicationDocumentUsage()
{
  return MEMORY[0x270F16B40]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MSVDeviceIsWatch()
{
  return MEMORY[0x270F4A330]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x270F4A338]();
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x270EF2B78]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t dirstat_np()
{
  return MEMORY[0x270ED91A0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x270ED9518](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

void free(void *a1)
{
}

uint64_t lockdown_copy_checkin_info()
{
  return MEMORY[0x270F99B28]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

FILE *tmpfile(void)
{
  return (FILE *)MEMORY[0x270EDB958]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x270EDBE90](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}