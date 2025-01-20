uint64_t start()
{
  void *v0;
  NSObject *v1;
  id v2;
  dispatch_source_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void handler[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v1 = sub_1000051D4();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_10000C6AC(v1);
    }
  }
  v2 = NSTemporaryDirectory();
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  v4 = (void *)qword_10001A2D0;
  qword_10001A2D0 = (uint64_t)v3;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100002990;
  handler[3] = &unk_1000144B0;
  handler[4] = &v11;
  dispatch_source_set_event_handler((dispatch_source_t)qword_10001A2D0, handler);
  dispatch_resume((dispatch_object_t)qword_10001A2D0);
  v5 = +[ServerController sharedController];
  [v5 start];

  while (!*((unsigned char *)v12 + 24))
  {
    v7 = +[NSRunLoop currentRunLoop];
    v8 = +[NSDate dateWithTimeIntervalSinceNow:1.0];
    [v7 runUntilDate:v8];
  }
  _Block_object_dispose(&v11, 8);
  return 0;
}

void sub_100002514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002588(id a1)
{
  qword_10001A2C0 = objc_alloc_init(ServerController);

  _objc_release_x1();
}

uint64_t sub_100002990(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void sub_100002E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002E84(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002E94(uint64_t a1)
{
}

void sub_100002E9C(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v12 = a3;
  v6 = [v12 clipBundleID];
  unsigned int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    v8 = [v12 clipIpaURL];
    uint64_t v9 = [v8 absoluteString];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

void sub_1000031C8(id a1)
{
  v1 = (void *)qword_10001A2D8;
  qword_10001A2D8 = (uint64_t)&off_100015010;
}

void sub_100003324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000333C(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([*(id *)(a1 + 32) hasPrefix:a2])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void sub_100003504(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    BOOL v9 = xpc_activity_set_state(v2, 4);
    uint64_t v10 = sub_1000051D4();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Running cleanup activity", buf, 2u);
      }
      id v12 = (void *)os_transaction_create();
      v13 = dispatch_group_create();
      dispatch_group_enter(v13);
      v14 = +[CPSClipCleanupManager sharedManager];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100003914;
      v34[3] = &unk_1000145B0;
      v15 = v2;
      v35 = v15;
      v16 = v13;
      v36 = v16;
      [v14 removeFailedClipInstallsWithCompletionHandler:v34];

      dispatch_group_enter(v16);
      id v17 = objc_alloc_init((Class)CPSImageStore);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100003AB8;
      v32[3] = &unk_100014588;
      v18 = v16;
      v33 = v18;
      [v17 purgeOldImagesWithCompletionHandler:v32];

      dispatch_group_enter(v18);
      v19 = +[CPSWebClipStore sharedStore];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100003B24;
      v30[3] = &unk_100014588;
      v20 = v18;
      v31 = v20;
      [v19 purgeDuplicateWebClipsWithCompletionHandler:v30];

      dispatch_group_enter(v20);
      v21 = +[CPSWebClipStore sharedStore];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100003B90;
      v28[3] = &unk_100014588;
      v29 = v20;
      v22 = v20;
      [v21 removeExpiredPoweredByWebClipsWithCompletionHandler:v28];

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100003BFC;
      block[3] = &unk_1000145B0;
      v26 = v15;
      id v27 = v12;
      id v23 = v12;
      dispatch_group_notify(v22, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100003C6C(v11);
      }
      xpc_activity_set_completion_status();
    }
  }
  else
  {
    xpc_activity_state_t v4 = state;
    if (state)
    {
      v24 = sub_1000051D4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        xpc_activity_state_t v38 = v4;
        v6 = "Current cleanup activity state is %ld. Not taking any action until the activity state is Run";
        unsigned int v7 = v24;
        uint32_t v8 = 12;
        goto LABEL_11;
      }
    }
    else
    {
      v5 = sub_1000051D4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v6 = "Checked in cleanup activity";
        unsigned int v7 = v5;
        uint32_t v8 = 2;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v6, buf, v8);
      }
    }
  }
}

void sub_100003914(uint64_t a1)
{
  v2 = sub_1000051D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished cleaning up failed clip installs", buf, 2u);
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v3 = sub_1000051D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deferring cleanup activity", buf, 2u);
    }
    xpc_activity_set_completion_status();
  }
  else
  {
    xpc_activity_state_t v4 = +[CPSClipCleanupManager sharedManager];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100003A4C;
    v5[3] = &unk_100014588;
    id v6 = *(id *)(a1 + 40);
    [v4 uninstallClipsWithParentAppInstalledWithCompletionHandler:v5];
  }
}

void sub_100003A4C(uint64_t a1)
{
  v2 = sub_1000051D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished cleaning up app clips with installed parent apps", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100003AB8(uint64_t a1)
{
  v2 = sub_1000051D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished purging image store", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100003B24(uint64_t a1)
{
  v2 = sub_1000051D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished purging duplicate web clips", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100003B90(uint64_t a1)
{
  v2 = sub_1000051D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished removing expired web clips", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100003BFC()
{
  v0 = sub_1000051D4();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Done with cleanup activity", v2, 2u);
  }
  return xpc_activity_set_completion_status();
}

void sub_100003C6C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set cleanup activity state to 'Continue'", v1, 2u);
}

void sub_100003EB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    xpc_activity_state_t v4 = [WeakRetained _appForBundleID:*(void *)(a1 + 32) createIfNeeded:1];
    uint64_t v5 = [v4 downloadedURL];
    if (!v5) {
      goto LABEL_5;
    }
    id v6 = (void *)v5;
    unsigned int v7 = +[NSFileManager defaultManager];
    uint32_t v8 = [v4 downloadedURL];
    BOOL v9 = [v8 path];
    unsigned int v10 = [v7 fileExistsAtPath:v9];

    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = [v4 bundleID];
      (*(void (**)(uint64_t, id, void))(v11 + 16))(v11, v12, 0);
    }
    else
    {
LABEL_5:
      id v13 = objc_alloc((Class)NSURLRequest);
      v14 = [v4 ipaLink];
      id v12 = [v13 initWithURL:v14 cachePolicy:1 timeoutInterval:20.0];

      v15 = sub_1000051D4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = v15;
        id v17 = [v4 ipaLink];
        *(_DWORD *)buf = 138412290;
        id v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "start downloading IPA from demo server: URL: %@", buf, 0xCu);
      }
      v18 = +[NSURLSession sharedSession];
      v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      v22 = sub_10000412C;
      id v23 = &unk_1000145D8;
      id v25 = *(id *)(a1 + 40);
      id v24 = v4;
      v19 = [v18 dataTaskWithRequest:v12 completionHandler:&v20];

      objc_msgSend(v19, "resume", v20, v21, v22, v23);
    }
  }
}

