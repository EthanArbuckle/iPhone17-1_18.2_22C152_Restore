void sub_100003194(id a1, AXManagedAssetTask *a2)
{
  [(AXManagedAssetTask *)a2 _cleanUnusedCompactResources];
}

id sub_100003648(uint64_t a1, void *a2)
{
  return _[a2 _refreshCatalog:*(unsigned __int8 *)(a1 + 32)];
}

void sub_100004510(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100004538(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = AXLogAssetDaemon();
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100014B88((uint64_t)v6, v10);
      }

      if ((uint64_t)[WeakRetained attemptCount] >= 10) {
        uint64_t v11 = 300;
      }
      else {
        uint64_t v11 = 60;
      }
      objc_msgSend(WeakRetained, "setAttemptCount:", (char *)objc_msgSend(WeakRetained, "attemptCount") + 1);
      v12 = AXLogAssetDaemon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [WeakRetained attemptCount]);
        v14 = +[NSNumber numberWithInteger:v11];
        *(_DWORD *)buf = 138412546;
        v24 = v13;
        __int16 v25 = 2112;
        v26 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "AXMigrateResTask: Mobile asset daemon was not ready on attempt %@, will try again in %@ seconds.", buf, 0x16u);
      }
      v15 = [WeakRetained timer];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000487C;
      v21[3] = &unk_1000207E8;
      objc_copyWeak(&v22, v7);
      [v15 afterDelay:v21 processBlock:(double)v11];

      objc_destroyWeak(&v22);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "AXMigrateResTask: Catalog found after force update. Will refresh cache for type: TTSAXResourceManagerTypeAccessibility", buf, 2u);
      }

      v16 = +[TTSAXResourceManager sharedInstance];
      id v17 = [v16 refreshResourcesCacheForManagerType:1];

      v18 = AXLogAssetDaemon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "AXMigrateResTask: Will attempt to download samples if neccessary", buf, 2u);
      }

      v19 = +[TTSAXResourceManager sharedInstance];
      [v19 downloadSamplesIfNecessary];

      v20 = AXLogAssetDaemon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "AXMigrateResTask: Will begin migration of Nashville to Maui", buf, 2u);
      }

      [WeakRetained _migrateNashvilleToMaui];
    }
  }
}

void sub_100004860(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000487C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _retryAndBackOff];
}

NSObject *sub_1000049A8()
{
  v0 = AXLogAssetDaemon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Installing SIGTERM handler.", v4, 2u);
  }

  signal(15, (void (__cdecl *)(int))1);
  v1 = dispatch_get_global_queue(2, 0);
  uint64_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v1);

  dispatch_source_set_event_handler(v2, &stru_100020850);
  dispatch_resume(v2);
  return v2;
}

void sub_100004A7C(id a1)
{
  v1 = AXLogAssetDaemon();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Received SIGTERM. Terminating now.", v2, 2u);
  }

  exit(15);
}

uint64_t start()
{
  v0 = AXLogAssetDaemon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = +[NSProcessInfo processInfo];
    uint64_t v2 = [v1 environment];
    v3 = [v2 objectForKey:@"MallocStackLogging"];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "axasstsd is starting up. MallocStackLogging=%@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v4 = sub_1000049A8();
  id v5 = (void *)qword_100027A38;
  qword_100027A38 = v4;

  id v6 = +[AXAssetsDaemon sharedInstance];
  v7 = +[AXImageCaptionModelAssetPolicy policy];
  v8 = +[AXManagedAsset assetWithPolicy:v7];
  v63[0] = v8;
  v9 = +[AXUltronModelAssetPolicy policy];
  v10 = +[AXManagedAsset assetWithPolicy:v9];
  v63[1] = v10;
  uint64_t v11 = +[AXTTSResourceAssetPolicy policy];
  v12 = +[AXManagedAsset assetWithPolicy:v11];
  v63[2] = v12;
  v13 = +[AXMagnifierAssetPolicy policy];
  v14 = +[AXManagedAsset assetWithPolicy:v13];
  v63[3] = v14;
  v15 = +[NSArray arrayWithObjects:v63 count:4];
  [v6 registerManagedAssets:v15];

  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  v16 = (unsigned int (*)(void))off_100027A40;
  v62 = off_100027A40;
  if (!off_100027A40)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v65 = sub_100005524;
    v66 = &unk_100020878;
    v67 = &v59;
    id v17 = (void *)sub_100005574();
    v18 = dlsym(v17, "AXDeviceSupportsBackTap");
    *(void *)(v67[1] + 24) = v18;
    off_100027A40 = *(_UNKNOWN **)(v67[1] + 24);
    v16 = (unsigned int (*)(void))v60[3];
  }
  _Block_object_dispose(&v59, 8);
  if (!v16) {
    goto LABEL_33;
  }
  if (v16())
  {
    v19 = +[AXPhoenixAssetPolicy policy];
    v20 = +[AXManagedAsset assetWithPolicy:v19];
    [v6 registerManagedAsset:v20];
  }
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  v21 = (unsigned int (*)(void))off_100027A50;
  v62 = off_100027A50;
  if (!off_100027A50)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v65 = sub_1000056E8;
    v66 = &unk_100020878;
    v67 = &v59;
    id v22 = (void *)sub_100005574();
    v23 = dlsym(v22, "AXDeviceSupportsVoiceTriggers");
    *(void *)(v67[1] + 24) = v23;
    off_100027A50 = *(_UNKNOWN **)(v67[1] + 24);
    v21 = (unsigned int (*)(void))v60[3];
  }
  _Block_object_dispose(&v59, 8);
  if (!v21)
  {
LABEL_33:
    sub_100014C00();
    __break(1u);
  }
  if (v21())
  {
    v24 = +[AXVoiceTriggerAssetPolicy policy];
    __int16 v25 = +[AXManagedAsset assetWithPolicy:v24];
    [v6 registerManagedAsset:v25];
  }
  v26 = +[NSProcessInfo processInfo];
  if ((unint64_t)[v26 physicalMemory] > 0x773593FF && AXRuntimeCheck_HasANE())
  {

LABEL_18:
    v26 = +[AXElementVisionModelAssetPolicy policy];
    v27 = +[AXManagedAsset assetWithPolicy:v26];
    [v6 registerManagedAsset:v27];
    goto LABEL_19;
  }
  v27 = +[NSProcessInfo processInfo];
  if ((unint64_t)[v27 physicalMemory] > 0x773593FF)
  {
    int v28 = AXRuntimeCheck_HasANE();

    if (!v28) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
LABEL_19:

LABEL_20:
  v29 = +[AXIconVisionModelAssetPolicy policy];
  v30 = +[AXManagedAsset assetWithPolicy:v29];
  [v6 registerManagedAsset:v30];

  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  v31 = (unsigned int (*)(void))off_100027A58;
  v62 = off_100027A58;
  if (!off_100027A58)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v65 = sub_100005738;
    v66 = &unk_100020878;
    v67 = &v59;
    v32 = (void *)sub_100005574();
    v33 = dlsym(v32, "AXDeviceSupportsAudiogramIngestion");
    *(void *)(v67[1] + 24) = v33;
    off_100027A58 = *(_UNKNOWN **)(v67[1] + 24);
    v31 = (unsigned int (*)(void))v60[3];
  }
  _Block_object_dispose(&v59, 8);
  if (!v31) {
    goto LABEL_33;
  }
  if (v31())
  {
    v34 = +[AXAudiogramIngestionAssetPolicy policy];
    v35 = +[AXManagedAsset assetWithPolicy:v34];
    [v6 registerManagedAsset:v35];
  }
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  v36 = (unsigned int (*)(void))off_100027A60;
  v62 = off_100027A60;
  if (!off_100027A60)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v65 = sub_100005788;
    v66 = &unk_100020878;
    v67 = &v59;
    v37 = (void *)sub_100005574();
    v38 = dlsym(v37, "AXDeviceSupportsComfortSounds");
    *(void *)(v67[1] + 24) = v38;
    off_100027A60 = *(_UNKNOWN **)(v67[1] + 24);
    v36 = (unsigned int (*)(void))v60[3];
  }
  _Block_object_dispose(&v59, 8);
  if (!v36) {
    goto LABEL_33;
  }
  if (v36())
  {
    v39 = +[AXComfortSoundsAssetPolicy policy];
    v40 = +[AXManagedAsset assetWithPolicy:v39];
    [v6 registerManagedAsset:v40];
  }
  id v41 = +[AXSimpleAssetTaskManager sharedInstance];
  v42 = +[AXSimpleAssetTaskManager sharedInstance];
  [v42 registerTask:objc_opt_class()];

  v43 = +[AXSimpleAssetTaskManager sharedInstance];
  [v43 registerTask:objc_opt_class()];

  v44 = +[AXSimpleAssetTaskManager sharedInstance];
  [v44 registerTask:objc_opt_class()];

  v45 = +[AXSimpleAssetTaskManager sharedInstance];
  [v45 registerTask:objc_opt_class()];

  v46 = +[AXSimpleAssetTaskManager sharedInstance];
  [v46 registerTask:objc_opt_class()];

  v47 = +[AXSimpleAssetTaskManager sharedInstance];
  [v47 registerTask:objc_opt_class()];

  v48 = +[AXSimpleAssetTaskManager sharedInstance];
  [v48 registerTask:objc_opt_class()];

  v49 = +[AXSimpleAssetTaskManager sharedInstance];
  [v49 registerTask:objc_opt_class()];

  v50 = +[AXSimpleAssetTaskManager sharedInstance];
  [v50 registerTask:objc_opt_class()];

  v51 = +[AXSimpleAssetTaskManager sharedInstance];
  [v51 registerTask:objc_opt_class()];

  v52 = +[AXSimpleAssetTaskManager sharedInstance];
  [v52 registerTask:objc_opt_class()];

  id v53 = [objc_alloc((Class)AXLaunchActivityPolicy) initWithLaunchActivityIdentifier:@"com.apple.ax.TTSResource.cleanse.LaunchActivity"];
  v54 = +[AXManagedAsset assetWithPolicy:v53];
  [v6 registerManagedAsset:v54];

  v55 = +[AXSimpleAssetTaskManager sharedInstance];
  [v55 start];

  v56 = AXLogAssetDaemon();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "axassetsd will begin servicing requests", (uint8_t *)&buf, 2u);
  }

  [v6 run];
  return 0;
}

