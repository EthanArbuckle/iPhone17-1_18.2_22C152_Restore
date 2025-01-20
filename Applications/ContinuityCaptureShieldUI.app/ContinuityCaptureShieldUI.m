void sub_100004CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004D04(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 32)) {
    [v6 removeAttribution:];
  }
  if (*(void *)(a1 + 40)) {
    [v6 addAttribution:];
  }
  [v5 setUserInitiated:1];
}

void sub_100004D84(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCurrentAttribution:*(void *)(a1 + 32)];
  v3 = *(void **)(a1 + 40);
  id v4 = WeakRetained[4];
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100004E40;
    v5[3] = &unk_10001C4E0;
    id v6 = v3;
    [v4 handleUserInteractionsWithBlock:v5];
  }
  else
  {
    [WeakRetained[4] handleUserInteractionsWithBlock:0];
  }
}

uint64_t sub_100004E40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100006868(uint64_t a1)
{
  v2 = sub_10000AB00();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[ContinuityCaptureShieldUIViewController observeValueForKeyPath:ofObject:change:context:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: %@ Request refresh ui", (uint8_t *)&v5, 0x16u);
  }

  return [*(id *)(a1 + 32) _updateUI];
}

id sub_10000692C(uint64_t a1)
{
  v2 = sub_10000AB00();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[ContinuityCaptureShieldUIViewController observeValueForKeyPath:ofObject:change:context:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: %@ Updated FaceTime continuity session state. Refresh UI", (uint8_t *)&v5, 0x16u);
  }

  return [*(id *)(a1 + 32) _updateUI];
}

void sub_100006D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006DAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = sub_10000AB00();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[ContinuityCaptureShieldUIViewController _showHowToReconnectDialog]_block_invoke";
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: <%p> OK button pressed", (uint8_t *)&v5, 0x16u);
  }

  [WeakRetained _disconnectSession];
}

void sub_100006E88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = sub_10000AB00();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[ContinuityCaptureShieldUIViewController _showHowToReconnectDialog]_block_invoke";
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: <%p> Cancel button pressed", (uint8_t *)&v5, 0x16u);
  }

  WeakRetained[17] = 0;
}

void sub_100007248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007284(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = sub_10000AB00();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[ContinuityCaptureShieldUIViewController _showDedicatedDisconnectDialog]_block_invoke";
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: <%p> OK button pressed", (uint8_t *)&v5, 0x16u);
  }

  [WeakRetained _disconnectSession];
}

void sub_100007360(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = sub_10000AB00();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[ContinuityCaptureShieldUIViewController _showDedicatedDisconnectDialog]_block_invoke";
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: <%p> Cancel button pressed", (uint8_t *)&v5, 0x16u);
  }

  WeakRetained[17] = 0;
}

void sub_1000082B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000082E4(uint64_t a1)
{
  v2 = +[TUCallCenter sharedInstance];
  uint64_t v3 = [v2 neighborhoodActivityConduit];
  uint64_t v4 = [*(id *)(a1 + 32) UUID];
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000083F4;
  v6[3] = &unk_10001C5C0;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  [v3 pullConversation:v4 fromTVDevice:v5 completion:v6];

  objc_destroyWeak(&v8);
}

void sub_1000083E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000083F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = sub_10000AB00();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000FC18(a1, (uint64_t)v4, v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000846C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL sub_100008828(id a1, TUConversation *a2)
{
  return [(TUConversation *)a2 state] == (id)3;
}

void sub_1000089D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_10000AB00();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315394;
      id v4 = "-[ContinuityCaptureShieldUIViewController _disconnectSession]_block_invoke";
      __int16 v5 = 2112;
      id v6 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s:  %@ disconnect timeout", (uint8_t *)&v3, 0x16u);
    }

    [WeakRetained _tearDownShield];
  }
}

void sub_100008D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL sub_100008D38(id a1, TUConversation *a2)
{
  return [(TUConversation *)a2 state] == (id)3;
}

