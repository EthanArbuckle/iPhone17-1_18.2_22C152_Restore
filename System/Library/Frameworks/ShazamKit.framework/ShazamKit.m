void sub_100003388(id a1)
{
  uint64_t vars8;

  qword_100090A00 = +[NSMapTable weakToWeakObjectsMapTable];

  _objc_release_x1();
}

void sub_10000341C(id a1)
{
  qword_100090A10 = (uint64_t)dispatch_queue_create("com.apple.shazamd.globalworkers.dispatch", 0);

  _objc_release_x1();
}

void sub_100003728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003754(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained shutdownWorker];
}

void sub_100003794(uint64_t a1)
{
  id v4 = +[SHServiceStateHandler globallyScopedWorkers];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 workerID];
  [v4 setObject:v2 forKey:v3];
}

void sub_10000394C(uint64_t a1)
{
  id v3 = +[SHServiceStateHandler globallyScopedWorkers];
  v2 = [*(id *)(a1 + 32) workerID];
  [v3 removeObjectForKey:v2];
}

void sub_100003D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003D58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003D68(uint64_t a1)
{
}

void sub_100003D70(uint64_t a1)
{
  id v5 = +[SHServiceStateHandler globallyScopedWorkers];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100004194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000041B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to setup the remote proxy %@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (void *)*((void *)WeakRetained + 1);
    *((void *)WeakRetained + 1) = 0;
  }
}

void sub_10000488C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sh_log_object();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error presenting media item %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004B04(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    int v5 = sh_log_object();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error handling apple music action with error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004DEC(uint64_t a1)
{
  uint64_t v2 = sh_log_object();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Watchdog timer fired", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005130(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000534C(void *a1, void *a2)
{
  id v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  int v5 = [WeakRetained presentationOptionsForFeatureFlags:v4];
  [WeakRetained iteratePresentationOptions:v5 mediaItem:a1[4] presentationSettings:a1[5] featureFlags:v4 completionHandler:a1[6]];
}

void sub_100005B3C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_100005BA0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v6 = WeakRetained;
  if (v8)
  {
    if (objc_msgSend(WeakRetained, "didUserCancelAuthenticationWithError:"))
    {
      [v6 iteratePresentationOptions:&__NSArray0__struct mediaItem:*(void *)(a1 + 32) presentationSettings:0 featureFlags:0 completionHandler:*(void *)(a1 + 56)];
    }
    else
    {
      id v7 = [v6 removePresentationOption:1 fromArray:*(void *)(a1 + 40)];
      [v6 iteratePresentationOptions:v7 mediaItem:*(void *)(a1 + 32) presentationSettings:0 featureFlags:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_100005C84(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v5)
  {
    id v7 = sh_log_object();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error presenting Native Track Page %@", (uint8_t *)&v9, 0xCu);
    }

    if ([WeakRetained didUserCancelAuthenticationWithError:v5])
    {
      [WeakRetained iteratePresentationOptions:&__NSArray0__struct mediaItem:*(void *)(a1 + 32) presentationSettings:0 featureFlags:0 completionHandler:*(void *)(a1 + 56)];
    }
    else
    {
      id v8 = [WeakRetained removePresentationOption:2 fromArray:*(void *)(a1 + 40)];
      [WeakRetained iteratePresentationOptions:v8 mediaItem:*(void *)(a1 + 32) presentationSettings:0 featureFlags:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_100005F8C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = sh_log_object();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Opened url %@ in the Shazam app", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error opening URL %@ with error %@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000650C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    int v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v7 = sh_log_object();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to open MusicRecognition from NSUserActivity with error: %@", (uint8_t *)&v8, 0xCu);
    }

    int v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

void sub_1000067C0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sh_log_object();
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v7;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error presenting fallback URL %@ with error: %@", buf, 0x16u);
    }

    int v8 = +[NSString stringWithFormat:@"Failed to open url %@", *(void *)(a1 + 32)];
    uint64_t v11 = a1 + 32;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(v11 + 8);
    NSErrorUserInfoKey v15 = NSDebugDescriptionErrorKey;
    v16 = v8;
    __int16 v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v13 = +[SHError errorWithCode:500 underlyingError:0 keyOverrides:v12];
    (*(void (**)(uint64_t, void, uint64_t, void *))(v10 + 16))(v10, 0, v9, v13);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Daemon opened fallback URL %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100007F10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_100007F30(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    id v4 = [(os_unfair_lock_s *)v3 connectionHandles];
    [v4 removeObject:*(void *)(a1 + 32)];

    id v5 = sh_log_object();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(os_unfair_lock_s *)v3 connectionHandles];
      int v10 = 134217984;
      id v11 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connection listener removed a handle, now we have %lu left", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v7 = [*(id *)(a1 + 32) exportedObject];
    int v8 = sh_log_object();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412546;
      id v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Calling shutdown on the service %@ of the handle %@", (uint8_t *)&v10, 0x16u);
    }

    if (objc_opt_respondsToSelector()) {
      [v7 shutdownService];
    }
    os_unfair_lock_unlock(v3 + 2);
  }
}

uint64_t sub_1000080D0(uint64_t a1)
{
  uint64_t v2 = sh_log_object();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(_DWORD *)(a1 + 56);
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Interruption handler called for service %@ from %@:%i", (uint8_t *)&v7, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_1000081A4(uint64_t a1)
{
  uint64_t v2 = sh_log_object();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(_DWORD *)(a1 + 56);
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Invalidation handler called for service %@ from %@:%i", (uint8_t *)&v7, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t start()
{
  signal(15, (void (__cdecl *)(int))1);
  v0 = dispatch_get_global_queue(0, 0);
  uint64_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v0);
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    uint64_t v2 = sh_log_object();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Failed to set tmp dir suffix", v7, 2u);
    }
  }
  uint64_t v3 = objc_alloc_init(SHServer);
  uint64_t v4 = (void *)qword_100090A20;
  qword_100090A20 = (uint64_t)v3;

  [(id)qword_100090A20 start];
  if (v1)
  {
    dispatch_source_set_event_handler(v1, &stru_100074E58);
    dispatch_resume(v1);
  }
  int v5 = +[NSRunLoop currentRunLoop];
  [v5 run];

  return 0;
}

void sub_100008414(id a1)
{
  uint64_t v1 = sh_log_object();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Software termination signal from kill. Exiting...", v2, 2u);
  }

  [(id)qword_100090A20 stop];
}

void sub_100009CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009CE4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v7
    || (uint64_t v10 = *(void **)(a1 + 32),
        id v16 = v9,
        unsigned __int8 v11 = [v10 appendBuffer:v7 atTime:v8 error:&v16],
        id v12 = v16,
        v9,
        id v9 = v12,
        (v11 & 1) == 0))
  {
    uint64_t v13 = sh_log_object();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Signature generator failed to flow audio - error %@, tearing down and creating a new instance", buf, 0xCu);
    }

    id v14 = [objc_alloc((Class)SHSignatureGenerator) initSignatureRingBufferWithDuration:3.0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setSignatureGenerator:v14];
  }
}

void sub_100009F74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_100009F98(uint64_t a1, void *a2)
{
  if (a2)
  {
    [a2 recordingIntermission];
    double v4 = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setDefaultRecordingIntermissionInSeconds:v4];

    int v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v6();
  }
  else
  {
    id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v8();
  }
}

void sub_10000A140(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_10000A164(uint64_t a1, void *a2)
{
  if (a2)
  {
    double v3 = [a2 tokenForClientIdentifier:*(void *)(a1 + 32)];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setCampaignToken:v3];

    int v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v5();
  }
  else
  {
    id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v7();
  }
}

void sub_10000A4F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_10000A518(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 56));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = [*(id *)(a1 + 48) locationProvider];
  id v7 = [v6 location];
  id v8 = +[SHServerMatchResponseParser matcherResponseFromServerData:v4 signature:v5 location:v7 context:v3];

  id v9 = objc_loadWeakRetained(&to);
  uint64_t v10 = [v9 delegate];
  id v11 = objc_loadWeakRetained(&to);
  [v10 matcher:v11 didProduceResponse:v8];

  objc_destroyWeak(&to);
}

void sub_10000A604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_10000A7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A7C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 40));
  if (v5)
  {
    id v7 = objc_loadWeakRetained(&to);
    [v7 matchSignature:*(void *)(a1 + 32) tokenizedURL:v5];
  }
  else
  {
    id v7 = +[SHError errorWithCode:202 underlyingError:v6];
    id v8 = +[SHMatcherResponse errorResponseForSignature:*(void *)(a1 + 32) error:v7];
    id v9 = objc_loadWeakRetained(&to);
    uint64_t v10 = [v9 delegate];
    id v11 = objc_loadWeakRetained(&to);
    [v10 matcher:v11 didProduceResponse:v8];
  }
  objc_destroyWeak(&to);
}

void sub_10000A8D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_10000AAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AB24(id *a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, a1 + 6);
  uint64_t v4 = [v3 data];
  if (!v4
    || ([v3 data],
        id v5 = objc_claimAutoreleasedReturnValue(),
        BOOL v6 = [v5 length] == 0,
        v5,
        v4,
        v6))
  {
    id v9 = sh_log_object();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v3 error];
      *(_DWORD *)buf = 138412290;
      v36 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Received network response, no data %@", buf, 0xCu);
    }
    id v11 = [v3 error];
    id v12 = [v11 domain];
    if ([v12 isEqualToString:NSURLErrorDomain])
    {
      uint64_t v13 = [v3 error];
      if ([v13 code] == (id)-1009)
      {
      }
      else
      {
        id v14 = [v3 error];
        BOOL v15 = [v14 code] == (id)-1005;

        if (!v15) {
          goto LABEL_15;
        }
      }
      [a1[4] duration];
      double v17 = v16;
      uint64_t v18 = [a1[4] metrics];
      [v18 signatureRecordingOffset];
      double v20 = v19;
      v21 = [a1[5] catalog];
      [v21 maximumQuerySignatureDuration];
      BOOL v23 = v17 + v20 < v22;

      if (v23)
      {
        v24 = sh_log_object();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Signature length not max so continuing recording until max", buf, 2u);
        }

        v25 = [a1[4] metrics];
        [v25 signatureRecordingOffset];
        double v27 = v26;
        v28 = [a1[5] catalog];
        [v28 maximumQuerySignatureDuration];
        id v7 = +[SHMatcherResponse noMatchWithRecordingIntermission:a1[4] recordingSignatureOffset:0.0 retrySeconds:v27 signature:v29];

        id v8 = objc_loadWeakRetained(&to);
        v30 = [v8 delegate];
        id v31 = objc_loadWeakRetained(&to);
        [v30 matcher:v31 didProduceResponse:v7];
        goto LABEL_16;
      }
    }
    else
    {
    }
LABEL_15:
    id v32 = a1[4];
    v33 = [v3 error];
    id v7 = +[SHMatcherResponse errorResponseForSignature:v32 error:v33];

    id v8 = objc_loadWeakRetained(&to);
    v30 = [v8 delegate];
    id v31 = objc_loadWeakRetained(&to);
    [v30 matcher:v31 didProduceResponse:v7];
LABEL_16:

    goto LABEL_17;
  }
  id v7 = objc_loadWeakRetained(&to);
  id v8 = [v3 data];
  [v7 responseForServerData:v8 signature:a1[4]];
LABEL_17:

  objc_destroyWeak(&to);
}

void sub_10000AEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_10000BB18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000BB44(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 data];
    *(_DWORD *)buf = 134217984;
    id v19 = [v5 length];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Haptics request complete with response data %lu.", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = [*(id *)(a1 + 32) mediaItem];
  [v7 duration];
  id v17 = 0;
  id v8 = objc_msgSend(WeakRetained, "hapticSongItemFromResponse:songDuration:error:", v3, &v17);
  id v9 = v17;

  uint64_t v10 = [v8 hapticsURL];

  id v11 = sh_log_object();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = v10 != 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Song attributes fetched. Media Item Has Haptic Track?: %d", buf, 8u);
  }
  BOOL v12 = v10 != 0;

  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = [v3 error];
  BOOL v15 = (void *)v14;
  if (v14) {
    id v16 = (id)v14;
  }
  else {
    id v16 = v9;
  }
  (*(void (**)(uint64_t, BOOL, id))(v13 + 16))(v13, v12, v16);
}

void sub_10000C378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,id location)
{
  objc_destroyWeak(v57);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C3A4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [SHHapticsEndpointResponse alloc];
  id v6 = [*(id *)(a1 + 40) mediaItem];
  uint64_t v4 = [[SHNetworkDownloadResponse alloc] initWithDownloadedFileLocation:0 urlResponse:0 error:*(void *)(a1 + 48)];
  id v5 = [(SHHapticsEndpointResponse *)v3 initWithRequestMediaItem:v6 networkDownloadResponse:v4];
  [v2 addObject:v5];
}

void sub_10000C454(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = [*(id *)(a1 + 32) mediaItem];
  [v5 duration];
  id v51 = 0;
  id v6 = objc_msgSend(WeakRetained, "hapticSongItemFromResponse:songDuration:error:", v3, &v51);
  id v33 = v51;

  id v7 = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = [*(id *)(a1 + 32) mediaItem];
  v34 = [v7 cachedHapticsResponseForSongItem:v6 representingMediaItem:v8];

  if (v34
    && (id v9 = objc_loadWeakRetained((id *)(a1 + 64)),
        unsigned int v10 = [v9 allowsCachedAssets],
        v9,
        v10))
  {
    id v11 = sh_log_object();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      BOOL v12 = [v6 appleMusicID];
      uint64_t v13 = [*(id *)(a1 + 32) mediaItem];
      uint64_t v14 = [v13 isrc];
      *(_DWORD *)buf = 138412546;
      id v53 = v12;
      __int16 v54 = 2112;
      id v55 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Returning cached apple archive for request. AppleMusicID: %@, ISRC: %@", buf, 0x16u);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C9AC;
    block[3] = &unk_100074FC0;
    BOOL v15 = *(NSObject **)(a1 + 40);
    id v49 = *(id *)(a1 + 48);
    id v50 = v34;
    dispatch_sync(v15, block);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

    id v16 = v49;
  }
  else
  {
    id v16 = [v6 hapticsURL];
    if (v16)
    {
      id v17 = [v6 spatialOffsets];
      uint64_t v18 = +[SHServerSpatialOffsetsParser offsetsFromResponse:v17];

      id v19 = objc_loadWeakRetained((id *)(a1 + 64));
      id v32 = [v19 hapticsDownloadRequestFromDownloadURL:v16];

      double v20 = [v6 appleMusicID];
      v21 = v20;
      if (v20)
      {
        id v22 = v20;
      }
      else
      {
        double v27 = +[NSProcessInfo processInfo];
        id v22 = [v27 globallyUniqueString];
      }
      v28 = sh_log_object();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        id v29 = [v18 count];
        *(_DWORD *)buf = 138412546;
        id v53 = v22;
        __int16 v54 = 2048;
        id v55 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Attempting to download archive with filename %@. Spatial offsets count %ld", buf, 0x16u);
      }

      id v30 = objc_loadWeakRetained((id *)(a1 + 64));
      id v31 = [v30 endpointRequester];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10000CA94;
      v35[3] = &unk_100075038;
      id v36 = *(id *)(a1 + 40);
      id v37 = *(id *)(a1 + 48);
      objc_copyWeak(&v42, (id *)(a1 + 64));
      uint64_t v38 = *(void *)(a1 + 32);
      id v39 = v6;
      id v26 = v18;
      id v40 = v26;
      id v41 = *(id *)(a1 + 56);
      [v31 performDownloadRequest:v32 filename:v22 fileType:UTTypeAppleArchive reply:v35];

      objc_destroyWeak(&v42);
    }
    else
    {
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10000C9B8;
      v43[3] = &unk_100074FE8;
      BOOL v23 = *(NSObject **)(a1 + 40);
      id v24 = *(id *)(a1 + 48);
      uint64_t v25 = *(void *)(a1 + 32);
      id v44 = v24;
      uint64_t v45 = v25;
      id v46 = v3;
      id v47 = v33;
      dispatch_sync(v23, v43);
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

      id v26 = v44;
    }
  }
}

void sub_10000C990(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_10000C9AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

void sub_10000C9B8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [SHHapticsEndpointResponse alloc];
  id v9 = [*(id *)(a1 + 40) mediaItem];
  uint64_t v4 = [SHNetworkDownloadResponse alloc];
  id v5 = [*(id *)(a1 + 48) error];
  id v6 = v5;
  if (!v5) {
    id v6 = *(void **)(a1 + 56);
  }
  id v7 = [(SHNetworkDownloadResponse *)v4 initWithDownloadedFileLocation:0 urlResponse:0 error:v6];
  id v8 = [(SHHapticsEndpointResponse *)v3 initWithRequestMediaItem:v9 networkDownloadResponse:v7];
  [v2 addObject:v8];
}

void sub_10000CA94(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CB90;
  v7[3] = &unk_100075010;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  objc_copyWeak(&v13, (id *)(a1 + 80));
  id v5 = *(void **)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = v5;
  id v11 = *(id *)(a1 + 64);
  id v12 = v3;
  id v6 = v3;
  dispatch_sync(v4, v7);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));

  objc_destroyWeak(&v13);
}

void sub_10000CB90(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [SHHapticsEndpointResponse alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v4 = [*(id *)(a1 + 40) mediaItem];
  id v5 = [WeakRetained updateMediaItem:v4 withSongItem:*(void *)(a1 + 48)];
  id v6 = [(SHHapticsEndpointResponse *)v3 initWithRequestMediaItem:v5 spatialOffsets:*(void *)(a1 + 56) networkDownloadResponse:*(void *)(a1 + 64)];
  [v2 addObject:v6];
}

void sub_10000CC50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void sub_10000D1C8(id a1)
{
  id v1 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.ShazamNotifications"];
  id v2 = (void *)qword_100090A30;
  qword_100090A30 = (uint64_t)v1;

  id v3 = (void *)qword_100090A30;
  uint64_t v4 = +[SHMatchResultUserNotificationContentProvider notificationCategories];
  [v3 setNotificationCategories:v4];

  id v5 = objc_alloc_init(SHMatchResultUserNotificationCenterDelegate);
  id v6 = (void *)qword_100090A28;
  qword_100090A28 = (uint64_t)v5;

  [(id)qword_100090A30 setDelegate:qword_100090A28];
  id v7 = (void *)qword_100090A30;

  [v7 setWantsNotificationResponsesDelivered];
}

void sub_10000DFFC(id a1)
{
  id v6 = objc_alloc_init(SHAudioSessionManager);
  id v1 = [SHAudioRecordingManager alloc];
  id v2 = +[SHAudioRecorderProvider availableRecorders];
  id v3 = [(SHAudioRecordingManager *)v1 initWithRecorders:v2];

  uint64_t v4 = [[SHAudioManager alloc] initWithAudioSessionManager:v6 audioRecordingManager:v3];
  id v5 = (void *)qword_100090A40;
  qword_100090A40 = (uint64_t)v4;
}

void sub_10001103C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011060(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = [WeakRetained session];
    uint64_t v9 = [v8 dataTaskPromiseWithRequest:v5];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100011270;
    v14[3] = &unk_1000750F0;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    id v15 = *(id *)(a1 + 32);
    [v9 addFinishBlock:v14];

    objc_destroyWeak(&v16);
  }
  else
  {
    id v10 = sh_log_object();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to encode network request %@", buf, 0xCu);
    }

    id v11 = [SHNetworkResponse alloc];
    id v12 = +[SHError errorWithCode:202 underlyingError:v6];
    id v13 = [(SHNetworkResponse *)v11 initWithData:0 urlResponse:0 error:v12];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100011254(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100011270(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [v7 data];
  uint64_t v9 = [v7 response];

  [WeakRetained handleResultData:v8 forResponse:v9 callback:*(void *)(a1 + 32) error:v6];
}

void sub_100011488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000114AC(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    id v8 = [WeakRetained session];

    uint64_t v9 = [(SHNetworkDownloadResponse *)v8 session];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000116B8;
    v14[3] = &unk_100075140;
    id v17 = a1[6];
    id v15 = a1[4];
    id v16 = a1[5];
    id v10 = [v9 downloadTaskWithRequest:v5 completionHandler:v14];

    [v10 resume];
  }
  else
  {
    id v11 = sh_log_object();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to encode network request %@", buf, 0xCu);
    }

    id v12 = [SHNetworkDownloadResponse alloc];
    id v13 = +[SHError errorWithCode:202 underlyingError:v6];
    id v8 = [(SHNetworkDownloadResponse *)v12 initWithDownloadedFileLocation:0 urlResponse:0 error:v13];

    (*((void (**)(void))a1[6] + 2))();
  }
}

