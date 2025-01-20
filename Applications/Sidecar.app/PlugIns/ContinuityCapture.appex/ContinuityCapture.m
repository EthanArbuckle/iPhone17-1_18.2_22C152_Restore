void sub_100001B18(id a1)
{
  uint64_t vars8;

  qword_10001A108 = objc_alloc_init(ContinuityCaptureShieldUIBackgroundActivityManager);

  _objc_release_x1();
}

void sub_100001F78(id a1, NSString *a2, ContinuityCaptureShieldUIBackgroundActivityController *a3, BOOL *a4)
{
}

void sub_100002078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002090(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000020A0(uint64_t a1)
{
}

void sub_1000020A8(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isBackgroundActivityActive])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_100004060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,id a63)
{
}

void sub_100004108(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = ContinuityCaptureShieldUILog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      v5 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke";
      __int16 v6 = 2048;
      id v7 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: <%p> pause button pressed", (uint8_t *)&v4, 0x16u);
    }

    v3 = [WeakRetained delegate];
    [v3 contentViewDidSelectPauseButton:WeakRetained];
  }
}

void sub_1000041EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v6 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 41))
  {
    id v7 = ContinuityCaptureShieldUILog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke";
      __int16 v15 = 2048;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: <%p> facetime button pressed", buf, 0x16u);
    }

    id v8 = [v6 delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      [v6 _setPullFaceTimeButtonLoading:1];
      v10 = [v6 delegate];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000043B8;
      v11[3] = &unk_1000145D8;
      objc_copyWeak(&v12, v4);
      [v10 contentViewDidSelectFaceTimeButton:v6 completion:v11];

      objc_destroyWeak(&v12);
    }
  }
}

void sub_10000439C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000043B8(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004448;
  block[3] = &unk_1000145D8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_100004448(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setPullFaceTimeButtonLoading:0];
}

void sub_10000448C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = ContinuityCaptureShieldUILog();
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
      v5 = [WeakRetained delegate];
      [v5 contentViewDidSelectFavoritesButton:WeakRetained];
    }
  }
}

void sub_1000045A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = ContinuityCaptureShieldUILog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      v5 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke";
      __int16 v6 = 2048;
      id v7 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: <%p> disconnect button pressed", (uint8_t *)&v4, 0x16u);
    }

    id v3 = [WeakRetained delegate];
    [v3 contentViewDidSelectDisconnectButton:WeakRetained];
  }
}

void sub_100004684(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = ContinuityCaptureShieldUILog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      v5 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke";
      __int16 v6 = 2048;
      id v7 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: <%p> skip button pressed", (uint8_t *)&v4, 0x16u);
    }

    id v3 = [WeakRetained delegate];
    [v3 contentViewDidSelectSkipButton:WeakRetained];
  }
}

void sub_100004CC0(uint64_t a1)
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

uint64_t ContinuityCaptureShieldUILog()
{
  if (qword_10001A120 != -1) {
    dispatch_once(&qword_10001A120, &stru_1000145F8);
  }
  return qword_10001A118;
}

void sub_100005FD0(id a1)
{
  qword_10001A118 = (uint64_t)os_log_create("com.apple.ContinuityCaptureShieldUI", "default");
}

void sub_10000620C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006220(id a1)
{
  double v1 = [+[NSBundle mainBundle] bundleIdentifier];

  _AVCapturePrewarm(v1);
}

void sub_1000067C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006838;
  v3[3] = &unk_100014640;
  v3[4] = *(void *)(a1 + 32);
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

unsigned char *sub_100006838(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[136]) {
    return [result _handleLayout:*(void *)(a1 + 40) ignoringStandby:1];
  }
  return result;
}

id sub_100006FC4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 168) = *(unsigned char *)(a1 + 48);
  if (*(unsigned char *)(a1 + 48)) {
    double v1 = &kCMContinuityCaptureControlIncomingCall;
  }
  else {
    double v1 = &kCMContinuityCaptureControlIncomingCallComplete;
  }
  return [*(id *)(*(void *)(a1 + 32) + 48) postEvent:*v1 entity:4 data:*(void *)(a1 + 40)];
}