void sub_100008D5C(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  __int16 v5 = WeakRetained;
  if (a2 && WeakRetained)
  {
    WeakRetained[3] = 1;
    [WeakRetained _pullConversation:*(void *)(a1 + 32) deviceHandle:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = sub_10000AB00();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10000FCCC();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100009570(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tearDownShield];
}

void sub_1000099F0(id a1, BSActionResponse *a2)
{
  v2 = a2;
  int v3 = sub_10000AB00();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(BSActionResponse *)v2 error];
    int v6 = 136315394;
    id v7 = "-[ContinuityCaptureShieldUIViewController _tearDownShield]_block_invoke";
    __int16 v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Scene torn down with error: %@, exit now ", (uint8_t *)&v6, 0x16u);
  }
  __int16 v5 = +[UIApplication sharedApplication];
  [v5 terminateWithSuccess];
}

void sub_100009AE8(uint64_t a1)
{
  v2 = sub_10000AB00();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 136315394;
    id v7 = "-[ContinuityCaptureShieldUIViewController _tearDownShield]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: destroy scene: %@ in lock mode", (uint8_t *)&v6, 0x16u);
  }

  id v4 = *(void **)(a1 + 32);
  __int16 v5 = +[NSSet setWithObject:*(void *)(a1 + 40)];
  [v4 sendActions:v5];
}

void sub_10000A3E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A3FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _recalculateState];
}

id sub_10000AB00()
{
  if (qword_100024070 != -1) {
    dispatch_once(&qword_100024070, &stru_10001C768);
  }
  v0 = (void *)qword_100024068;

  return v0;
}

void sub_10000AB54(id a1)
{
  qword_100024068 = (uint64_t)os_log_create("com.apple.ContinuityCaptureShieldUI", "default");

  _objc_release_x1();
}

void sub_10000ABF4(id a1)
{
  qword_100024080 = objc_alloc_init(CMContinuityCaptureUIStateTracker);

  _objc_release_x1();
}

void sub_10000B258(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000B490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

BOOL sub_10000B4AC(id a1, TUConversation *a2)
{
  return [(TUConversation *)a2 state] == (id)3;
}

void sub_10000B5B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _sessionDidUpdateWithConfiguration:*(void *)(a1 + 32)];
}

void sub_10000B87C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000B9D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tearDownShield];
}

void sub_10000BC44(id a1)
{
  qword_100024088 = objc_alloc_init(ContinuityCaptureShieldUIBackgroundPauseManager);

  _objc_release_x1();
}

void sub_10000D2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,id a63)
{
}

void sub_10000D38C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_10000AB00();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      __int16 v5 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke";
      __int16 v6 = 2048;
      id v7 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: <%p> pause button pressed", (uint8_t *)&v4, 0x16u);
    }

    uint64_t v3 = [WeakRetained delegate];
    [v3 contentViewDidSelectPauseButton:WeakRetained];
  }
}

void sub_10000D470(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v6 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 41))
  {
    id v7 = sub_10000AB00();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke";
      __int16 v15 = 2048;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: <%p> facetime button pressed", buf, 0x16u);
    }

    __int16 v8 = [v6 delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      [v6 _setPullFaceTimeButtonLoading:1];
      v10 = [v6 delegate];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10000D63C;
      v11[3] = &unk_10001C678;
      objc_copyWeak(&v12, v4);
      [v10 contentViewDidSelectFaceTimeButton:v6 completion:v11];

      objc_destroyWeak(&v12);
    }
  }
}

void sub_10000D620(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000D63C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D6CC;
  block[3] = &unk_10001C678;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_10000D6CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setPullFaceTimeButtonLoading:0];
}

void sub_10000D710(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_10000AB00();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      id v7 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke_3";
      __int16 v8 = 2048;
      id v9 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: <%p> favorites button pressed", (uint8_t *)&v6, 0x16u);
    }

    id v3 = [WeakRetained delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      __int16 v5 = [WeakRetained delegate];
      [v5 contentViewDidSelectFavoritesButton:WeakRetained];
    }
  }
}

void sub_10000D824(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_10000AB00();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      __int16 v5 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke";
      __int16 v6 = 2048;
      id v7 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: <%p> disconnect button pressed", (uint8_t *)&v4, 0x16u);
    }

    id v3 = [WeakRetained delegate];
    [v3 contentViewDidSelectDisconnectButton:WeakRetained];
  }
}