void sub_1000116B8(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  if (a2)
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    id v17 = 0;
    id v10 = a3;
    id v11 = +[SHNetworkDownloadUtilities renameDownloadedFile:a2 withFilename:v8 usingType:v9 error:&v17];
    id v12 = v17;
    uint64_t v13 = a1[6];
    uint64_t v14 = [[SHNetworkDownloadResponse alloc] initWithDownloadedFileLocation:v11 urlResponse:v10 error:v12];

    (*(void (**)(uint64_t, SHNetworkDownloadResponse *))(v13 + 16))(v13, v14);
  }
  else
  {
    uint64_t v15 = a1[6];
    id v16 = a3;
    id v11 = [[SHNetworkDownloadResponse alloc] initWithDownloadedFileLocation:0 urlResponse:v16 error:v7];

    (*(void (**)(uint64_t, SHNetworkDownloadResponse *))(v15 + 16))(v15, v11);
  }
}

void sub_1000123B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sh_log_object();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error adding notification request %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012554(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 shazamID];
  id v6 = +[UNNotificationRequest requestWithIdentifier:v5 content:v4 trigger:0];

  id v7 = +[SHMatchResultNotificationScheduler userNotificationCenter];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100012650;
  v8[3] = &unk_100074CA8;
  id v9 = *(id *)(a1 + 40);
  [v7 addNotificationRequest:v6 withCompletionHandler:v8];
}

void sub_100012650(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sh_log_object();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to schedule notification: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001299C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100012A24;
  v2[3] = &unk_1000751B8;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "sh_setDefaultValuesWithCompletion:", v2);
}

void sub_100012A24(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sh_log_object();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to add default values to response context %@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100012AE8(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100012B78;
  v3[3] = &unk_1000751B8;
  id v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "sh_setCampaignTokenForClientIdentifier:completion:", v2, v3);
}

void sub_100012B78(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sh_log_object();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to add campaign token to response context %@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100012C3C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100012CA4(id a1)
{
  id v1 = +[SHLCloudContext sharedContext];
  uint64_t v2 = [v1 manateeContainer];
  id v3 = (void *)qword_100090A58;
  qword_100090A58 = v2;

  id v4 = [(id)qword_100090A58 options];
  [v4 setApplicationBundleIdentifierOverrideForTCC:@"com.apple.musicrecognition"];
}

void sub_100013204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100013230(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [v5 updateToken:4 withValue:&stru_100076968];
    id v7 = [a1[4] URLBuilder];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100013384;
    v8[3] = &unk_100075250;
    id v11 = a1[6];
    objc_copyWeak(&v12, a1 + 7);
    id v9 = v5;
    id v10 = a1[5];
    [v7 defaultValuesWithCompletion:v8];

    objc_destroyWeak(&v12);
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void sub_100013370(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100013384(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    id v5 = [a1[4] URLRepresentation];
    id v6 = +[SHMediaItemFetcher urlRequestsForBaseURL:shazamIDs:batchSize:](SHMediaItemFetcher, "urlRequestsForBaseURL:shazamIDs:batchSize:", v5, a1[5], [v3 lookupBatchSize]);

    id v7 = [WeakRetained networkRequester];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000134DC;
    v8[3] = &unk_100075228;
    id v10 = a1[6];
    void v8[4] = WeakRetained;
    id v9 = a1[5];
    [v7 performRequests:v6 completionHandler:v8];
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void sub_1000134DC(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [a1[4] contextBuilder];
    uint64_t v8 = [a1[4] bundleIdentifier];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100013684;
    v10[3] = &unk_100075200;
    id v11 = a1[5];
    id v12 = v5;
    id v13 = a1[6];
    [v7 loadContextForClientIdentifier:v8 completion:v10];
  }
  else
  {
    id v9 = sh_log_object();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error fetching media items %@", buf, 0xCu);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
}

void sub_100013684(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 32) count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v16 = a1;
  id v5 = *(id *)(a1 + 40);
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "data", v16);

        if (v11)
        {
          id v12 = [v10 data];
          uint64_t v17 = 0;
          id v13 = +[SHServerGetResponseParser mediaItemsFromServerData:v12 context:v3 error:&v17];

          if (v13) {
            [v4 addObjectsFromArray:v13];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  uint64_t v14 = *(void *)(v16 + 48);
  id v15 = [v4 copy];
  (*(void (**)(uint64_t, id, void))(v14 + 16))(v14, v15, 0);
}

void sub_100013DB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v8 = v3;
    id v5 = +[NSArray arrayWithObjects:&v8 count:1];
    [*(id *)(a1 + 32) setAttachments:v5];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
}

void sub_10001661C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = +[NSFileManager defaultManager];
    id v9 = +[NSProcessInfo processInfo];
    id v10 = [v9 globallyUniqueString];

    id v11 = [v8 temporaryDirectory];
    id v12 = [v11 URLByAppendingPathComponent:v10];
    id v13 = [v12 URLByAppendingPathExtension:@"png"];

    if (v13)
    {
      id v15 = 0;
      [v8 moveItemAtURL:v6 toURL:v13 error:&v15];
      id v14 = v15;
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100016ED4(id a1)
{
  id v1 = +[SHNotificationCenterProvider matchResultNotificationCenter];
  +[SHMatchResultNotificationScheduler setUserNotificationCenter:v1];

  id v2 = +[SHRemoteConfiguration sharedInstance];
  [v2 populateRemoteConfiguration];
}

void sub_100017260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100017284(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained delegate];
  id v5 = [v3 userInfo];

  id v6 = [v5 objectForKeyedSubscript:SHNotificationSpectralOutputPayloadKey];
  [v4 didCalculateSpectralData:v6];
}

void sub_1000181E4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = +[SHError normalizedError:a3];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v6);
}

void sub_100018334(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = +[SHError normalizedError:a3];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v6);
}

void sub_100018484(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  +[SHError normalizedError:](SHError, "normalizedError:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);
}

void sub_10001B664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B684(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001B694(uint64_t a1)
{
}

void sub_10001B69C(uint64_t a1, int a2, id obj)
{
}

void sub_10001B8E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001B900(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchedObjects];
  id v4 = NSStringFromSelector("date");
  id v5 = +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", v4, [*(id *)(a1 + 40) ascending]);

  id v29 = v5;
  id v6 = +[NSArray arrayWithObjects:&v29 count:1];
  id v7 = [v2 sortedArrayUsingDescriptors:v6];

  if ([*(id *)(a1 + 40) resultsLimit] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [v7 count];
    id v9 = [*(id *)(a1 + 40) resultsLimit];
    if (v8 >= v9) {
      id v10 = v9;
    }
    else {
      id v10 = v8;
    }
    uint64_t v11 = objc_msgSend(v7, "subarrayWithRange:", 0, v10);

    id v7 = (void *)v11;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v18 = objc_alloc((Class)SHMediaLibraryTrack);
        id v19 = objc_msgSend(v18, "initWithManagedTrack:", v17, (void)v24);
        long long v20 = [*(id *)(a1 + 40) providerIdentifier];

        if (!v20
          || ([v19 providerIdentifier],
              long long v21 = objc_claimAutoreleasedReturnValue(),
              [*(id *)(a1 + 40) providerIdentifier],
              id v22 = objc_claimAutoreleasedReturnValue(),
              unsigned int v23 = [v21 isEqualToString:v22],
              v22,
              v21,
              v23))
        {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v19];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }
}

void sub_10001BE24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001BE44(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v6);
        id v8 = objc_alloc((Class)SHMediaLibraryTrack);
        id v9 = objc_msgSend(v8, "initWithManagedTrack:", v7, (void)v10);
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void sub_10001C1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001C1E0(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v6);
        id v8 = objc_alloc((Class)SHMediaLibraryGroup);
        id v9 = objc_msgSend(v8, "initWithManagedGroup:", v7, (void)v10);
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void sub_10001C46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001C484(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchedObjects];
  if ([*(id *)(a1 + 40) resultsLimit] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = [v2 count];
    id v4 = [*(id *)(a1 + 40) resultsLimit];
    if (v3 >= v4) {
      id v5 = v4;
    }
    else {
      id v5 = v3;
    }
    id v6 = objc_msgSend(v2, "subarrayWithRange:", 0, v5);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v2;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = objc_alloc((Class)SHMediaLibraryGroup);
        id v14 = objc_msgSend(v13, "initWithManagedGroup:", v12, (void)v15);
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

void sub_10001C6E4(uint64_t a1)
{
  [*(id *)(a1 + 32) updateReportForLibraryTrack:*(void *)(a1 + 40)];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v52 = long long v61 = 0u;
  id obj = [v52 locallyFoundTracks];
  id v2 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v59;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v59 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v7 = [v6 updatedTrack];
        id v8 = [v7 metadata];

        if (v8)
        {
          id v9 = [v6 localTrack];
          uint64_t v10 = [v9 metadata];

          if (v10)
          {
            long long v11 = [v6 updatedTrack];
            uint64_t v12 = [v11 metadata];
            id v13 = [v12 encodedSystemData];
            id v14 = [v6 localTrack];
            long long v15 = [v14 metadata];
            [v15 setData:v13];
          }
          else
          {
            long long v16 = *(void **)(a1 + 32);
            long long v11 = [v6 updatedTrack];
            uint64_t v12 = [v11 metadata];
            id v13 = [v12 encodedSystemData];
            id v14 = [v6 localTrack];
            id v17 = [v16 createMetadataWithData:v13 track:v14 group:0 context:*(void *)(a1 + 48)];
          }
        }
        long long v18 = *(void **)(a1 + 32);
        id v19 = [v6 localTrack];
        long long v20 = [v6 updatedTrack];
        [v18 updateManagedTrack:v19 withUpdatedTrack:v20];
      }
      id v3 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v3);
  }

  long long v21 = [v52 locallyFoundTracks];
  id v22 = [v21 count];

  if (v22)
  {
    unsigned int v23 = sh_log_object();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      long long v24 = [v52 locallyFoundTracks];
      id v25 = [v24 count];
      *(_DWORD *)buf = 134217984;
      id v64 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Updating existing entries for %lu library track(s)", buf, 0xCu);
    }
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v26 = [v52 missingFromLocalStoreTracks];
  id v27 = [v26 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v55;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v55 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
        id v32 = (objc_class *)objc_opt_class();
        id v33 = NSStringFromClass(v32);
        v34 = +[NSEntityDescription insertNewObjectForEntityForName:v33 inManagedObjectContext:*(void *)(a1 + 48)];

        [*(id *)(a1 + 32) updateManagedTrack:v34 withUpdatedTrack:v31];
        v35 = [v31 associatedGroupIdentifier];

        if (v35)
        {
          id v36 = *(void **)(a1 + 32);
          id v37 = [v31 associatedGroupIdentifier];
          [v36 associateTrack:v34 toGroupWithIdentifier:v37 context:*(void *)(a1 + 48)];
        }
        uint64_t v38 = [v31 metadata];

        if (v38)
        {
          id v39 = *(void **)(a1 + 32);
          id v40 = [v31 metadata];
          id v41 = [v40 encodedSystemData];
          id v42 = [v39 createMetadataWithData:v41 track:v34 group:0 context:*(void *)(a1 + 48)];
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v28);
  }

  v43 = [v52 missingFromLocalStoreTracks];
  id v44 = [v43 count];

  if (v44)
  {
    uint64_t v45 = sh_log_object();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      id v46 = [v52 missingFromLocalStoreTracks];
      id v47 = [v46 count];
      *(_DWORD *)buf = 134217984;
      id v64 = v47;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Creating entries for %lu library track(s)", buf, 0xCu);
    }
  }
  uint64_t v48 = *(void *)(a1 + 56);
  id v49 = [v52 missingFromLocalStoreTracks];
  id v50 = [v49 count];
  id v51 = [v52 locallyFoundTracks];
  (*(void (**)(uint64_t, id, id))(v48 + 16))(v48, v50, [v51 count]);
}

void sub_10001CE00(id *a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = a1[4];
  id v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v5);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001D004;
        v14[3] = &unk_100075420;
        void v14[4] = v6;
        id v7 = +[NSPredicate predicateWithBlock:v14];
        id v9 = [a1[5] filteredArrayUsingPredicate:v7];
        uint64_t v10 = [v9 firstObject];

        if (v10)
        {
          long long v11 = [[SHUpdatedTrackLocalTrackPair alloc] initWithUpdatedTrack:v6 localTrack:v10];
          uint64_t v12 = [a1[6] locallyFoundTracks];
          [v12 addObject:v11];
        }
        else
        {
          long long v11 = [a1[6] missingFromLocalStoreTracks];
          [(SHUpdatedTrackLocalTrackPair *)v11 addObject:v6];
        }

        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

id sub_10001D004(uint64_t a1, void *a2)
{
  id v3 = [a2 syncID];
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_10001D150(uint64_t a1)
{
  [*(id *)(a1 + 32) updateReportForLibraryGroups:*(void *)(a1 + 40)];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v52 = long long v62 = 0u;
  id obj = [v52 locallyFoundGroups];
  id v2 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v60;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v60 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        id v7 = [v6 updatedGroup];
        id v8 = [v7 metadata];

        if (v8)
        {
          id v9 = [v6 localGroup];
          uint64_t v10 = [v9 metadata];

          if (v10)
          {
            long long v11 = [v6 updatedGroup];
            uint64_t v12 = [v11 metadata];
            id v13 = [v12 encodedSystemData];
            id v14 = [v6 localGroup];
            long long v15 = [v14 metadata];
            [v15 setData:v13];
          }
          else
          {
            long long v16 = *(void **)(a1 + 32);
            long long v11 = [v6 updatedGroup];
            uint64_t v12 = [v11 metadata];
            id v13 = [v12 encodedSystemData];
            id v14 = [v6 localGroup];
            id v17 = [v16 createMetadataWithData:v13 track:0 group:v14 context:*(void *)(a1 + 48)];
          }

          long long v18 = [v6 updatedGroup];
          id v19 = [v18 identifier];
          long long v20 = [v6 localGroup];
          [v20 setSyncID:v19];
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    }
    while (v3);
  }

  long long v21 = [v52 locallyFoundGroups];
  id v22 = [v21 count];

  if (v22)
  {
    unsigned int v23 = NSStringFromSelector("updatedGroup");
    long long v24 = NSStringFromSelector("identifier");
    id v25 = +[NSString stringWithFormat:@"@unionOfObjects.%@.%@", v23, v24];

    long long v26 = sh_log_object();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      id v27 = [v52 locallyFoundGroups];
      id v28 = [v27 valueForKeyPath:v25];
      *(_DWORD *)buf = 134218242;
      id v65 = v22;
      __int16 v66 = 2112;
      v67 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Updating existing entries for %lu Library Group IDs: %@", buf, 0x16u);
    }
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obja = [v52 missingFromLocalStoreGroups];
  id v29 = [obja countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v56;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v56 != v31) {
          objc_enumerationMutation(obja);
        }
        id v33 = *(void **)(*((void *)&v55 + 1) + 8 * (void)j);
        v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        id v36 = +[NSEntityDescription insertNewObjectForEntityForName:v35 inManagedObjectContext:*(void *)(a1 + 48)];

        id v37 = [v33 identifier];
        [v36 setSyncID:v37];

        uint64_t v38 = [v33 metadata];

        if (v38)
        {
          id v39 = *(void **)(a1 + 32);
          id v40 = [v33 metadata];
          id v41 = [v40 encodedSystemData];
          id v42 = [v39 createMetadataWithData:v41 track:0 group:v36 context:*(void *)(a1 + 48)];
        }
      }
      id v30 = [obja countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v30);
  }

  v43 = [v52 missingFromLocalStoreGroups];
  id v44 = [v43 count];

  if (v44)
  {
    uint64_t v45 = sh_log_object();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      id v46 = [v52 missingFromLocalStoreGroups];
      id v47 = [v46 count];
      *(_DWORD *)buf = 134217984;
      id v65 = v47;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Creating entries for %lu library group(s)", buf, 0xCu);
    }
  }
  uint64_t v48 = *(void *)(a1 + 56);
  id v49 = [v52 missingFromLocalStoreGroups];
  id v50 = [v49 count];
  id v51 = [v52 locallyFoundGroups];
  (*(void (**)(uint64_t, id, id))(v48 + 16))(v48, v50, [v51 count]);
}

void sub_10001D8C8(id *a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = a1[4];
  id v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v5);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001DACC;
        v14[3] = &unk_100075448;
        void v14[4] = v6;
        id v7 = +[NSPredicate predicateWithBlock:v14];
        id v9 = [a1[5] filteredArrayUsingPredicate:v7];
        uint64_t v10 = [v9 firstObject];

        if (v10)
        {
          long long v11 = [[SHUpdatedGroupLocalGroupPair alloc] initWithUpdatedGroup:v6 localGroup:v10];
          uint64_t v12 = [a1[6] locallyFoundGroups];
          [v12 addObject:v11];
        }
        else
        {
          long long v11 = [a1[6] missingFromLocalStoreGroups];
          [(SHUpdatedGroupLocalGroupPair *)v11 addObject:v6];
        }

        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

id sub_10001DACC(uint64_t a1, void *a2)
{
  id v3 = [a2 syncID];
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t sub_10001DCE0(uint64_t a1)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) deleteObject:*(void *)(*((void *)&v17 + 1) + 8 * (void)v6)];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *(id *)(a1 + 48);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(a1 + 40), "deleteObject:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v11), (void)v13);
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v9);
  }

  return (*(uint64_t (**)(void, char *))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), (char *)[*(id *)(a1 + 32) count] + (void)objc_msgSend(*(id *)(a1 + 48), "count"));
}