id sub_1000071CC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = &kCMContinuityCaptureEventActiveCallStart;
  }
  else {
    double v1 = &kCMContinuityCaptureEventActiveCallEnd;
  }
  return [*(id *)(*(void *)(a1 + 32) + 48) postEvent:*v1 entity:0 data:0];
}

id sub_1000074EC(uint64_t a1)
{
  if (dword_10001A140)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 169) = 0;
  return [*(id *)(a1 + 32) _disconnectSession:v4 v5];
}

uint64_t sub_10000764C(uint64_t result)
{
  uint64_t v1 = result;
  if (dword_10001A140)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    result = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *(unsigned char *)(*(void *)(v1 + 32) + 169) = 0;
  return result;
}

void sub_100007E84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100007EA8(uint64_t a1)
{
  if (dword_10001A140)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v3 = objc_opt_class();
  objc_sync_enter(v3);

  *(void *)(*(void *)(a1 + 32) + 128) = 0;
  return objc_sync_exit(v3);
}

void sub_100008050(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000085B4(_Unwind_Exception *exception_object)
{
}

id sub_1000085D0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 160);
  if (v3)
  {
    uint64_t v4 = *(NSObject **)(v2 + 104);
    if (v4)
    {
      dispatch_source_cancel(v4);

      *(void *)(*(void *)(a1 + 32) + 104) = 0;
      id v3 = *(void **)(*(void *)(a1 + 32) + 160);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 resetRequest:v5];
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 160) = [objc_alloc((Class)CMContinuityCaptureSidecarServer) initWithRequest:*(void *)(a1 + 40)];
    FigCaptureSessionRemoteSetWombatEnabled();
    id v7 = *(void **)(a1 + 32);
    return [v7 updateRequestState];
  }
}

void sub_10000894C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100008968(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = *(unsigned char *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 120))
  {
    if (*(void *)(v2 + 160))
    {
      [*(id *)(v2 + 160) resetRequest:0];
      id v3 = *(void **)(a1 + 32);
      return [v3 _setConnectionInterruptTimer];
    }
    goto LABEL_10;
  }
  if (!*(void *)(v2 + 48))
  {
LABEL_10:
    return [(id)v2 _terminate];
  }
  uint64_t v4 = kCMContinuityCaptureEventTerminate;
  uint64_t v5 = *(void **)(v2 + 48);

  return [v5 postEvent:v4 entity:0 data:0];
}

void sub_100009280(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *sub_1000092AC(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[6]) {
    return [result updateRequestState];
  }
  return result;
}

void sub_100009628(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_1000096A0;
  v1[3] = &unk_100014758;
  long long v2 = *(_OWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v1);
}

void sub_1000096A0(uint64_t a1)
{
  if (dword_10001A140)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((char)--*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 48) postEvent:kCMContinuityCaptureEventTerminate entity:0 data:0];
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 104));
  }
}

void sub_100009CA4(uint64_t a1)
{
  [*(id *)(a1 + 32) _observeValueForKeyPath:*(void *)(a1 + 40) ofObject:*(void *)(a1 + 48) change:*(void *)(a1 + 56) context:*(void *)(a1 + 64)];
  long long v2 = *(void **)(a1 + 32);
}

id sub_10000A5A4(uint64_t a1)
{
  if (dword_10001A140)
  {
    int v7 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v3 = (void *)SBSCreateOpenApplicationService();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A750;
  v5[3] = &unk_1000147A8;
  v5[4] = *(void *)(a1 + 32);
  return [v3 openApplication:@"com.apple.sidecar" withOptions:0 completion:v5];
}

uint64_t sub_10000A750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

id sub_10000B488(uint64_t a1)
{
  if (dword_10001A140)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_handleLayout:ignoringStandby:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "currentLayout", v4, v5), 0);
}