void sub_1000054F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100005524(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100005574();
  result = dlsym(v2, "AXDeviceSupportsBackTap");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100027A40 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100005574()
{
  v3[0] = 0;
  if (!qword_100027A48)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100005674;
    v3[4] = &unk_1000208B0;
    v3[5] = v3;
    long long v4 = off_100020898;
    uint64_t v5 = 0;
    qword_100027A48 = _sl_dlopen();
  }
  uint64_t v0 = qword_100027A48;
  v1 = (void *)v3[0];
  if (!qword_100027A48)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100005674()
{
  uint64_t result = _sl_dlopen();
  qword_100027A48 = result;
  return result;
}

void *sub_1000056E8(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100005574();
  uint64_t result = dlsym(v2, "AXDeviceSupportsVoiceTriggers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100027A50 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100005738(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100005574();
  uint64_t result = dlsym(v2, "AXDeviceSupportsAudiogramIngestion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100027A58 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100005788(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100005574();
  uint64_t result = dlsym(v2, "AXDeviceSupportsComfortSounds");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100027A60 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100006558(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dequeueNextTask];
}

void sub_100006754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006778(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [[AXAssetsXPCActivity alloc] initWithActivity:v3];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [(AXAssetsXPCActivity *)v4 state];
  if (v6 == (id)2)
  {
    v9 = AXLogAssetDaemon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v14 = 138412546;
      v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "XPC Activity handler called. %@. Asset:%@", (uint8_t *)&v14, 0x16u);
    }

    [(AXAssetsXPCActivity *)v4 updateState:4];
    v7 = +[AXManagedAssetTaskContext contextWithActivity:v4];
    uint64_t v11 = [WeakRetained policy];
    v12 = [v11 launchActivityIdentifier];
    unsigned int v13 = [v12 isEqualToString:@"com.apple.ax.TTSResource.cleanse.LaunchActivity"];

    if (v13) {
      [WeakRetained enqueueCleanseUnusedCompactResourcesTaskWithContext:v7];
    }
    else {
      [WeakRetained enqueueAssetUpdateTaskWithContext:v7];
    }
  }
  else if (v6)
  {
    v7 = AXLogAssetDaemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100014C24((uint64_t)v4, a1, v7);
    }
  }
  else
  {
    v7 = AXLogAssetDaemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138412546;
      v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "XPC Activity handler called. %@. Asset:%@", (uint8_t *)&v14, 0x16u);
    }
  }
}

void sub_100006C1C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = AXLogAssetDaemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) policy];
    long long v4 = [v3 assetType];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(*(void *)(a1 + 32) + 24) count];
    int v8 = 138412802;
    v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[AXManagedAsset: %@]: enqeueing task: [%@]. Total queued: %lu", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(void *)(v7 + 32)) {
    dispatch_source_merge_data(*(dispatch_source_t *)(v7 + 16), 1uLL);
  }
}

void sub_100006E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006E50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006E60(uint64_t a1)
{
}

void sub_100006E68(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  if (v3)
  {
    objc_msgSend(v3, "removeObserver:forKeyPath:context:");
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if ([*(id *)(v2 + 24) count])
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndex:0];
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = v6;

    [*(id *)(*(void *)(a1 + 32) + 32) addObserver:*(void *)(a1 + 32) forKeyPath:@"finished" options:1 context:off_100027790];
    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectAtIndex:0];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  __int16 v10 = AXLogAssetDaemon();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      __int16 v12 = [*(id *)(a1 + 32) policy];
      id v13 = [v12 assetType];
      uint64_t v14 = *(void *)(a1 + 32);
      v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v16 = [*(id *)(v14 + 24) count];
      int v21 = 138412802;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v15;
      __int16 v25 = 2048;
      id v26 = v16;
      uint64_t v17 = "[AXManagedAsset: %@]: dequeuing next task: [%@]. Total queued: %lu";
      v18 = v10;
      uint32_t v19 = 32;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, v19);
    }
  }
  else if (v11)
  {
    __int16 v12 = [*(id *)(a1 + 32) policy];
    id v13 = [v12 assetType];
    id v20 = [*(id *)(*(void *)(a1 + 32) + 24) count];
    int v21 = 138412546;
    id v22 = v13;
    __int16 v23 = 2048;
    id v24 = v20;
    uint64_t v17 = "[AXManagedAsset: %@]: Did finish dequeueing all queued tasks. (confirming queue count: %lu)";
    v18 = v10;
    uint32_t v19 = 22;
    goto LABEL_10;
  }
}

void sub_100007FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008004(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008014(uint64_t a1)
{
}

void sub_10000801C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(v3, "ax_flatMappedArrayUsingBlock:", &stru_100020968);
    id v6 = [v5 mutableCopy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = AXLogAssetDaemon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)long long buf = 138412290;
    v44 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AXInformSiriSubsTask: Starting with voices: %@", buf, 0xCu);
  }

  if (*(unsigned char *)(a1 + 64))
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v11 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v12 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v38;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v17 = [v16 name];

          if (!v17)
          {
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObject:v16];
            goto LABEL_29;
          }
          if (AXSiriTTSSynthesisVoiceAssetsAreEqual())
          {
            char v18 = 1;
            goto LABEL_31;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
        char v18 = 0;
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
LABEL_29:
      char v18 = 0;
    }
LABEL_31:

    if ([*(id *)(a1 + 32) type] == (id)4 && (TTSSupportsNeuralVoices() & 1) == 0)
    {
      id v26 = AXLogAssetDaemon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100014CB0((uint64_t *)(a1 + 32), v26);
      }
    }
    else if ((v18 & 1) == 0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(a1 + 32)];
    }
  }
  else
  {
    uint32_t v19 = +[NSMutableArray array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v20 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v21 = (char *)[v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v34;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v20);
          }
          if (AXSiriTTSSynthesisVoiceAssetsAreEqual()) {
            [v19 addObject:*(void *)(a1 + 32)];
          }
        }
        id v22 = (char *)[v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v22);
    }

    __int16 v25 = AXLogAssetDaemon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      v44 = v19;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "AXInformSiriSubsTask: Removing siri auto download voice: %@", buf, 0xCu);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObjectsInArray:v19];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) enumerateObjectsUsingBlock:&stru_1000209A8];
  uint64_t v27 = *(void *)(a1 + 56);
  uint64_t v28 = *(void *)(*(void *)(v27 + 8) + 40);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100008520;
  v30[3] = &unk_1000209D0;
  uint64_t v32 = v27;
  v29 = *(void **)(a1 + 40);
  id v31 = *(id *)(a1 + 48);
  [v29 subscribeWithVoices:v28 reply:v30];
}