void sub_10001E138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E150(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "deleteObject:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v6), (void)v8);
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10001E258(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = [v2 executeRequest:v1 withContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
}

void sub_10001E33C(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = sh_log_object();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to purge local group objects: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_10001E3EC(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = sh_log_object();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to purge local track objects: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_10001E4FC(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = sh_log_object();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to delete sync metadata: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_10001E784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001E7B4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasChanges])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v3 + 40);
    unsigned __int8 v4 = [v2 save:&obj];
    objc_storeStrong((id *)(v3 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

id sub_10001E8CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

void sub_10001EAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_10001EB2C(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_10001F490(uint64_t a1)
{
  id v2 = +[SHFetchedResultsControllerFactory trackFetchedResultsControllerWithContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setTracksFetchedResultsController:v2];

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 tracksFetchedResultsController];
  [(id)v4 setDelegate:v3];

  uint64_t v5 = [*(id *)(a1 + 32) tracksFetchedResultsController];
  id v8 = 0;
  LOBYTE(v4) = [v5 performFetch:&v8];
  id v6 = v8;

  if ((v4 & 1) == 0)
  {
    id v7 = sh_log_object();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to observe local track changes: %@", buf, 0xCu);
    }
  }
}

void sub_10001F64C(uint64_t a1)
{
  id v2 = +[SHFetchedResultsControllerFactory groupFetchedResultsControllerWithContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setGroupsFetchedResultsController:v2];

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 groupsFetchedResultsController];
  [(id)v4 setDelegate:v3];

  uint64_t v5 = [*(id *)(a1 + 32) groupsFetchedResultsController];
  id v8 = 0;
  LOBYTE(v4) = [v5 performFetch:&v8];
  id v6 = v8;

  if ((v4 & 1) == 0)
  {
    id v7 = sh_log_object();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to observe local group changes: %@", buf, 0xCu);
    }
  }
}

void sub_10001FA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001FA9C(uint64_t a1)
{
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  id v16 = +[NSEntityDescription entityForName:v3 inManagedObjectContext:*(void *)(a1 + 32)];

  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = +[NSEntityDescription entityForName:v5 inManagedObjectContext:*(void *)(a1 + 32)];

  id v7 = [*(id *)(a1 + 40) entity];
  unsigned int v8 = [v7 isKindOfEntity:v16];

  uint64_t v9 = *(void **)(a1 + 40);
  if (v8)
  {
    id v10 = v9;
    id v11 = [objc_alloc((Class)SHMediaLibraryTrack) initWithManagedTrack:v10];
  }
  else
  {
    uint64_t v12 = [v9 entity];
    unsigned int v13 = [v12 isKindOfEntity:v6];

    if (!v13) {
      goto LABEL_6;
    }
    id v10 = *(id *)(a1 + 40);
    id v11 = [objc_alloc((Class)SHMediaLibraryGroup) initWithManagedGroup:v10];
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v11;

LABEL_6:
}

void sub_1000201C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000201F4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 snapshot];
  [v5 mergeSnapshot:v4];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = [*(id *)(a1 + 32) snapshot];
  [WeakRetained removeInvalidChangesFromSnapshot:v7];

  unsigned int v8 = [*(id *)(a1 + 32) snapshot];
  id v14 = 0;
  unsigned __int8 v9 = [WeakRetained _synchronizeLocalSnapshot:v8 error:&v14];
  id v10 = v14;

  if (v9)
  {
    id v11 = [*(id *)(a1 + 32) snapshot];
    uint64_t v12 = [*(id *)(a1 + 32) startCondition];
    [WeakRetained synchronizeRemoteSnapshot:v11 startCondition:v12];
  }
  else
  {
    unsigned int v13 = sh_log_object();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to sync local changes with error %@", buf, 0xCu);
    }

    [WeakRetained failedToSyncContext:*(void *)(a1 + 32)];
  }
}

void sub_1000204F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100020514(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned int v8 = [WeakRetained dataStore];
  unsigned __int8 v9 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100020640;
  v10[3] = &unk_100075608;
  id v11 = v9;
  id v12 = *(id *)(a1 + 40);
  objc_copyWeak(&v13, (id *)(a1 + 48));
  [v8 fetchLibraryItemsWithParameters:v11 completionHandler:v10];

  objc_destroyWeak(&v13);
}

void sub_10002062C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100020640(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  unsigned int v23 = v8;
  if ([a1[4] shouldUpdate])
  {
    id v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v31;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = objc_msgSend(objc_alloc((Class)SHMediaLibraryChange), "initWithLibraryItem:changeType:", *(void *)(*((void *)&v30 + 1) + 8 * (void)v14), 1, v23);
          [v10 addObject:v15];

          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v12);
    }

    id v16 = objc_alloc((Class)SHMediaLibrarySnapshot);
    id v17 = [v10 copy];
    long long v18 = +[NSOrderedSet orderedSetWithArray:v17];
    id v19 = [v16 initWithChanges:v18];

    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    long long v21 = [WeakRetained snapshotUpdater];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100020938;
    v24[3] = &unk_1000755E0;
    objc_copyWeak(&v29, a1 + 6);
    id v22 = v19;
    id v25 = v22;
    id v28 = a1[5];
    id v26 = v23;
    id v27 = v9;
    [v21 updateSnapshot:v22 completionHandler:v24];

    objc_destroyWeak(&v29);
  }
  else
  {
    (*((void (**)(id))a1[5] + 2))(a1[5]);
  }
}

void sub_10002091C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100020938(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 tracksForChangeType:1];
  if ([v4 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v6 = [WeakRetained dataStore];
    id v7 = [v4 copy];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100020B3C;
    v16[3] = &unk_1000755B8;
    id v8 = v4;
    id v17 = v8;
    [v6 persistUpdatedTracks:v7 completionHandler:v16];

    id v9 = [WeakRetained dataStore];
    id v15 = 0;
    unsigned __int8 v10 = [v9 commitChangesWithError:&v15];
    id v11 = v15;

    if ((v10 & 1) == 0)
    {
      id v12 = sh_log_object();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v8 count];
        *(_DWORD *)buf = 134218242;
        id v19 = v13;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to save %ld updated changes with error %@", buf, 0x16u);
      }
    }
  }
  [*(id *)(a1 + 32) mergeSnapshot:v3];
  id v14 = [*(id *)(a1 + 32) tracksForChangeType:1];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100020B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = sh_log_object();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) count];
    int v8 = 134218496;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2048;
    uint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Processed %lu returned track changes after update. Inserted %ld & Updated %ld local entries", (uint8_t *)&v8, 0x20u);
  }
}

void sub_1000211E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = sh_log_object();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) count];
    int v8 = 134218496;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2048;
    uint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Processed %lu changes before sync. Inserted %ld & Updated %ld local group entries", (uint8_t *)&v8, 0x20u);
  }
}

void sub_1000212B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = sh_log_object();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) count];
    int v8 = 134218496;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2048;
    uint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Processed %lu changes before sync. Inserted %ld & Updated %ld local track entries", (uint8_t *)&v8, 0x20u);
  }
}

void sub_100021384(uint64_t a1, uint64_t a2)
{
  id v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) count];
    int v6 = 134218240;
    id v7 = v5;
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Processed %lu deletions before sync. Deleted %ld local entries", (uint8_t *)&v6, 0x16u);
  }
}

void sub_10002154C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100021570(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 48));
  if ([v5 status] || !objc_msgSend(v5, "isEncrypted"))
  {
    __int16 v8 = sh_log_object();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "iCloud account is not available or device to device encryption is not supported, skipping remote sync", v17, 2u);
    }

    if ([v5 status] || (objc_msgSend(v5, "isEncrypted") & 1) != 0)
    {
      uint64_t v9 = 0;
      id v7 = 0;
    }
    else
    {
      uint64_t v19 = SHErrorDeviceToDeviceEncryptionKey;
      __int16 v20 = &__kCFBooleanFalse;
      id v7 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v9 = 2;
    }
    id v10 = objc_loadWeakRetained(&to);
    uint64_t v11 = +[SHLError errorWithCode:v9];
    __int16 v12 = [v10 mapInternalLibraryErrorToMediaLibrary:v11 keyOverrides:v7];

    id v13 = objc_loadWeakRetained(&to);
    [v13 beginLibrarySync];

    id v14 = objc_loadWeakRetained(&to);
    id v15 = [*(id *)(a1 + 32) allItemIdentifiers];
    [v14 handleLibraryError:v12 failedItemIdentifiers:v15];

    id v16 = objc_loadWeakRetained(&to);
    [v16 persistChangesAndCompleteSyncWithCompletionHandler:0];
  }
  else
  {
    id v7 = objc_loadWeakRetained(&to);
    [v7 _synchronizeRemoteSnapshot:*(void *)(a1 + 32) startCondition:*(void *)(a1 + 40)];
  }

  objc_destroyWeak(&to);
}

void sub_100021790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location)
{
}

void sub_1000224AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = sh_log_object();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) count];
    int v8 = 134218496;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2048;
    uint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Processed %lu returned track changes. Inserted %ld & Updated %ld local entries", (uint8_t *)&v8, 0x20u);
  }
}

void sub_100022778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = sh_log_object();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) count];
    int v8 = 134218496;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2048;
    uint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Processed %lu returned group changes. Inserted %ld & Updated %ld local entries", (uint8_t *)&v8, 0x20u);
  }
}

void sub_1000228F8(uint64_t a1, uint64_t a2)
{
  id v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) count];
    int v6 = 134218240;
    id v7 = v5;
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Processed %lu returned deletions. Deleted %ld local entries", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100022B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100022B28(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) mergeSnapshot:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [*(id *)(a1 + 32) tracksForChangeType:1];
  if ([v4 count])
  {
    id v5 = [WeakRetained dataStore];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100022C18;
    v6[3] = &unk_1000755B8;
    id v7 = v4;
    [v5 persistUpdatedTracks:v7 completionHandler:v6];
  }
  [WeakRetained persistChangesAndCompleteSyncWithCompletionHandler:*(void *)(a1 + 40)];
}

void sub_100022C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = sh_log_object();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) count];
    int v8 = 134218496;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2048;
    uint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Processed %lu returned track changes after update. Inserted %ld & Updated %ld local entries", (uint8_t *)&v8, 0x20u);
  }
}

void sub_1000238D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100023904(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 libraryItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = [WeakRetained snapshotUpdater];
    int v8 = [v7 condition];
    uint64_t v9 = ((uint64_t (**)(void, id))v8)[2](v8, v3);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_1000245D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[SHLError errorWithCode:2];
  int v8 = +[SHLTaskPreconditionResult resultWithError:v7];
  if (v5)
  {
    if ([v5 supportsDeviceToDeviceEncryption])
    {
      uint64_t v9 = sub_10003260C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Account supports device to device encryption", (uint8_t *)&v14, 2u);
      }

      uint64_t v10 = +[SHLTaskPreconditionResult fulfilledResult];

      int v8 = (void *)v10;
    }
  }
  else
  {
    uint64_t v11 = sub_10003260C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to fetch account info %@", (uint8_t *)&v14, 0xCu);
    }

    if (v6)
    {
      uint64_t v12 = +[SHLError errorWithCode:2 underlyingError:v6];

      uint64_t v13 = +[SHLTaskPreconditionResult resultWithError:v12];

      int v8 = (void *)v13;
      id v7 = (void *)v12;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100024DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100024DF4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v19 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = WeakRetained;
  if (v8)
  {
    uint64_t v12 = [WeakRetained delegate];
    id v13 = objc_loadWeakRetained(v9);
    id v14 = objc_loadWeakRetained(v9);
    id v15 = [v14 request];
    id v16 = [v13 responseSignatureForRequest:v15];
    id v17 = +[SHMatcherResponse errorResponseForSignature:v16 error:v8];
    [v12 matcher:v13 didProduceResponse:v17];

    [v11 _stop];
  }
  else
  {
    long long v18 = [WeakRetained sessionDriver];
    [v18 flow:v19 time:v7];
  }
}

void sub_100025C50(id a1)
{
  qword_100090A70 = [[SHLOperationQueue alloc] initOperationQueue];

  _objc_release_x1();
}

void sub_100026578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100026590(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 userInfo];
  id v8 = [v4 objectForKeyedSubscript:CKErrorRetryAfterKey];

  id v5 = v8;
  if (v8)
  {
    if (*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0.0
      || ([v8 doubleValue], id v5 = v8, v6 < *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)))
    {
      [v8 doubleValue];
      id v5 = v8;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
    }
  }
}

void sub_1000267F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10002680C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id result = objc_msgSend(*(id *)(a1 + 40), "canRetryForError:");
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

SHAudioTapMatcher *sub_10002718C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 signatureGenerator];
  [*(id *)(a1 + 32) maximumQuerySignatureDuration];
  id v25 = 0;
  unsigned __int8 v5 = objc_msgSend(v4, "updateRingBufferDuration:error:", &v25);
  id v6 = v25;

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = sh_log_object();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to update ring for recording buffer duration %@", buf, 0xCu);
    }
  }
  id v8 = objc_alloc((Class)SHSignatureBuffer);
  [*(id *)(a1 + 32) minimumQuerySignatureDuration];
  double v10 = v9;
  [*(id *)(a1 + 32) maximumQuerySignatureDuration];
  double v12 = v11;
  id v13 = [*(id *)(a1 + 32) _configuration];
  [v13 streamingBufferDuration];
  double v15 = v14;
  id v16 = [v3 signatureGenerator];
  id v17 = [v8 initWithMinimumSignatureDuration:v16 maximumSignatureDuration:v10 bufferDuration:v12 signatureGenerator:v15];

  long long v18 = [SHAudioTapMatcher alloc];
  id v19 = [v3 tap];

  id v20 = [objc_alloc((Class)SHStreamingSessionDriver) initWithSignatureBuffer:v17];
  id v21 = [*(id *)(a1 + 40) audioTapProvider];
  id v22 = [v21 audioRecordingManager];
  unsigned int v23 = [(SHAudioTapMatcher *)v18 initWithAudioTap:v19 sessionDriver:v20 audioRecordingManager:v22 catalog:*(void *)(a1 + 32)];

  return v23;
}

SHSignatureGeneratorMatcher *sub_1000273B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 signatureGenerator];
  [*(id *)(a1 + 32) maximumQuerySignatureDuration];
  id v25 = 0;
  unsigned __int8 v5 = objc_msgSend(v4, "updateRingBufferDuration:error:", &v25);
  id v6 = v25;

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = sh_log_object();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to update ring buffer for signature generation duration %@", buf, 0xCu);
    }
  }
  id v8 = objc_alloc((Class)SHSignatureBuffer);
  [*(id *)(a1 + 32) minimumQuerySignatureDuration];
  double v10 = v9;
  [*(id *)(a1 + 32) maximumQuerySignatureDuration];
  double v12 = v11;
  id v13 = [*(id *)(a1 + 32) _configuration];
  [v13 streamingBufferDuration];
  double v15 = v14;
  id v16 = [v3 signatureGenerator];
  id v17 = [v8 initWithMinimumSignatureDuration:v16 maximumSignatureDuration:v10 bufferDuration:v12 signatureGenerator:v15];

  long long v18 = [SHSignatureGeneratorMatcher alloc];
  id v19 = [v3 tap];

  id v20 = [objc_alloc((Class)SHStreamingSessionDriver) initWithSignatureBuffer:v17];
  id v21 = [*(id *)(a1 + 40) audioTapProvider];
  id v22 = [v21 audioRecordingManager];
  unsigned int v23 = [(SHSignatureGeneratorMatcher *)v18 initWithAudioTap:v19 sessionDriver:v20 audioRecordingManager:v22];

  return v23;
}

void sub_100027DC8(void *a1, uint64_t a2, AudioQueueBuffer *a3, uint64_t a4)
{
  id v6 = a1;
  id v12 = [objc_alloc((Class)AVAudioFormat) initWithStreamDescription:v6 + 8];
  uint64_t v7 = +[SHAudioUtilities audioBufferFromData:a3->mAudioData byteSize:a3->mAudioDataByteSize inFormat:v12];
  id v8 = objc_alloc((Class)AVAudioTime);
  [v12 sampleRate];
  id v9 = objc_msgSend(v8, "initWithAudioTimeStamp:sampleRate:", a4);
  double v10 = [v6 delegate];
  [v10 recorder:v6 producedAudioBuffer:v7 atTime:v9];

  double v11 = (OpaqueAudioQueue *)v6[6];
  AudioQueueEnqueueBuffer(v11, a3, 0, 0);
}

void sub_100027ECC(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 1024;
    unsigned int v8 = +[SHAudioRecorder isAudioQueueRunning:a2];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Audio queue for audio recorder %@ has changed running state %i", (uint8_t *)&v5, 0x12u);
  }
}

void sub_100028384(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100028398(uint64_t a1)
{
  id WeakRetained = (AudioQueueRef *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = AudioQueueStart(WeakRetained[6], 0);
  id v9 = 0;
  unsigned int v4 = [(id)objc_opt_class() hasAudioQueueFailedWithStatus:v3 annotateError:&v9];
  id v5 = v9;
  if (v4)
  {
    id v6 = sh_log_object();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to start audio queue after a retry", v8, 2u);
    }

    [(AudioQueueRef *)WeakRetained stopRecordingWithError:0];
    __int16 v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    __int16 v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

void sub_10002A190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002A1AC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      id v12 = [WeakRetained session];
      [v12 matchStreamingBuffer:v7 atTime:v8];
    }
    else
    {
      id v13 = sh_log_object();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138412290;
        id v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No buffer received in tap completion - error %@", (uint8_t *)&v16, 0xCu);
      }

      double v14 = [v11 errorResponseSignature];
      id v12 = +[SHMatcherResponse errorResponseForSignature:v14 error:v9];

      double v15 = [v11 delegate];
      [v15 matcher:v11 didProduceResponse:v12];

      [v11 _stop];
    }
  }
}