void sub_10000412C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v18 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    unsigned int v10 = [*(id *)(a1 + 32) bundleID];
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v8);
  }
  else
  {
    if (v18)
    {
      uint64_t v11 = NSTemporaryDirectory();
      id v12 = [*(id *)(a1 + 32) ipaLink];
      id v13 = [v12 lastPathComponent];
      unsigned int v10 = [v11 stringByAppendingPathComponent:v13];

      if ([v18 writeToFile:v10 atomically:1])
      {
        v14 = +[NSURL URLWithString:v10];
        [*(id *)(a1 + 32) setDownloadedURL:v14];
      }
      uint64_t v15 = *(void *)(a1 + 40);
      v16 = [*(id *)(a1 + 32) bundleID];
      (*(void (**)(uint64_t, void *, void))(v15 + 16))(v15, v16, 0);
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 40);
      unsigned int v10 = [*(id *)(a1 + 32) bundleID];
      v16 = +[NSError cps_errorWithCode:4];
      (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v10, v16);
    }
  }
}

uint64_t sub_1000043AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000044E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    xpc_activity_state_t v4 = [WeakRetained _appForBundleID:*(void *)(a1 + 32) createIfNeeded:1];
    uint64_t v5 = [v4 downloadedURL];
    if (!v5) {
      goto LABEL_5;
    }
    id v6 = (void *)v5;
    id v7 = +[NSFileManager defaultManager];
    id v8 = [v4 downloadedURL];
    uint64_t v9 = [v8 path];
    unsigned int v10 = [v7 fileExistsAtPath:v9];

    if (v10)
    {
      uint64_t v11 = (void *)v3[5];
      id v12 = [v4 bundleID];
      id v13 = [v4 downloadedURL];
      v14 = [v13 path];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000476C;
      v26[3] = &unk_100014650;
      id v28 = *(id *)(a1 + 48);
      id v27 = v4;
      [v11 installDownloadedAppWithBundleID:v12 localFilePath:v14 completionHandler:v26];

      uint64_t v15 = v28;
    }
    else
    {
LABEL_5:
      v16 = [v4 ipaLink];

      if (!v16)
      {
        uint64_t v18 = *(void *)(a1 + 48);
        uint64_t v19 = *(void *)(a1 + 32);
        v20 = +[NSError cps_errorWithCode:4];
        (*(void (**)(uint64_t, uint64_t, void *))(v18 + 16))(v18, v19, v20);

        goto LABEL_9;
      }
      uint64_t v17 = *(void **)(a1 + 32);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100004824;
      v21[3] = &unk_100014678;
      v21[4] = v3;
      id v22 = v17;
      id v23 = *(id *)(a1 + 40);
      id v25 = *(id *)(a1 + 48);
      id v24 = v4;
      [v3 downloadAppWithBundleID:v22 completionHandler:v21];

      uint64_t v15 = v22;
    }

LABEL_9:
  }
}

void sub_10000476C(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) bundleID];
  uint64_t v5 = (void *)v4;
  if (v7)
  {
    id v6 = +[NSError cps_errorWithCode:6 underlyingError:v7];
    (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v5, v6);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, 0);
  }
}

void sub_100004824(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = [*(id *)(a1 + 56) bundleID];
    (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v5, v6);
  }
  else
  {
    [*(id *)(a1 + 32) _installAppWithBundleID:*(void *)(a1 + 40) applicationIconFileURL:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 64)];
  }
}

void sub_100004BB4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = sub_1000051D4();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)unsigned int v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ABRMetaData", "End Fetching ABR metadata", v10, 2u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [v6 clipURL];

  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v5);
}

void sub_100004DC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_1000051D4();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ABRMetaData", "End Fetching ABR metadata", buf, 2u);
  }
  if (v5)
  {
    uint64_t v8 = sub_1000051D4();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AppMetaData", "Start Fetching App metadata", buf, 2u);
    }
    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 8);
    unsigned int v10 = [v5 clipBundleID];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(unsigned __int8 *)(a1 + 64);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100004F98;
    v13[3] = &unk_1000146F0;
    id v14 = v5;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    [v9 lookUpClipMetadataByBundleID:v10 sourceBundleID:v11 downloadIconIfNeeded:v12 skipCaching:0 completionHandler:v13];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_100004F98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = sub_1000051D4();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AppMetaData", "End Fetching App metadata", v8, 2u);
  }
  [*(id *)(a1 + 32) setClipRequestURL:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateWithAMSMetadata:v6];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100005168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000051D4()
{
  if (qword_10001A2F0 != -1) {
    dispatch_once(&qword_10001A2F0, &stru_100014738);
  }
  return qword_10001A2E8;
}

void sub_100005218(id a1)
{
  qword_10001A2E8 = (uint64_t)os_log_create("com.apple.ClipServices.clipserviced", "ClipServicesDaemon");

  _objc_release_x1();
}

void sub_100005588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,id a25)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

void sub_1000055D8(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CPSDaemonProtocol];
  v2 = (void *)qword_10001A2F8;
  qword_10001A2F8 = v1;

  uint64_t v3 = (void *)qword_10001A2F8;
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  uint64_t v4 = +[NSArray arrayWithObjects:v10 count:2];
  id v5 = +[NSSet setWithArray:v4];
  [v3 setClasses:v5 forSelector:"fetchClipMetadataWithURL:reply:" argumentIndex:1 ofReply:1];

  id v6 = (void *)qword_10001A2F8;
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  id v7 = +[NSArray arrayWithObjects:v9 count:2];
  uint64_t v8 = +[NSSet setWithArray:v7];
  [v6 setClasses:v8 forSelector:"uninstallClipsWithBundleIDs:reply:" argumentIndex:1 ofReply:0];
}

void sub_100005760(uint64_t a1)
{
  v2 = sub_1000051D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = 134218242;
    id v7 = WeakRetained;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): connection interrupted: %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100005840(uint64_t a1)
{
  v2 = sub_1000051D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    int v7 = 134218242;
    id v8 = WeakRetained;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): connection invalidated: %@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  [v6 _remoteClientDisconnected];
}

void sub_100005B28(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 clipBundleID];
  id v5 = sub_1000051D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 134218499;
    uint64_t v9 = v6;
    __int16 v10 = 2117;
    uint64_t v11 = v7;
    __int16 v12 = 2113;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "RemoteClient (%p): isClipURL: %{sensitive}@ resolvedBundleID: %{private}@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void, BOOL))(a1[6] + 16))(a1[6], [v4 length] != 0);
}

void sub_100005D2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000051D4();
  if (os_signpost_enabled(v4))
  {
    id v5 = v4;
    uint64_t v6 = [v3 logID];
    *(_DWORD *)buf = 138543618;
    id v15 = v6;
    __int16 v16 = 2082;
    uint64_t v17 = "[begin] prewarmClipWithURL";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ClipPrewarm", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005EC8;
  v8[3] = &unk_1000147F8;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v12 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  char v13 = *(unsigned char *)(a1 + 64);
  id v11 = *(id *)(a1 + 48);
  id v7 = v3;
  [v7 fetchMetadataWithCompletion:v8];
}

