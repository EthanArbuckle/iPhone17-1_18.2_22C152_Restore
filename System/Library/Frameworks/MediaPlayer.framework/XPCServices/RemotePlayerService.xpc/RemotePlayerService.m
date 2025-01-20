id sub_100003CC4()
{
  void *v0;
  uint64_t vars8;

  if (qword_10000CC80 != -1) {
    dispatch_once(&qword_10000CC80, &stru_1000083E0);
  }
  v0 = (void *)qword_10000CC78;

  return v0;
}

void sub_100003D18(id a1)
{
  qword_10000CC78 = (uint64_t)os_log_create("com.apple.amp.MediaPlayer", "MPRemotePlayerService");

  _objc_release_x1();
}

void sub_100004114(uint64_t a1, int a2)
{
  v4 = sub_100003CC4();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v6 + 56);
      int v8 = *(_DWORD *)(v6 + 12);
      int v13 = 134218496;
      uint64_t v14 = v6;
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      __int16 v17 = 1024;
      int v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MPRemotePlayerService: %p: took process assertion %p for pid %d", (uint8_t *)&v13, 0x1Cu);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(v10 + 56);
      int v12 = *(_DWORD *)(v10 + 12);
      int v13 = 134218496;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = v11;
      __int16 v17 = 1024;
      int v18 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "MPRemotePlayerService: %p: clearing process assertion %p for pid %d [failed to acquire assertion]", (uint8_t *)&v13, 0x1Cu);
    }

    uint64_t v9 = *(void *)(a1 + 32);
    v5 = *(NSObject **)(v9 + 56);
    *(void *)(v9 + 56) = 0;
  }
}

id sub_100004268(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _shouldPreventSuspensionForBackgroundPlayback] & 1) == 0)
  {
    v2 = sub_100003CC4();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(v3 + 56);
      int v5 = *(_DWORD *)(v3 + 12);
      int v9 = 134218496;
      uint64_t v10 = v3;
      __int16 v11 = 2048;
      uint64_t v12 = v4;
      __int16 v13 = 1024;
      int v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MPRemotePlayerService: %p: invalidated process assertion %p for %d [!shouldPreventSuspensionForBackgroundPlayback]", (uint8_t *)&v9, 0x1Cu);
    }

    [*(id *)(*(void *)(a1 + 32) + 56) invalidate];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = 0;
  }
  return [*(id *)(a1 + 32) _cancelAssertionInvalidationTimerWithReason:@"event handler"];
}

void sub_100004424()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (void (*)(void))off_10000CC68;
  int v9 = off_10000CC68;
  if (!off_10000CC68)
  {
    v1 = sub_1000046C4();
    v7[3] = (uint64_t)dlsym(v1, "MPSharedBackgroundTaskProvider");
    off_10000CC68 = (_UNKNOWN *)v7[3];
    v0 = (void (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    v2 = v0();
    id v3 = v2;
  }
  else
  {
    uint64_t v4 = +[NSAssertionHandler currentHandler];
    int v5 = +[NSString stringWithUTF8String:"id<MSVBackgroundTaskProviding> _sharedBackgroundTaskProvider(void)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPRemotePlayerService.m", 41, @"%s", dlerror());

    __break(1u);
  }
}

void sub_100004578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004590(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = *(unsigned char *)(a1 + 48);
  [*(id *)(a1 + 32) _updateProcessAssertion];
  v2 = sub_100003CC4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 48);
    int v6 = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MPRemotePlayerService: %p: setWantsReverseProcessAssertion: %{BOOL}u", (uint8_t *)&v6, 0x12u);
  }

  int v5 = sub_100004424();
  [v5 endTask:*(void *)(a1 + 40)];
}