void sub_10002B6CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v63 = a1;
  if ([v3 count])
  {
    unsigned int v4 = [*(id *)(a1 + 32) fetchTaskTransformer];
    id v5 = [v4 cloudBackedZoneChangesOperationFromFetchTask:*(void *)(a1 + 40) forChangedZones:v3 container:*(void *)(a1 + 48)];

    id v6 = +[SHLOperationQueue defaultQueue];
    long long v61 = v5;
    id v7 = [v5 operation];
    [v6 addOperation:v7];

    a1 = v63;
    id v64 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v62 = v3;
    id obj = v3;
    id v8 = [obj countByEnumeratingWithState:&v69 objects:v81 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v70;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v70 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          id v13 = [*(id *)(a1 + 32) cache];
          double v14 = [v12 zone];
          double v15 = [v14 zoneID];
          int v16 = [v15 zoneName];
          unsigned __int8 v17 = [v13 subscriptionExistsForZoneIdentifier:v16];

          if ((v17 & 1) == 0)
          {
            long long v18 = sub_10003260C();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              id v19 = (objc_class *)objc_opt_class();
              id v20 = NSStringFromClass(v19);
              id v21 = [*(id *)(a1 + 40) identifier];
              id v22 = [v12 zone];
              unsigned int v23 = [v22 zoneID];
              long long v24 = [v23 zoneName];
              *(_DWORD *)buf = 138543874;
              id v76 = v20;
              __int16 v77 = 2112;
              v78 = v21;
              __int16 v79 = 2114;
              v80 = v24;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "<task: %{public}@ %@> Local subscription for <zone: %{public}@> does not exist, creating one now", buf, 0x20u);

              a1 = v63;
            }

            [v64 addObject:v12];
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v69 objects:v81 count:16];
      }
      while (v9);
    }

    if ([v64 count])
    {
      id v25 = [*(id *)(a1 + 32) subscriptionTaskTransformer];
      id v26 = [v25 cloudBackedOperationForZones:v64 container:*(void *)(a1 + 48)];

      id v27 = +[SHLOperationQueue defaultQueue];
      id v28 = [v26 operation];
      [v27 addOperation:v28];

      a1 = v63;
    }

    id v3 = v62;
  }
  id v29 = +[SHLCloudContext sharedContext];
  long long v30 = [v29 shazamLibraryZone];

  if (([*(id *)(a1 + 32) cloudBackedZones:v3 containsZone:v30] & 1) == 0)
  {
    long long v31 = [*(id *)(a1 + 32) cache];
    long long v32 = [v30 zoneID];
    long long v33 = [v32 zoneName];
    unsigned __int8 v34 = [v31 zoneExistsForIdentifier:v33];

    if ((v34 & 1) == 0)
    {
      v35 = [[SHLCloudBackedZone alloc] initWithZone:v30];
      id v36 = [*(id *)(v63 + 32) cache];
      id v37 = [(SHLCloudBackedZone *)v35 zone];
      uint64_t v38 = [v37 zoneID];
      id v39 = [v38 zoneName];
      id v68 = 0;
      unsigned __int8 v40 = [v36 storeZoneIdentifier:v39 error:&v68];
      id v41 = v68;

      if ((v40 & 1) == 0)
      {
        id v42 = sub_10003260C();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v76 = v41;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Failed to cache zone identifier for shazamLibraryZone in fetch task with error %{public}@", buf, 0xCu);
        }
      }
      id obja = v41;
      v43 = [*(id *)(v63 + 32) zoneTransformer];
      v74 = v35;
      id v44 = +[NSArray arrayWithObjects:&v74 count:1];
      uint64_t v45 = [v43 cloudBackedOperationForZonesToSave:v44 container:*(void *)(v63 + 48)];

      id v46 = +[SHLOperationQueue defaultQueue];
      id v47 = [v45 operation];
      [v46 addOperation:v47];

      uint64_t v48 = sub_10003260C();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        id v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        id v50 = v65 = v45;
        id v51 = [*(id *)(v63 + 40) identifier];
        v52 = [(SHLCloudBackedZone *)v35 zone];
        [v52 zoneID];
        v54 = id v53 = v3;
        long long v55 = [v54 zoneName];
        *(_DWORD *)buf = 138543874;
        id v76 = v50;
        __int16 v77 = 2112;
        v78 = v51;
        __int16 v79 = 2114;
        v80 = v55;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "<task: %{public}@ %@> <zone: %{public}@> does not exist, so we are attempting to create one with a subscription", buf, 0x20u);

        id v3 = v53;
        uint64_t v45 = v65;
      }

      long long v56 = [*(id *)(v63 + 32) subscriptionTaskTransformer];
      v73 = v35;
      long long v57 = +[NSArray arrayWithObjects:&v73 count:1];
      long long v58 = [v56 cloudBackedOperationForZones:v57 container:*(void *)(v63 + 48)];

      long long v59 = +[SHLOperationQueue defaultQueue];
      long long v60 = [v58 operation];
      [v59 addOperation:v60];
    }
  }
}

void sub_10002C600(id a1)
{
  qword_100090A80 = (uint64_t)dispatch_queue_create("com.apple.shazamd.location.dispatch", 0);

  _objc_release_x1();
}

void sub_10002C694(id a1)
{
  qword_100090A90 = +[NSMapTable weakToWeakObjectsMapTable];

  _objc_release_x1();
}

void sub_10002C860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002C87C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002C88C(uint64_t a1)
{
}

void sub_10002C894(uint64_t a1)
{
  id v5 = +[SHLocationProvider activeLocationProviders];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10002CA00(uint64_t a1)
{
  id v2 = objc_alloc((Class)CLLocationManager);
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned int v4 = +[SHLocationProvider locationQueue];
  id v5 = [v2 initWithEffectiveBundleIdentifier:@"com.apple.musicrecognition" delegate:v3 onQueue:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(*(void *)(a1 + 32) + 40) setDesiredAccuracy:-1.0];
  id v8 = +[SHLocationProvider activeLocationProviders];
  [v8 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

void sub_10002D344(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_10002D368(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (![v5 status] && objc_msgSend(v5, "isEncrypted")) {
      [WeakRetained startListeningForPushNotifications];
    }
    unsigned int v4 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
  }
}

void sub_10002D490(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10002D4AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v6 = [WeakRetained connectionQueue];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10002D578;
      v7[3] = &unk_100074FC0;
      void v7[4] = v5;
      id v8 = v3;
      dispatch_async(v6, v7);
    }
  }
}

void sub_10002D578(uint64_t a1)
{
  id v2 = objc_alloc((Class)APSConnection);
  uint64_t v3 = *(void *)(a1 + 40);
  unsigned int v4 = [*(id *)(a1 + 32) connectionQueue];
  id v5 = [v2 initWithEnvironmentName:v3 namedDelegatePort:@"com.apple.aps.shazamd" queue:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
  id v8 = [@"com.apple.icloud-container." stringByAppendingString:SHShazamKitServiceName];
  id v13 = v8;
  id v9 = +[NSArray arrayWithObjects:&v13 count:1];
  [*(id *)(*(void *)(a1 + 32) + 32) _setEnabledTopics:v9];

  uint64_t v10 = sh_log_object();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "APS Push listening for topic: '%@'", (uint8_t *)&v11, 0xCu);
  }
}

void sub_10002D888(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = sh_log_object();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error getting server preferred push environment %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002DFB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002DFD8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained libraryInfoFetcher];
  [v1 fetchLibraryInfoWithCompletionHandler:&stru_1000759C8];
}

void sub_10002E9A8(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) progress];
  id v2 = [*(id *)(a1 + 32) progress];
  objc_msgSend(v3, "setCompletedUnitCount:", (char *)objc_msgSend(v2, "completedUnitCount") + 1);
}

void sub_10002EA18(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v81 = a1;
  int v11 = [*(id *)(a1 + 40) identifier];
  [v10 removeTaskOfType:0 forIdentifier:v11 error:0];

  if (v9 && !+[SHLError canRetryForError:v9])
  {
    long long v61 = sub_10003260C();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v99 = v9;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "Failed to complete modify operation. Error %@", buf, 0xCu);
    }

    id v62 = *(void **)(a1 + 32);
    uint64_t v63 = [*(id *)(a1 + 40) identifier];
    id v64 = [v62 taskOfType:1 identifier:v63];

    if (v64)
    {
      id v65 = *(void **)(a1 + 32);
      __int16 v66 = [*(id *)(a1 + 40) identifier];
      [v65 removeTaskOfType:1 forIdentifier:v66 error:0];
    }
    id obj = +[SHLError errorWithUnderlyingError:v9];
    id v28 = [[SHLTaskOutcome alloc] initWithError:obj];
    v67 = [*(id *)(a1 + 40) delegate];
    id v68 = [*(id *)(a1 + 40) session];
    __int16 v79 = v67;
    [v67 session:v68 task:*(void *)(a1 + 40) didProduceOutcome:v28];
  }
  else
  {
    id v76 = v7;
    if (v7) {
      id v12 = v7;
    }
    else {
      id v12 = &__NSArray0__struct;
    }
    id v13 = v12;
    id v75 = v8;
    if (v8) {
      double v14 = v8;
    }
    else {
      double v14 = &__NSArray0__struct;
    }
    id v77 = v14;
    __int16 v79 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
    v78 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id obj = v13;
    id v15 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v92;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v92 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          id v20 = [[SHLCloudBackedItem alloc] initWithRecord:v19];
          id v21 = [v19 recordType];
          unsigned int v22 = [v21 isEqualToString:@"Group"];

          if (v22)
          {
            unsigned int v23 = +[SHLCloudGroupTransformer libraryGroupFromCloudBackedItem:v20];
            if (v23)
            {
              long long v24 = v79;
LABEL_20:
              [v24 addObject:v23];
            }
          }
          else
          {
            id v25 = [v19 recordType];
            unsigned int v26 = [v25 isEqualToString:@"Track"];

            if (!v26) {
              goto LABEL_22;
            }
            unsigned int v23 = +[SHLCloudTrackTransformer libraryTrackFromCloudBackedItem:usingEncryption:](SHLCloudTrackTransformer, "libraryTrackFromCloudBackedItem:usingEncryption:", v20, [*(id *)(v81 + 48) isEncrypted]);
            if (v23)
            {
              long long v24 = v78;
              goto LABEL_20;
            }
          }

LABEL_22:
        }
        id v16 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
      }
      while (v16);
    }

    id v27 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v77 count]);
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v28 = (SHLTaskOutcome *)v77;
    id v29 = [(SHLTaskOutcome *)v28 countByEnumeratingWithState:&v87 objects:v96 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v88;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v88 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v33 = [*(id *)(*((void *)&v87 + 1) + 8 * (void)j) recordName];
          [v27 addObject:v33];
        }
        id v30 = [(SHLTaskOutcome *)v28 countByEnumeratingWithState:&v87 objects:v96 count:16];
      }
      while (v30);
    }

    if ([v79 count])
    {
      unsigned __int8 v34 = [*(id *)(v81 + 40) delegate];
      v35 = [*(id *)(v81 + 40) session];
      uint64_t v36 = *(void *)(v81 + 40);
      id v37 = [v79 copy];
      [v34 session:v35 task:v36 didModifyGroups:v37];
    }
    if ([v78 count])
    {
      uint64_t v38 = [*(id *)(v81 + 40) delegate];
      id v39 = [*(id *)(v81 + 40) session];
      uint64_t v40 = *(void *)(v81 + 40);
      id v41 = [v78 copy];
      [v38 session:v39 task:v40 didModifyTracks:v41];
    }
    if ([v27 count])
    {
      id v42 = [*(id *)(v81 + 40) delegate];
      v43 = [*(id *)(v81 + 40) session];
      uint64_t v44 = *(void *)(v81 + 40);
      id v45 = [v27 copy];
      [v42 session:v43 task:v44 didDeleteItemsWithIdentifiers:v45];
    }
    if (v9)
    {
      v74 = [[SHLModifyTaskRecovery alloc] initWithOriginalTask:*(void *)(v81 + 40) savedGroups:v79 savedTracks:v78 deletedIDs:v27 error:v9];
      id v46 = [(SHLModifyTaskRecovery *)v74 recoverableTasks];
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v47 = [v46 countByEnumeratingWithState:&v83 objects:v95 count:16];
      if (v47)
      {
        id v48 = v47;
        uint64_t v49 = *(void *)v84;
        do
        {
          for (k = 0; k != v48; k = (char *)k + 1)
          {
            if (*(void *)v84 != v49) {
              objc_enumerationMutation(v46);
            }
            uint64_t v51 = *(void *)(*((void *)&v83 + 1) + 8 * (void)k);
            v52 = *(void **)(v81 + 32);
            id v82 = 0;
            unsigned __int8 v53 = [v52 storeTask:v51 ofType:1 error:&v82];
            id v54 = v82;
            if ((v53 & 1) == 0)
            {
              long long v55 = sub_10003260C();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v99 = v54;
                _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Failed to store the retry modification task with error %{public}@", buf, 0xCu);
              }
            }
          }
          id v48 = [v46 countByEnumeratingWithState:&v83 objects:v95 count:16];
        }
        while (v48);
      }
      long long v56 = +[SHLError errorWithUnderlyingError:v9];
      long long v57 = [[SHLTaskOutcome alloc] initWithTasksToRetry:v46 error:v56];
      long long v58 = [*(id *)(v81 + 40) delegate];
      long long v59 = [*(id *)(v81 + 40) session];
      [v58 session:v59 task:*(void *)(v81 + 40) didProduceOutcome:v57];

      id v8 = v75;
      id v7 = v76;
      long long v60 = (SHLTaskOutcome *)v74;
    }
    else
    {
      long long v69 = *(void **)(v81 + 32);
      long long v70 = [*(id *)(v81 + 40) identifier];
      long long v71 = [v69 taskOfType:1 identifier:v70];

      if (v71)
      {
        long long v72 = *(void **)(v81 + 32);
        v73 = [*(id *)(v81 + 40) identifier];
        [v72 removeTaskOfType:1 forIdentifier:v73 error:0];
      }
      long long v60 = objc_alloc_init(SHLTaskOutcome);
      id v46 = [*(id *)(v81 + 40) delegate];
      long long v56 = [*(id *)(v81 + 40) session];
      [v46 session:v56 task:*(void *)(v81 + 40) didProduceOutcome:v60];
      id v7 = v76;
    }

    id v68 = v78;
  }
}

void sub_10002FFC0(id a1)
{
  qword_100090AA0 = objc_alloc_init(SHLCloudContext);

  _objc_release_x1();
}

void sub_100031614(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    a3 = +[SHError errorWithCode:400 underlyingError:a3];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000318E8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (a4)
  {
    a4 = +[SHError errorWithCode:400 underlyingError:a4];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100032088(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    id v5 = [a4 userInfo];
    id v6 = [v5 objectForKey:CKPartialErrorsByItemIDKey];

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100032168;
    v7[3] = &unk_100075AB8;
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

uint64_t sub_100032168(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  if ([a3 code] != (id)15)
  {
    id v5 = [*(id *)(a1 + 32) objectForKey:v10];
    id v6 = v5;
    if (v5)
    {
      id v7 = *(void **)(a1 + 40);
      id v8 = [v5 zoneName];
      [v7 removeSubscriptionForZoneIdentifier:v8 error:0];
    }
  }

  return _objc_release_x2();
}

id sub_10003260C()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100090AB8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100090AB8))
  {
    qword_100090AB0 = (uint64_t)os_log_create("com.apple.shazam.ShazamLibrary", (const char *)[@"Library" cStringUsingEncoding:4]);
    __cxa_guard_release(&qword_100090AB8);
  }
  v0 = (void *)qword_100090AB0;

  return v0;
}

void sub_100032694(_Unwind_Exception *a1)
{
}

void sub_1000327B4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isSatisfied])
  {
    id v3 = [*(id *)(a1 + 32) mutableCopy];
    [v3 removeObjectAtIndex:0];
    [*(id *)(a1 + 48) evaluatePreconditions:v3 withCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100032928(id a1)
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v1 = [v3 URLForResource:@"ShazamLibrary" withExtension:@"momd"];
  id v2 = (void *)qword_100090AC0;
  qword_100090AC0 = v1;
}

void sub_100032F3C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = +[SHLTaskPreconditionResult failedResult];
  switch(a2)
  {
    case 0:
      id v7 = sub_10003260C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138412290;
        id v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to retrieve iCloud account information with error %@", (uint8_t *)&v16, 0xCu);
      }

      if (v5)
      {
        uint64_t v8 = +[SHLTaskPreconditionResult resultWithError:v5];
        goto LABEL_19;
      }
      break;
    case 1:
      id v9 = sub_10003260C();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_18;
      }
      LOWORD(v16) = 0;
      id v10 = "iCloud account is available";
      goto LABEL_17;
    case 2:
      int v11 = sub_10003260C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "iCloud account is restricted", (uint8_t *)&v16, 2u);
      }

      uint64_t v12 = 1;
      goto LABEL_14;
    case 3:
      id v13 = sub_10003260C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No iCloud account available", (uint8_t *)&v16, 2u);
      }

      uint64_t v12 = 0;
LABEL_14:
      uint64_t v14 = +[SHLError errorWithCode:v12];
      uint64_t v15 = +[SHLTaskPreconditionResult resultWithError:v14];

      id v6 = (void *)v14;
      goto LABEL_20;
    case 4:
      id v9 = sub_10003260C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        id v10 = "iCloud account is temporarily unavailable";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, 2u);
      }
LABEL_18:

      uint64_t v8 = +[SHLTaskPreconditionResult fulfilledResult];
LABEL_19:
      uint64_t v15 = v8;
LABEL_20:

      id v6 = (void *)v15;
      break;
    default:
      break;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL sub_100033320(id a1, SHMediaLibraryChange *a2)
{
  id v2 = a2;
  if ([(SHMediaLibraryChange *)v2 changeType] == (id)1)
  {
    id v3 = [(SHMediaLibraryChange *)v2 libraryItem];
    id v4 = [v3 lastUpdatedDate];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void sub_1000334AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc((Class)SHMediaLibrarySnapshot);
  uint64_t v8 = +[NSOrderedSet orderedSetWithArray:v6];

  id v9 = [v7 initWithChanges:v8];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100033860(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v34 = a3;
  id v6 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v13 = [v12 shazamID];

        if (v13)
        {
          uint64_t v14 = [v12 shazamID];
          [v6 setObject:v12 forKey:v14];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v9);
  }
  long long v32 = v7;

  v35 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 32) count]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v33 = a1;
  id v15 = *(id *)(a1 + 32);
  id v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v37;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * (void)j), "copy", v32);
        id v21 = [v20 libraryItem];
        unsigned int v22 = [v21 shazamKey];

        if (v22)
        {
          unsigned int v23 = [v20 libraryItem];
          long long v24 = [v23 shazamKey];
          id v25 = [v24 validatedKey];
          unsigned int v26 = [v6 objectForKey:v25];

          if (v26)
          {
            id v27 = [v20 libraryItem];
            [v27 updateWithMediaItem:v26];

            id v28 = +[NSDate date];
            id v29 = [v20 libraryItem];
            [v29 setLastUpdatedDate:v28];

            [v35 addObject:v20];
          }
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v17);
  }

  uint64_t v30 = *(void *)(v33 + 40);
  id v31 = [v35 copy];
  (*(void (**)(uint64_t, id, id))(v30 + 16))(v30, v31, v34);
}

void sub_100036684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
}

void sub_1000366BC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((a2 & 1) == 0)
  {
    id v7 = sh_log_object();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to start recorder %@ with error: %@", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
  }
  id v9 = [WeakRetained startRecognitionGroup];
  dispatch_group_leave(v9);
}

void sub_1000398EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100039928(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) tasksToRetry];
  [WeakRetained retryFailedTasks:v2];
}

void sub_100039AA4(uint64_t a1, int a2)
{
  id v4 = sub_10003260C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)id v25 = a2;
    *(_WORD *)&v25[4] = 2114;
    *(void *)&v25[6] = v6;
    *(_WORD *)&v25[14] = 2112;
    *(void *)&v25[16] = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Client called Library completion with success = %d for <task: %{public}@ %@>", buf, 0x1Cu);
  }
  uint64_t v8 = [*(id *)(a1 + 40) syncSession];
  id v9 = v8;
  if (a2)
  {
    uint64_t v23 = 0;
    int v10 = (id *)&v23;
    [v8 commitTransactionWithError:&v23];
  }
  else
  {
    uint64_t v22 = 0;
    int v10 = (id *)&v22;
    [v8 undoTransactionWithError:&v22];
  }
  id v11 = *v10;

  __int16 v12 = sub_10003260C();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      id v16 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138543874;
      *(void *)id v25 = v15;
      *(_WORD *)&v25[8] = 2112;
      *(void *)&v25[10] = v16;
      *(_WORD *)&v25[18] = 2112;
      *(void *)&v25[20] = v11;
      id v17 = "Error finishing transaction for <task: %{public}@ %@> %@";
      uint64_t v18 = v13;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      uint32_t v20 = 32;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v20);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v21 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v21);
    id v16 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138543618;
    *(void *)id v25 = v15;
    *(_WORD *)&v25[8] = 2112;
    *(void *)&v25[10] = v16;
    id v17 = "Finished handling transaction for <task: %{public}@ %@>";
    uint64_t v18 = v13;
    os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
    uint32_t v20 = 22;
    goto LABEL_11;
  }
}

void sub_10003ACA0(id a1)
{
  uint64_t v1 = [SHLShazamLibrary alloc];
  id v5 = +[NSBundle mainBundle];
  id v2 = [v5 bundleIdentifier];
  id v3 = [(SHLShazamLibrary *)v1 initWithScope:0 callingProcessIdentifier:v2];
  id v4 = (void *)qword_100090AD0;
  qword_100090AD0 = (uint64_t)v3;
}