uint64_t sub_10000BBC4(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 97) = *(unsigned char *)(*(void *)(result + 32) + 96) ^ 1;
  if (*(unsigned char *)(*(void *)(result + 32) + 97)) {
    BOOL v1 = dword_10001A140 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

id sub_10000BF6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminate];
}

void sub_10000C250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C26C(uint64_t a1, void *a2, void *a3)
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

void sub_10000C2EC(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCurrentAttribution:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  id v4 = WeakRetained[4];
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000C3A8;
    v5[3] = &unk_1000147F8;
    id v6 = v3;
    [v4 handleUserInteractionsWithBlock:v5];
  }
  else
  {
    [WeakRetained[4] handleUserInteractionsWithBlock:0];
  }
}

uint64_t sub_10000C3A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
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

uint64_t FigCaptureSessionRemoteSetWombatEnabled()
{
  return _FigCaptureSessionRemoteSetWombatEnabled();
}

uint64_t FigCaptureSessionRemoteSetWombatInUse()
{
  return _FigCaptureSessionRemoteSetWombatInUse();
}

uint64_t FigNote_AllowInternalDefaultLogs()
{
  return _FigNote_AllowInternalDefaultLogs();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t SBSCreateOpenApplicationService()
{
  return _SBSCreateOpenApplicationService();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return _fig_log_call_emit_and_clean_up_after_send_and_compose();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return _fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
}

uint64_t fig_note_initialize_category_with_default_work_cf()
{
  return _fig_note_initialize_category_with_default_work_cf();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

id objc_msgSend__pauseButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _pauseButtonConfiguration];
}

id objc_msgSend__resolveUserPauseState(void *a1, const char *a2, ...)
{
  return [a1 _resolveUserPauseState];
}

id objc_msgSend__shouldShowFaceTimeButton(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowFaceTimeButton];
}

id objc_msgSend__shouldShowFavoritesButton(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowFavoritesButton];
}

id objc_msgSend__skipButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _skipButtonConfiguration];
}

id objc_msgSend__terminate(void *a1, const char *a2, ...)
{
  return [a1 _terminate];
}

id objc_msgSend__textToButtonsPadding(void *a1, const char *a2, ...)
{
  return [a1 _textToButtonsPadding];
}

id objc_msgSend__updateUI(void *a1, const char *a2, ...)
{
  return [a1 _updateUI];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
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

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
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

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_contentInsets(void *a1, const char *a2, ...)
{
  return [a1 contentInsets];
}

id objc_msgSend_contentLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 contentLayoutGuide];
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

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return [a1 currentLayout];
}

id objc_msgSend_deactivateBackgroundActivity(void *a1, const char *a2, ...)
{
  return [a1 deactivateBackgroundActivity];
}

id objc_msgSend_defaultMetrics(void *a1, const char *a2, ...)
{
  return [a1 defaultMetrics];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_displayBacklightLevel(void *a1, const char *a2, ...)
{
  return [a1 displayBacklightLevel];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_filledButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 filledButtonConfiguration];
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

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isBackgroundActivityActive(void *a1, const char *a2, ...)
{
  return [a1 isBackgroundActivityActive];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isGeometryFlipped(void *a1, const char *a2, ...)
{
  return [a1 isGeometryFlipped];
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

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return [a1 level];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_objectValue(void *a1, const char *a2, ...)
{
  return [a1 objectValue];
}

id objc_msgSend_publishedObjectNames(void *a1, const char *a2, ...)
{
  return [a1 publishedObjectNames];
}

id objc_msgSend_releaseCurrentIdleSleepAssertion(void *a1, const char *a2, ...)
{
  return [a1 releaseCurrentIdleSleepAssertion];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_rootLayer(void *a1, const char *a2, ...)
{
  return [a1 rootLayer];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
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

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_videoPreviewLayer(void *a1, const char *a2, ...)
{
  return [a1 videoPreviewLayer];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}