void sub_100005EC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 clipBundleID];
  if (v4)
  {
    [*(id *)(a1 + 40) fetchHeroImage];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000061E4;
    v22[3] = &unk_100014588;
    id v23 = *(id *)(a1 + 40);
    id v5 = objc_retainBlock(v22);
    if (([v3 clipIncompatibleWithCurrentDevice] & 1) != 0
      || ([v3 deviceCapabilitiesDontMatch] & 1) != 0)
    {
      ((void (*)(void *))v5[2])(v5);
      uint64_t v6 = *(void *)(a1 + 64);
      id v7 = +[NSError cps_errorWithCode:11];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

LABEL_20:
      int v8 = v23;
      goto LABEL_21;
    }
    if (![v3 hasFullAppInstalledOnSystem])
    {
      if (+[CPSClipURL usesDemoMetadata])
      {
        id v10 = [*(id *)(*(void *)(a1 + 32) + 40) appLinkResolver];
        [v10 saveLinkWithURL:*(void *)(a1 + 48) metadata:v3];
      }
      id v11 = [*(id *)(a1 + 40) configuration];
      unsigned int v12 = [v11 isInvokedByPhysicalCode]
          ? [v3 canUpdateOnPhysicalInovcation]
          : 0;

      if (*(unsigned char *)(a1 + 72))
      {
        char v13 = [v3 invocationPolicy];
        if ([v13 isEligible])
        {
          unsigned int v14 = [v3 fullAppOnly] | v12;

          if (v14 != 1)
          {
            id v15 = [*(id *)(a1 + 56) clipInstaller];
            __int16 v16 = [v3 clipBundleID];
            uint64_t v17 = *(void *)(a1 + 40);
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v18[2] = sub_1000062C8;
            v18[3] = &unk_1000147D0;
            v20 = v5;
            id v19 = *(id *)(a1 + 40);
            id v21 = *(id *)(a1 + 64);
            [v15 prewarmClipWithBundleID:v16 session:v17 completion:v18];

            goto LABEL_20;
          }
        }
        else
        {
        }
      }
    }
    ((void (*)(void *))v5[2])(v5);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_20;
  }
  int v8 = +[NSError cps_errorWithCode:2];
  id v9 = sub_1000051D4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10000A380();
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_21:
}

void sub_1000061E4(uint64_t a1)
{
  v2 = sub_1000051D4();
  if (os_signpost_enabled(v2))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = [v3 logID];
    int v6 = 138543618;
    id v7 = v5;
    __int16 v8 = 2082;
    id v9 = "[end] prewarmClipWithURL";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ClipPrewarm", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", (uint8_t *)&v6, 0x16u);
  }
}

void sub_1000062C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3)
  {
    uint64_t v4 = sub_1000051D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000A404(a1, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100006424(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v4 = [*(id *)(a1 + 32) clipInstaller];
    [v4 cancelPrewarmForBundleID:v6 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = +[NSError cps_errorWithCode:2];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
  }
}

void sub_100006968(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

uint64_t sub_100006AEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006BF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 configuration];
  uint64_t v5 = [v4 launchReason];

  id v6 = [v3 metadata];
  id v7 = [v6 invocationPolicy];
  if ([v7 reason] != (id)14
    || ([v5 isEqualToString:CPSSessionLaunchReasonAppClipCode] & 1) != 0
    || ([v5 isEqualToString:CPSSessionLaunchReasonQR] & 1) != 0
    || ([v5 isEqualToString:CPSSessionLaunchReasonNFC] & 1) != 0)
  {
  }
  else
  {
    unsigned __int8 v24 = [v5 isEqualToString:CPSSessionLaunchReasonMessages];

    if ((v24 & 1) == 0)
    {
      uint64_t v25 = *(void *)(a1 + 48);
      v26 = +[NSError cps_errorWithCode:11];
      (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

      goto LABEL_13;
    }
  }
  unsigned int v8 = [*(id *)(a1 + 32) _canSkipShowingAppClipCardOnLaunchForSession:v3];
  id v9 = sub_1000051D4();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      char v13 = v9;
      unsigned int v14 = [v3 configuration];
      id v15 = [v14 launchReason];
      int v27 = 134218755;
      uint64_t v28 = v11;
      __int16 v29 = 2117;
      uint64_t v30 = v12;
      __int16 v31 = 2112;
      v32 = v15;
      __int16 v33 = 2048;
      id v34 = v3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): Opening clip directly with URL (%{sensitive}@) with launch reason (%@), session (%p)", (uint8_t *)&v27, 0x2Au);
    }
    __int16 v16 = *(void **)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = [v3 launchOptions];
    [v16 _openClipDirectlyWithURL:v17 launchOptions:v18 reply:*(void *)(a1 + 48)];
  }
  else
  {
    if (v10)
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      id v21 = v9;
      id v22 = [v3 configuration];
      id v23 = [v22 launchReason];
      int v27 = 134218755;
      uint64_t v28 = v19;
      __int16 v29 = 2117;
      uint64_t v30 = v20;
      __int16 v31 = 2112;
      v32 = v23;
      __int16 v33 = 2048;
      id v34 = v3;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): Opening clip with invocation UI for URL (%{sensitive}@) with launch reason (%@), session (%p)", (uint8_t *)&v27, 0x2Au);
    }
    [*(id *)(a1 + 32) _openClipWithInvocationUIWithURL:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
  }
LABEL_13:
}