void sub_10003C264(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10003C288(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003C3AC;
  v10[3] = &unk_100075D08;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v8 = v5;
  id v11 = v8;
  id v13 = *(id *)(a1 + 32);
  id v9 = v6;
  id v12 = v9;
  [WeakRetained fetchAccountTokensWithAccountInfo:v8 completion:v10];

  objc_destroyWeak(&v14);
}

void sub_10003C398(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003C3AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = objc_msgSend(objc_alloc((Class)SHMediaLibraryInfo), "initWithStatus:encrypted:", +[SHMediaLibraryInfoFetcher libraryStatusForAccountStatus:](SHMediaLibraryInfoFetcher, "libraryStatusForAccountStatus:", objc_msgSend(*(id *)(a1 + 32), "accountStatus")), objc_msgSend(*(id *)(a1 + 32), "supportsDeviceToDeviceEncryption"));
  id v3 = [WeakRetained currentUserID];
  [v2 setIdentityToken:v3];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10003C5D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003C5F4(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 domain];
    if ([v7 isEqualToString:CKErrorDomain])
    {
      id v8 = [v6 code];

      if (v8 == (id)9)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        [WeakRetained setCurrentUserID:0];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id WeakRetained = [v11 recordName];
  id v10 = objc_loadWeakRetained((id *)(a1 + 40));
  [v10 setCurrentUserID:WeakRetained];

LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003D560(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10003D584(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEncrypted] ^ 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (![WeakRetained isShazamAppInstalled] || (v4 & 1) != 0)
  {
    id v6 = +[SHRemoteConfiguration sharedInstance];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003D688;
    v7[3] = &unk_100075D90;
    void v7[4] = WeakRetained;
    id v8 = *(id *)(a1 + 32);
    [v6 featureFlagsWithCompletion:v7];
  }
  else
  {
    [WeakRetained openShazamAppLibrary:*(void *)(a1 + 32)];
  }
}

id sub_10003D688(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a2 shouldDisplayShazamUpsell];
  uint64_t v5 = *(void *)(a1 + 40);

  return [v3 openNativeHistoryWithShazamUpsell:v4 completionHandler:v5];
}

void sub_10003D888(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v7 = sh_log_object();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error opening Shazam App Library, error %@", (uint8_t *)&v8, 0xCu);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

void sub_10003DC98(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = objc_alloc_init(SHEventSignalScheduler);
    [(SHEventSignalScheduler *)v6 sendEventSignal:@"com.apple.musicrecognition.history-activated"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = sh_log_object();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to open MusicRecognition from NSUserActivity with error: %@", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10003E51C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 zoneName];
  LOBYTE(v4) = [v4 zoneExistsForIdentifier:v5];

  if ((v4 & 1) == 0)
  {
    id v6 = sub_10003260C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [v3 zoneName];
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "<zone: %@> does not exist locally, saving now", buf, 0xCu);
    }
    int v8 = *(void **)(a1 + 32);
    id v9 = [v3 zoneName];
    id v16 = 0;
    unsigned __int8 v10 = [v8 storeZoneIdentifier:v9 error:&v16];
    id v11 = v16;

    if ((v10 & 1) == 0)
    {
      id v12 = sub_10003260C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v3 zoneName];
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = v13;
        __int16 v19 = 2114;
        id v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed store store zone identifier for %@, with error %{public}@", buf, 0x16u);
      }
    }
  }
  id v14 = [objc_alloc((Class)CKRecordZone) initWithZoneID:v3];
  id v15 = [[SHLCloudBackedZone alloc] initWithZone:v14];
  [*(id *)(a1 + 40) addObject:v15];
}

void sub_10003E710(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10003260C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 zoneName];
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<zone: %@> was deleted", buf, 0xCu);
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = [v3 zoneName];
  id v16 = 0;
  unsigned __int8 v8 = [v6 removeZoneIdentifier:v7 error:&v16];
  id v9 = v16;

  if ((v8 & 1) == 0)
  {
    unsigned __int8 v10 = sub_10003260C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v3 zoneName];
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to remove zone identifier for %@, with error %{public}@", buf, 0x16u);
    }
  }
  id v12 = +[SHLError errorWithCode:7];
  id v13 = [[SHLTaskOutcome alloc] initWithError:v12];
  id v14 = [*(id *)(a1 + 40) delegate];
  id v15 = [*(id *)(a1 + 40) session];
  [v14 session:v15 task:*(void *)(a1 + 40) didProduceOutcome:v13];
}

void sub_10003E914(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10003260C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 zoneName];
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<zone: %@> was purged", buf, 0xCu);
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = [v3 zoneName];
  id v16 = 0;
  unsigned __int8 v8 = [v6 removeZoneIdentifier:v7 error:&v16];
  id v9 = v16;

  if ((v8 & 1) == 0)
  {
    unsigned __int8 v10 = sub_10003260C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v3 zoneName];
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to remove zone identifier for %@, with error %{public}@", buf, 0x16u);
    }
  }
  id v12 = +[SHLError errorWithCode:8];
  id v13 = [[SHLTaskOutcome alloc] initWithError:v12];
  id v14 = [*(id *)(a1 + 40) delegate];
  id v15 = [*(id *)(a1 + 40) session];
  [v14 session:v15 task:*(void *)(a1 + 40) didProduceOutcome:v13];
}

void sub_10003EB18(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    unsigned __int8 v8 = sub_10003260C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138412290;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Updated database <token: %@>", (uint8_t *)&v20, 0xCu);
    }

    id v9 = [[SHLCloudBackedToken alloc] initWithToken:v6];
    [*(id *)(a1 + 32) storeDatabaseToken:v9 error:0];
  }
  if ([*(id *)(a1 + 40) count])
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    unsigned __int8 v10 = *(void **)(a1 + 32);
    id v11 = [*(id *)(a1 + 48) identifier];
    [v10 removeTaskOfType:0 forIdentifier:v11 error:0];

    id v12 = [*(id *)(a1 + 48) progress];
    id v13 = [*(id *)(a1 + 48) progress];
    objc_msgSend(v12, "setCompletedUnitCount:", (char *)objc_msgSend(v13, "completedUnitCount") + 1);

    if (v7)
    {
      if ([v7 code] == (id)21) {
        [*(id *)(a1 + 32) removeDatabaseTokenWithError:0];
      }
      id v14 = +[SHLError errorWithUnderlyingError:v7];
      id v15 = [[SHLTaskOutcome alloc] initWithError:v14];
      id v16 = [*(id *)(a1 + 48) delegate];
      id v17 = [*(id *)(a1 + 48) session];
      [v16 session:v17 task:*(void *)(a1 + 48) didProduceOutcome:v15];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      id v14 = objc_alloc_init(SHLTaskOutcome);
      uint64_t v18 = [*(id *)(a1 + 48) delegate];
      __int16 v19 = [*(id *)(a1 + 48) session];
      [v18 session:v19 task:*(void *)(a1 + 48) didProduceOutcome:v14];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void sub_10003F330(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [[SHLCloudBackedItem alloc] initWithRecord:v6];
    unsigned __int8 v8 = [v6 recordType];
    unsigned int v9 = [v8 isEqualToString:@"Group"];

    if (v9)
    {
      unsigned __int8 v10 = +[SHLCloudGroupTransformer libraryGroupFromCloudBackedItem:v7];
      if (v10)
      {
        id v11 = a1 + 4;
LABEL_10:
        [*v11 addObject:v10];
        goto LABEL_11;
      }
      goto LABEL_11;
    }
    id v13 = [v6 recordType];
    unsigned int v14 = [v13 isEqualToString:@"Track"];

    if (v14)
    {
      unsigned __int8 v10 = +[SHLCloudTrackTransformer libraryTrackFromCloudBackedItem:usingEncryption:](SHLCloudTrackTransformer, "libraryTrackFromCloudBackedItem:usingEncryption:", v7, [a1[5] isEncrypted]);
      if (v10)
      {
        id v11 = a1 + 6;
        goto LABEL_10;
      }
LABEL_11:
    }
  }
  else
  {
    sub_10003260C();
    id v7 = (SHLCloudBackedItem *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v5 recordName];
      int v15 = 138412290;
      id v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_ERROR, "Failed to fetch changes for record (%@)", (uint8_t *)&v15, 0xCu);
    }
  }
}

void sub_10003F4E8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 recordName];
  [v2 addObject:v3];
}

void sub_10003F540(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v5 = a3;
    id v6 = a2;
    unsigned int v9 = [[SHLCloudBackedToken alloc] initWithToken:v5];

    id v7 = *(void **)(a1 + 32);
    unsigned __int8 v8 = [v6 zoneName];

    [v7 storeZoneToken:v9 forZoneIdentifier:v8 error:0];
  }
}

void sub_10003F5F0(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a3;
  if (v10)
  {
    id v11 = sub_10003260C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = [v9 zoneName];
      int v19 = 138543618;
      int v20 = v12;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Updated <zone: %{public}@> token: %@>", (uint8_t *)&v19, 0x16u);
    }
    id v13 = [[SHLCloudBackedToken alloc] initWithToken:v10];
    unsigned int v14 = *(void **)(a1 + 32);
    int v15 = [v9 zoneName];
    [v14 storeZoneToken:v13 forZoneIdentifier:v15 error:0];

LABEL_9:
    goto LABEL_10;
  }
  if ([a6 code] == (id)21)
  {
    id v16 = sub_10003260C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v17 = [v9 zoneName];
      int v19 = 138543362;
      int v20 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "<zone: %{public}@> token has expired. Removing saved token", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v18 = *(void **)(a1 + 32);
    id v13 = [v9 zoneName];
    [v18 removeTokenForZoneIdentifier:v13 error:0];
    goto LABEL_9;
  }
LABEL_10:
}

void sub_10003F7CC(uint64_t a1, void *a2)
{
  id v25 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) identifier];
  [v3 removeTaskOfType:0 forIdentifier:v4 error:0];

  id v5 = [*(id *)(a1 + 40) progress];
  id v6 = [*(id *)(a1 + 40) progress];
  objc_msgSend(v5, "setCompletedUnitCount:", (char *)objc_msgSend(v6, "completedUnitCount") + 1);

  if ([*(id *)(a1 + 48) count])
  {
    id v7 = [*(id *)(a1 + 40) delegate];
    unsigned __int8 v8 = [*(id *)(a1 + 40) session];
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [*(id *)(a1 + 48) copy];
    [v7 session:v8 task:v9 didFetchGroups:v10];
  }
  if ([*(id *)(a1 + 56) count])
  {
    id v11 = [*(id *)(a1 + 40) delegate];
    id v12 = [*(id *)(a1 + 40) session];
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = [*(id *)(a1 + 56) copy];
    [v11 session:v12 task:v13 didFetchTracks:v14];
  }
  if ([*(id *)(a1 + 64) count])
  {
    int v15 = [*(id *)(a1 + 40) delegate];
    id v16 = [*(id *)(a1 + 40) session];
    uint64_t v17 = *(void *)(a1 + 40);
    id v18 = [*(id *)(a1 + 64) copy];
    [v15 session:v16 task:v17 didFetchDeletedItemsWithIdentifiers:v18];
  }
  int v19 = objc_alloc_init(SHLTaskOutcome);
  if (v25)
  {
    int v20 = [SHLTaskOutcome alloc];
    __int16 v21 = +[SHLError errorWithUnderlyingError:v25];
    id v22 = [(SHLTaskOutcome *)v20 initWithError:v21];

    int v19 = v22;
  }
  uint64_t v23 = [*(id *)(a1 + 40) delegate];
  long long v24 = [*(id *)(a1 + 40) session];
  [v23 session:v24 task:*(void *)(a1 + 40) didProduceOutcome:v19];
}

void sub_100040D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100040D64(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (([v3 isSatisfied] & 1) == 0)
  {
    id v7 = sub_10003260C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      id v10 = [a1[4] identifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v9;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to schedule <task: %{public}@ %@> pre-conditions were not satisifed", buf, 0x16u);
    }
    id v11 = [v3 error];
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = +[SHLError errorWithCode:5];
    }
    id v6 = v13;

    id v14 = [SHLTaskOutcome alloc];
    id v21 = a1[4];
    int v15 = +[NSArray arrayWithObjects:&v21 count:1];
    id v16 = [(SHLTaskOutcome *)v14 initWithTasksToRetry:v15 error:v6];

    uint64_t v17 = [a1[4] delegate];
    [v17 session:WeakRetained task:a1[4] didProduceOutcome:v16];

    goto LABEL_10;
  }
  if (WeakRetained)
  {
    id v5 = [WeakRetained sessionDispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100040FB8;
    block[3] = &unk_100074FC0;
    id v19 = a1[5];
    id v20 = a1[4];
    dispatch_async(v5, block);

    id v6 = v19;
LABEL_10:
  }
}

id sub_100040FB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleModifyTask:*(void *)(a1 + 40)];
}

void sub_100041170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100041194(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (([v3 isSatisfied] & 1) == 0)
  {
    id v7 = sub_10003260C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      id v10 = [a1[4] identifier];
      *(_DWORD *)buf = 138543618;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to schedule <task: %{public}@ %@> pre-conditions were not satisifed", buf, 0x16u);
    }
    id v11 = [v3 error];
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = +[SHLError errorWithCode:5];
    }
    id v6 = v13;

    id v14 = [[SHLTaskOutcome alloc] initWithError:v6];
    int v15 = [a1[4] delegate];
    [v15 session:WeakRetained task:a1[4] didProduceOutcome:v14];

    goto LABEL_10;
  }
  if (WeakRetained)
  {
    id v5 = [WeakRetained sessionDispatchQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000413B4;
    v16[3] = &unk_100074FC0;
    id v17 = a1[5];
    id v18 = a1[4];
    dispatch_async(v5, v16);

    id v6 = v17;
LABEL_10:
  }
}

id sub_1000413B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleFetchTask:*(void *)(a1 + 40)];
}

void sub_1000429B8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    id v6 = sub_10003260C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to complete zone operation. Error %@", buf, 0xCu);
    }

    id v7 = [v5 userInfo];
    unsigned __int8 v8 = [v7 objectForKey:CKPartialErrorsByItemIDKey];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100042B08;
    v9[3] = &unk_100075F20;
    id v10 = *(id *)(a1 + 32);
    [v8 enumerateKeysAndObjectsUsingBlock:v9];
  }
}

void sub_100042B08(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 zoneName];
  [v2 removeZoneIdentifier:v3 error:0];
}

void sub_100042FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100043000(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 adamIDURL];
    if (v7)
    {

LABEL_5:
      uint64_t v9 = sh_log_object();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Making request to fetch song attributes", (uint8_t *)&v14, 2u);
      }

      id v10 = [[SHHapticsEndpointRequest alloc] initWithRequestMediaItem:*(void *)(a1 + 32) hapticsEndpoint:v5];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      id v12 = [WeakRetained networkRequester];
      [v12 performHapticsTrackAvailabilityRequest:v10 completionHandler:*(void *)(a1 + 40)];

      goto LABEL_11;
    }
    unsigned __int8 v8 = [v5 isrcURL];

    if (v8) {
      goto LABEL_5;
    }
  }
  id v13 = sh_log_object();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Not requesting for haptics availability because endpoint is missing required URLs. Error: %@", (uint8_t *)&v14, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_11:
}

void sub_100043308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004332C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 adamIDURL];
    if (v7)
    {

LABEL_5:
      id v29 = v6;
      long long v32 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 32) count]);
      uint64_t v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 32) count]);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v30 = a1;
      id obj = *(id *)(a1 + 32);
      id v10 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      id v31 = v5;
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v38;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v38 != v12) {
              objc_enumerationMutation(obj);
            }
            int v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            id v15 = +[SHHapticsProviderUtilities cachedHapticTracksForMediaItem:v14];
            if ([v15 count]
              && (id WeakRetained = objc_loadWeakRetained((id *)(v30 + 48)),
                  unsigned int v17 = [WeakRetained allowsCachedAssets],
                  WeakRetained,
                  v17))
            {
              id v18 = sh_log_object();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                id v19 = [v15 count];
                id v20 = [v14 properties];
                *(_DWORD *)buf = 134218242;
                id v42 = v19;
                __int16 v43 = 2112;
                uint64_t v44 = v20;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Retrieved cached %lu haptic tracks for media item: %@", buf, 0x16u);

                id v5 = v31;
              }

              __int16 v21 = (SHHapticsEndpointRequest *)[objc_alloc((Class)SHHaptic) initWithHapticTracks:v15 representingMediaItem:v14 spatialOffsets:&__NSArray0__struct error:0];
              id v22 = v32;
            }
            else
            {
              __int16 v21 = [[SHHapticsEndpointRequest alloc] initWithRequestMediaItem:v14 hapticsEndpoint:v5];
              id v22 = v9;
            }
            [v22 addObject:v21];
          }
          id v11 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v11);
      }

      id v23 = objc_loadWeakRetained((id *)(v30 + 48));
      __int16 v24 = [v23 networkRequester];
      id v25 = [v9 copy];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10004373C;
      v34[3] = &unk_100075F98;
      id v36 = *(id *)(v30 + 40);
      id v26 = v32;
      id v35 = v26;
      [v24 performRequests:v25 completionHandler:v34];

      id v5 = v31;
      id v6 = v29;
      goto LABEL_22;
    }
    unsigned __int8 v8 = [v5 isrcURL];

    if (v8) {
      goto LABEL_5;
    }
  }
  id v27 = sh_log_object();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v6;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Not requesting for haptics cause endpoint is missing. Error: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_22:
}

void sub_10004373C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = +[SHHapticsProviderUtilities hapticsFromDownloadResponses:a2];
    [v6 addObjectsFromArray:v7];

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v9, 0);
  }
  else
  {
    id v10 = sh_log_object();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error fetching haptics archives %@", (uint8_t *)&v11, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100043D18(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100043DD8;
  v6[3] = &unk_100074FC0;
  id v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_sync(v4, v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

id sub_100043DD8(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

void sub_100043DE4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

uint64_t sub_100044EA0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100044EB0(uint64_t a1)
{
}

void sub_100044EB8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) retryBlock];
  v2[2]();

  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

int64_t sub_10004545C(id a1, SHLLibraryBatch *a2, SHLLibraryBatch *a3)
{
  id v4 = a3;
  int64_t v5 = [(SHLLibraryBatch *)a2 numberOfItems];
  int64_t v6 = [(SHLLibraryBatch *)v4 numberOfItems];

  return v5 < v6;
}

int64_t sub_1000454B0(id a1, SHLLibraryBatch *a2, SHLLibraryBatch *a3)
{
  id v4 = a3;
  int64_t v5 = [(SHLLibraryBatch *)a2 numberOfItems];
  int64_t v6 = [(SHLLibraryBatch *)v4 numberOfItems];

  return v5 > v6;
}

void sub_1000469B4(id a1)
{
  uint64_t v1 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v2 = [v1 firstObject];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    NSTemporaryDirectory();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v4;

  int64_t v5 = +[NSURL fileURLWithPath:v8];
  uint64_t v6 = [v5 URLByAppendingPathComponent:@"com.apple.shazamd/MusicHaptics"];
  id v7 = (void *)qword_100090AE0;
  qword_100090AE0 = v6;
}

void sub_100046AC0(id a1)
{
  v3[0] = SHHapticPatternAlgorithmDefault;
  v3[1] = SHHapticPatternAlgorithmBalancedMixEnhancedDynamicRange;
  v3[2] = SHHapticPatternAlgorithmPriorityVocalsEnhancedDynamicRange;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:3];
  id v2 = (void *)qword_100090AF0;
  qword_100090AF0 = v1;
}