void sub_10000D908(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_10000AB00();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      __int16 v5 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke";
      __int16 v6 = 2048;
      id v7 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: <%p> skip button pressed", (uint8_t *)&v4, 0x16u);
    }

    id v3 = [WeakRetained delegate];
    [v3 contentViewDidSelectSkipButton:WeakRetained];
  }
}

void sub_10000DF44(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v1 = CACurrentMediaTime();
    id v2 = [WeakRetained[8] rootLayer];
    [v2 setBeginTime:v1];

    [WeakRetained[8] setState:@"Animate"];
  }
}

void sub_10000F264(id a1)
{
  qword_100024098 = objc_alloc_init(ContinuityCaptureShieldUIBackgroundActivityManager);

  _objc_release_x1();
}

void sub_10000F6C4(id a1, NSString *a2, ContinuityCaptureShieldUIBackgroundActivityController *a3, BOOL *a4)
{
}

void sub_10000F7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F7DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000F7EC(uint64_t a1)
{
}

void sub_10000F7F4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isBackgroundActivityActive])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t start(int a1, char **a2)
{
  __int16 v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  __int16 v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_10000FAEC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  int v4 = "-[ContinuityCaptureShieldUIBaseSceneDelegate scene:openURLContexts:]";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: <%p> Launching ShieldUI via URL without a valid URL payload for the launchUIConfiguration: %@", (uint8_t *)&v3, 0x20u);
}

void sub_10000FB88()
{
  v2[0] = 136315650;
  sub_100009BE0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s: %@ shield UI in placement step unexpectedly with client device model %d", (uint8_t *)v2, 0x1Cu);
}

void sub_10000FC18(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = 136315650;
  sub_100009BE0();
  __int16 v8 = v6;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: %@ pullConversation failed with error=%@", (uint8_t *)v7, 0x20u);
}

void sub_10000FCCC()
{
  v1[0] = 136315394;
  sub_100009BE0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s: %@ error talking to ccd about pulling conversation", (uint8_t *)v1, 0x16u);
}

void sub_10000FD4C()
{
  v1[0] = 136315394;
  sub_100009BE0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: %@: error opening favorites", (uint8_t *)v1, 0x16u);
}

void sub_10000FDCC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  __int16 v6 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
  int v7 = 136315906;
  __int16 v8 = "-[ContinuityCaptureShieldUIPauseSceneComponent _scene:willTransitionToActivationState:withReasonsMask:]";
  __int16 v9 = 2048;
  uint64_t v10 = a1;
  __int16 v11 = 2048;
  uint64_t v12 = a2;
  __int16 v13 = 2112;
  v14 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%s: <%p> state:%zu deactivationReasons:%@", (uint8_t *)&v7, 0x2Au);
}

void sub_10000FEA0()
{
  v1[0] = 136315394;
  sub_100009BE0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: %@ activeConfiguration shouldn't be nil", (uint8_t *)v1, 0x16u);
}

void sub_10000FF20()
{
  v1[0] = 136315394;
  sub_100009BE0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: %@ activeConfiguration should not be set to nil, returning", (uint8_t *)v1, 0x16u);
}

uint64_t AVGestaltGetBoolAnswer()
{
  return _AVGestaltGetBoolAnswer();
}

uint64_t BSAuditTokenForCurrentProcess()
{
  return _BSAuditTokenForCurrentProcess();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

uint64_t CMContinuityCaptureLog()
{
  return _CMContinuityCaptureLog();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UIApplicationSceneDeactivationReasonMaskDescriptionComponents()
{
  return _UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
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

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return [a1 URLContexts];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return [a1 _FBSScene];
}

id objc_msgSend__aquireAppSuspendAssertion(void *a1, const char *a2, ...)
{
  return [a1 _aquireAppSuspendAssertion];
}

id objc_msgSend__cancelCurrentDebounceTimer(void *a1, const char *a2, ...)
{
  return [a1 _cancelCurrentDebounceTimer];
}

id objc_msgSend__clearPendingCompletion(void *a1, const char *a2, ...)
{
  return [a1 _clearPendingCompletion];
}

id objc_msgSend__currentBackgroundActivityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _currentBackgroundActivityIdentifier];
}