id sub_100008438(id a1, SiriTTSVoiceSubscription *a2)
{
  return [(SiriTTSVoiceSubscription *)a2 voice];
}

void sub_100008440(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = AXLogAssetDaemon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = +[NSNumber numberWithUnsignedInteger:a3];
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AXInformSiriSubsTask: Setting Siri auto-downloaded voice[%@]: %@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_100008520(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AXLogAssetDaemon();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v13 = 138412546;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AXInformSiriSubsTask: Unable to subscribe with voices %@. %@", (uint8_t *)&v13, 0x16u);
    }
    CFStringRef v7 = @"InformSiriVoiceSubscriptionsTaskFailure";
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v13 = 138412290;
      uint64_t v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AXInformSiriSubsTask: Subscribed with voices %@", (uint8_t *)&v13, 0xCu);
    }
    CFStringRef v7 = @"InformSiriVoiceSubscriptionsTaskSuccessful";
  }

  uint64_t v9 = +[AXAssetMetadataStore store];
  __int16 v10 = +[NSDate date];
  [v9 setValue:v10 forKey:v7 forAssetType:kAXTTSResourceAssetType];

  id v11 = AXLogAssetDaemon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "AXInformSiriSubsTask: Task finishing", (uint8_t *)&v13, 2u);
  }

  if (v3) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v12);
}

void sub_100009410(id a1)
{
  qword_100027A68 = objc_alloc_init(AXSimpleAssetTaskManager);
  _objc_release_x1();
}

void sub_10000964C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000966C(uint64_t a1, xpc_object_t xdict)
{
  id v3 = +[NSString stringWithCString:xpc_dictionary_get_string(xdict, _xpc_event_key_name) encoding:4];
  uint64_t v4 = AXLogAssetDaemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    CFStringRef v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Recieved notification %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([v3 isEqualToString:@"com.apple.mobile.keybagd.first_unlock"]) {
    [WeakRetained handleFirstUnlock];
  }
  [WeakRetained _handleNotification:v3];
}

void sub_1000099AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_sync_exit(v20);
  _Unwind_Resume(a1);
}

void sub_1000099F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[AXAssetsXPCActivity alloc] initWithActivity:v3];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [(AXAssetsXPCActivity *)v4 state];
  if (v6 == (id)2)
  {
    uint64_t v9 = AXLogAssetDaemon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v4;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "XPC Activity handler called. %@. Asset:%@", (uint8_t *)&v11, 0x16u);
    }

    [(AXAssetsXPCActivity *)v4 updateState:4];
    CFStringRef v7 = [*(id *)(a1 + 40) copy];
    [*(id *)(a1 + 40) setLaunchActivity:v4];
    [WeakRetained _handleXPCActivity:v7 taskClass:*(void *)(a1 + 56)];
  }
  else if (v6)
  {
    CFStringRef v7 = AXLogAssetDaemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100014C24((uint64_t)v4, a1, v7);
    }
  }
  else
  {
    CFStringRef v7 = AXLogAssetDaemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v4;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "XPC Activity handler called. %@. Asset:%@", (uint8_t *)&v11, 0x16u);
    }
  }
}

void sub_100009E84(uint64_t a1)
{
}

void sub_10000A0A4(uint64_t a1)
{
}

void sub_10000A530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000A714(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000AAC8(uint64_t a1)
{
  uint64_t v2 = AXLogAssetDaemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SmpTskMgr::Dispatching: %@", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) inflightTasks];
  [v4 addObject:*(void *)(a1 + 32)];

  BOOL v5 = [*(id *)(a1 + 40) _taskQueueForTask:objc_opt_class()];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AC24;
  block[3] = &unk_100020B20;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void **)(a1 + 48);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = v8;
  dispatch_async(v5, block);
}

void sub_10000AC24(uint64_t a1)
{
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_10000AF3C;
  v25[4] = sub_10000AF4C;
  dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
  uint64_t v2 = AXLogAssetDaemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v28 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SmpTskMgr::Running: %@", buf, 0xCu);
  }

  uint64_t v4 = *(void **)(a1 + 32);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000AF54;
  v22[3] = &unk_100020AF8;
  id v23 = v4;
  id v24 = v25;
  [v23 run:v22];
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10000B030;
  uint64_t v17 = &unk_100020B48;
  int v21 = v25;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  id v18 = v5;
  uint64_t v19 = v6;
  id v20 = v7;
  uint64_t v8 = objc_retainBlock(&v14);
  if (objc_msgSend((id)objc_opt_class(), "synchronous", v14, v15, v16, v17))
  {
    uint64_t v9 = AXLogAssetDaemon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SmpTskMgr::Executing synchronously and blocking group: %@", buf, 0xCu);
    }

    ((void (*)(void ***))v8[2])(v8);
  }
  else
  {
    uint64_t v11 = AXLogAssetDaemon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SmpTskMgr::Executing async and not blocking group: %@", buf, 0xCu);
    }

    __int16 v13 = [*(id *)(a1 + 40) taskCompletionWaitingQueue];
    dispatch_async(v13, v8);
  }
  _Block_object_dispose(v25, 8);
}

void sub_10000AF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000AF3C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000AF4C(uint64_t a1)
{
}

intptr_t sub_10000AF54(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setCompletionStatus:a2];
  uint64_t v4 = AXLogAssetDaemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 134218242;
    uint64_t v8 = a2;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SmpTskMgr::Finishing: Status=%ld Task:%@", (uint8_t *)&v7, 0x16u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10000B030(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = AXLogAssetDaemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SmpTskMgr::Completed: %@, executing post-task action", buf, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(*(id *)(a1 + 32), "didCompleteWithStatus:", objc_msgSend(*(id *)(a1 + 32), "completionStatus"));
  }
  uint64_t v4 = [*(id *)(a1 + 40) taskDispatcherQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B1A4;
  block[3] = &unk_100020B20;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  dispatch_sync(v4, block);
}

uint64_t sub_10000B1A4(uint64_t a1)
{
  uint64_t v2 = AXLogAssetDaemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SmpTskMgr::CleanUp: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) inflightTasks];
  [v4 removeObject:*(void *)(a1 + 32)];

  id v5 = +[AXAssetsDaemon sharedInstance];
  uint64_t v6 = [v5 activityTransactionManager];
  int v7 = [*(id *)(a1 + 32) description];
  [v6 simpleTaskFinished:v7];

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000B38C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) trigger];
  v1 = [v2 launchActivity];
  [v1 updateState:5];
}

void sub_10000CE4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  _Unwind_Resume(a1);
}

void sub_10000CE80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = AXLogAssetDaemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = [WeakRetained processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted from PID %d", (uint8_t *)v3, 8u);
  }

  [WeakRetained invalidate];
}

void sub_10000CF40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = AXLogAssetDaemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = [WeakRetained processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated from PID %d", (uint8_t *)v3, 8u);
  }
}

void sub_10000D37C(id a1)
{
  id v1 = [[AXAssetsDaemon alloc] _init];
  id v2 = (void *)qword_100027A78;
  qword_100027A78 = (uint64_t)v1;

  id v3 = +[TTSTraceServer shared];
}

void sub_10000D580(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_10000D5AC(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _refreshAssetCatalogForAssetType:v8 withOverrideTimeout:v7 forceCatalogRefresh:a4];
}

void sub_10000D62C(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateAssetForAssetType:v3];
}

uint64_t sub_10000DB60(uint64_t a1)
{
  id v2 = AXLogAssetDaemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Resetting TTSAXResourceManager caches and asset catalogs", buf, 2u);
  }

  id v3 = +[TTSAXResourceManager sharedInstance];
  [v3 resetResourcesCache];

  uint64_t v4 = +[TTSAXResourceManager sharedInstance];
  [v4 resetInMemoryAssetCatalogs];

  +[TTSAXResourceManager freeSharedInstance];
  +[TTSSynthesisProviderVoiceManager freeSharedInstance];
  id v5 = AXLogAssetDaemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Flushing CFPrefs caches", v7, 2u);
  }

  CFPreferencesFlushCaches();
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E398(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E3A8(uint64_t a1)
{
}

void sub_10000E3B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(v3, "ax_flatMappedArrayUsingBlock:", &stru_100020C58);
    id v6 = [v5 mutableCopy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  int v9 = AXLogAssetDaemon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)long long buf = 138412290;
    id v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "AXCleanupSiriSubsTask: Starting cleanup with voices: %@", buf, 0xCu);
  }

  id v11 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v17 type] == (id)1
          || [v17 type] == (id)4 && (TTSSupportsNeuralVoices() & 1) == 0)
        {
          [v11 addObject:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  id v18 = AXLogAssetDaemon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "AXCleanupSiriSubsTask: Removing unused Siri auto download voices: %@", buf, 0xCu);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeObjectsInArray:v11];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) enumerateObjectsUsingBlock:&stru_100020C78];
  uint64_t v19 = *(void *)(a1 + 48);
  uint64_t v20 = *(void *)(*(void *)(v19 + 8) + 40);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000E780;
  v22[3] = &unk_1000209D0;
  uint64_t v24 = v19;
  int v21 = *(void **)(a1 + 32);
  id v23 = *(id *)(a1 + 40);
  [v21 subscribeWithVoices:v20 reply:v22];
}