void sub_100046F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100046F84(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setAssociatedMatcherController:0];
  }
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 stopRecognition];
}

void sub_100047988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000479AC(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[SHRemoteConfiguration sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100047B70;
    v9[3] = &unk_100076100;
    id v12 = a1[5];
    id v10 = a1[4];
    objc_copyWeak(&v13, a1 + 6);
    id v11 = v5;
    [v7 endpointsWithCompletion:v9];

    objc_destroyWeak(&v13);
  }
  else
  {
    id v8 = sh_log_object();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Missing or invalid host %@", buf, 0xCu);
    }

    (*((void (**)(void))a1[5] + 2))();
  }
}

void sub_100047B54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100047B70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [v5 hapticsURLPathForClientIdentifier:*(void *)(a1 + 32) songResourceIDType:1];
    uint64_t v8 = [v5 hapticsURLPathForClientIdentifier:*(void *)(a1 + 32) songResourceIDType:2];
    if (v7 | v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      id v10 = [WeakRetained storefront];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100047D7C;
      v12[3] = &unk_1000760D8;
      id v13 = (id)v7;
      id v14 = *(id *)(a1 + 40);
      id v15 = (id)v8;
      id v16 = *(id *)(a1 + 48);
      [v10 storefrontCountryCode:v12];
    }
    else
    {
      id v11 = sh_log_object();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Missing or invalid haptics endpoint %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100047D7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Fetching endpoint with storefront %@", (uint8_t *)&v13, 0xCu);
  }

  if (*(void *)(a1 + 32))
  {
    id v5 = objc_alloc((Class)SHTokenizedURL);
    id v6 = [*(id *)(a1 + 40) name];
    id v7 = [v5 initWithHost:v6 URLPath:*(void *)(a1 + 32)];

    [v7 updateToken:3 withValue:v3];
  }
  else
  {
    id v7 = 0;
  }
  if (*(void *)(a1 + 48))
  {
    id v8 = objc_alloc((Class)SHTokenizedURL);
    id v9 = [*(id *)(a1 + 40) name];
    id v10 = [v8 initWithHost:v9 URLPath:*(void *)(a1 + 48)];

    [v10 updateToken:3 withValue:v3];
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 56);
  id v12 = [[SHHapticsEndpoint alloc] initWithAdamIDURL:v7 isrcURL:v10];
  (*(void (**)(uint64_t, SHHapticsEndpoint *, void))(v11 + 16))(v11, v12, 0);
}

void sub_100048078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004809C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[SHRemoteConfiguration sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004827C;
    v11[3] = &unk_100076178;
    id v8 = *(id *)(a1 + 48);
    id v9 = *(void **)(a1 + 64);
    id v15 = v8;
    v16[1] = v9;
    id v12 = *(id *)(a1 + 32);
    objc_copyWeak(v16, (id *)(a1 + 56));
    id v13 = v5;
    id v14 = *(id *)(a1 + 40);
    [v7 endpointsWithCompletion:v11];

    objc_destroyWeak(v16);
  }
  else
  {
    id v10 = sh_log_object();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Missing or invalid host %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100048260(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10004827C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(void *)(a1 + 72) == 2) {
      [v5 matchURLPathForClientIdentifier:v7];
    }
    else {
    id v8 = [v5 lookupURLPathForClientIdentifier:v7];
    }
    if (v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      id v10 = [WeakRetained storefront];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100048488;
      v12[3] = &unk_100076150;
      id v13 = *(id *)(a1 + 40);
      id v14 = v8;
      id v15 = v5;
      id v16 = *(id *)(a1 + 48);
      id v17 = *(id *)(a1 + 56);
      [v10 storefrontCountryCode:v12];
    }
    else
    {
      uint64_t v11 = sh_log_object();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Missing or invalid match endpoint %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_100048488(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Fetching endpoint with storefront %@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = objc_alloc((Class)SHTokenizedURL);
  id v6 = [*(id *)(a1 + 32) name];
  id v7 = [v5 initWithHost:v6 URLPath:*(void *)(a1 + 40)];

  id v8 = [*(id *)(a1 + 48) suggestedLanguage];
  +[SHShazamKitServerURLBuilder updateTokensForEndpoint:v7 language:v8 storefront:v3 installationID:*(void *)(a1 + 56)];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_100048F80(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) shazamID];
    id v8 = +[UNNotificationAttachment attachmentWithIdentifier:v7 URL:v9 options:0 error:0];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);
  }
}

OSStatus AudioQueueAddPropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return _AudioQueueAddPropertyListener(inAQ, inID, inProc, inUserData);
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return _AudioQueueAllocateBuffer(inAQ, inBufferByteSize, outBuffer);
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return _AudioQueueDispose(inAQ, inImmediate);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return _AudioQueueEnqueueBuffer(inAQ, inBuffer, inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueGetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, void *outData, UInt32 *ioDataSize)
{
  return _AudioQueueGetProperty(inAQ, inID, outData, ioDataSize);
}

OSStatus AudioQueueNewInput(const AudioStreamBasicDescription *inFormat, AudioQueueInputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return _AudioQueueNewInput(inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, inFlags, outAQ);
}