void *sub_100004674(uint64_t a1)
{
  v2 = sub_1000046C4();
  result = dlsym(v2, "MPSharedBackgroundTaskProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000CC68 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1000046C4()
{
  v4[0] = 0;
  if (!qword_10000CC70)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = (void *)3221225472;
    v4[3] = sub_100004818;
    v4[4] = &unk_1000083A0;
    v4[5] = v4;
    long long v5 = off_100008388;
    uint64_t v6 = 0;
    qword_10000CC70 = _sl_dlopen();
  }
  v0 = (void *)qword_10000CC70;
  if (!qword_10000CC70)
  {
    v0 = +[NSAssertionHandler currentHandler];
    uint64_t v3 = +[NSString stringWithUTF8String:"void *MediaPlayerLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPRemotePlayerService.m", 34, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100004818()
{
  uint64_t result = _sl_dlopen();
  qword_10000CC70 = result;
  return result;
}

void sub_100004958(void *a1)
{
  v2 = [*(id *)(a1[4] + 24) serverEndpoint];
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v3 = sub_100003CC4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    int v6 = 134218242;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    int v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MPRemotePlayerService: %p: Got server endpoint: %@", (uint8_t *)&v6, 0x16u);
  }

  long long v5 = sub_100004424();
  [v5 endTask:a1[6]];
}

void sub_100004D60(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100004ED4;
  v2[3] = &unk_100008250;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void sub_100004E04(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:BKSApplicationStateKey];
  id v4 = [v3 integerValue];

  if (v4 == (id)2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004ECC;
    block[3] = &unk_100008278;
    id v6 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_100004ECC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportUserBackgroundedApplication];
}

id sub_100004ED4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  [*(id *)(a1 + 40) reportUserBackgroundedApplication];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateProcessAssertion];
}

void sub_100005110(uint64_t a1)
{
  id v2 = sub_100005444();
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  [v2 setGlobalPrivacyClientWithAuditToken:v17];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v4 = (void *)qword_10000CC90;
  uint64_t v21 = qword_10000CC90;
  if (!qword_10000CC90)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100005528;
    v23 = &unk_100008368;
    v24 = &v18;
    sub_100005528((uint64_t)buf);
    id v4 = (void *)v19[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v18, 8);
  [v5 setXPCHostApplicationIdentifier:*(void *)(a1 + 40)];
  if (!*(void *)(*(void *)(a1 + 48) + 8))
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    id v6 = (void *)qword_10000CC98;
    uint64_t v21 = qword_10000CC98;
    if (!qword_10000CC98)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1000055F0;
      v23 = &unk_100008368;
      v24 = &v18;
      sub_1000055F0((uint64_t)buf);
      id v6 = (void *)v19[3];
    }
    uint64_t v7 = v6;
    _Block_object_dispose(&v18, 8);
    id v8 = [[v7 alloc] initWithPlayerID:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = v8;

    [*(id *)(*(void *)(a1 + 48) + 8) setDisableAutoPlay:1];
    [*(id *)(*(void *)(a1 + 48) + 8) start];
    [*(id *)(*(void *)(a1 + 48) + 8) becomeActive];
    MRMediaRemoteGetLocalOrigin();
    MRMediaRemoteSetParentApplication();
  }
  __int16 v11 = [[MPRemotePlayerServiceConnection alloc] initWithConnection:*(void *)(a1 + 32) bundleID:*(void *)(a1 + 40) pid:*(unsigned int *)(a1 + 64) playbackEngine:*(void *)(*(void *)(a1 + 48) + 8)];
  uint64_t v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MPRemotePlayerServiceProtocol];
  [*(id *)(a1 + 32) setExportedInterface:v12];

  [*(id *)(a1 + 32) setExportedObject:v11];
  [*(id *)(a1 + 32) resume];
  __int16 v13 = sub_100003CC4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "MPRemotePlayerService: %p: Resumed XPC connection: %@", buf, 0x16u);
  }

  uint64_t v16 = sub_100004424();
  [v16 endTask:*(void *)(a1 + 56)];
}

void sub_100005420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100005444()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_10000CC88;
  uint64_t v7 = qword_10000CC88;
  if (!qword_10000CC88)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100005850;
    v3[3] = &unk_100008368;
    v3[4] = &v4;
    sub_100005850((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100005510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005528(uint64_t a1)
{
  sub_1000046C4();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPServerObjectDatabase");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10000CC90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getMPServerObjectDatabaseClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPRemotePlayerService.m", 40, @"Unable to find class %s", "MPServerObjectDatabase");

    __break(1u);
  }
}