void sub_100006FB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_1000051D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000A524(a1, v4, v3);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100007104(void *a1, char a2)
{
  if (a2)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v4 = sub_1000051D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[5];
      int v7 = 134218243;
      uint64_t v8 = v5;
      __int16 v9 = 2117;
      uint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): user did not open clip for url: %{sensitive}@", (uint8_t *)&v7, 0x16u);
    }
    id v3 = +[NSError cps_errorWithCode:8];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_100007668(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 metadata];
  __int16 v69 = 0;
  unsigned __int8 v68 = 0;
  id v8 = a1[4];
  __int16 v9 = [a1[5] predefinedBundleID];
  uint64_t v10 = [v8 _validateIngestedBundleID:v9 forSession:v5 appInstalled:(char *)&v69 + 1 clipRequestsLocationConfirmation:&v69 clipRequestsNotification:&v68];

  if (v10
    && ([v7 clipBundleID],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v11 isEqualToString:v10],
        v11,
        (v12 & 1) == 0))
  {
    if (v7)
    {
      id v15 = sub_1000051D4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = a1[4];
        *(_DWORD *)buf = 134217984;
        id v71 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): client ingested bundleID replaced the existing clip bundleID", buf, 0xCu);
      }
      [v7 setClipBundleID:v10];
    }
    else
    {
      id v17 = objc_alloc((Class)CPSClipMetadata);
      v75[0] = a1[6];
      v74[0] = CPSClipMetadataKeyClipTargetURL;
      v74[1] = CPSClipMetadataKeyClipURL;
      uint64_t v18 = +[NSURL cps_preIngestedURLWithBundleIdentifier:v10];
      v75[1] = v18;
      v75[2] = v10;
      v74[2] = CPSClipMetadataKeyClipBundleID;
      v74[3] = CPSClipMetadataKeyClipRequestsNotificationPermission;
      uint64_t v19 = +[NSNumber numberWithBool:v68];
      v75[3] = v19;
      v74[4] = CPSClipMetadataKeyClipRequestsLocationConfirmationPermission;
      uint64_t v20 = +[NSNumber numberWithBool:v69];
      v75[4] = v20;
      id v21 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:5];
      id v7 = [v17 initWithUncheckedDictionary:v21];

      [v5 setPreloadedMetadata:v7];
    }
    id v22 = v10;

    id v6 = v22;
  }
  else
  {
    buf[0] = 0;
    unsigned __int8 v13 = [v7 hasUpToDateVersionInstalledOnSystemIsPlaceholder:buf];
    if (buf[0]) {
      unsigned __int8 v14 = 0;
    }
    else {
      unsigned __int8 v14 = v13;
    }
    HIBYTE(v69) = v14;
  }
  id v23 = [a1[4] _deducedInstalledFullAppBundleIDForSession:v5];
  if (v23)
  {
    unsigned __int8 v24 = sub_1000051D4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = a1[4];
      *(_DWORD *)buf = 134218243;
      id v71 = v25;
      __int16 v72 = 2117;
      id v73 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): Obtained deduced full app bundleID: %{sensitive}@", buf, 0x16u);
    }
    v26 = [v5 configuration];
    uint64_t v27 = [v26 fallbackClipBundleID];

    id v6 = (id)v27;
  }
  if (v6)
  {
    unsigned int v28 = [v7 hasFullAppInstalledOnSystem];
    if (v23 || v28)
    {
      v40 = +[CPSWebClipStore sharedStore];
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_100007CEC;
      v59[3] = &unk_100014960;
      id v60 = v5;
      id v61 = a1[5];
      id v62 = v7;
      id v41 = v23;
      id v42 = a1[4];
      id v63 = v41;
      id v64 = v42;
      id v65 = a1[6];
      id v67 = a1[8];
      id v66 = v6;
      [v40 createOrUpdateExistingWebClipWithMetadata:v62 comletionHandler:v59];

      v39 = v60;
    }
    else
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100008090;
      v49[3] = &unk_1000149D8;
      id v50 = v5;
      id v51 = v7;
      id v29 = a1[5];
      id v30 = a1[4];
      id v52 = v29;
      id v53 = v30;
      id v31 = v6;
      id v54 = v31;
      char v58 = HIBYTE(v69);
      id v55 = a1[6];
      id v57 = a1[8];
      id v56 = a1[7];
      v32 = objc_retainBlock(v49);
      if (+[CPSUtilities deviceIsLocked])
      {
        id v33 = objc_alloc_init((Class)SBSLockScreenService);
        id v34 = sub_1000051D4();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          id v35 = a1[4];
          *(_DWORD *)buf = 134218243;
          id v71 = v35;
          __int16 v72 = 2113;
          id v73 = v31;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): attempting device unlock for %{private}@", buf, 0x16u);
        }
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100008734;
        v43[3] = &unk_100014A28;
        id v44 = v33;
        char v48 = HIBYTE(v69);
        id v36 = v31;
        id v37 = a1[4];
        id v45 = v36;
        id v46 = v37;
        v47 = v32;
        id v38 = v33;
        [v38 requestPasscodeUnlockUIWithOptions:0 withCompletion:v43];
      }
      else
      {
        ((void (*)(void *))v32[2])(v32);
      }

      v39 = v50;
    }
  }
  else
  {
    v39 = +[NSError cps_errorWithCode:2];
    +[RemoteClient _didEndOpenAppForURL:a1[6] adamID:0 error:v39 completionHandler:a1[8]];
  }
}

void sub_100007CEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) updateClipDataForEntryPointWithWebClip:v3 launchOptions:*(void *)(a1 + 40)];
  id v4 = objc_alloc_init((Class)CPSClipEventsReporter);
  [v4 logClipLaunchEventForSession:*(void *)(a1 + 32)];
  id v5 = [*(id *)(a1 + 48) fullAppBundleID];
  id v6 = v5;
  if (!v5) {
    id v6 = *(void **)(a1 + 56);
  }
  id v7 = v6;

  id v8 = sub_1000051D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void **)(a1 + 48);
    uint64_t v11 = v8;
    unsigned __int8 v12 = [v10 clipLaunchURL];
    unsigned __int8 v13 = v12;
    if (!v12) {
      unsigned __int8 v13 = *(void **)(a1 + 72);
    }
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218755;
    uint64_t v26 = v9;
    __int16 v27 = 2117;
    unsigned int v28 = v13;
    __int16 v29 = 2117;
    id v30 = v7;
    __int16 v31 = 2048;
    uint64_t v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): Opening URL (%{sensitive}@) in full app (%{sensitive}@), session (%p)", buf, 0x2Au);
  }
  id v15 = [*(id *)(a1 + 48) clipLaunchURL];
  id v16 = v15;
  if (!v15) {
    id v16 = *(void **)(a1 + 72);
  }
  id v17 = [*(id *)(a1 + 32) configuration];
  id v18 = [v17 originIsControlCenter];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100007FD4;
  v23[3] = &unk_100014910;
  id v24 = *(id *)(a1 + 88);
  +[CPSUtilities openURL:v16 inAppWithBundleIdentifier:v7 promptForUnlock:1 originIsControlCenter:v18 completionHandler:v23];

  if (([*(id *)(a1 + 48) isPoweredByThirdParty] & 1) == 0)
  {
    uint64_t v19 = +[CPSWebClipStore sharedStore];
    uint64_t v20 = [v3 identifier];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100007FE4;
    v21[3] = &unk_100014938;
    v21[4] = *(void *)(a1 + 64);
    id v22 = v7;
    [v19 removeWebClipWithIdentifier:v20 completionHandler:v21];
  }
  [*(id *)(a1 + 64) _logOpenAppClipEventForBundleID:*(void *)(a1 + 80) session:*(void *)(a1 + 32) didOpenFullApp:1 requiresAppClipInstall:0];
}

uint64_t sub_100007FD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007FE4(uint64_t a1)
{
  uint64_t v2 = sub_1000051D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 134218243;
    uint64_t v6 = v3;
    __int16 v7 = 2113;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): remove an web clip since the app clip is not powered-by, and its parent app (%{private}@) is installed.", (uint8_t *)&v5, 0x16u);
  }
}

void sub_100008090(uint64_t a1)
{
  uint64_t v2 = sub_1000051D4();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    int v5 = [v3 logID];
    *(_DWORD *)buf = 138543618;
    id v22 = v5;
    __int16 v23 = 2082;
    id v24 = "[begin] installing clip";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InstallClipAction", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);
  }
  [*(id *)(a1 + 32) setOpeningWebClipFromDaemon:1];
  uint64_t v6 = +[CPSWebClipStore sharedStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100008288;
  v11[3] = &unk_1000149B0;
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void **)(a1 + 64);
  id v13 = v8;
  uint64_t v14 = v9;
  id v15 = v10;
  char v20 = *(unsigned char *)(a1 + 96);
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 72);
  id v19 = *(id *)(a1 + 88);
  id v18 = *(id *)(a1 + 80);
  [v6 createOrUpdateExistingWebClipWithMetadata:v7 comletionHandler:v11];
}