OSStatus AudioQueueRemovePropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return _AudioQueueRemovePropertyListener(inAQ, inID, inProc, inUserData);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return _AudioQueueSetProperty(inAQ, inID, inData, inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return _AudioQueueStart(inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return _AudioQueueStop(inAQ, inImmediate);
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return _CLLocationCoordinate2DIsValid(coord);
}

uint64_t MSNMonitorBeginException()
{
  return _MSNMonitorBeginException();
}

uint64_t MSNMonitorEndException()
{
  return _MSNMonitorEndException();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t SHShazamEventsClientInterface()
{
  return _SHShazamEventsClientInterface();
}

uint64_t SHShazamEventsServiceInterface()
{
  return _SHShazamEventsServiceInterface();
}

uint64_t SHShazamKitClientInterface()
{
  return _SHShazamKitClientInterface();
}

uint64_t SHShazamKitServiceInterface()
{
  return _SHShazamKitServiceInterface();
}

uint64_t SHShazamKitUIClientInterface()
{
  return _SHShazamKitUIClientInterface();
}

uint64_t SHShazamKitUIServiceInterface()
{
  return _SHShazamKitUIServiceInterface();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t cblas_sasum_NEWLAPACK()
{
  return _cblas_sasum_NEWLAPACK();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_exception_throw(id exception)
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t sh_log_object()
{
  return _sh_log_object();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return _xpc_copy_entitlement_for_self();
}

id objc_msgSend_Discoverability(void *a1, const char *a2, ...)
{
  return [a1 Discoverability];
}

id objc_msgSend_Signals(void *a1, const char *a2, ...)
{
  return [a1 Signals];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLBuilder(void *a1, const char *a2, ...)
{
  return [a1 URLBuilder];
}

id objc_msgSend_URLRepresentation(void *a1, const char *a2, ...)
{
  return [a1 URLRepresentation];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__ID(void *a1, const char *a2, ...)
{
  return [a1 _ID];
}

id objc_msgSend__configuration(void *a1, const char *a2, ...)
{
  return [a1 _configuration];
}

id objc_msgSend__createMatcher(void *a1, const char *a2, ...)
{
  return [a1 _createMatcher];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__stop(void *a1, const char *a2, ...)
{
  return [a1 _stop];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accountListener(void *a1, const char *a2, ...)
{
  return [a1 accountListener];
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return [a1 accountStatus];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 actionIdentifier];
}

id objc_msgSend_activeAssistantServiceTaps(void *a1, const char *a2, ...)
{
  return [a1 activeAssistantServiceTaps];
}

id objc_msgSend_activeLocationProviders(void *a1, const char *a2, ...)
{
  return [a1 activeLocationProviders];
}

id objc_msgSend_activeTaps(void *a1, const char *a2, ...)
{
  return [a1 activeTaps];
}

id objc_msgSend_adamIDURL(void *a1, const char *a2, ...)
{
  return [a1 adamIDURL];
}

id objc_msgSend_addPlatformLabel(void *a1, const char *a2, ...)
{
  return [a1 addPlatformLabel];
}

id objc_msgSend_albumName(void *a1, const char *a2, ...)
{
  return [a1 albumName];
}

id objc_msgSend_allItemIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allItemIdentifiers];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowsCachedAssets(void *a1, const char *a2, ...)
{
  return [a1 allowsCachedAssets];
}

id objc_msgSend_amsBag(void *a1, const char *a2, ...)
{
  return [a1 amsBag];
}

id objc_msgSend_appleMusicID(void *a1, const char *a2, ...)
{
  return [a1 appleMusicID];
}

id objc_msgSend_appleMusicURL(void *a1, const char *a2, ...)
{
  return [a1 appleMusicURL];
}

id objc_msgSend_appleMusicURLString(void *a1, const char *a2, ...)
{
  return [a1 appleMusicURLString];
}

id objc_msgSend_applicationSupportDirectory(void *a1, const char *a2, ...)
{
  return [a1 applicationSupportDirectory];
}

id objc_msgSend_apsConnection(void *a1, const char *a2, ...)
{
  return [a1 apsConnection];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return [a1 artist];
}

id objc_msgSend_artistName(void *a1, const char *a2, ...)
{
  return [a1 artistName];
}

id objc_msgSend_artworkSize(void *a1, const char *a2, ...)
{
  return [a1 artworkSize];
}

id objc_msgSend_artworkURL(void *a1, const char *a2, ...)
{
  return [a1 artworkURL];
}

id objc_msgSend_ascending(void *a1, const char *a2, ...)
{
  return [a1 ascending];
}

id objc_msgSend_assistantTapCount(void *a1, const char *a2, ...)
{
  return [a1 assistantTapCount];
}

id objc_msgSend_associatedGroupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 associatedGroupIdentifier];
}

id objc_msgSend_associatedMatcherController(void *a1, const char *a2, ...)
{
  return [a1 associatedMatcherController];
}

id objc_msgSend_attribution(void *a1, const char *a2, ...)
{
  return [a1 attribution];
}

id objc_msgSend_audioBufferList(void *a1, const char *a2, ...)
{
  return [a1 audioBufferList];
}

id objc_msgSend_audioEnvironment(void *a1, const char *a2, ...)
{
  return [a1 audioEnvironment];
}

id objc_msgSend_audioRecorderDispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 audioRecorderDispatchQueue];
}

id objc_msgSend_audioRecordingManager(void *a1, const char *a2, ...)
{
  return [a1 audioRecordingManager];
}

id objc_msgSend_audioSession(void *a1, const char *a2, ...)
{
  return [a1 audioSession];
}

id objc_msgSend_audioSessionIsActive(void *a1, const char *a2, ...)
{
  return [a1 audioSessionIsActive];
}

id objc_msgSend_audioSessionManager(void *a1, const char *a2, ...)
{
  return [a1 audioSessionManager];
}

id objc_msgSend_audioStartDate(void *a1, const char *a2, ...)
{
  return [a1 audioStartDate];
}

id objc_msgSend_audioTap(void *a1, const char *a2, ...)
{
  return [a1 audioTap];
}

id objc_msgSend_audioTapClient(void *a1, const char *a2, ...)
{
  return [a1 audioTapClient];
}

id objc_msgSend_audioTapProvider(void *a1, const char *a2, ...)
{
  return [a1 audioTapProvider];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_availableHapticAlgorithms(void *a1, const char *a2, ...)
{
  return [a1 availableHapticAlgorithms];
}

id objc_msgSend_availableRecorders(void *a1, const char *a2, ...)
{
  return [a1 availableRecorders];
}

id objc_msgSend_availableServices(void *a1, const char *a2, ...)
{
  return [a1 availableServices];
}

id objc_msgSend_beginLibrarySync(void *a1, const char *a2, ...)
{
  return [a1 beginLibrarySync];
}

id objc_msgSend_BOOLValueType(void *a1, const char *a2, ...)
{
  return [a1 BOOLValueType];
}

id objc_msgSend_buffers(void *a1, const char *a2, ...)
{
  return [a1 buffers];
}

id objc_msgSend_buildListener(void *a1, const char *a2, ...)
{
  return [a1 buildListener];
}

id objc_msgSend_buildListeners(void *a1, const char *a2, ...)
{
  return [a1 buildListeners];
}

id objc_msgSend_bundleDirectory(void *a1, const char *a2, ...)
{
  return [a1 bundleDirectory];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleName(void *a1, const char *a2, ...)
{
  return [a1 bundleName];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return [a1 cache];
}

id objc_msgSend_cacheDirectory(void *a1, const char *a2, ...)
{
  return [a1 cacheDirectory];
}

id objc_msgSend_callingProcessIdentifier(void *a1, const char *a2, ...)
{
  return [a1 callingProcessIdentifier];
}

id objc_msgSend_campaignToken(void *a1, const char *a2, ...)
{
  return [a1 campaignToken];
}

id objc_msgSend_canEnableSpectralOutput(void *a1, const char *a2, ...)
{
  return [a1 canEnableSpectralOutput];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_catalog(void *a1, const char *a2, ...)
{
  return [a1 catalog];
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return [a1 changeType];
}

id objc_msgSend_changes(void *a1, const char *a2, ...)
{
  return [a1 changes];
}

id objc_msgSend_childMatcher(void *a1, const char *a2, ...)
{
  return [a1 childMatcher];
}

id objc_msgSend_clearCachedSyncStatus(void *a1, const char *a2, ...)
{
  return [a1 clearCachedSyncStatus];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_clientCredentials(void *a1, const char *a2, ...)
{
  return [a1 clientCredentials];
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientIdentifier];
}

id objc_msgSend_clientType(void *a1, const char *a2, ...)
{
  return [a1 clientType];
}

id objc_msgSend_cloudBackedContainer(void *a1, const char *a2, ...)
{
  return [a1 cloudBackedContainer];
}

id objc_msgSend_cloudContainer(void *a1, const char *a2, ...)
{
  return [a1 cloudContainer];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_compoundIdentifier(void *a1, const char *a2, ...)
{
  return [a1 compoundIdentifier];
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return [a1 condition];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionHandles(void *a1, const char *a2, ...)
{
  return [a1 connectionHandles];
}

id objc_msgSend_connectionQueue(void *a1, const char *a2, ...)
{
  return [a1 connectionQueue];
}

id objc_msgSend_constructURLRequest(void *a1, const char *a2, ...)
{
  return [a1 constructURLRequest];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return [a1 containerID];
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 containerIdentifier];
}

id objc_msgSend_containerTransformer(void *a1, const char *a2, ...)
{
  return [a1 containerTransformer];
}

id objc_msgSend_containingAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 containingAppBundleIdentifier];
}

id objc_msgSend_containsTokens(void *a1, const char *a2, ...)
{
  return [a1 containsTokens];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contentDeliverer(void *a1, const char *a2, ...)
{
  return [a1 contentDeliverer];
}

id objc_msgSend_contentProvider(void *a1, const char *a2, ...)
{
  return [a1 contentProvider];
}

id objc_msgSend_contextBuilder(void *a1, const char *a2, ...)
{
  return [a1 contextBuilder];
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return [a1 controller];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createBundleDirectory(void *a1, const char *a2, ...)
{
  return [a1 createBundleDirectory];
}

id objc_msgSend_createTaskFolderPaths(void *a1, const char *a2, ...)
{
  return [a1 createTaskFolderPaths];
}

id objc_msgSend_createTransaction(void *a1, const char *a2, ...)
{
  return [a1 createTransaction];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_credentials(void *a1, const char *a2, ...)
{
  return [a1 credentials];
}

id objc_msgSend_currentCache(void *a1, const char *a2, ...)
{
  return [a1 currentCache];
}

id objc_msgSend_currentContext(void *a1, const char *a2, ...)
{
  return [a1 currentContext];
}

id objc_msgSend_currentDatabaseFolderPath(void *a1, const char *a2, ...)
{
  return [a1 currentDatabaseFolderPath];
}

id objc_msgSend_currentMediaItem(void *a1, const char *a2, ...)
{
  return [a1 currentMediaItem];
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return [a1 currentRoute];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentSignatureID(void *a1, const char *a2, ...)
{
  return [a1 currentSignatureID];
}

id objc_msgSend_currentSnapshot(void *a1, const char *a2, ...)
{
  return [a1 currentSnapshot];
}

id objc_msgSend_currentUserID(void *a1, const char *a2, ...)
{
  return [a1 currentUserID];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataArray(void *a1, const char *a2, ...)
{
  return [a1 dataArray];
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dataRepresentation];
}

id objc_msgSend_dataStore(void *a1, const char *a2, ...)
{
  return [a1 dataStore];
}

id objc_msgSend_databaseChangesOperation(void *a1, const char *a2, ...)
{
  return [a1 databaseChangesOperation];
}

id objc_msgSend_databaseToken(void *a1, const char *a2, ...)
{
  return [a1 databaseToken];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_deactivateAudioSession(void *a1, const char *a2, ...)
{
  return [a1 deactivateAudioSession];
}

id objc_msgSend_deadline(void *a1, const char *a2, ...)
{
  return [a1 deadline];
}

id objc_msgSend_debugContainer(void *a1, const char *a2, ...)
{
  return [a1 debugContainer];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultContainer(void *a1, const char *a2, ...)
{
  return [a1 defaultContainer];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultQueue(void *a1, const char *a2, ...)
{
  return [a1 defaultQueue];
}

id objc_msgSend_defaultRecordingIntermissionInSeconds(void *a1, const char *a2, ...)
{
  return [a1 defaultRecordingIntermissionInSeconds];
}

id objc_msgSend_defaultRecordingSignatureOffsetInSeconds(void *a1, const char *a2, ...)
{
  return [a1 defaultRecordingSignatureOffsetInSeconds];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return [a1 defaultSound];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteAllItems(void *a1, const char *a2, ...)
{
  return [a1 deleteAllItems];
}

id objc_msgSend_deleteAllSyncMetadataItems(void *a1, const char *a2, ...)
{
  return [a1 deleteAllSyncMetadataItems];
}

id objc_msgSend_deletedIDs(void *a1, const char *a2, ...)
{
  return [a1 deletedIDs];
}

id objc_msgSend_deletions(void *a1, const char *a2, ...)
{
  return [a1 deletions];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableSpectralOutputNotification(void *a1, const char *a2, ...)
{
  return [a1 disableSpectralOutputNotification];
}

id objc_msgSend_doesCacheDirectoryExist(void *a1, const char *a2, ...)
{
  return [a1 doesCacheDirectoryExist];
}

id objc_msgSend_doesLegacyCacheDirectoryExist(void *a1, const char *a2, ...)
{
  return [a1 doesLegacyCacheDirectoryExist];
}

id objc_msgSend_doesPrivateDatabaseFolderPathExist(void *a1, const char *a2, ...)
{
  return [a1 doesPrivateDatabaseFolderPathExist];
}

id objc_msgSend_doesTaskFolderPathsExist(void *a1, const char *a2, ...)
{
  return [a1 doesTaskFolderPathsExist];
}

id objc_msgSend_doesZoneFolderPathExist(void *a1, const char *a2, ...)
{
  return [a1 doesZoneFolderPathExist];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadDirectory(void *a1, const char *a2, ...)
{
  return [a1 downloadDirectory];
}

id objc_msgSend_downloadedFileLocation(void *a1, const char *a2, ...)
{
  return [a1 downloadedFileLocation];
}

id objc_msgSend_downstreamMatcherDelegate(void *a1, const char *a2, ...)
{
  return [a1 downstreamMatcherDelegate];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_durationInMilliseconds(void *a1, const char *a2, ...)
{
  return [a1 durationInMilliseconds];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_encodedSystemData(void *a1, const char *a2, ...)
{
  return [a1 encodedSystemData];
}

id objc_msgSend_encoder(void *a1, const char *a2, ...)
{
  return [a1 encoder];
}

id objc_msgSend_encryptedValues(void *a1, const char *a2, ...)
{
  return [a1 encryptedValues];
}

id objc_msgSend_endedRecordingDate(void *a1, const char *a2, ...)
{
  return [a1 endedRecordingDate];
}

id objc_msgSend_endpointRequester(void *a1, const char *a2, ...)
{
  return [a1 endpointRequester];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return [a1 entity];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorDictionary(void *a1, const char *a2, ...)
{
  return [a1 errorDictionary];
}

id objc_msgSend_errorResponseSignature(void *a1, const char *a2, ...)
{
  return [a1 errorResponseSignature];
}

id objc_msgSend_eventSignaller(void *a1, const char *a2, ...)
{
  return [a1 eventSignaller];
}

id objc_msgSend_executionScope(void *a1, const char *a2, ...)
{
  return [a1 executionScope];
}

id objc_msgSend_explicitContent(void *a1, const char *a2, ...)
{
  return [a1 explicitContent];
}

id objc_msgSend_exportedObject(void *a1, const char *a2, ...)
{
  return [a1 exportedObject];
}

id objc_msgSend_failedFolderPath(void *a1, const char *a2, ...)
{
  return [a1 failedFolderPath];
}

id objc_msgSend_failedItemIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 failedItemIdentifiers];
}

id objc_msgSend_failedResult(void *a1, const char *a2, ...)
{
  return [a1 failedResult];
}

id objc_msgSend_fetchAllUploadableGroupsMissingLibrarySyncMetadata(void *a1, const char *a2, ...)
{
  return [a1 fetchAllUploadableGroupsMissingLibrarySyncMetadata];
}

id objc_msgSend_fetchAllUploadableTracksMissingLibrarySyncMetadata(void *a1, const char *a2, ...)
{
  return [a1 fetchAllUploadableTracksMissingLibrarySyncMetadata];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return [a1 fetchRequest];
}

id objc_msgSend_fetchTaskScheduler(void *a1, const char *a2, ...)
{
  return [a1 fetchTaskScheduler];
}

id objc_msgSend_fetchTaskTransformer(void *a1, const char *a2, ...)
{
  return [a1 fetchTaskTransformer];
}

id objc_msgSend_fetchType(void *a1, const char *a2, ...)
{
  return [a1 fetchType];
}

id objc_msgSend_fetchedObjects(void *a1, const char *a2, ...)
{
  return [a1 fetchedObjects];
}

id objc_msgSend_filterOptions(void *a1, const char *a2, ...)
{
  return [a1 filterOptions];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_finishLibrarySync(void *a1, const char *a2, ...)
{
  return [a1 finishLibrarySync];
}

id objc_msgSend_finishSyncing(void *a1, const char *a2, ...)
{
  return [a1 finishSyncing];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_frequencySkew(void *a1, const char *a2, ...)
{
  return [a1 frequencySkew];
}

id objc_msgSend_fulfilledResult(void *a1, const char *a2, ...)
{
  return [a1 fulfilledResult];
}

id objc_msgSend_genreNames(void *a1, const char *a2, ...)
{
  return [a1 genreNames];
}

id objc_msgSend_genres(void *a1, const char *a2, ...)
{
  return [a1 genres];
}

id objc_msgSend_globalQueue(void *a1, const char *a2, ...)
{
  return [a1 globalQueue];
}

id objc_msgSend_globallyScopedWorkers(void *a1, const char *a2, ...)
{
  return [a1 globallyScopedWorkers];
}

id objc_msgSend_globallyUniqueString(void *a1, const char *a2, ...)
{
  return [a1 globallyUniqueString];
}

id objc_msgSend_groupIDsToDelete(void *a1, const char *a2, ...)
{
  return [a1 groupIDsToDelete];
}

id objc_msgSend_groupSetToAdd(void *a1, const char *a2, ...)
{
  return [a1 groupSetToAdd];
}

id objc_msgSend_groupSetToDelete(void *a1, const char *a2, ...)
{
  return [a1 groupSetToDelete];
}

id objc_msgSend_groupsFetchedResultsController(void *a1, const char *a2, ...)
{
  return [a1 groupsFetchedResultsController];
}

id objc_msgSend_groupsToAdd(void *a1, const char *a2, ...)
{
  return [a1 groupsToAdd];
}

id objc_msgSend_groupsToDelete(void *a1, const char *a2, ...)
{
  return [a1 groupsToDelete];
}

id objc_msgSend_groupsToModify(void *a1, const char *a2, ...)
{
  return [a1 groupsToModify];
}

id objc_msgSend_hapticItemIDs(void *a1, const char *a2, ...)
{
  return [a1 hapticItemIDs];
}

id objc_msgSend_hapticsEndpoint(void *a1, const char *a2, ...)
{
  return [a1 hapticsEndpoint];
}

id objc_msgSend_hapticsFetcher(void *a1, const char *a2, ...)
{
  return [a1 hapticsFetcher];
}

id objc_msgSend_hapticsURL(void *a1, const char *a2, ...)
{
  return [a1 hapticsURL];
}

id objc_msgSend_hasActiveTaps(void *a1, const char *a2, ...)
{
  return [a1 hasActiveTaps];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return [a1 hasChanges];
}

id objc_msgSend_hasHitDeadline(void *a1, const char *a2, ...)
{
  return [a1 hasHitDeadline];
}

id objc_msgSend_hasRequestAppleMusicID(void *a1, const char *a2, ...)
{
  return [a1 hasRequestAppleMusicID];
}

id objc_msgSend_hasRequestISRC(void *a1, const char *a2, ...)
{
  return [a1 hasRequestISRC];
}

id objc_msgSend_hasValidRecognitionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hasValidRecognitionIdentifier];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inflightFolderPath(void *a1, const char *a2, ...)
{
  return [a1 inflightFolderPath];
}

id objc_msgSend_initOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 initOperationQueue];
}

id objc_msgSend_initializeGlobalServiceState(void *a1, const char *a2, ...)
{
  return [a1 initializeGlobalServiceState];
}

id objc_msgSend_insertions(void *a1, const char *a2, ...)
{
  return [a1 insertions];
}

id objc_msgSend_installationID(void *a1, const char *a2, ...)
{
  return [a1 installationID];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isAudioSessionInterrupted(void *a1, const char *a2, ...)
{
  return [a1 isAudioSessionInterrupted];
}

id objc_msgSend_isBundleIdentifierValid(void *a1, const char *a2, ...)
{
  return [a1 isBundleIdentifierValid];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isEncrypted(void *a1, const char *a2, ...)
{
  return [a1 isEncrypted];
}

id objc_msgSend_isEntitledForInternalClient(void *a1, const char *a2, ...)
{
  return [a1 isEntitledForInternalClient];
}

id objc_msgSend_isEntitledForMicrophone(void *a1, const char *a2, ...)
{
  return [a1 isEntitledForMicrophone];
}

id objc_msgSend_isEntitledForSPI(void *a1, const char *a2, ...)
{
  return [a1 isEntitledForSPI];
}

id objc_msgSend_isExplicitContent(void *a1, const char *a2, ...)
{
  return [a1 isExplicitContent];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isOtherAudioPlaying(void *a1, const char *a2, ...)
{
  return [a1 isOtherAudioPlaying];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isSatisfied(void *a1, const char *a2, ...)
{
  return [a1 isSatisfied];
}

id objc_msgSend_isShazamAppInstalled(void *a1, const char *a2, ...)
{
  return [a1 isShazamAppInstalled];
}

id objc_msgSend_isStillRunningAssociatedRequest(void *a1, const char *a2, ...)
{
  return [a1 isStillRunningAssociatedRequest];
}

id objc_msgSend_isTeamIdentifierValid(void *a1, const char *a2, ...)
{
  return [a1 isTeamIdentifierValid];
}

id objc_msgSend_isUsingAlternativeOutputToBuiltInSpeaker(void *a1, const char *a2, ...)
{
  return [a1 isUsingAlternativeOutputToBuiltInSpeaker];
}

id objc_msgSend_iso8601Formatter(void *a1, const char *a2, ...)
{
  return [a1 iso8601Formatter];
}

id objc_msgSend_isrc(void *a1, const char *a2, ...)
{
  return [a1 isrc];
}

id objc_msgSend_isrcURL(void *a1, const char *a2, ...)
{
  return [a1 isrcURL];
}

id objc_msgSend_labelSet(void *a1, const char *a2, ...)
{
  return [a1 labelSet];
}

id objc_msgSend_labels(void *a1, const char *a2, ...)
{
  return [a1 labels];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastUpdatedDate(void *a1, const char *a2, ...)
{
  return [a1 lastUpdatedDate];
}

id objc_msgSend_legacyCacheDirectory(void *a1, const char *a2, ...)
{
  return [a1 legacyCacheDirectory];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_libraryClient(void *a1, const char *a2, ...)
{
  return [a1 libraryClient];
}

id objc_msgSend_libraryController(void *a1, const char *a2, ...)
{
  return [a1 libraryController];
}

id objc_msgSend_libraryInfoFetcher(void *a1, const char *a2, ...)
{
  return [a1 libraryInfoFetcher];
}

id objc_msgSend_libraryItem(void *a1, const char *a2, ...)
{
  return [a1 libraryItem];
}

id objc_msgSend_libraryItemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 libraryItemIdentifier];
}

id objc_msgSend_libraryQueryManager(void *a1, const char *a2, ...)
{
  return [a1 libraryQueryManager];
}

id objc_msgSend_listen(void *a1, const char *a2, ...)
{
  return [a1 listen];
}

id objc_msgSend_listenForChanges(void *a1, const char *a2, ...)
{
  return [a1 listenForChanges];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return [a1 listeners];
}

id objc_msgSend_localGroup(void *a1, const char *a2, ...)
{
  return [a1 localGroup];
}

id objc_msgSend_localTrack(void *a1, const char *a2, ...)
{
  return [a1 localTrack];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_locallyFoundGroups(void *a1, const char *a2, ...)
{
  return [a1 locallyFoundGroups];
}

id objc_msgSend_locallyFoundTracks(void *a1, const char *a2, ...)
{
  return [a1 locallyFoundTracks];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return [a1 locationManager];
}

id objc_msgSend_locationProvider(void *a1, const char *a2, ...)
{
  return [a1 locationProvider];
}

id objc_msgSend_locationQueue(void *a1, const char *a2, ...)
{
  return [a1 locationQueue];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lookupBatchSize(void *a1, const char *a2, ...)
{
  return [a1 lookupBatchSize];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_lyricLines(void *a1, const char *a2, ...)
{
  return [a1 lyricLines];
}

id objc_msgSend_lyricsDictionary(void *a1, const char *a2, ...)
{
  return [a1 lyricsDictionary];
}

id objc_msgSend_lyricsLines(void *a1, const char *a2, ...)
{
  return [a1 lyricsLines];
}

id objc_msgSend_lyricsRelationIDs(void *a1, const char *a2, ...)
{
  return [a1 lyricsRelationIDs];
}

id objc_msgSend_lyricsResponse(void *a1, const char *a2, ...)
{
  return [a1 lyricsResponse];
}

id objc_msgSend_lyricsSnippet(void *a1, const char *a2, ...)
{
  return [a1 lyricsSnippet];
}

id objc_msgSend_lyricsText(void *a1, const char *a2, ...)
{
  return [a1 lyricsText];
}

id objc_msgSend_machServiceName(void *a1, const char *a2, ...)
{
  return [a1 machServiceName];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 managedObjectContext];
}

id objc_msgSend_managedObjectModelURL(void *a1, const char *a2, ...)
{
  return [a1 managedObjectModelURL];
}

id objc_msgSend_manateeContainer(void *a1, const char *a2, ...)
{
  return [a1 manateeContainer];
}

id objc_msgSend_match(void *a1, const char *a2, ...)
{
  return [a1 match];
}

id objc_msgSend_matchOffset(void *a1, const char *a2, ...)
{
  return [a1 matchOffset];
}

id objc_msgSend_matchResultNotificationCenter(void *a1, const char *a2, ...)
{
  return [a1 matchResultNotificationCenter];
}

id objc_msgSend_matcher(void *a1, const char *a2, ...)
{
  return [a1 matcher];
}

id objc_msgSend_matcherControllerProvider(void *a1, const char *a2, ...)
{
  return [a1 matcherControllerProvider];
}

id objc_msgSend_matcherDelegateForResponse(void *a1, const char *a2, ...)
{
  return [a1 matcherDelegateForResponse];
}

id objc_msgSend_matcherFactory(void *a1, const char *a2, ...)
{
  return [a1 matcherFactory];
}

id objc_msgSend_matcherRequest(void *a1, const char *a2, ...)
{
  return [a1 matcherRequest];
}

id objc_msgSend_matchers(void *a1, const char *a2, ...)
{
  return [a1 matchers];
}

id objc_msgSend_maximumQuerySignatureDuration(void *a1, const char *a2, ...)
{
  return [a1 maximumQuerySignatureDuration];
}

id objc_msgSend_mediaItem(void *a1, const char *a2, ...)
{
  return [a1 mediaItem];
}

id objc_msgSend_mediaItemFetcher(void *a1, const char *a2, ...)
{
  return [a1 mediaItemFetcher];
}

id objc_msgSend_mediaItemPresenter(void *a1, const char *a2, ...)
{
  return [a1 mediaItemPresenter];
}

id objc_msgSend_mediaItems(void *a1, const char *a2, ...)
{
  return [a1 mediaItems];
}

id objc_msgSend_mediaLibraryPresenter(void *a1, const char *a2, ...)
{
  return [a1 mediaLibraryPresenter];
}

id objc_msgSend_mediaServicesWereReset(void *a1, const char *a2, ...)
{
  return [a1 mediaServicesWereReset];
}

id objc_msgSend_mergeByPropertyStoreTrumpMergePolicy(void *a1, const char *a2, ...)
{
  return [a1 mergeByPropertyStoreTrumpMergePolicy];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return [a1 metrics];
}

id objc_msgSend_migrateCacheIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 migrateCacheIfNeeded];
}

id objc_msgSend_minimumQuerySignatureDuration(void *a1, const char *a2, ...)
{
  return [a1 minimumQuerySignatureDuration];
}

id objc_msgSend_missingFromLocalStoreGroups(void *a1, const char *a2, ...)
{
  return [a1 missingFromLocalStoreGroups];
}

id objc_msgSend_missingFromLocalStoreTracks(void *a1, const char *a2, ...)
{
  return [a1 missingFromLocalStoreTracks];
}

id objc_msgSend_modifyRecordZonesOperation(void *a1, const char *a2, ...)
{
  return [a1 modifyRecordZonesOperation];
}

id objc_msgSend_modifyRecordsOperation(void *a1, const char *a2, ...)
{
  return [a1 modifyRecordsOperation];
}

id objc_msgSend_modifySubscriptionsOperation(void *a1, const char *a2, ...)
{
  return [a1 modifySubscriptionsOperation];
}

id objc_msgSend_modifyTaskScheduler(void *a1, const char *a2, ...)
{
  return [a1 modifyTaskScheduler];
}

id objc_msgSend_musicHapticsRootDirectory(void *a1, const char *a2, ...)
{
  return [a1 musicHapticsRootDirectory];
}

id objc_msgSend_musicVideoDictionary(void *a1, const char *a2, ...)
{
  return [a1 musicVideoDictionary];
}

id objc_msgSend_musicVideoItemDictionary(void *a1, const char *a2, ...)
{
  return [a1 musicVideoItemDictionary];
}

id objc_msgSend_musicVideoRelationIDs(void *a1, const char *a2, ...)
{
  return [a1 musicVideoRelationIDs];
}

id objc_msgSend_musicVideoResponse(void *a1, const char *a2, ...)
{
  return [a1 musicVideoResponse];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsMigration(void *a1, const char *a2, ...)
{
  return [a1 needsMigration];
}

id objc_msgSend_networkDownloadResponse(void *a1, const char *a2, ...)
{
  return [a1 networkDownloadResponse];
}

id objc_msgSend_networkRequester(void *a1, const char *a2, ...)
{
  return [a1 networkRequester];
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return [a1 newBackgroundContext];
}

id objc_msgSend_nextLine(void *a1, const char *a2, ...)
{
  return [a1 nextLine];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_notificationActionForMatch(void *a1, const char *a2, ...)
{
  return [a1 notificationActionForMatch];
}

id objc_msgSend_notificationCategories(void *a1, const char *a2, ...)
{
  return [a1 notificationCategories];
}

id objc_msgSend_notificationContentForNoMatch(void *a1, const char *a2, ...)
{
  return [a1 notificationContentForNoMatch];
}

id objc_msgSend_notificationObserver(void *a1, const char *a2, ...)
{
  return [a1 notificationObserver];
}

id objc_msgSend_notificationScheduler(void *a1, const char *a2, ...)
{
  return [a1 notificationScheduler];
}

id objc_msgSend_notificationType(void *a1, const char *a2, ...)
{
  return [a1 notificationType];
}

id objc_msgSend_numberOfItems(void *a1, const char *a2, ...)
{
  return [a1 numberOfItems];
}

id objc_msgSend_openResultInBrowserOnFailure(void *a1, const char *a2, ...)
{
  return [a1 openResultInBrowserOnFailure];
}

id objc_msgSend_operation(void *a1, const char *a2, ...)
{
  return [a1 operation];
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return [a1 operationQueue];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_originalTask(void *a1, const char *a2, ...)
{
  return [a1 originalTask];
}

id objc_msgSend_outcome(void *a1, const char *a2, ...)
{
  return [a1 outcome];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return [a1 outputs];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_persistentContainer(void *a1, const char *a2, ...)
{
  return [a1 persistentContainer];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreCoordinator];
}

id objc_msgSend_persistentStoreDescriptions(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreDescriptions];
}

id objc_msgSend_persistentStoreURL(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreURL];
}

id objc_msgSend_platformLabel(void *a1, const char *a2, ...)
{
  return [a1 platformLabel];
}

id objc_msgSend_populateRemoteConfiguration(void *a1, const char *a2, ...)
{
  return [a1 populateRemoteConfiguration];
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return [a1 portType];
}

id objc_msgSend_precomposedStringWithCanonicalMapping(void *a1, const char *a2, ...)
{
  return [a1 precomposedStringWithCanonicalMapping];
}

id objc_msgSend_preconditions(void *a1, const char *a2, ...)
{
  return [a1 preconditions];
}

id objc_msgSend_previousServerChangeToken(void *a1, const char *a2, ...)
{
  return [a1 previousServerChangeToken];
}

id objc_msgSend_previouslySuggestedAudioRecordingSource(void *a1, const char *a2, ...)
{
  return [a1 previouslySuggestedAudioRecordingSource];
}

id objc_msgSend_privacyDisclosureAcknowledgementRequired(void *a1, const char *a2, ...)
{
  return [a1 privacyDisclosureAcknowledgementRequired];
}

id objc_msgSend_privacyDisclosureManager(void *a1, const char *a2, ...)
{
  return [a1 privacyDisclosureManager];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 privateCloudDatabase];
}

id objc_msgSend_privateDatabaseFolderPath(void *a1, const char *a2, ...)
{
  return [a1 privateDatabaseFolderPath];
}

id objc_msgSend_privateDatabaseTransactionPath(void *a1, const char *a2, ...)
{
  return [a1 privateDatabaseTransactionPath];
}

id objc_msgSend_privateOperation(void *a1, const char *a2, ...)
{
  return [a1 privateOperation];
}

id objc_msgSend_processID(void *a1, const char *a2, ...)
{
  return [a1 processID];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return [a1 productName];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_providerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 providerIdentifier];
}

id objc_msgSend_providerName(void *a1, const char *a2, ...)
{
  return [a1 providerName];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_querySignature(void *a1, const char *a2, ...)
{
  return [a1 querySignature];
}

id objc_msgSend_rawSongResponse(void *a1, const char *a2, ...)
{
  return [a1 rawSongResponse];
}

id objc_msgSend_recognitionHasStopped(void *a1, const char *a2, ...)
{
  return [a1 recognitionHasStopped];
}

id objc_msgSend_recognitionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 recognitionIdentifier];
}

id objc_msgSend_record(void *a1, const char *a2, ...)
{
  return [a1 record];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return [a1 recordID];
}

id objc_msgSend_recordIDsToDelete(void *a1, const char *a2, ...)
{
  return [a1 recordIDsToDelete];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return [a1 recordName];
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return [a1 recordType];
}

id objc_msgSend_recordZoneChangesOperation(void *a1, const char *a2, ...)
{
  return [a1 recordZoneChangesOperation];
}

id objc_msgSend_recordZoneIDs(void *a1, const char *a2, ...)
{
  return [a1 recordZoneIDs];
}

id objc_msgSend_recordZoneIDsToDelete(void *a1, const char *a2, ...)
{
  return [a1 recordZoneIDsToDelete];
}

id objc_msgSend_recordZonesToSave(void *a1, const char *a2, ...)
{
  return [a1 recordZonesToSave];
}

id objc_msgSend_recorderConfiguration(void *a1, const char *a2, ...)
{
  return [a1 recorderConfiguration];
}

id objc_msgSend_recorderConfigurationWithPromise(void *a1, const char *a2, ...)
{
  return [a1 recorderConfigurationWithPromise];
}

id objc_msgSend_recorders(void *a1, const char *a2, ...)
{
  return [a1 recorders];
}

id objc_msgSend_recordingIntermission(void *a1, const char *a2, ...)
{
  return [a1 recordingIntermission];
}

id objc_msgSend_recordingIntermissionSeconds(void *a1, const char *a2, ...)
{
  return [a1 recordingIntermissionSeconds];
}

id objc_msgSend_recordingLogs(void *a1, const char *a2, ...)
{
  return [a1 recordingLogs];
}

id objc_msgSend_recordingLogsLock(void *a1, const char *a2, ...)
{
  return [a1 recordingLogsLock];
}

id objc_msgSend_recordingSignatureOffset(void *a1, const char *a2, ...)
{
  return [a1 recordingSignatureOffset];
}

id objc_msgSend_recordingSignatureOffsetSeconds(void *a1, const char *a2, ...)
{
  return [a1 recordingSignatureOffsetSeconds];
}

id objc_msgSend_recordingSource(void *a1, const char *a2, ...)
{
  return [a1 recordingSource];
}

id objc_msgSend_recordsToSave(void *a1, const char *a2, ...)
{
  return [a1 recordsToSave];
}

id objc_msgSend_recoverTaskFromLimitExceededError(void *a1, const char *a2, ...)
{
  return [a1 recoverTaskFromLimitExceededError];
}

id objc_msgSend_recoverTaskFromPartialError(void *a1, const char *a2, ...)
{
  return [a1 recoverTaskFromPartialError];
}

id objc_msgSend_recoverableTasks(void *a1, const char *a2, ...)
{
  return [a1 recoverableTasks];
}

id objc_msgSend_registerAudioSessionObservers(void *a1, const char *a2, ...)
{
  return [a1 registerAudioSessionObservers];
}

id objc_msgSend_registerForPushNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForPushNotifications];
}

id objc_msgSend_registerMusicRecognitionBundleAttribution(void *a1, const char *a2, ...)
{
  return [a1 registerMusicRecognitionBundleAttribution];
}

id objc_msgSend_releaseDate(void *a1, const char *a2, ...)
{
  return [a1 releaseDate];
}

id objc_msgSend_remoteConfiguration(void *a1, const char *a2, ...)
{
  return [a1 remoteConfiguration];
}

id objc_msgSend_remoteLibrary(void *a1, const char *a2, ...)
{
  return [a1 remoteLibrary];
}

id objc_msgSend_remoteObject(void *a1, const char *a2, ...)
{
  return [a1 remoteObject];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestID(void *a1, const char *a2, ...)
{
  return [a1 requestID];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requestIdentifier];
}

id objc_msgSend_resourcesDictionary(void *a1, const char *a2, ...)
{
  return [a1 resourcesDictionary];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resultsDictionary(void *a1, const char *a2, ...)
{
  return [a1 resultsDictionary];
}

id objc_msgSend_resultsLimit(void *a1, const char *a2, ...)
{
  return [a1 resultsLimit];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retryBlock(void *a1, const char *a2, ...)
{
  return [a1 retryBlock];
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return [a1 retryCount];
}

id objc_msgSend_retryHandler(void *a1, const char *a2, ...)
{
  return [a1 retryHandler];
}

id objc_msgSend_retrySeconds(void *a1, const char *a2, ...)
{
  return [a1 retrySeconds];
}

id objc_msgSend_rootDirectory(void *a1, const char *a2, ...)
{
  return [a1 rootDirectory];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runningAssociatedRequestID(void *a1, const char *a2, ...)
{
  return [a1 runningAssociatedRequestID];
}

id objc_msgSend_sampleRate(void *a1, const char *a2, ...)
{
  return [a1 sampleRate];
}

id objc_msgSend_savedGroups(void *a1, const char *a2, ...)
{
  return [a1 savedGroups];
}

id objc_msgSend_savedTracks(void *a1, const char *a2, ...)
{
  return [a1 savedTracks];
}

id objc_msgSend_schedulerFactory(void *a1, const char *a2, ...)
{
  return [a1 schedulerFactory];
}

id objc_msgSend_scope(void *a1, const char *a2, ...)
{
  return [a1 scope];
}

id objc_msgSend_sendNotifications(void *a1, const char *a2, ...)
{
  return [a1 sendNotifications];
}

id objc_msgSend_serverChangeToken(void *a1, const char *a2, ...)
{
  return [a1 serverChangeToken];
}

id objc_msgSend_serviceDelegate(void *a1, const char *a2, ...)
{
  return [a1 serviceDelegate];
}

id objc_msgSend_serviceProvider(void *a1, const char *a2, ...)
{
  return [a1 serviceProvider];
}

id objc_msgSend_serviceStateHandler(void *a1, const char *a2, ...)
{
  return [a1 serviceStateHandler];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sessionConfiguration];
}

id objc_msgSend_sessionDispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 sessionDispatchQueue];
}

id objc_msgSend_sessionDriver(void *a1, const char *a2, ...)
{
  return [a1 sessionDriver];
}

id objc_msgSend_sessionDuration(void *a1, const char *a2, ...)
{
  return [a1 sessionDuration];
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sessionIdentifier];
}

id objc_msgSend_sessionScope(void *a1, const char *a2, ...)
{
  return [a1 sessionScope];
}

id objc_msgSend_sessionType(void *a1, const char *a2, ...)
{
  return [a1 sessionType];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setUpSpectralOutputNotification(void *a1, const char *a2, ...)
{
  return [a1 setUpSpectralOutputNotification];
}

id objc_msgSend_sharedContainer(void *a1, const char *a2, ...)
{
  return [a1 sharedContainer];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return [a1 sharedContext];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_shazamCount(void *a1, const char *a2, ...)
{
  return [a1 shazamCount];
}

id objc_msgSend_shazamDictionary(void *a1, const char *a2, ...)
{
  return [a1 shazamDictionary];
}

id objc_msgSend_shazamID(void *a1, const char *a2, ...)
{
  return [a1 shazamID];
}

id objc_msgSend_shazamIDs(void *a1, const char *a2, ...)
{
  return [a1 shazamIDs];
}

id objc_msgSend_shazamItemDictionary(void *a1, const char *a2, ...)
{
  return [a1 shazamItemDictionary];
}

id objc_msgSend_shazamKey(void *a1, const char *a2, ...)
{
  return [a1 shazamKey];
}

id objc_msgSend_shazamLibraryZone(void *a1, const char *a2, ...)
{
  return [a1 shazamLibraryZone];
}

id objc_msgSend_shazamResponse(void *a1, const char *a2, ...)
{
  return [a1 shazamResponse];
}

id objc_msgSend_shazamURL(void *a1, const char *a2, ...)
{
  return [a1 shazamURL];
}

id objc_msgSend_shouldDisplayShazamUpsell(void *a1, const char *a2, ...)
{
  return [a1 shouldDisplayShazamUpsell];
}

id objc_msgSend_shouldPerformFetch(void *a1, const char *a2, ...)
{
  return [a1 shouldPerformFetch];
}

id objc_msgSend_shouldUpdate(void *a1, const char *a2, ...)
{
  return [a1 shouldUpdate];
}

id objc_msgSend_shutdownService(void *a1, const char *a2, ...)
{
  return [a1 shutdownService];
}

id objc_msgSend_shutdownWorker(void *a1, const char *a2, ...)
{
  return [a1 shutdownWorker];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return [a1 signature];
}

id objc_msgSend_signatureGenerator(void *a1, const char *a2, ...)
{
  return [a1 signatureGenerator];
}

id objc_msgSend_signatureRecordingOffset(void *a1, const char *a2, ...)
{
  return [a1 signatureRecordingOffset];
}

id objc_msgSend_silentRecorders(void *a1, const char *a2, ...)
{
  return [a1 silentRecorders];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return [a1 snapshot];
}

id objc_msgSend_snapshotUpdater(void *a1, const char *a2, ...)
{
  return [a1 snapshotUpdater];
}

id objc_msgSend_songInfo(void *a1, const char *a2, ...)
{
  return [a1 songInfo];
}

id objc_msgSend_songItemDictionary(void *a1, const char *a2, ...)
{
  return [a1 songItemDictionary];
}

id objc_msgSend_songRelationIDs(void *a1, const char *a2, ...)
{
  return [a1 songRelationIDs];
}

id objc_msgSend_songsDictionary(void *a1, const char *a2, ...)
{
  return [a1 songsDictionary];
}

id objc_msgSend_songsResponse(void *a1, const char *a2, ...)
{
  return [a1 songsResponse];
}

id objc_msgSend_songwriters(void *a1, const char *a2, ...)
{
  return [a1 songwriters];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_spatialOffsets(void *a1, const char *a2, ...)
{
  return [a1 spatialOffsets];
}

id objc_msgSend_speedSkew(void *a1, const char *a2, ...)
{
  return [a1 speedSkew];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startCondition(void *a1, const char *a2, ...)
{
  return [a1 startCondition];
}

id objc_msgSend_startListeningForPushNotifications(void *a1, const char *a2, ...)
{
  return [a1 startListeningForPushNotifications];
}

id objc_msgSend_startRecognitionGroup(void *a1, const char *a2, ...)
{
  return [a1 startRecognitionGroup];
}

id objc_msgSend_startRecording(void *a1, const char *a2, ...)
{
  return [a1 startRecording];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 startUpdatingLocation];
}

id objc_msgSend_startedRecordingDate(void *a1, const char *a2, ...)
{
  return [a1 startedRecordingDate];
}

id objc_msgSend_staticLyrics(void *a1, const char *a2, ...)
{
  return [a1 staticLyrics];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopAfterTransferingBuffers(void *a1, const char *a2, ...)
{
  return [a1 stopAfterTransferingBuffers];
}

id objc_msgSend_stopCondition(void *a1, const char *a2, ...)
{
  return [a1 stopCondition];
}

id objc_msgSend_stopListening(void *a1, const char *a2, ...)
{
  return [a1 stopListening];
}

id objc_msgSend_stopListeningForChanges(void *a1, const char *a2, ...)
{
  return [a1 stopListeningForChanges];
}

id objc_msgSend_stopRecognition(void *a1, const char *a2, ...)
{
  return [a1 stopRecognition];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingLocation];
}

id objc_msgSend_stopWatchdogTimer(void *a1, const char *a2, ...)
{
  return [a1 stopWatchdogTimer];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_storefront(void *a1, const char *a2, ...)
{
  return [a1 storefront];
}

id objc_msgSend_streamDescription(void *a1, const char *a2, ...)
{
  return [a1 streamDescription];
}

id objc_msgSend_streamingBufferDuration(void *a1, const char *a2, ...)
{
  return [a1 streamingBufferDuration];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_subscription(void *a1, const char *a2, ...)
{
  return [a1 subscription];
}

id objc_msgSend_subscriptionID(void *a1, const char *a2, ...)
{
  return [a1 subscriptionID];
}

id objc_msgSend_subscriptionIDsToDelete(void *a1, const char *a2, ...)
{
  return [a1 subscriptionIDsToDelete];
}

id objc_msgSend_subscriptionTaskTransformer(void *a1, const char *a2, ...)
{
  return [a1 subscriptionTaskTransformer];
}

id objc_msgSend_subscriptionsToSave(void *a1, const char *a2, ...)
{
  return [a1 subscriptionsToSave];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_suggestedAudioRecordingSource(void *a1, const char *a2, ...)
{
  return [a1 suggestedAudioRecordingSource];
}

id objc_msgSend_suggestedLanguage(void *a1, const char *a2, ...)
{
  return [a1 suggestedLanguage];
}

id objc_msgSend_supportsDeviceToDeviceEncryption(void *a1, const char *a2, ...)
{
  return [a1 supportsDeviceToDeviceEncryption];
}

id objc_msgSend_syncCompletionLock(void *a1, const char *a2, ...)
{
  return [a1 syncCompletionLock];
}

id objc_msgSend_syncID(void *a1, const char *a2, ...)
{
  return [a1 syncID];
}

id objc_msgSend_syncProgress(void *a1, const char *a2, ...)
{
  return [a1 syncProgress];
}

id objc_msgSend_syncSession(void *a1, const char *a2, ...)
{
  return [a1 syncSession];
}

id objc_msgSend_syncSnapshot(void *a1, const char *a2, ...)
{
  return [a1 syncSnapshot];
}

id objc_msgSend_syncStartCondition(void *a1, const char *a2, ...)
{
  return [a1 syncStartCondition];
}

id objc_msgSend_tailOperation(void *a1, const char *a2, ...)
{
  return [a1 tailOperation];
}

id objc_msgSend_tap(void *a1, const char *a2, ...)
{
  return [a1 tap];
}

id objc_msgSend_tapsForAvailableSources(void *a1, const char *a2, ...)
{
  return [a1 tapsForAvailableSources];
}

id objc_msgSend_taskID(void *a1, const char *a2, ...)
{
  return [a1 taskID];
}

id objc_msgSend_taskTransformer(void *a1, const char *a2, ...)
{
  return [a1 taskTransformer];
}

id objc_msgSend_tasksToRetry(void *a1, const char *a2, ...)
{
  return [a1 tasksToRetry];
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 teamIdentifier];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return [a1 topic];
}

id objc_msgSend_totalTapCount(void *a1, const char *a2, ...)
{
  return [a1 totalTapCount];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_trackChanges(void *a1, const char *a2, ...)
{
  return [a1 trackChanges];
}

id objc_msgSend_trackIDsToDelete(void *a1, const char *a2, ...)
{
  return [a1 trackIDsToDelete];
}

id objc_msgSend_trackSetToAdd(void *a1, const char *a2, ...)
{
  return [a1 trackSetToAdd];
}

id objc_msgSend_trackSetToDelete(void *a1, const char *a2, ...)
{
  return [a1 trackSetToDelete];
}

id objc_msgSend_tracksFetchedResultsController(void *a1, const char *a2, ...)
{
  return [a1 tracksFetchedResultsController];
}

id objc_msgSend_tracksToAdd(void *a1, const char *a2, ...)
{
  return [a1 tracksToAdd];
}

id objc_msgSend_tracksToDelete(void *a1, const char *a2, ...)
{
  return [a1 tracksToDelete];
}

id objc_msgSend_tracksToModify(void *a1, const char *a2, ...)
{
  return [a1 tracksToModify];
}

id objc_msgSend_tracksToSave(void *a1, const char *a2, ...)
{
  return [a1 tracksToSave];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return [a1 transaction];
}

id objc_msgSend_transactionID(void *a1, const char *a2, ...)
{
  return [a1 transactionID];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_ubiquityIdentityToken(void *a1, const char *a2, ...)
{
  return [a1 ubiquityIdentityToken];
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return [a1 underlyingErrors];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unregisterAudioSessionObservers(void *a1, const char *a2, ...)
{
  return [a1 unregisterAudioSessionObservers];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsyncedGroupChangeset(void *a1, const char *a2, ...)
{
  return [a1 unsyncedGroupChangeset];
}

id objc_msgSend_unsyncedTrackChangeset(void *a1, const char *a2, ...)
{
  return [a1 unsyncedTrackChangeset];
}

id objc_msgSend_updateProgress(void *a1, const char *a2, ...)
{
  return [a1 updateProgress];
}

id objc_msgSend_updatedGroup(void *a1, const char *a2, ...)
{
  return [a1 updatedGroup];
}

id objc_msgSend_updatedTrack(void *a1, const char *a2, ...)
{
  return [a1 updatedTrack];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_urlBuilder(void *a1, const char *a2, ...)
{
  return [a1 urlBuilder];
}

id objc_msgSend_urlRequest(void *a1, const char *a2, ...)
{
  return [a1 urlRequest];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userNotificationCenter(void *a1, const char *a2, ...)
{
  return [a1 userNotificationCenter];
}

id objc_msgSend_validProviderIdentifier(void *a1, const char *a2, ...)
{
  return [a1 validProviderIdentifier];
}

id objc_msgSend_validProviderName(void *a1, const char *a2, ...)
{
  return [a1 validProviderName];
}

id objc_msgSend_validatedKey(void *a1, const char *a2, ...)
{
  return [a1 validatedKey];
}

id objc_msgSend_videoURL(void *a1, const char *a2, ...)
{
  return [a1 videoURL];
}

id objc_msgSend_watchdogTimeout(void *a1, const char *a2, ...)
{
  return [a1 watchdogTimeout];
}

id objc_msgSend_weakToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 weakToWeakObjectsMapTable];
}

id objc_msgSend_webURL(void *a1, const char *a2, ...)
{
  return [a1 webURL];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_worker(void *a1, const char *a2, ...)
{
  return [a1 worker];
}

id objc_msgSend_workerDelegate(void *a1, const char *a2, ...)
{
  return [a1 workerDelegate];
}

id objc_msgSend_workerID(void *a1, const char *a2, ...)
{
  return [a1 workerID];
}

id objc_msgSend_workers(void *a1, const char *a2, ...)
{
  return [a1 workers];
}

id objc_msgSend_workflowRunnerClient(void *a1, const char *a2, ...)
{
  return [a1 workflowRunnerClient];
}

id objc_msgSend_zone(void *a1, const char *a2, ...)
{
  return [a1 zone];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return [a1 zoneID];
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return [a1 zoneName];
}

id objc_msgSend_zoneTransformer(void *a1, const char *a2, ...)
{
  return [a1 zoneTransformer];
}

id objc_msgSend_zonesFolderPath(void *a1, const char *a2, ...)
{
  return [a1 zonesFolderPath];
}