id objc_msgSend__defaultButtonPadding(void *a1, const char *a2, ...)
{
  return [a1 _defaultButtonPadding];
}

id objc_msgSend__defaultButtonScreenWidth(void *a1, const char *a2, ...)
{
  return [a1 _defaultButtonScreenWidth];
}

id objc_msgSend__defaultButtonTextFont(void *a1, const char *a2, ...)
{
  return [a1 _defaultButtonTextFont];
}

id objc_msgSend__defaultDescriptionPadding(void *a1, const char *a2, ...)
{
  return [a1 _defaultDescriptionPadding];
}

id objc_msgSend__defaultImageSymbolConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _defaultImageSymbolConfiguration];
}

id objc_msgSend__defaultImageTintColor(void *a1, const char *a2, ...)
{
  return [a1 _defaultImageTintColor];
}

id objc_msgSend__defaultSecondaryTextColor(void *a1, const char *a2, ...)
{
  return [a1 _defaultSecondaryTextColor];
}

id objc_msgSend__defaultSecondaryTextFont(void *a1, const char *a2, ...)
{
  return [a1 _defaultSecondaryTextFont];
}

id objc_msgSend__defaultTextColor(void *a1, const char *a2, ...)
{
  return [a1 _defaultTextColor];
}

id objc_msgSend__defaultTextFont(void *a1, const char *a2, ...)
{
  return [a1 _defaultTextFont];
}

id objc_msgSend__disconnectButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _disconnectButtonConfiguration];
}

id objc_msgSend__disconnectFaceTimeIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _disconnectFaceTimeIfNecessary];
}

id objc_msgSend__disconnectSession(void *a1, const char *a2, ...)
{
  return [a1 _disconnectSession];
}

id objc_msgSend__facetimeButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _facetimeButtonConfiguration];
}

id objc_msgSend__favoritesButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _favoritesButtonConfiguration];
}

id objc_msgSend__imageToTextPadding(void *a1, const char *a2, ...)
{
  return [a1 _imageToTextPadding];
}

id objc_msgSend__isOnLockScreen(void *a1, const char *a2, ...)
{
  return [a1 _isOnLockScreen];
}

id objc_msgSend__isPad(void *a1, const char *a2, ...)
{
  return [a1 _isPad];
}

id objc_msgSend__pauseButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _pauseButtonConfiguration];
}

id objc_msgSend__recalculateState(void *a1, const char *a2, ...)
{
  return [a1 _recalculateState];
}

id objc_msgSend__refreshConnectionType(void *a1, const char *a2, ...)
{
  return [a1 _refreshConnectionType];
}

id objc_msgSend__refreshUIState(void *a1, const char *a2, ...)
{
  return [a1 _refreshUIState];
}

id objc_msgSend__releaseAppSuspendAssertion(void *a1, const char *a2, ...)
{
  return [a1 _releaseAppSuspendAssertion];
}

id objc_msgSend__shouldShowFaceTimeButton(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowFaceTimeButton];
}

id objc_msgSend__shouldShowFavoritesButton(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowFavoritesButton];
}

id objc_msgSend__shouldShowHowToReconnectDialog(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowHowToReconnectDialog];
}

id objc_msgSend__skipButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _skipButtonConfiguration];
}

id objc_msgSend__tearDownShield(void *a1, const char *a2, ...)
{
  return [a1 _tearDownShield];
}

id objc_msgSend__textToButtonsPadding(void *a1, const char *a2, ...)
{
  return [a1 _textToButtonsPadding];
}

id objc_msgSend__updateUI(void *a1, const char *a2, ...)
{
  return [a1 _updateUI];
}

id objc_msgSend__updateUIForClientInformation(void *a1, const char *a2, ...)
{
  return [a1 _updateUIForClientInformation];
}

id objc_msgSend__updateUIForConnectionType(void *a1, const char *a2, ...)
{
  return [a1 _updateUIForConnectionType];
}