void sub_100008288(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) updateClipDataForEntryPointWithWebClip:v3 launchOptions:*(void *)(a1 + 40)];
  if (([*(id *)(a1 + 40) skipsLaunching] & 1) == 0)
  {
    int v5 = [v3 identifier];
    uint64_t v6 = sub_1000051D4();
    uint64_t v7 = v6;
    if (v5)
    {
      if (os_signpost_enabled(v6))
      {
        id v8 = *v4;
        uint64_t v9 = v7;
        uint64_t v10 = [v8 logID];
        *(_DWORD *)buf = 138543618;
        __int16 v31 = v10;
        __int16 v32 = 2082;
        id v33 = "[begin] opening clip";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "OpenClipAction", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);
      }
      uint64_t v11 = [*(id *)(a1 + 32) configuration];
      uint64_t v12 = [v11 originIsControlCenter];

      +[SBSWebClipService launchWebClipWithIdentifier:v5 origin:v12];
      [*(id *)(a1 + 48) _logOpenAppClipEventForBundleID:*(void *)(a1 + 56) session:*(void *)(a1 + 32) didOpenFullApp:0 requiresAppClipInstall:*(unsigned char *)(a1 + 96) == 0];
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sub_10000A5F0();
    }
  }
  id v13 = [*v4 configuration];
  if ([v13 isInvokedByPhysicalCode]) {
    unsigned int v14 = [*(id *)(a1 + 64) canUpdateOnPhysicalInovcation];
  }
  else {
    unsigned int v14 = 0;
  }

  if (*(unsigned char *)(a1 + 96) || v14)
  {
    id v18 = sub_1000051D4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = *(void **)(a1 + 48);
      char v20 = *(const char **)(a1 + 72);
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218499;
      __int16 v31 = v19;
      __int16 v32 = 2117;
      id v33 = v20;
      __int16 v34 = 2048;
      uint64_t v35 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): Skipping clip install for URL (%{sensitive}@) since bundle already installed or update disallowed, session (%p)", buf, 0x20u);
    }
    +[RemoteClient _didEndOpenAppForURL:*(void *)(a1 + 72) adamID:0 error:0 completionHandler:*(void *)(a1 + 88)];
    id v22 = sub_1000051D4();
    if (os_signpost_enabled(v22))
    {
      id v23 = *v4;
      id v24 = v22;
      id v25 = [v23 logID];
      *(_DWORD *)buf = 138543618;
      __int16 v31 = v25;
      __int16 v32 = 2082;
      id v33 = "[end] installing clip";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InstallClipAction", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);
    }
  }
  else
  {
    id v15 = [*(id *)(a1 + 80) clipInstaller];
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 32);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100008634;
    v26[3] = &unk_100014988;
    id v27 = *(id *)(a1 + 72);
    id v29 = *(id *)(a1 + 88);
    id v28 = *(id *)(a1 + 32);
    [v15 installClipWithBundleID:v16 session:v17 completion:v26];
  }
}

void sub_100008634(void *a1, uint64_t a2)
{
  +[RemoteClient _didEndOpenAppForURL:a1[4] adamID:0 error:a2 completionHandler:a1[6]];
  id v3 = sub_1000051D4();
  if (os_signpost_enabled(v3))
  {
    uint64_t v4 = (void *)a1[5];
    int v5 = v3;
    uint64_t v6 = [v4 logID];
    int v7 = 138543618;
    id v8 = v6;
    __int16 v9 = 2082;
    uint64_t v10 = "[end] installing clip";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InstallClipAction", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", (uint8_t *)&v7, 0x16u);
  }
}

void sub_100008734(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000087FC;
  block[3] = &unk_100014A00;
  id v8 = *(id *)(a1 + 32);
  char v12 = a2;
  char v13 = *(unsigned char *)(a1 + 64);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1000087FC(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = sub_1000051D4();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v3 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218243;
      uint64_t v11 = v3;
      __int16 v12 = 2113;
      uint64_t v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): device unlocked, begin installing clip for %{private}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else if (!*(unsigned char *)(a1 + 65))
  {
    uint64_t v5 = +[CPSSessionManager sharedManager];
    uint64_t v6 = [v5 clipInstaller];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000897C;
    v8[3] = &unk_100014938;
    int8x16_t v7 = *(int8x16_t *)(a1 + 40);
    int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
    [v6 cancelPrewarmForBundleID:(id)v7.i64[0] completion:v8];
  }
}

void sub_10000897C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000051D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int8x16_t v7 = v4;
    id v8 = objc_msgSend(v3, "cps_privacyPreservingDescription");
    int v9 = 134218499;
    uint64_t v10 = v5;
    __int16 v11 = 2113;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    unsigned int v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): unlock failed, cancelled prewarm for %{private}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

void sub_1000092F8(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 32);
    [a2 addRemoteObjectProxy:v3];
  }
  else
  {
    uint64_t v4 = sub_1000051D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000A810();
    }
    uint64_t v5 = [*(id *)(a1 + 40) connection];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 auditToken];
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
    }
    int8x16_t v7 = +[LSBundleProxy bundleProxyWithAuditToken:&v19 error:0];

    id v8 = [v7 bundleIdentifier];
    if ([v8 isEqualToString:@"com.apple.ClipViewService"])
    {
      int v9 = sub_1000051D4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000A7D8(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      uint64_t v17 = *(void **)(*(void *)(a1 + 40) + 32);
      id v18 = +[NSError cps_errorWithCode:](NSError, "cps_errorWithCode:", 10, v19, v20);
      [v17 didFinishLoadingWithError:v18];
    }
  }
}

void sub_100009514(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 32);
    [a2 removeRemoteObjectProxy:v2];
  }
  else
  {
    uint64_t v3 = sub_1000051D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000A888();
    }
  }
}

void sub_100009658(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 userNotificationGranted];
    id v6 = [v5 BOOLValue];
    [v8 lastProxCardLaunchTime];
    int8x16_t v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    (*(void (**)(uint64_t, id, void *, void))(v4 + 16))(v4, v6, v7, 0);
  }
  else
  {
    uint64_t v5 = +[NSError cps_errorWithCode:10];
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v5);
  }
}

void sub_100009844(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = +[NSDate now];
    [v3 setLastActivatedTime:v4];

    uint64_t v5 = +[CPSWebClipStore sharedStore];
    [v5 saveWebClip:v3 completionHandler:0];

    id v6 = +[CPSSessionManager sharedManager];
    int8x16_t v7 = [v3 pageURL];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_1000099C4;
    v10[3] = &unk_100014AC8;
    id v13 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 32);
    id v12 = v3;
    uint64_t v14 = *(void *)(a1 + 48);
    [v6 getSessionWithURL:v7 completion:v10];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = +[NSError cps_errorWithCode:2];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