id sub_10000E698(id a1, SiriTTSVoiceSubscription *a2)
{
  return [(SiriTTSVoiceSubscription *)a2 voice];
}

void sub_10000E6A0(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = AXLogAssetDaemon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = +[NSNumber numberWithUnsignedInteger:a3];
    int v8 = 138412546;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AXCleanupSiriSubsTask: Setting Siri auto-downloaded voice[%@]: %@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_10000E780(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AXLogAssetDaemon();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (!v5) {
      goto LABEL_7;
    }
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v17 = 138412546;
    uint64_t v18 = v6;
    __int16 v19 = 2112;
    id v20 = v3;
    uint64_t v7 = "AXCleanupSiriSubsTask: Unable to subscribe with voices %@. %@";
    int v8 = v4;
    uint32_t v9 = 22;
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v17 = 138412290;
    uint64_t v18 = v10;
    uint64_t v7 = "AXCleanupSiriSubsTask: Subscribed with voices %@";
    int v8 = v4;
    uint32_t v9 = 12;
  }
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v17, v9);
LABEL_7:

  id v11 = AXLogAssetDaemon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "AXCleanupSiriSubsTask: Task finishing", (uint8_t *)&v17, 2u);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  if (v3) {
    CFStringRef v14 = @"CleanupSiriVoiceSubscriptionsTaskFailed";
  }
  else {
    CFStringRef v14 = @"CleanupSiriVoiceSubscriptionsTaskSuccess";
  }
  (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, v13);
  uint64_t v15 = +[AXAssetMetadataStore store];
  id v16 = +[NSDate date];
  [v15 setValue:v16 forKey:v14 forAssetType:kAXTTSResourceAssetType];
}

id sub_10000EAB8(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_queue_addActiveReason:", *(void *)(a1 + 40));
}

id sub_10000EB5C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_queue_removeActiveReason:", *(void *)(a1 + 40));
}

id sub_10000EED8(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_queue_handleInactiveTimerFired");
}

void sub_10000EFF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F014(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained[1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F09C;
  block[3] = &unk_100020A90;
  void block[4] = WeakRetained;
  dispatch_async(v2, block);
}

void sub_10000F09C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  id v3 = AXLogAssetDaemon();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AXATM: Delegate completed but active reason added while transitioning to idle. Keeping transaction alive", v5, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AXATM: Delegate completed and no new reason added. Will end os_transaction now", buf, 2u);
    }

    [*(id *)(a1 + 32) setTransaction:0];
  }
}

void sub_10000F2EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[AXAssetMetadataStore store];
  BOOL v5 = [*(id *)(a1 + 32) assetType];
  [v4 recordAssetRefreshEventForAssetType:v5];

  id v9 = v3;
  uint64_t v6 = +[AXAssetMetadataStore store];
  uint64_t v7 = [*(id *)(a1 + 32) assetType];
  int v8 = +[AXUpdateAssetTaskRestorationState restoreOrCreateStateFromStore:v6 assetType:v7];
  [v9 setRestorationState:v8];

  objc_msgSend(v9, "_housekeeping_op1_refreshAssets");
}

void sub_10000F5F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F624(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = WeakRetained;
  if (!v6)
  {
    if ([WeakRetained _deferIfNeeded]) {
      goto LABEL_16;
    }
    uint64_t v12 = [v8 policy];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v8 assetController];
      if ([v13 isAssetCatalogInstalled])
      {
        id v22 = [v5 firstObject];
        CFStringRef v14 = [v22 properties];
        uint64_t v15 = [v14 objectForKeyedSubscript:kTTSResourceBuildKey];
        id v16 = +[TTSAXResourceManager sharedInstance];
        int v17 = [v16 catalogBuildVersion];
        unsigned int v21 = [v15 isEqualToString:v17];

        if (v21)
        {
          uint64_t v18 = AXLogAssetDaemon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = *(void *)(a1 + 32);
            *(_DWORD *)long long buf = 138412290;
            uint64_t v24 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@: Build versions matched, no need to update assets.", buf, 0xCu);
          }

          id v20 = +[TTSAXResourceManager sharedInstance];
          [v20 downloadSamplesIfNecessary];

          uint64_t v10 = v8;
          uint64_t v11 = 0;
          goto LABEL_5;
        }
LABEL_15:
        objc_msgSend(v8, "_housekeeping_op2_purgeAssets:", v5);
        goto LABEL_16;
      }
    }
    goto LABEL_15;
  }
  id v9 = AXLogAssetDaemon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100014F50((uint64_t)v8, v6);
  }

  uint64_t v10 = v8;
  uint64_t v11 = 1;
LABEL_5:
  [v10 _completeWithResult:v11];
LABEL_16:
}

void sub_10000FCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
}

void sub_10000FD40(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (v4)
  {
    uint64_t v7 = AXLogAssetDaemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100014FE4((uint64_t)v6, v4);
    }

    [v6 _completeWithResult:1];
  }
  else if (([WeakRetained _deferIfNeeded] & 1) == 0)
  {
    objc_msgSend(v6, "_housekeeping_op3_downloadAssets:", *(void *)(a1 + 32));
  }
}

void sub_1000104A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1000104D4(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
LABEL_7:
    id v6 = AXLogAssetDaemon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Finished all subtasks with success.", (uint8_t *)&v7, 0xCu);
    }

    [WeakRetained _completeWithResult:0];
    goto LABEL_10;
  }
  id v4 = _AXAssetMakeError();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!v4) {
    goto LABEL_7;
  }
  id v5 = AXLogAssetDaemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000150BC((uint64_t)WeakRetained, v4);
  }

  [WeakRetained _completeWithResult:1];
LABEL_10:
}

void sub_100010A00(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_100010D4C()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for TTSTraceServer()) init];
  qword_100027A90 = (uint64_t)result;
  return result;
}