id objc_msgSend__updateUIForPlacementStep(void *a1, const char *a2, ...)
{
  return [a1 _updateUIForPlacementStep];
}

id objc_msgSend__updateUIForUIState(void *a1, const char *a2, ...)
{
  return [a1 _updateUIForUIState];
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return [a1 activationState];
}

id objc_msgSend_activeConfiguration(void *a1, const char *a2, ...)
{
  return [a1 activeConfiguration];
}

id objc_msgSend_activeConversations(void *a1, const char *a2, ...)
{
  return [a1 activeConversations];
}

id objc_msgSend_activeSplitSessionTV(void *a1, const char *a2, ...)
{
  return [a1 activeSplitSessionTV];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_annotation(void *a1, const char *a2, ...)
{
  return [a1 annotation];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_avMode(void *a1, const char *a2, ...)
{
  return [a1 avMode];
}

id objc_msgSend_backgroundActivityControllers(void *a1, const char *a2, ...)
{
  return [a1 backgroundActivityControllers];
}

id objc_msgSend_backgroundActivityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 backgroundActivityIdentifier];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_borderlessButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 borderlessButtonConfiguration];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clientDeviceModel(void *a1, const char *a2, ...)
{
  return [a1 clientDeviceModel];
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return [a1 clientName];
}

id objc_msgSend_compositeState(void *a1, const char *a2, ...)
{
  return [a1 compositeState];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_connectionType(void *a1, const char *a2, ...)
{
  return [a1 connectionType];
}

id objc_msgSend_contentInsets(void *a1, const char *a2, ...)
{
  return [a1 contentInsets];
}

id objc_msgSend_contentLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 contentLayoutGuide];
}

id objc_msgSend_conversationManager(void *a1, const char *a2, ...)
{
  return [a1 conversationManager];
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

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_deactivateBackgroundActivity(void *a1, const char *a2, ...)
{
  return [a1 deactivateBackgroundActivity];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultMetrics(void *a1, const char *a2, ...)
{
  return [a1 defaultMetrics];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_disconnectAllCalls(void *a1, const char *a2, ...)
{
  return [a1 disconnectAllCalls];
}

id objc_msgSend_disconnectSession(void *a1, const char *a2, ...)
{
  return [a1 disconnectSession];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_filledButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 filledButtonConfiguration];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frameLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 frameLayoutGuide];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_identifierForCurrentProcess(void *a1, const char *a2, ...)
{
  return [a1 identifierForCurrentProcess];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isBackgroundActivityActive(void *a1, const char *a2, ...)
{
  return [a1 isBackgroundActivityActive];
}

id objc_msgSend_isDedicated(void *a1, const char *a2, ...)
{
  return [a1 isDedicated];
}

id objc_msgSend_isDedicatedSession(void *a1, const char *a2, ...)
{
  return [a1 isDedicatedSession];
}

id objc_msgSend_isGeometryFlipped(void *a1, const char *a2, ...)
{
  return [a1 isGeometryFlipped];
}

id objc_msgSend_isInFaceTime(void *a1, const char *a2, ...)
{
  return [a1 isInFaceTime];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_neighborhoodActivityConduit(void *a1, const char *a2, ...)
{
  return [a1 neighborhoodActivityConduit];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_placementStepSkipped(void *a1, const char *a2, ...)
{
  return [a1 placementStepSkipped];
}

id objc_msgSend_publishedObjectNames(void *a1, const char *a2, ...)
{
  return [a1 publishedObjectNames];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_rootLayer(void *a1, const char *a2, ...)
{
  return [a1 rootLayer];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_skipPlacementStep(void *a1, const char *a2, ...)
{
  return [a1 skipPlacementStep];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlackColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_tearDownShield(void *a1, const char *a2, ...)
{
  return [a1 tearDownShield];
}

id objc_msgSend_terminateWithSuccess(void *a1, const char *a2, ...)
{
  return [a1 terminateWithSuccess];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_toState(void *a1, const char *a2, ...)
{
  return [a1 toState];
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

id objc_msgSend_uiState(void *a1, const char *a2, ...)
{
  return [a1 uiState];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}