void sub_1000099C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_1000051D4();
    if (os_signpost_enabled(v4))
    {
      uint64_t v5 = v4;
      id v6 = [v3 logID];
      int v23 = 138543618;
      id v24 = v6;
      __int16 v25 = 2082;
      uint64_t v26 = "[end] opening clip enableTelemetry=YES ";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "OpenClipAction", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", (uint8_t *)&v23, 0x16u);
    }
    if (([v3 isOpeningWebClipFromDaemon] & 1) == 0)
    {
      if ([*(id *)(a1 + 32) length]) {
        CFStringRef v7 = *(const __CFString **)(a1 + 32);
      }
      else {
        CFStringRef v7 = @"com.apple.springboard";
      }
      uint64_t v10 = [v3 configuration];
      [v10 setReferrerBundleID:v7];

      id v11 = +[CPSAnalyticsLogger sharedLogger];
      id v12 = [*(id *)(a1 + 40) applicationBundleIdentifier];
      id v13 = [v3 configuration];
      uint64_t v14 = [v13 analyticsLaunchReason];
      uint64_t v15 = [v3 url];
      uint64_t v16 = objc_msgSend(v15, "cps_fallbackBundleIdentifier");
      [v11 recordDidOpenAppClipWithBundleID:v12 launchReason:v14 didShowCard:0 didOpenFullApp:0 didInstallAppClip:0 isOutOfBoxURL:v16 != 0];
    }
    [v3 setOpeningWebClipFromDaemon:0];
    uint64_t v17 = [v3 metadata];
    id v18 = [v17 webClipID];

    if (!v18)
    {
      long long v19 = [*(id *)(a1 + 40) bundleIdentifier];
      long long v20 = [v3 metadata];
      [v20 setWebClipID:v19];
    }
    if ([v3 registeredForTest])
    {
      [v3 didCompleteTestSessionAtTime:*(double *)(a1 + 56)];
      uint64_t v21 = +[CPSSessionManager sharedManager];
      id v22 = [*(id *)(a1 + 40) pageURL];
      [v21 clearSessionWithURL:v22];
    }
    else
    {
      uint64_t v21 = +[CPSClipEventsReporter reporter];
      [v21 logClipLaunchEventForSession:v3];
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    int v9 = +[NSError cps_errorWithCode:2];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

void sub_100009D94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = +[CPSClipLaunchOptions optionsForAppClipRecord:a2];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
  else
  {
    id v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
}

uint64_t sub_100009F54(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 checkAndConsumeShowsAppAttributionBannerLaunchOption];
  uint64_t v4 = *(uint64_t (**)(uint64_t, id))(v2 + 16);

  return v4(v2, v3);
}

uint64_t sub_10000A068(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000A144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000A22C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  CFStringRef v7 = sub_1000051D4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10000A900(a1, v7, v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000A328(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000A348(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000A380()
{
  sub_10000A374();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "RemoteClient (%p): Failed to find a bundleID from metadata, session (%p)", v2, 0x16u);
}

void sub_10000A404(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 logID];
  sub_10000A328((void *)&_mh_execute_header, v5, v6, "Fail to prewarm clip download. ID = [%{public}@] Error: %{public}@", v7, v8, v9, v10, 2u);
}

void sub_10000A4B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A4EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A524(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = a2;
  uint64_t v7 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  int v8 = 134218499;
  uint64_t v9 = v4;
  __int16 v10 = 2117;
  uint64_t v11 = v5;
  __int16 v12 = 2114;
  id v13 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "RemoteClient (%p): unable to open clip url %{sensitive}@ without invocation UI: %{public}@", (uint8_t *)&v8, 0x20u);
}

void sub_10000A5F0()
{
  sub_10000A374();
  __int16 v4 = 2113;
  uint64_t v5 = v0;
  __int16 v6 = 2048;
  uint64_t v7 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "RemoteClient (%p): Could not launch clip with bundleId: %{private}@ because there is no corresponding web clip identifier, session (%p)", v3, 0x20u);
}

void sub_10000A688(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  sub_10000A364();
  sub_10000A328((void *)&_mh_execute_header, v6, v7, "RemoteClient (%p): error in downloading clip: %{public}@", v8, v9, v10, v11, 2u);
}

void sub_10000A730(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  sub_10000A364();
  sub_10000A328((void *)&_mh_execute_header, v6, v7, "RemoteClient (%p): error in opening clip: %{public}@", v8, v9, v10, v11, 2u);
}

void sub_10000A7D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A810()
{
  sub_10000A374();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "registerSessionWithURL: cannot find a session for URL: %{sensitive}@", v1, 0xCu);
}

void sub_10000A888()
{
  sub_10000A374();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "unregisterSessionWithURL: cannot find a session for URL: %{sensitive}@", v1, 0xCu);
}

void sub_10000A900(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  uint64_t v6 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  int v7 = 134218242;
  uint64_t v8 = v4;
  sub_10000A364();
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "RemoteClient (%p): error fetching AMP diagnostics: %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_10000AA0C(id a1)
{
  id v3 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/clipserviced/"];
  uint64_t v1 = +[NSURL fileURLWithPath:v3 isDirectory:1];
  os_log_t v2 = (void *)qword_10001A308;
  qword_10001A308 = v1;
}

void sub_10000AB28(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) daemonLibraryDirectoryURL];
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"DomainHashFiles" isDirectory:1];
  os_log_t v2 = (void *)qword_10001A318;
  qword_10001A318 = v1;
}

void sub_10000AC2C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) daemonLibraryDirectoryURL];
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"URLLookup.db" isDirectory:1];
  os_log_t v2 = (void *)qword_10001A328;
  qword_10001A328 = v1;
}

void sub_10000AE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_10000AEC4(id a1)
{
  qword_10001A338 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CPSDaemonProtocolNonEntitled];

  _objc_release_x1();
}

void sub_10000AF0C(uint64_t a1)
{
  os_log_t v2 = sub_1000051D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = 134218242;
    id v7 = WeakRetained;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "RemoteClientNotEntitled %p: connection interrupted: %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_10000AFEC(uint64_t a1)
{
  os_log_t v2 = sub_1000051D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = 134218242;
    id v7 = WeakRetained;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "RemoteClientNotEntitled %p: connection invalidated: %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_10000B340(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3
    && ([v3 applicationBundleIdentifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 isEqualToString:*(void *)(a1 + 32)],
        v5,
        (v6 & 1) != 0))
  {
    id v7 = +[CPSClipDataSQLiteStore defaultStore];
    __int16 v8 = *(void **)(a1 + 32);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000B528;
    v16[3] = &unk_100014C90;
    id v17 = v8;
    id v9 = *(id *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void **)(a1 + 48);
    id v22 = v9;
    uint64_t v18 = v10;
    id v19 = v11;
    id v20 = v4;
    id v21 = *(id *)(a1 + 56);
    [v7 getAppClipRecordWithBundleID:v17 completion:v16];

    __int16 v12 = v17;
  }
  else
  {
    id v13 = sub_1000051D4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      uint64_t v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "The app clip requesting location confirmation or its url is not available. bundleID: %{private}@", buf, 0xCu);
    }
    uint64_t v15 = *(void *)(a1 + 64);
    __int16 v12 = +[NSError cps_errorWithCode:10];
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v12);
  }
}