id static TTSTraceServer.shared.getter()
{
  if (qword_100027A88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = (void *)qword_100027A90;
  return v0;
}

void static TTSTraceServer.shared.setter(uint64_t a1)
{
  if (qword_100027A88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_100027A90;
  qword_100027A90 = a1;
}

uint64_t (*static TTSTraceServer.shared.modify())()
{
  if (qword_100027A88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

unint64_t sub_100011008(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000124F8(&qword_100027A08);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_100012F78(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_100011124()
{
  id v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  sub_1000124F8(&qword_1000279A8);
  __chkstk_darwin();
  id v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC9axassetsd14TTSTraceServer_clientTimeoutTasks;
  uint64_t v6 = v1;
  *(void *)&v1[v5] = sub_100011008((uint64_t)&_swiftEmptyArrayStorage);

  uint64_t v7 = (objc_class *)type metadata accessor for TTSTraceServer();
  v12.receiver = v6;
  v12.super_class = v7;
  id v8 = objc_msgSendSuper2(&v12, "init");
  if (TTSIsInternalBuild())
  {
    uint64_t v9 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = ObjectType;
    sub_100011B1C((uint64_t)v4, (uint64_t)&unk_1000279B8, (uint64_t)v10);
    swift_release();
  }

  return v8;
}

uint64_t sub_100011288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  sub_1000124F8(&qword_1000279A8);
  v4[8] = swift_task_alloc();
  uint64_t v5 = sub_1000124F8(&qword_1000279C0);
  v4[9] = v5;
  v4[10] = *(void *)(v5 - 8);
  v4[11] = swift_task_alloc();
  uint64_t v6 = sub_1000124F8(&qword_1000279C8);
  v4[12] = v6;
  v4[13] = *(void *)(v6 - 8);
  v4[14] = swift_task_alloc();
  return _swift_task_switch(sub_1000113DC, 0, 0);
}

uint64_t sub_1000113DC()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  type metadata accessor for TTSSettings();
  static TTSSettings.shared.getter();
  id v4 = (void *)dispatch thunk of TTSSettings.$speechTraceClients.getter();
  swift_release();
  dispatch thunk of AXSetting.stream.getter();

  AsyncStream.makeAsyncIterator()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[15] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_10001150C;
  uint64_t v6 = v0[12];
  return AsyncStream.Iterator.next(isolation:)(v0 + 6, 0, 0, v6);
}

uint64_t sub_10001150C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100011608, 0, 0);
}

uint64_t sub_100011608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)v4[6];
  if (!v5)
  {
    (*(void (**)(void, void))(v4[13] + 8))(v4[14], v4[12]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v31 = (uint64_t (*)(void))v4[1];
    return v31();
  }
  int64_t v6 = 0;
  long long v33 = v5 + 8;
  uint64_t v7 = -1;
  uint64_t v8 = -1 << *((unsigned char *)v5 + 32);
  if (-v8 < 64) {
    uint64_t v7 = ~(-1 << -(char)v8);
  }
  unint64_t v9 = v7 & v5[8];
  int64_t v34 = (unint64_t)(63 - v8) >> 6;
  long long v35 = (void *)v4[6];
  while (1)
  {
    if (v9)
    {
      unint64_t v10 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      int64_t v36 = v6;
      unint64_t v11 = v10 | (v6 << 6);
      goto LABEL_27;
    }
    int64_t v12 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
LABEL_41:
      __break(1u);
      return AsyncStream.Iterator.next(isolation:)(v5, a2, a3, a4);
    }
    if (v12 >= v34) {
      goto LABEL_34;
    }
    unint64_t v13 = v33[v12];
    int64_t v14 = v6 + 1;
    if (!v13)
    {
      int64_t v14 = v6 + 2;
      if (v6 + 2 >= v34) {
        goto LABEL_34;
      }
      unint64_t v13 = v33[v14];
      if (!v13)
      {
        int64_t v14 = v6 + 3;
        if (v6 + 3 >= v34) {
          goto LABEL_34;
        }
        unint64_t v13 = v33[v14];
        if (!v13)
        {
          int64_t v14 = v6 + 4;
          if (v6 + 4 >= v34) {
            goto LABEL_34;
          }
          unint64_t v13 = v33[v14];
          if (!v13)
          {
            int64_t v14 = v6 + 5;
            if (v6 + 5 >= v34) {
              goto LABEL_34;
            }
            unint64_t v13 = v33[v14];
            if (!v13) {
              break;
            }
          }
        }
      }
    }
LABEL_26:
    unint64_t v9 = (v13 - 1) & v13;
    int64_t v36 = v14;
    unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
LABEL_27:
    uint64_t v17 = v4[7];
    uint64_t v16 = v4[8];
    uint64_t v18 = (uint64_t *)(v5[6] + 16 * v11);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    uint64_t v21 = type metadata accessor for TaskPriority();
    uint64_t v22 = *(void *)(v21 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56))(v16, 1, 1, v21);
    id v23 = (void *)swift_allocObject();
    v23[2] = 0;
    uint64_t v24 = v23 + 2;
    v23[3] = 0;
    v23[4] = v20;
    v23[5] = v19;
    v23[6] = v17;
    LODWORD(v17) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v16, 1, v21);
    swift_bridgeObjectRetain();
    uint64_t v25 = v4[8];
    if (v17 == 1)
    {
      sub_100014A68(v4[8], &qword_1000279A8);
      if (*v24) {
        goto LABEL_29;
      }
    }
    else
    {
      TaskPriority.rawValue.getter();
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v25, v21);
      if (*v24)
      {
LABEL_29:
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v26 = dispatch thunk of Actor.unownedExecutor.getter();
        uint64_t v28 = v27;
        swift_unknownObjectRelease();
        goto LABEL_32;
      }
    }
    uint64_t v26 = 0;
    uint64_t v28 = 0;
LABEL_32:
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = &unk_1000279D8;
    *(void *)(v29 + 24) = v23;
    if (v28 | v26)
    {
      v4[2] = 0;
      v4[3] = 0;
      v4[4] = v26;
      v4[5] = v28;
    }
    swift_task_create();
    swift_release();
    uint64_t v5 = v35;
    int64_t v6 = v36;
  }
  uint64_t v15 = v6 + 6;
  if (v6 + 6 < v34)
  {
    unint64_t v13 = v33[v15];
    if (!v13)
    {
      while (1)
      {
        int64_t v14 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_41;
        }
        if (v14 >= v34) {
          goto LABEL_34;
        }
        unint64_t v13 = v33[v14];
        ++v15;
        if (v13) {
          goto LABEL_26;
        }
      }
    }
    int64_t v14 = v6 + 6;
    goto LABEL_26;
  }
LABEL_34:
  swift_release();
  v30 = (void *)swift_task_alloc();
  v4[15] = v30;
  void *v30 = v4;
  v30[1] = sub_10001150C;
  a4 = v4[12];
  uint64_t v5 = v4 + 6;
  a2 = 0;
  a3 = 0;
  return AsyncStream.Iterator.next(isolation:)(v5, a2, a3, a4);
}

uint64_t sub_100011A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return _swift_task_switch(sub_100011ABC, 0, 0);
}

uint64_t sub_100011ABC()
{
  sub_100014650(v0[2], v0[3]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100011B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_100014A68(a1, &qword_1000279A8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_100011CC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[10] = a5;
  v6[11] = a6;
  v6[9] = a4;
  sub_1000124F8(&qword_100027A10);
  v6[12] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for ContinuousClock();
  v6[13] = v7;
  v6[14] = *(void *)(v7 - 8);
  v6[15] = swift_task_alloc();
  return _swift_task_switch(sub_100011DBC, 0, 0);
}

uint64_t sub_100011DBC()
{
  ContinuousClock.init()();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_100027A18 + dword_100027A18);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v1;
  void *v1 = v0;
  v1[1] = sub_100011E84;
  return v3(0x40AAD21B3B700000, 3, 0, 0, 1);
}

uint64_t sub_100011E84()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 120);
  uint64_t v3 = *(void *)(*(void *)v1 + 112);
  uint64_t v4 = *(void *)(*(void *)v1 + 104);
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_100012184;
  }
  else {
    uint64_t v5 = sub_100011FF4;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100011FF4()
{
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[9];
  uint64_t v2 = v0[10];
  type metadata accessor for TTSSettings();
  static TTSSettings.shared.getter();
  uint64_t v4 = type metadata accessor for TTSSettings.SpeechTracingClient();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v1, 1, 1, v4);
  swift_bridgeObjectRetain();
  uint64_t v5 = (void (*)(void *, void))dispatch thunk of TTSSettings.speechTraceClients.modify();
  sub_1000121F4(v1, v3, v2);
  v5(v0 + 2, 0);
  swift_release();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1000130D4(v3, v2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_100012184()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000121F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  sub_1000124F8(&qword_100027A10);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TTSSettings.SpeechTracingClient();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  unint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1, 1, v10) == 1)
  {
    sub_100014A68(a1, &qword_100027A10);
    sub_1000131A4(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_100014A68((uint64_t)v9, &qword_100027A10);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v13, a1, v10);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_100013FA4((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v17;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

void sub_1000123D0(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;
    id v11 = a3;
    id v13 = a1;
    id v12 = a5;
    sub_100014650(v8, v10);
    swift_bridgeObjectRelease();
  }
}

id TTSTraceServer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTSTraceServer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TTSTraceServer()
{
  return self;
}

uint64_t method lookup function for TTSTraceServer(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for TTSTraceServer);
}

uint64_t sub_1000124F8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10001253C()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100012574()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100014B0C;
  return sub_100011288((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_100012608()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100012648()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[2] = v2;
  v4[3] = v3;
  v4[1] = sub_1000126F4;
  return _swift_task_switch(sub_100011ABC, 0, 0);
}

uint64_t sub_1000126F4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000127E8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000128C4;
  return v6(a1);
}

uint64_t sub_1000128C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000129BC()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000129F4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100014B0C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000279E0 + dword_1000279E0);
  return v6(a1, v4);
}

uint64_t sub_100012AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = type metadata accessor for ContinuousClock.Instant();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return _swift_task_switch(sub_100012BB0, 0, 0);
}