Class sub_1000055F0(uint64_t a1)
{
  v6[0] = 0;
  if (!qword_10000CCA0)
  {
    v6[1] = _NSConcreteStackBlock;
    v6[2] = (void *)3221225472;
    v6[3] = sub_1000057DC;
    v6[4] = &unk_1000083A0;
    v6[5] = v6;
    long long v7 = off_100008400;
    uint64_t v8 = 0;
    qword_10000CCA0 = _sl_dlopen();
  }
  if (!qword_10000CCA0)
  {
    id v3 = +[NSAssertionHandler currentHandler];
    uint64_t v4 = +[NSString stringWithUTF8String:"void *MediaPlaybackCoreLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"MPRemotePlayerService.m", 35, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("MPCPlaybackEngine");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = +[NSAssertionHandler currentHandler];
    id v5 = +[NSString stringWithUTF8String:"Class getMPCPlaybackEngineClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"MPRemotePlayerService.m", 42, @"Unable to find class %s", "MPCPlaybackEngine");

LABEL_10:
    __break(1u);
  }
  qword_10000CC98 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000057DC()
{
  uint64_t result = _sl_dlopen();
  qword_10000CCA0 = result;
  return result;
}

void sub_100005850(uint64_t a1)
{
  sub_1000046C4();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaLibrary");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10000CC88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getMPMediaLibraryClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPRemotePlayerService.m", 38, @"Unable to find class %s", "MPMediaLibrary");

    __break(1u);
  }
}

uint64_t start()
{
  v0 = dispatch_get_global_queue(25, 0);
  dispatch_async(v0, &stru_100008418);

  id v1 = +[NSXPCListener serviceListener];
  id v2 = objc_opt_new();
  [v1 setDelegate:v2];
  [v1 resume];

  return 0;
}

void sub_10000599C(id a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v1 = (void *)qword_10000CCA8;
  uint64_t v18 = qword_10000CCA8;
  if (!qword_10000CCA8)
  {
    uint64_t v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    uint64_t v12 = sub_100005BE8;
    __int16 v13 = &unk_100008368;
    uint64_t v14 = &v15;
    sub_100005BE8((uint64_t)&v10);
    id v1 = (void *)v16[3];
  }
  id v2 = v1;
  _Block_object_dispose(&v15, 8);
  id v3 = [v2 sharedCloudController];
  [v3 becomeActive];

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2050000000;
  uint64_t v4 = (void *)qword_10000CCB0;
  uint64_t v18 = qword_10000CCB0;
  if (!qword_10000CCB0)
  {
    uint64_t v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    uint64_t v12 = sub_100005CB0;
    __int16 v13 = &unk_100008368;
    uint64_t v14 = &v15;
    sub_100005CB0((uint64_t)&v10);
    uint64_t v4 = (void *)v16[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v15, 8);
  uint64_t v6 = [v5 sharedController];
  [v6 beginObservingCloudLibraryEnabled];

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2050000000;
  long long v7 = (void *)qword_10000CCB8;
  uint64_t v18 = qword_10000CCB8;
  if (!qword_10000CCB8)
  {
    uint64_t v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    uint64_t v12 = sub_100005D78;
    __int16 v13 = &unk_100008368;
    uint64_t v14 = &v15;
    sub_100005D78((uint64_t)&v10);
    long long v7 = (void *)v16[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v15, 8);
  [v8 setFilteringDisabled:1];
  uint64_t v9 = [sub_100005444() defaultMediaLibrary];
  [v9 beginGeneratingLibraryChangeNotifications];
}

void sub_100005BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005BE8(uint64_t a1)
{
  sub_1000046C4();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPCloudController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10000CCA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getMPCloudControllerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPRemotePlayerService.m", 36, @"Unable to find class %s", "MPCloudController");

    __break(1u);
  }
}

void sub_100005CB0(uint64_t a1)
{
  sub_1000046C4();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPCloudServiceStatusController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10000CCB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getMPCloudServiceStatusControllerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPRemotePlayerService.m", 37, @"Unable to find class %s", "MPCloudServiceStatusController");

    __break(1u);
  }
}

Class sub_100005D78(uint64_t a1)
{
  sub_1000046C4();
  Class result = objc_getClass("MPMediaQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10000CCB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v3 = +[NSAssertionHandler currentHandler];
    uint64_t v4 = +[NSString stringWithUTF8String:"Class getMPMediaQueryClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"MPRemotePlayerService.m", 39, @"Unable to find class %s", "MPMediaQuery");

    __break(1u);
    return (Class)MRMediaRemoteGetLocalOrigin();
  }
  return result;
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return _MRMediaRemoteGetLocalOrigin();
}

uint64_t MRMediaRemoteSetParentApplication()
{
  return _MRMediaRemoteSetParentApplication();
}

uint64_t MSVBundleIDForAuditToken()
{
  return _MSVBundleIDForAuditToken();
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__shouldPreventSuspensionForBackgroundPlayback(void *a1, const char *a2, ...)
{
  return [a1 _shouldPreventSuspensionForBackgroundPlayback];
}

id objc_msgSend__updateProcessAssertion(void *a1, const char *a2, ...)
{
  return [a1 _updateProcessAssertion];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_becomeActive(void *a1, const char *a2, ...)
{
  return [a1 becomeActive];
}

id objc_msgSend_beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 beginGeneratingLibraryChangeNotifications];
}

id objc_msgSend_beginObservingCloudLibraryEnabled(void *a1, const char *a2, ...)
{
  return [a1 beginObservingCloudLibraryEnabled];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return [a1 defaultMediaLibrary];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_reportUserBackgroundedApplication(void *a1, const char *a2, ...)
{
  return [a1 reportUserBackgroundedApplication];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serverEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serverEndpoint];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedCloudController(void *a1, const char *a2, ...)
{
  return [a1 sharedCloudController];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}