void sub_10000B528(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v10 = sub_1000051D4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      uint64_t v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "The app clip requesting location confirmation was not launched by clipserviced. bundleID: %{private}@", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 72);
    uint64_t v13 = 10;
    goto LABEL_10;
  }
  if (![v3 locationConfirmationState])
  {
    uint64_t v14 = sub_1000051D4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      uint64_t v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "The app clip was not launch by QR, NFC or app clip code; or the app clip has request location confirmation befor"
        "e. bundleID: %{private}@",
        buf,
        0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 72);
    uint64_t v13 = 15;
LABEL_10:
    id v9 = +[NSError cps_errorWithCode:v13];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v9);
    goto LABEL_11;
  }
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [*(id *)(a1 + 56) applicationBundleIdentifier];
  __int16 v8 = [*(id *)(a1 + 64) localizedName];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000B770;
  v16[3] = &unk_100014C68;
  id v17 = v4;
  id v20 = *(id *)(a1 + 72);
  id v18 = *(id *)(a1 + 32);
  id v19 = *(id *)(a1 + 48);
  [v5 _requestLocationConsentWithRegion:v6 clipBundleID:v7 appName:v8 record:v17 completion:v16];

  id v9 = v17;
LABEL_11:
}

void sub_10000B770(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) locationConfirmationGranted];
    unsigned __int8 v4 = [v3 BOOLValue];

    if (v4)
    {
      if ([*(id *)(a1 + 32) locationConfirmationState])
      {
        id v5 = +[CPSLocationProvider sharedProvider];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10000BA9C;
        v16[3] = &unk_100014C40;
        uint64_t v6 = *(void *)(a1 + 48);
        id v17 = *(id *)(a1 + 40);
        id v18 = *(id *)(a1 + 32);
        id v19 = *(id *)(a1 + 56);
        [v5 confirmCurrentLocationInRegion:v6 completion:v16];

        id v7 = v17;
        goto LABEL_14;
      }
      uint64_t v11 = sub_1000051D4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138477827;
        uint64_t v23 = v14;
        uint64_t v13 = "This app clip has request location confirmation since launched. bundleID: %{private}@";
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v11 = sub_1000051D4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138477827;
        uint64_t v23 = v12;
        uint64_t v13 = "User has denied location confirmation for bundleID: %{private}@";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      }
    }
    uint64_t v15 = *(void *)(a1 + 56);
    id v7 = +[NSError cps_errorWithCode:15];
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v7);
    goto LABEL_14;
  }
  __int16 v8 = sub_1000051D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User has denied location confirmation on the consent dialog.", buf, 2u);
  }
  [*(id *)(a1 + 32) setLocationConfirmationState:0];
  id v9 = +[CPSClipDataSQLiteStore defaultStore];
  uint64_t v10 = *(void *)(a1 + 32);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000BA30;
  v20[3] = &unk_100014BF0;
  id v21 = *(id *)(a1 + 56);
  [v9 saveAppClipRecord:v10 completion:v20];

  id v7 = v21;
LABEL_14:
}

void sub_10000BA30(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError cps_errorWithCode:15];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void sub_10000BA9C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_1000051D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138478083;
    uint64_t v17 = v7;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Location confirmation request finished. bundleID: %{private}@ error: %@", buf, 0x16u);
  }
  if ([v5 code] != (id)14) {
    [*(id *)(a1 + 40) setLocationConfirmationState:0];
  }
  __int16 v8 = +[CPSClipDataSQLiteStore defaultStore];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000BC18;
  v12[3] = &unk_100014C18;
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  char v15 = a2;
  id v13 = v5;
  id v14 = v10;
  id v11 = v5;
  [v8 saveAppClipRecord:v9 completion:v12];
}

uint64_t sub_10000BC18(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void sub_10000BDB4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = sub_1000051D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cannot get user's current location. Error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v8 = objc_msgSend(objc_alloc((Class)CPSLocationConfirmationRequest), "initWithRequestState:clipBundleID:applicationName:deviceLocation:expectedRegion:", objc_msgSend(*(id *)(a1 + 32), "locationConfirmationState"), *(void *)(a1 + 40), *(void *)(a1 + 48), v5, *(void *)(a1 + 56));
    uint64_t v9 = +[CPSOpenClipCardPresenter sharedPresenter];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_10000BF50;
    v10[3] = &unk_100014CE0;
    id v11 = *(id *)(a1 + 64);
    [v9 showLocationConfirmationSheetWithRequest:v8 completion:v10];
  }
}