uint64_t sub_100012BB0()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = type metadata accessor for ContinuousClock();
  uint64_t v5 = sub_100014AC4(&qword_100027A28, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  dispatch thunk of Clock.now.getter();
  sub_100014AC4(&qword_100027A30, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  void *v7 = v0;
  v7[1] = sub_100012D50;
  uint64_t v8 = v0[11];
  return dispatch thunk of Clock.sleep(until:tolerance:)(v8, v0 + 2, v4, v5);
}

uint64_t sub_100012D50()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return _swift_task_switch(sub_100012F0C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_100012F0C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_100012F78(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return sub_100012FF0(a1, a2, v4);
}

unint64_t sub_100012FF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1000130D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100012F78(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1000141D4();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_100013A4C(v6, v9);
  uint64_t *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1000131A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_100012F78(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10001438C();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for TTSSettings.SpeechTracingClient();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_100013C24(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for TTSSettings.SpeechTracingClient();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_10001334C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000124F8(&qword_100027A08);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_100013664(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = type metadata accessor for TTSSettings.SpeechTracingClient();
  uint64_t v5 = *(void *)(v49 - 8);
  __chkstk_darwin();
  v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_1000124F8(&qword_100027A20);
  int v47 = a2;
  uint64_t v8 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  uint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    unint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    void *v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  unint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v9;
  return result;
}

unint64_t sub_100013A4C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *int64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_100013C24(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          _OWORD *v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(type metadata accessor for TTSSettings.SpeechTracingClient() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  uint64_t *v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_100013E34(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100012F78(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1000141D4();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10001334C(v15, a4 & 1);
  unint64_t v21 = sub_100012F78(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100013FA4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_100012F78(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10001438C();
      goto LABEL_7;
    }
    sub_100013664(v15, a4 & 1);
    unint64_t v26 = sub_100012F78(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = type metadata accessor for TTSSettings.SpeechTracingClient();
    uint64_t v21 = *(void *)(v20 - 8);
    char v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_100014124(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_100014124(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  void *v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for TTSSettings.SpeechTracingClient();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_1000141D4()
{
  uint64_t v1 = v0;
  sub_1000124F8(&qword_100027A08);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10001438C()
{
  uint64_t v35 = type metadata accessor for TTSSettings.SpeechTracingClient();
  uint64_t v1 = *(void *)(v35 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000124F8(&qword_100027A20);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = static _DictionaryStorage.copy(original:)();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    char v27 = v30;
LABEL_25:
    uint64_t *v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    unint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    void *v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    char v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void sub_100014650(uint64_t a1, uint64_t a2)
{
  sub_1000124F8(&qword_1000279A8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100027A88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v6 = (void *)qword_100027A90;
  uint64_t v7 = qword_100027A90 + OBJC_IVAR____TtC9axassetsd14TTSTraceServer_clientTimeoutTasks;
  swift_beginAccess();
  uint64_t v8 = *(void *)(*(void *)v7 + 16);
  id v9 = v6;
  if (v8)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100012F78(a1, a2);
    if (v10)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1000124F8(&qword_100027A00);
      Task.cancel()();
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a1;
  v12[5] = a2;
  v12[6] = v9;
  swift_bridgeObjectRetain_n();
  id v13 = v9;
  uint64_t v14 = sub_100011B1C((uint64_t)v5, (uint64_t)&unk_1000279F8, (uint64_t)v12);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v20 = *(void *)v7;
  *(void *)uint64_t v7 = 0x8000000000000000;
  sub_100013E34(v14, a1, a2, isUniquelyReferenced_nonNull_native);
  *(void *)uint64_t v7 = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  unint64_t v16 = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v17 = (__CFString *)String._bridgeToObjectiveC()();
  CFNotificationCenterRemoveObserver(v16, 0, v17, 0);

  uint64_t v18 = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v19 = (__CFString *)String._bridgeToObjectiveC()();
  CFNotificationCenterAddObserver(v18, 0, (CFNotificationCallback)sub_1000123D0, v19, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

uint64_t sub_100014978()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000149C0()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000126F4;
  return sub_100011CC8((uint64_t)v5, v6, v7, v2, v3, v4);
}

uint64_t sub_100014A68(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000124F8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100014AC4(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100014B10(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "task [%@] being asked to complete, but is already fiinished!", (uint8_t *)&v2, 0xCu);
}

void sub_100014B88(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AXMigrateResTask: Error refreshing catalog during migration. %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_100014C00()
{
  dlerror();
  int v0 = abort_report_np();
  return sub_100014C24(v0, v1, v2);
}

void sub_100014C24(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "XPC Activity handler called with unexpected state. %@. Asset:%@", (uint8_t *)&v4, 0x16u);
}

void sub_100014CB0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AXInformSiriSubsTask: Error: attempted to add a neural voice on a device that does not support neural voices, %@", (uint8_t *)&v3, 0xCu);
}

void sub_100014D2C(void *a1, NSObject *a2)
{
  int v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Deallocating task %@", (uint8_t *)&v4, 0xCu);
}

void sub_100014DC4(void *a1, uint64_t a2, NSObject *a3)
{
  v5[0] = 67109378;
  v5[1] = [a1 processIdentifier];
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Rejecting connecting client with pid:(%d) appID:(%@). Missing required entitlement", (uint8_t *)v5, 0x12u);
}

void sub_100014E60(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AXATM: Active reason already exists for adding: '%@'. This will almost certainly lead to unwanted os_transaction problems.", (uint8_t *)&v2, 0xCu);
}

void sub_100014ED8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AXATM: Active reason does not exist for removal: '%@'. This will almost certainly lead to unwanted os_transaction problems", (uint8_t *)&v2, 0xCu);
}

void sub_100014F50(uint64_t a1, void *a2)
{
  int v2 = [a2 localizedDescription];
  sub_1000109E8();
  sub_100010A00((void *)&_mh_execute_header, v3, v4, "%@: Could not refresh assets: %@", v5, v6, v7, v8, v9);
}

void sub_100014FE4(uint64_t a1, void *a2)
{
  int v2 = [a2 localizedDescription];
  sub_1000109E8();
  sub_100010A00((void *)&_mh_execute_header, v3, v4, "%@: Could not purge assets: %@", v5, v6, v7, v8, v9);
}

void sub_100015078(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Kicking off downloads with refreshed assets:", v1, 2u);
}

void sub_1000150BC(uint64_t a1, void *a2)
{
  int v2 = [a2 localizedDescription];
  sub_1000109E8();
  sub_100010A00((void *)&_mh_execute_header, v3, v4, "%@: Could not kick off asset downloads: %@", v5, v6, v7, v8, v9);
}

uint64_t type metadata accessor for TTSSettings.SpeechTracingClient()
{
  return type metadata accessor for TTSSettings.SpeechTracingClient();
}

uint64_t dispatch thunk of TTSSettings.speechTraceClients.modify()
{
  return dispatch thunk of TTSSettings.speechTraceClients.modify();
}

uint64_t dispatch thunk of TTSSettings.$speechTraceClients.getter()
{
  return dispatch thunk of TTSSettings.$speechTraceClients.getter();
}

uint64_t static TTSSettings.shared.getter()
{
  return static TTSSettings.shared.getter();
}

uint64_t type metadata accessor for TTSSettings()
{
  return type metadata accessor for TTSSettings();
}

uint64_t dispatch thunk of AXSetting.stream.getter()
{
  return dispatch thunk of AXSetting.stream.getter();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t AXClientsForSiriResource()
{
  return _AXClientsForSiriResource();
}

uint64_t AXLogAssetDaemon()
{
  return _AXLogAssetDaemon();
}

uint64_t AXRuntimeCheck_HasANE()
{
  return _AXRuntimeCheck_HasANE();
}

uint64_t AXSiriTTSSynthesisVoiceAssetsAreEqual()
{
  return _AXSiriTTSSynthesisVoiceAssetsAreEqual();
}

uint64_t AXSiriTTSSynthesisVoiceFromVoiceIdentifier()
{
  return _AXSiriTTSSynthesisVoiceFromVoiceIdentifier();
}

uint64_t AXSwapSpeechSettingsIdentifiers()
{
  return _AXSwapSpeechSettingsIdentifiers();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return _AX_PERFORM_WITH_LOCK();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t CFPreferencesFlushCaches()
{
  return _CFPreferencesFlushCaches();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t TTSIsInternalBuild()
{
  return _TTSIsInternalBuild();
}

uint64_t TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences()
{
  return _TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
}

uint64_t TTSSupportsNeuralVoices()
{
  return _TTSSupportsNeuralVoices();
}

uint64_t _AXAssetMakeError()
{
  return __AXAssetMakeError();
}

uint64_t _AXCreateAXAssetsServiceInterface()
{
  return __AXCreateAXAssetsServiceInterface();
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

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__anonymousTaskForId_withArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_anonymousTaskForId:withArguments:");
}

id objc_msgSend__callCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callCompletion:");
}

id objc_msgSend__cleanupVoiceSubscriptions(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupVoiceSubscriptions];
}

id objc_msgSend__completeMigrationForLegacyResource_withDownloadedResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_completeMigrationForLegacyResource:withDownloadedResource:");
}

id objc_msgSend__completeWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_completeWithResult:");
}

id objc_msgSend__debugNameForXPCActivityState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_debugNameForXPCActivityState:");
}

id objc_msgSend__deferIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _deferIfNeeded];
}

id objc_msgSend__dequeueNextTask(void *a1, const char *a2, ...)
{
  return _[a1 _dequeueNextTask];
}

id objc_msgSend__dispatchTask_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dispatchTask:completion:");
}

id objc_msgSend__enqueueTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueTask:");
}

id objc_msgSend__getBootTime(void *a1, const char *a2, ...)
{
  return _[a1 _getBootTime];
}

id objc_msgSend__handleNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleNotification:");
}

id objc_msgSend__handleXPCActivity_taskClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleXPCActivity:taskClass:");
}

id objc_msgSend__housekeeping_op1_refreshAssets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_housekeeping_op1_refreshAssets");
}

id objc_msgSend__housekeeping_op2_purgeAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_housekeeping_op2_purgeAssets:");
}

id objc_msgSend__housekeeping_op3_downloadAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_housekeeping_op3_downloadAssets:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__initWithPhase_lastExitStatus_date_taskID_assetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithPhase:lastExitStatus:date:taskID:assetType:");
}

id objc_msgSend__managedAssetForAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_managedAssetForAssetType:");
}

id objc_msgSend__migrateNashvilleToMaui(void *a1, const char *a2, ...)
{
  return _[a1 _migrateNashvilleToMaui];
}

id objc_msgSend__purgeLegacyResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_purgeLegacyResource:");
}

id objc_msgSend__refreshAssetCatalogForAssetType_withOverrideTimeout_forceCatalogRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshAssetCatalogForAssetType:withOverrideTimeout:forceCatalogRefresh:");
}

id objc_msgSend__resourceInUseByOtherTechnologies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resourceInUseByOtherTechnologies:");
}

id objc_msgSend__restorationDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _restorationDictionary];
}

id objc_msgSend__restorationExitStatusForResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_restorationExitStatusForResult:");
}

id objc_msgSend__restorationState(void *a1, const char *a2, ...)
{
  return _[a1 _restorationState];
}

id objc_msgSend__retryAndBackOff(void *a1, const char *a2, ...)
{
  return _[a1 _retryAndBackOff];
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__taskQueueForTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_taskQueueForTask:");
}

id objc_msgSend__tasksForNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tasksForNotification:");
}

id objc_msgSend__tasksForTriggerType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tasksForTriggerType:");
}

id objc_msgSend__updateAssetForAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAssetForAssetType:");
}

id objc_msgSend__xpcQueue_acceptNewConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcQueue_acceptNewConnection:");
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return _[a1 activity];
}

id objc_msgSend_activityTransactionManager(void *a1, const char *a2, ...)
{
  return _[a1 activityTransactionManager];
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

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_afterDelay_processBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afterDelay:processBlock:");
}

id objc_msgSend_afterDelay_processBlock_cancelBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afterDelay:processBlock:cancelBlock:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return _[a1 arguments];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetController(void *a1, const char *a2, ...)
{
  return _[a1 assetController];
}

id objc_msgSend_assetControllerWithPolicy_qosClass_shouldRefreshForAssetInstallNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetControllerWithPolicy:qosClass:shouldRefreshForAssetInstallNotifications:");
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return _[a1 assetType];
}

id objc_msgSend_assetTypeSuffix(void *a1, const char *a2, ...)
{
  return _[a1 assetTypeSuffix];
}

id objc_msgSend_assetWithPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetWithPolicy:");
}

id objc_msgSend_assetsToDownloadFromRefreshedAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetsToDownloadFromRefreshedAssets:");
}

id objc_msgSend_assetsToPurgeFromInstalledAssets_withRefreshedAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetsToPurgeFromInstalledAssets:withRefreshedAssets:");
}

id objc_msgSend_attemptCount(void *a1, const char *a2, ...)
{
  return _[a1 attemptCount];
}

id objc_msgSend_ax_flatMappedArrayUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ax_flatMappedArrayUsingBlock:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_catalogBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 catalogBuildVersion];
}

id objc_msgSend_checkInAssetUpdateXPCActivity(void *a1, const char *a2, ...)
{
  return _[a1 checkInAssetUpdateXPCActivity];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return _[a1 completion];
}

id objc_msgSend_completionStatus(void *a1, const char *a2, ...)
{
  return _[a1 completionStatus];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextWithActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextWithActivity:");
}

id objc_msgSend_contextWithXPCClient(void *a1, const char *a2, ...)
{
  return _[a1 contextWithXPCClient];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_daemonShouldDownloadInBackgroundIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 daemonShouldDownloadInBackgroundIfNeeded];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return _[a1 defaultCStringEncoding];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteResourceWithVoiceId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteResourceWithVoiceId:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didCompleteWithStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCompleteWithStatus:");
}

id objc_msgSend_downloadAssets_successStartBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAssets:successStartBlock:");
}

id objc_msgSend_downloadResourceWithVoiceId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadResourceWithVoiceId:");
}

id objc_msgSend_downloadResourceWithVoiceId_userInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadResourceWithVoiceId:userInitiated:");
}

id objc_msgSend_downloadSamplesIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 downloadSamplesIfNecessary];
}

id objc_msgSend_enqueueAssetUpdateTaskWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueAssetUpdateTaskWithContext:");
}

id objc_msgSend_enqueueCatalogRefreshTaskWithOverrideTimeout_forceCatalogRefresh_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueCatalogRefreshTaskWithOverrideTimeout:forceCatalogRefresh:context:");
}

id objc_msgSend_enqueueCleanseUnusedCompactResourcesTaskWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueCleanseUnusedCompactResourcesTaskWithContext:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return _[a1 finished];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_footprint(void *a1, const char *a2, ...)
{
  return _[a1 footprint];
}

id objc_msgSend_freeSharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 freeSharedInstance];
}

id objc_msgSend_handleFirstBoot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFirstBoot:");
}

id objc_msgSend_handleFirstUnlock(void *a1, const char *a2, ...)
{
  return _[a1 handleFirstUnlock];
}

id objc_msgSend_hasCompletedPurgingAssets(void *a1, const char *a2, ...)
{
  return _[a1 hasCompletedPurgingAssets];
}

id objc_msgSend_hasCompletedRefreshingAssets(void *a1, const char *a2, ...)
{
  return _[a1 hasCompletedRefreshingAssets];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_idleStateWithTaskID_assetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idleStateWithTaskID:assetType:");
}

id objc_msgSend_inflightTasks(void *a1, const char *a2, ...)
{
  return _[a1 inflightTasks];
}

id objc_msgSend_initWithActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivity:");
}

id objc_msgSend_initWithLaunchActivityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLaunchActivityIdentifier:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithName_policy_context_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:policy:context:block:");
}

id objc_msgSend_initWithPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPolicy:");
}

id objc_msgSend_initWithPolicy_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPolicy:context:");
}

id objc_msgSend_initWithPolicy_forceCatalogRefresh_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPolicy:forceCatalogRefresh:context:");
}

id objc_msgSend_initWithTargetSerialQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTargetSerialQueue:");
}

id objc_msgSend_initWithTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTrigger:");
}

id objc_msgSend_installedAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedAssets:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invokeTaskById_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeTaskById:arguments:");
}

id objc_msgSend_invokeWithArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeWithArguments:");
}

id objc_msgSend_isAssetCatalogInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isAssetCatalogInstalled];
}

id objc_msgSend_isDownloadingAssets(void *a1, const char *a2, ...)
{
  return _[a1 isDownloadingAssets];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return _[a1 isIdle];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isInstalled];
}

id objc_msgSend_isMigrationComplete(void *a1, const char *a2, ...)
{
  return _[a1 isMigrationComplete];
}

id objc_msgSend_isPurgingAssets(void *a1, const char *a2, ...)
{
  return _[a1 isPurgingAssets];
}

id objc_msgSend_isRefreshingAssets(void *a1, const char *a2, ...)
{
  return _[a1 isRefreshingAssets];
}

id objc_msgSend_lastExitStatus(void *a1, const char *a2, ...)
{
  return _[a1 lastExitStatus];
}