uint64_t sub_10000BF50(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  switch(a2)
  {
    case 0:
      goto LABEL_5;
    case 1:
      id v3 = +[NSUserDefaults cps_clipServicesDefaults];
      objc_msgSend(v3, "setCps_didShowFirstTimeLocationConsent:", 1);

      goto LABEL_3;
    case 2:
LABEL_3:
      unsigned __int8 v4 = *(uint64_t (**)(void))(*(void *)(v2 + 32) + 16);
      goto LABEL_6;
    case 3:
      id v5 = +[NSUserDefaults cps_clipServicesDefaults];
      objc_msgSend(v5, "setCps_didShowFirstTimeLocationConsent:", 1);

LABEL_5:
      unsigned __int8 v4 = *(uint64_t (**)(void))(*(void *)(v2 + 32) + 16);
LABEL_6:
      result = v4();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000C13C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000C264(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000C394(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000C598(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error when try to find the app clip requesting location confirmation: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000C610(void *a1, void *a2)
{
  uint64_t v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 processIdentifier];
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "ServerController: Connection rejected (disabled) for pid %d", (uint8_t *)v4, 8u);
}

void sub_10000C6AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error in setting up tmp directory", v1, 2u);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t CPSClipMetadataFetchIgnoresCache()
{
  return _CPSClipMetadataFetchIgnoresCache();
}

uint64_t CPSharedResourcesDirectory()
{
  return _CPSharedResourcesDirectory();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

uint64_t xpc_activity_set_completion_status()
{
  return _xpc_activity_set_completion_status();
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

id objc_msgSend__appBundleIdentifiersByURLPrefixes(void *a1, const char *a2, ...)
{
  return [a1 _appBundleIdentifiersByURLPrefixes];
}

id objc_msgSend__clipIPALinksByBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _clipIPALinksByBundleIdentifiers];
}

id objc_msgSend__connectionClientHasReadAllWebClipsEntitlement(void *a1, const char *a2, ...)
{
  return [a1 _connectionClientHasReadAllWebClipsEntitlement];
}

id objc_msgSend__connectionClientIsWebBrowser(void *a1, const char *a2, ...)
{
  return [a1 _connectionClientIsWebBrowser];
}

id objc_msgSend__remoteClientDisconnected(void *a1, const char *a2, ...)
{
  return [a1 _remoteClientDisconnected];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allSessions(void *a1, const char *a2, ...)
{
  return [a1 allSessions];
}

id objc_msgSend_analyticsLaunchReason(void *a1, const char *a2, ...)
{
  return [a1 analyticsLaunchReason];
}

id objc_msgSend_appClipMetadata(void *a1, const char *a2, ...)
{
  return [a1 appClipMetadata];
}

id objc_msgSend_appLinkResolver(void *a1, const char *a2, ...)
{
  return [a1 appLinkResolver];
}

id objc_msgSend_applicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationBundleIdentifier];
}

id objc_msgSend_applicationIconFileURL(void *a1, const char *a2, ...)
{
  return [a1 applicationIconFileURL];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_canUpdateOnPhysicalInovcation(void *a1, const char *a2, ...)
{
  return [a1 canUpdateOnPhysicalInovcation];
}

id objc_msgSend_checkAndConsumeShowsAppAttributionBannerLaunchOption(void *a1, const char *a2, ...)
{
  return [a1 checkAndConsumeShowsAppAttributionBannerLaunchOption];
}

id objc_msgSend_checkInActivities(void *a1, const char *a2, ...)
{
  return [a1 checkInActivities];
}

id objc_msgSend_clearMetadataAndRefetch(void *a1, const char *a2, ...)
{
  return [a1 clearMetadataAndRefetch];
}

id objc_msgSend_clipBundleID(void *a1, const char *a2, ...)
{
  return [a1 clipBundleID];
}

id objc_msgSend_clipIncompatibleWithCurrentDevice(void *a1, const char *a2, ...)
{
  return [a1 clipIncompatibleWithCurrentDevice];
}

id objc_msgSend_clipInstaller(void *a1, const char *a2, ...)
{
  return [a1 clipInstaller];
}

id objc_msgSend_clipIpaURL(void *a1, const char *a2, ...)
{
  return [a1 clipIpaURL];
}

id objc_msgSend_clipLaunchURL(void *a1, const char *a2, ...)
{
  return [a1 clipLaunchURL];
}

id objc_msgSend_clipURL(void *a1, const char *a2, ...)
{
  return [a1 clipURL];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_daemonLibraryDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 daemonLibraryDirectoryURL];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_deviceCapabilitiesDontMatch(void *a1, const char *a2, ...)
{
  return [a1 deviceCapabilitiesDontMatch];
}

id objc_msgSend_deviceIsLocked(void *a1, const char *a2, ...)
{
  return [a1 deviceIsLocked];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_downloadedURL(void *a1, const char *a2, ...)
{
  return [a1 downloadedURL];
}

id objc_msgSend_fallbackClipBundleID(void *a1, const char *a2, ...)
{
  return [a1 fallbackClipBundleID];
}

id objc_msgSend_fetchHeroImage(void *a1, const char *a2, ...)
{
  return [a1 fetchHeroImage];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fullAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 fullAppBundleID];
}

id objc_msgSend_fullAppOnly(void *a1, const char *a2, ...)
{
  return [a1 fullAppOnly];
}

id objc_msgSend_hasFullAppInstalledOnSystem(void *a1, const char *a2, ...)
{
  return [a1 hasFullAppInstalledOnSystem];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invocationPolicy(void *a1, const char *a2, ...)
{
  return [a1 invocationPolicy];
}

id objc_msgSend_ipaLink(void *a1, const char *a2, ...)
{
  return [a1 ipaLink];
}

id objc_msgSend_isEligible(void *a1, const char *a2, ...)
{
  return [a1 isEligible];
}

id objc_msgSend_isInvokedByPhysicalCode(void *a1, const char *a2, ...)
{
  return [a1 isInvokedByPhysicalCode];
}

id objc_msgSend_isOpeningWebClipFromDaemon(void *a1, const char *a2, ...)
{
  return [a1 isOpeningWebClipFromDaemon];
}

id objc_msgSend_isPoweredByThirdParty(void *a1, const char *a2, ...)
{
  return [a1 isPoweredByThirdParty];
}

id objc_msgSend_isSupported(void *a1, const char *a2, ...)
{
  return [a1 isSupported];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastProxCardLaunchTime(void *a1, const char *a2, ...)
{
  return [a1 lastProxCardLaunchTime];
}

id objc_msgSend_launchOptions(void *a1, const char *a2, ...)
{
  return [a1 launchOptions];
}

id objc_msgSend_launchReason(void *a1, const char *a2, ...)
{
  return [a1 launchReason];
}

id objc_msgSend_legacyInstaller(void *a1, const char *a2, ...)
{
  return [a1 legacyInstaller];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_locationConfirmationGranted(void *a1, const char *a2, ...)
{
  return [a1 locationConfirmationGranted];
}

id objc_msgSend_locationConfirmationState(void *a1, const char *a2, ...)
{
  return [a1 locationConfirmationState];
}

id objc_msgSend_locationServiceEnabled(void *a1, const char *a2, ...)
{
  return [a1 locationServiceEnabled];
}

id objc_msgSend_logID(void *a1, const char *a2, ...)
{
  return [a1 logID];
}

id objc_msgSend_mapTableWithStrongToWeakObjects(void *a1, const char *a2, ...)
{
  return [a1 mapTableWithStrongToWeakObjects];
}

id objc_msgSend_mayLaunchWithoutInvocationUI(void *a1, const char *a2, ...)
{
  return [a1 mayLaunchWithoutInvocationUI];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_originIsControlCenter(void *a1, const char *a2, ...)
{
  return [a1 originIsControlCenter];
}

id objc_msgSend_pageURL(void *a1, const char *a2, ...)
{
  return [a1 pageURL];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_predefinedBundleID(void *a1, const char *a2, ...)
{
  return [a1 predefinedBundleID];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_registeredForTest(void *a1, const char *a2, ...)
{
  return [a1 registeredForTest];
}

id objc_msgSend_reporter(void *a1, const char *a2, ...)
{
  return [a1 reporter];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedLogger(void *a1, const char *a2, ...)
{
  return [a1 sharedLogger];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPresenter(void *a1, const char *a2, ...)
{
  return [a1 sharedPresenter];
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return [a1 sharedProvider];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_sharedStore(void *a1, const char *a2, ...)
{
  return [a1 sharedStore];
}

id objc_msgSend_skipsLaunching(void *a1, const char *a2, ...)
{
  return [a1 skipsLaunching];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stopStallingCurrentInstallation(void *a1, const char *a2, ...)
{
  return [a1 stopStallingCurrentInstallation];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_usedByPPT(void *a1, const char *a2, ...)
{
  return [a1 usedByPPT];
}

id objc_msgSend_userNotificationGranted(void *a1, const char *a2, ...)
{
  return [a1 userNotificationGranted];
}

id objc_msgSend_usesDemoMetadata(void *a1, const char *a2, ...)
{
  return [a1 usesDemoMetadata];
}

id objc_msgSend_wantsEphemeralNotifications(void *a1, const char *a2, ...)
{
  return [a1 wantsEphemeralNotifications];
}

id objc_msgSend_wantsLocationConfirmation(void *a1, const char *a2, ...)
{
  return [a1 wantsLocationConfirmation];
}

id objc_msgSend_webClipID(void *a1, const char *a2, ...)
{
  return [a1 webClipID];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}