id objc_msgSend_launchActivity(void *a1, const char *a2, ...)
{
  return _[a1 launchActivity];
}

id objc_msgSend_launchActivityId(void *a1, const char *a2, ...)
{
  return _[a1 launchActivityId];
}

id objc_msgSend_launchActivityIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 launchActivityIdentifier];
}

id objc_msgSend_legacyIdentifierForUpdatedIdentifierDuringMigration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyIdentifierForUpdatedIdentifierDuringMigration:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_managedAssets(void *a1, const char *a2, ...)
{
  return _[a1 managedAssets];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_notificationName(void *a1, const char *a2, ...)
{
  return _[a1 notificationName];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_overrideTimeout(void *a1, const char *a2, ...)
{
  return _[a1 overrideTimeout];
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return _[a1 phase];
}

id objc_msgSend_physicalMemory(void *a1, const char *a2, ...)
{
  return _[a1 physicalMemory];
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return _[a1 policy];
}

id objc_msgSend_primaryLanguage(void *a1, const char *a2, ...)
{
  return _[a1 primaryLanguage];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_purgeAndReloadAllComponents(void *a1, const char *a2, ...)
{
  return _[a1 purgeAndReloadAllComponents];
}

id objc_msgSend_purgeAssets_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeAssets:completion:");
}

id objc_msgSend_readResourceCacheVersionFromPreferences(void *a1, const char *a2, ...)
{
  return _[a1 readResourceCacheVersionFromPreferences];
}

id objc_msgSend_reconcileCachedComponents(void *a1, const char *a2, ...)
{
  return _[a1 reconcileCachedComponents];
}

id objc_msgSend_recordAssetRefreshEventForAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordAssetRefreshEventForAssetType:");
}

id objc_msgSend_refreshAssetCatalogForAssetTypeHandler(void *a1, const char *a2, ...)
{
  return _[a1 refreshAssetCatalogForAssetTypeHandler];
}

id objc_msgSend_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:");
}

id objc_msgSend_refreshResourcesCacheForManagerType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshResourcesCacheForManagerType:");
}

id objc_msgSend_registerManagedAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerManagedAsset:");
}

id objc_msgSend_registerManagedAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerManagedAssets:");
}

id objc_msgSend_registerTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerTask:");
}

id objc_msgSend_registeredTasks(void *a1, const char *a2, ...)
{
  return _[a1 registeredTasks];
}

id objc_msgSend_reloadVoicesForBundleIdentifierHash_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadVoicesForBundleIdentifierHash:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_resetInMemoryAssetCatalogs(void *a1, const char *a2, ...)
{
  return _[a1 resetInMemoryAssetCatalogs];
}

id objc_msgSend_resetResourcesCache(void *a1, const char *a2, ...)
{
  return _[a1 resetResourcesCache];
}

id objc_msgSend_resourceCompletedMigration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceCompletedMigration:");
}

id objc_msgSend_resourceNeedsMigration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceNeedsMigration:");
}

id objc_msgSend_resourceWithVoiceId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceWithVoiceId:");
}

id objc_msgSend_restorationState(void *a1, const char *a2, ...)
{
  return _[a1 restorationState];
}

id objc_msgSend_restoreOrCreateStateFromStore_assetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreOrCreateStateFromStore:assetType:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_run_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run:");
}

id objc_msgSend_selectedSpeechVoiceIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 selectedSpeechVoiceIdentifiers];
}

id objc_msgSend_selectedSpeechVoiceIdentifiersForSourceKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedSpeechVoiceIdentifiersForSourceKey:");
}

id objc_msgSend_selectedSpeechVoiceIdentifiersWithLanguageSource(void *a1, const char *a2, ...)
{
  return _[a1 selectedSpeechVoiceIdentifiersWithLanguageSource];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivity:");
}

id objc_msgSend_setActivityTransactionManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityTransactionManager:");
}

id objc_msgSend_setArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArguments:");
}

id objc_msgSend_setAssetController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetController:");
}

id objc_msgSend_setAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetType:");
}

id objc_msgSend_setAttemptCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttemptCount:");
}

id objc_msgSend_setAutomaticallyCancelPendingBlockUponSchedulingNewBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:");
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletion:");
}

id objc_msgSend_setCompletionStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionStatus:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnvironment:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLastExitStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastExitStatus:");
}

id objc_msgSend_setLaunchActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchActivity:");
}

id objc_msgSend_setLaunchActivityId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchActivityId:");
}

id objc_msgSend_setManagedAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManagedAssets:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNotificationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationName:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOverrideTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideTimeout:");
}

id objc_msgSend_setPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhase:");
}

id objc_msgSend_setPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPolicy:");
}

id objc_msgSend_setRefreshAssetCatalogForAssetTypeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefreshAssetCatalogForAssetTypeHandler:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRestorationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestorationState:");
}

id objc_msgSend_setTaskBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskBlock:");
}

id objc_msgSend_setTaskID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskID:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrigger:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUpdateAssetForAssetTypeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateAssetForAssetTypeHandler:");
}

id objc_msgSend_setUserInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInitiated:");
}

id objc_msgSend_setValue_forKey_forAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:forAssetType:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setXpcServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcServer:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldDefer(void *a1, const char *a2, ...)
{
  return _[a1 shouldDefer];
}

id objc_msgSend_simpleTaskFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simpleTaskFinished:");
}

id objc_msgSend_simpleTaskStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simpleTaskStarted:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startServer(void *a1, const char *a2, ...)
{
  return _[a1 startServer];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return _[a1 store];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subscribeWithVoices_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeWithVoices:reply:");
}

id objc_msgSend_subscribedVoicesWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribedVoicesWithReply:");
}

id objc_msgSend_synchronous(void *a1, const char *a2, ...)
{
  return _[a1 synchronous];
}

id objc_msgSend_taskBlock(void *a1, const char *a2, ...)
{
  return _[a1 taskBlock];
}

id objc_msgSend_taskCompletionWaitingQueue(void *a1, const char *a2, ...)
{
  return _[a1 taskCompletionWaitingQueue];
}

id objc_msgSend_taskDispatcherQueue(void *a1, const char *a2, ...)
{
  return _[a1 taskDispatcherQueue];
}

id objc_msgSend_taskGroupIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 taskGroupIdentifier];
}

id objc_msgSend_taskID(void *a1, const char *a2, ...)
{
  return _[a1 taskID];
}

id objc_msgSend_taskIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 taskIdentifier];
}

id objc_msgSend_taskQueues(void *a1, const char *a2, ...)
{
  return _[a1 taskQueues];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return _[a1 trigger];
}

id objc_msgSend_triggers(void *a1, const char *a2, ...)
{
  return _[a1 triggers];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_updateAssetForAssetTypeHandler(void *a1, const char *a2, ...)
{
  return _[a1 updateAssetForAssetTypeHandler];
}

id objc_msgSend_updateCatalogBuildVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCatalogBuildVersion:");
}

id objc_msgSend_updatePhase_exitStatus_saveToStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePhase:exitStatus:saveToStore:");
}

id objc_msgSend_updatePhase_saveToStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePhase:saveToStore:");
}

id objc_msgSend_updateState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateState:");
}

id objc_msgSend_updatedIdentifierForLegacyIdentifier_withLanguageCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedIdentifierForLegacyIdentifier:withLanguageCode:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_forAssetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:forAssetType:");
}

id objc_msgSend_voiceId(void *a1, const char *a2, ...)
{
  return _[a1 voiceId];
}

id objc_msgSend_voiceOverLanguageRotorItems(void *a1, const char *a2, ...)
{
  return _[a1 voiceOverLanguageRotorItems];
}

id objc_msgSend_willBecomeIdle_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willBecomeIdle:completion:");
}

id objc_msgSend_withAnonymousInvokation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withAnonymousInvokation:");
}

id objc_msgSend_withFirstBootType(void *a1, const char *a2, ...)
{
  return _[a1 withFirstBootType];
}

id objc_msgSend_withFirstUnlockType(void *a1, const char *a2, ...)
{
  return _[a1 withFirstUnlockType];
}

id objc_msgSend_withNotificationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withNotificationName:");
}

id objc_msgSend_writeIsMigrationCompleteToPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeIsMigrationCompleteToPreferences:");
}

id objc_msgSend_writeVoiceIdentifiersToMigrateToPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeVoiceIdentifiersToMigrateToPreferences:");
}

id objc_msgSend_xpcServer(void *a1, const char *a2, ...)
{
  return _[a1 xpcServer];
}