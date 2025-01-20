id sub_1000036DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateActionListViewWithAnimation];
}

id sub_1000036E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLastActionItemWithAnimationIfNecessary];
}

void sub_100004570(id a1)
{
  qword_100016860 = objc_alloc_init(BCCoreAnalytics);

  _objc_release_x1();
}

id sub_100004658(uint64_t a1)
{
  v9[0] = @"bizIdCallToAction";
  v2 = [*(id *)(a1 + 32) bizID];
  v3 = [*(id *)(a1 + 32) messageSubtitle];
  v4 = +[NSString stringWithFormat:@"%@ - %@", v2, v3];
  v10[0] = v4;
  v9[1] = @"chatSuggestLatencyInMiliSeconds";
  v5 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v10[1] = v5;
  v9[2] = @"bizItemReturnedAfterAction";
  v6 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v10[2] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

id sub_1000048B4(uint64_t a1)
{
  v9[0] = @"bizIdCallToAction";
  v2 = [*(id *)(a1 + 32) bizID];
  v3 = [*(id *)(a1 + 32) messageSubtitle];
  v4 = +[NSString stringWithFormat:@"%@ - %@", v2, v3];
  v10[0] = v4;
  v9[1] = @"bizIsVisible";
  v5 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v10[1] = v5;
  v9[2] = @"chatSuggestLatencyInMiliSeconds";
  v6 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v10[2] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

id sub_100004A00(uint64_t a1)
{
  v7[0] = @"bizFetchError";
  v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) code]);
  v8[0] = v2;
  v7[1] = @"bizIsVisible";
  v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v8[1] = v3;
  v7[2] = @"chatSuggestLatencyInMiliSeconds";
  v4 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v8[2] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

void sub_100005734(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 dialRequestAction];
  [v2 configureAlertControllerForDialRequestAction:v3];

  v4 = [*(id *)(a1 + 32) alertController];

  if (v4)
  {
    v5 = sub_100007F6C();
    v6 = (char *)[*(id *)(a1 + 32) tapId];
    if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = (os_signpost_id_t)v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v7, "RenderBusinessChatCallAction", (const char *)&unk_10000FB72, buf, 2u);
      }
    }

    v8 = [*(id *)(a1 + 32) deviceState];
    unsigned int v9 = [v8 isLocked];

    v10 = *(void **)(a1 + 32);
    if (v9)
    {
      [v10 _dismiss];
    }
    else
    {
      v11 = [v10 presenter];
      v12 = [*(id *)(a1 + 32) alertController];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000058B8;
      v13[3] = &unk_100010428;
      v13[4] = *(void *)(a1 + 32);
      [v11 presentViewController:v12 animated:1 completion:v13];
    }
  }
}

void sub_1000058B8(uint64_t a1)
{
  [*(id *)(a1 + 32) setChatSuggestUIPresented:1];
  v2 = [*(id *)(a1 + 32) pendingActionItems];
  id v3 = [v2 count];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) deviceState];
    unsigned int v5 = [v4 isLocked];

    v6 = *(void **)(a1 + 32);
    if (v5)
    {
      [v6 _dismiss];
    }
    else
    {
      os_signpost_id_t v7 = [v6 actionsViewController];
      v8 = [*(id *)(a1 + 32) pendingActionItems];
      [v7 addActionItems:v8];

      unsigned int v9 = *(void **)(a1 + 32);
      [v9 setPendingActionItems:0];
    }
  }
}

void sub_100006368(id *a1)
{
  +[BCCoreAnalytics logEventForView:bizItem:bizItemReturnedAfterAction:latency:](BCCoreAnalytics, "logEventForView:bizItem:bizItemReturnedAfterAction:latency:", @"com.apple.BusinessChatViewService.MessageButtonTapped", a1[4], 0, [a1[5] _latencyFromViewDidLoad]);
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  id v3 = [a1[4] messagesOpenURL];
  v4 = objc_opt_new();
  id v15 = 0;
  [v2 openURL:v3 withOptions:v4 error:&v15];
  id v5 = v15;

  v6 = sub_100007F6C();
  os_signpost_id_t v7 = v6;
  if (v5)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    v8 = [a1[4] messagesOpenURL];
    *(_DWORD *)buf = 136315394;
    v17 = "-[BCChatSuggestRemoteViewController messageAlertActionForBizItem:dialRequestAction:]_block_invoke";
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Error opening Messages url: %@", buf, 0x16u);
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    v8 = [a1[4] messagesOpenURL];
    *(_DWORD *)buf = 136315394;
    v17 = "-[BCChatSuggestRemoteViewController messageAlertActionForBizItem:dialRequestAction:]_block_invoke";
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Success open Messages url: %@", buf, 0x16u);
  }

LABEL_7:
  if ([a1[6] isValid])
  {
    id v9 = objc_alloc_init((Class)BSMutableSettings);
    [v9 setObject:@"Message" forSetting:10];
    id v10 = a1[6];
    v11 = +[BSActionResponse responseWithInfo:v9];
    [v10 sendResponse:v11];

    v12 = sub_100007F6C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[BCChatSuggestRemoteViewController messageAlertActionForBizItem:dialRequestAction:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Sending message to InCallService via XPC Action to place a call", buf, 0xCu);
    }

    [a1[5] _dismiss];
  }
  else
  {
    v13 = sub_100007F6C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = a1[6];
      *(_DWORD *)buf = 136315394;
      v17 = "-[BCChatSuggestRemoteViewController messageAlertActionForBizItem:dialRequestAction:]_block_invoke";
      __int16 v18 = 2112;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s invalid dialrequest message action : %@", buf, 0x16u);
    }

    [a1[5] _dismiss];
  }
}

void sub_100006870(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _latencyFromViewDidLoad];
  id v3 = [*(id *)(a1 + 32) bizItem];
  +[BCCoreAnalytics logEventForView:bizItem:bizItemReturnedAfterAction:latency:](BCCoreAnalytics, "logEventForView:bizItem:bizItemReturnedAfterAction:latency:", @"com.apple.BusinessChatViewService.CallButtonTapped", v3, 0, [*(id *)(a1 + 32) _latencyFromViewDidLoad]);

  v4 = +[BCCoreAnalytics sharedInstance];
  [v4 setLastActionTaken:@"com.apple.BusinessChatViewService.CallButtonTapped" withLatency:v2];

  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    unsigned int v6 = [v5 isValid];
    os_signpost_id_t v7 = sub_100007F6C();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[BCChatSuggestRemoteViewController callAlertActionForBizItem:dialRequestAction:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Sending message to InCallService via XPC Action to place a call", buf, 0xCu);
      }

      os_signpost_id_t v7 = objc_alloc_init((Class)BSMutableSettings);
      [v7 setObject:@"Call" forSetting:10];
      id v9 = *(void **)(a1 + 40);
      id v10 = +[BSActionResponse responseWithInfo:v7];
      [v9 sendResponse:v10];
    }
    else if (v8)
    {
      __int16 v18 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v21 = "-[BCChatSuggestRemoteViewController callAlertActionForBizItem:dialRequestAction:]_block_invoke";
      __int16 v22 = 2112;
      v23 = v18;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s invalid dialrequest call action : %@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) _dismiss];
  }
  else
  {
    v11 = sub_100007F6C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[BCChatSuggestRemoteViewController callAlertActionForBizItem:dialRequestAction:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Sending message to InCallService via launch services to place a call", buf, 0xCu);
    }

    v12 = +[NSString stringWithFormat:@"tel://%@?handleType=phoneNumber", *(void *)(a1 + 48)];
    v13 = +[NSURL URLWithString:v12];
    id v14 = +[LSApplicationWorkspace defaultWorkspace];
    id v15 = objc_opt_new();
    id v19 = 0;
    [v14 openURL:v13 withOptions:v15 error:&v19];
    id v16 = v19;

    if (v16)
    {
      v17 = sub_100007F6C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[BCChatSuggestRemoteViewController callAlertActionForBizItem:dialRequestAction:]_block_invoke";
        __int16 v22 = 2112;
        v23 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Error opening Telephony url: %@", buf, 0x16u);
      }
    }
    [*(id *)(a1 + 32) _dismiss];
  }
}

id sub_100006CB4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isValid])
  {
    id v2 = objc_alloc_init((Class)BSMutableSettings);
    [v2 setObject:@"Cancel" forSetting:10];
    id v3 = *(void **)(a1 + 32);
    v4 = +[BSActionResponse responseWithInfo:v2];
    [v3 sendResponse:v4];

    id v5 = sub_100007F6C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = "-[BCChatSuggestRemoteViewController defaultAlertActionForDialRequestAction:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s sendResponse", (uint8_t *)&v10, 0xCu);
    }

    id v6 = [*(id *)(a1 + 40) _latencyFromViewDidLoad];
    os_signpost_id_t v7 = [*(id *)(a1 + 40) bizItem];
    +[BCCoreAnalytics logEventForView:bizItem:bizItemReturnedAfterAction:latency:](BCCoreAnalytics, "logEventForView:bizItem:bizItemReturnedAfterAction:latency:", @"com.apple.BusinessChatViewService.ChatSuggestDismissed", v7, 0, [*(id *)(a1 + 40) _latencyFromViewDidLoad]);

    BOOL v8 = +[BCCoreAnalytics sharedInstance];
    [v8 setLastActionTaken:@"com.apple.BusinessChatViewService.ChatSuggestDismissed" withLatency:v6];
  }
  return [*(id *)(a1 + 40) _dismiss];
}

void sub_100007348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000736C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v10 = sub_100007F6C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[BCChatSuggestRemoteViewController fetchBizInfoForDialRequestAction:]_block_invoke";
    __int16 v30 = 2112;
    id v31 = v7;
    __int16 v32 = 1024;
    int v33 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Fetch returned BizItem %@ Visible:%d", buf, 0x1Cu);
  }

  if (v8)
  {
    v11 = sub_100007F6C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[BCChatSuggestRemoteViewController fetchBizInfoForDialRequestAction:]_block_invoke";
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Error fetching biz item. Error %@", buf, 0x16u);
    }

    +[BCCoreAnalytics logEventForChatSuggestDidNotAppearForBizItem:error:isVisible:latency:](BCCoreAnalytics, "logEventForChatSuggestDidNotAppearForBizItem:error:isVisible:latency:", v7, v8, a3, [WeakRetained _latencyFromViewDidLoad]);
    v12 = sub_100007F6C();
    v13 = (char *)[WeakRetained tapId];
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = (os_signpost_id_t)v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, v14, "RenderBusinessChatUI", (const char *)&unk_10000FB72, buf, 2u);
      }
    }

    id v15 = sub_100007F6C();
    id v16 = (char *)[WeakRetained tapId];
    if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_22;
    }
    os_signpost_id_t v17 = (os_signpost_id_t)v16;
    if (!os_signpost_enabled(v15)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    goto LABEL_21;
  }
  if (v7 && a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000077AC;
    block[3] = &unk_100010500;
    block[4] = WeakRetained;
    id v26 = v7;
    id v27 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    goto LABEL_23;
  }
  +[BCCoreAnalytics logEventForChatSuggestDidNotAppearForBizItem:error:isVisible:latency:](BCCoreAnalytics, "logEventForChatSuggestDidNotAppearForBizItem:error:isVisible:latency:", v7, 0, a3, [WeakRetained _latencyFromViewDidLoad]);
  __int16 v18 = sub_100007F6C();
  id v19 = (char *)[WeakRetained tapId];
  if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v20 = (os_signpost_id_t)v19;
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v20, "RenderBusinessChatUI", (const char *)&unk_10000FB72, buf, 2u);
    }
  }

  id v15 = sub_100007F6C();
  v21 = (char *)[WeakRetained tapId];
  if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v17 = (os_signpost_id_t)v21;
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
LABEL_21:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, v17, "ChatSuggestEnd", (const char *)&unk_10000FB72, buf, 2u);
    }
  }
LABEL_22:

LABEL_23:
  if ([WeakRetained chatSuggestRemoteViewControllerDismissed])
  {
    __int16 v22 = +[BCCoreAnalytics sharedInstance];
    v23 = [v22 lastActionTaken];
    v24 = +[BCCoreAnalytics sharedInstance];
    +[BCCoreAnalytics logEventForView:bizItem:bizItemReturnedAfterAction:latency:](BCCoreAnalytics, "logEventForView:bizItem:bizItemReturnedAfterAction:latency:", v23, v7, 1, [v24 lastActionLatency]);

    [WeakRetained _logPhoneNumberDisplayedIfNecessary];
  }
}

id sub_1000077AC(uint64_t a1)
{
  [*(id *)(a1 + 32) setBizItem:*(void *)(a1 + 40)];
  id result = [*(id *)(a1 + 32) chatSuggestRemoteViewControllerDismissed];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    return [v3 configureAlertControllerForBusinessItem:v4 dialRequestAction:v5];
  }
  return result;
}

id sub_100007F6C()
{
  if (qword_100016890 != -1) {
    dispatch_once(&qword_100016890, &stru_100010548);
  }
  v0 = (void *)qword_100016888;

  return v0;
}

void sub_100007FC0(id a1)
{
  qword_100016888 = (uint64_t)os_log_create("com.apple.BusinessServices.businesschatviewservice", "Common");

  _objc_release_x1();
}

uint64_t sub_100008030()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (uint64_t (*)(void))off_100016878;
  id v7 = off_100016878;
  if (!off_100016878)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100008118;
    v3[3] = &unk_100010570;
    v3[4] = &v4;
    sub_100008118((uint64_t)v3);
    v0 = (uint64_t (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    id v2 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v2);
  }
  return v0(0);
}

void *sub_100008118(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100016880)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_100008258;
    v5[4] = &unk_1000105A8;
    v5[5] = v5;
    long long v6 = off_100010590;
    uint64_t v7 = 0;
    qword_100016880 = _sl_dlopen();
    id v3 = (void *)v5[0];
    id v2 = (void *)qword_100016880;
    if (qword_100016880)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)qword_100016880;
LABEL_5:
  id result = dlsym(v2, "MKBGetDeviceLockState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100016878 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100008258()
{
  uint64_t result = _sl_dlopen();
  qword_100016880 = result;
  return result;
}

uint64_t start(int a1, char **a2)
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  long long v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

id objc_msgSend__computeMaxHeights(void *a1, const char *a2, ...)
{
  return [a1 _computeMaxHeights];
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return [a1 _dismiss];
}

id objc_msgSend__handleSizeClassDidChange(void *a1, const char *a2, ...)
{
  return [a1 _handleSizeClassDidChange];
}

id objc_msgSend__latencyFromViewDidLoad(void *a1, const char *a2, ...)
{
  return [a1 _latencyFromViewDidLoad];
}

id objc_msgSend__logPhoneNumberDisplayedIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _logPhoneNumberDisplayedIfNecessary];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__sizeAndLoadTable(void *a1, const char *a2, ...)
{
  return [a1 _sizeAndLoadTable];
}

id objc_msgSend__systemBlueColor2(void *a1, const char *a2, ...)
{
  return [a1 _systemBlueColor2];
}

id objc_msgSend_actionItems(void *a1, const char *a2, ...)
{
  return [a1 actionItems];
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return [a1 actionType];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_actionsViewController(void *a1, const char *a2, ...)
{
  return [a1 actionsViewController];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeInterfaceOrientation];
}

id objc_msgSend_alertController(void *a1, const char *a2, ...)
{
  return [a1 alertController];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_bizID(void *a1, const char *a2, ...)
{
  return [a1 bizID];
}

id objc_msgSend_bizItem(void *a1, const char *a2, ...)
{
  return [a1 bizItem];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_brandedHeaderDelegate(void *a1, const char *a2, ...)
{
  return [a1 brandedHeaderDelegate];
}

id objc_msgSend_businessItem(void *a1, const char *a2, ...)
{
  return [a1 businessItem];
}

id objc_msgSend_callSubtitle(void *a1, const char *a2, ...)
{
  return [a1 callSubtitle];
}

id objc_msgSend_cellSeparatorHeight(void *a1, const char *a2, ...)
{
  return [a1 cellSeparatorHeight];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_chatSuggestRemoteViewControllerDismissed(void *a1, const char *a2, ...)
{
  return [a1 chatSuggestRemoteViewControllerDismissed];
}

id objc_msgSend_chatSuggestUIPresented(void *a1, const char *a2, ...)
{
  return [a1 chatSuggestUIPresented];
}

id objc_msgSend_classBundle(void *a1, const char *a2, ...)
{
  return [a1 classBundle];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
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

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_deviceState(void *a1, const char *a2, ...)
{
  return [a1 deviceState];
}

id objc_msgSend_dialRequestAction(void *a1, const char *a2, ...)
{
  return [a1 dialRequestAction];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hadBizItemWhenPhoneNumberUIPresented(void *a1, const char *a2, ...)
{
  return [a1 hadBizItemWhenPhoneNumberUIPresented];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_headerActionItem(void *a1, const char *a2, ...)
{
  return [a1 headerActionItem];
}

id objc_msgSend_headerImageView(void *a1, const char *a2, ...)
{
  return [a1 headerImageView];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_iconName(void *a1, const char *a2, ...)
{
  return [a1 iconName];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_initialTableLoadCompleted(void *a1, const char *a2, ...)
{
  return [a1 initialTableLoadCompleted];
}

id objc_msgSend_isAvailableForCalling(void *a1, const char *a2, ...)
{
  return [a1 isAvailableForCalling];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isVerified(void *a1, const char *a2, ...)
{
  return [a1 isVerified];
}

id objc_msgSend_itemsToAdd(void *a1, const char *a2, ...)
{
  return [a1 itemsToAdd];
}

id objc_msgSend_lastActionItemPendingUpdate(void *a1, const char *a2, ...)
{
  return [a1 lastActionItemPendingUpdate];
}

id objc_msgSend_lastActionLatency(void *a1, const char *a2, ...)
{
  return [a1 lastActionLatency];
}

id objc_msgSend_lastActionTaken(void *a1, const char *a2, ...)
{
  return [a1 lastActionTaken];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadContentView(void *a1, const char *a2, ...)
{
  return [a1 loadContentView];
}

id objc_msgSend_mainImageView(void *a1, const char *a2, ...)
{
  return [a1 mainImageView];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeBrandedHeaderViewController(void *a1, const char *a2, ...)
{
  return [a1 makeBrandedHeaderViewController];
}

id objc_msgSend_maxActionCellHeight(void *a1, const char *a2, ...)
{
  return [a1 maxActionCellHeight];
}

id objc_msgSend_maxHeaderCellHeight(void *a1, const char *a2, ...)
{
  return [a1 maxHeaderCellHeight];
}

id objc_msgSend_messageSubtitle(void *a1, const char *a2, ...)
{
  return [a1 messageSubtitle];
}

id objc_msgSend_messageTitle(void *a1, const char *a2, ...)
{
  return [a1 messageTitle];
}

id objc_msgSend_messagesOpenURL(void *a1, const char *a2, ...)
{
  return [a1 messagesOpenURL];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_pendingActionItems(void *a1, const char *a2, ...)
{
  return [a1 pendingActionItems];
}

id objc_msgSend_phoneNumberDisplayLogged(void *a1, const char *a2, ...)
{
  return [a1 phoneNumberDisplayLogged];
}

id objc_msgSend_phoneNumberUIPresented(void *a1, const char *a2, ...)
{
  return [a1 phoneNumberUIPresented];
}

id objc_msgSend_phoneNumberUIPresentedTime(void *a1, const char *a2, ...)
{
  return [a1 phoneNumberUIPresentedTime];
}

id objc_msgSend_presenter(void *a1, const char *a2, ...)
{
  return [a1 presenter];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reuseIdentifier];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_subTitle(void *a1, const char *a2, ...)
{
  return [a1 subTitle];
}

id objc_msgSend_subTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 subTitleLabel];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tapId(void *a1, const char *a2, ...)
{
  return [a1 tapId];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitChangeRegistration(void *a1, const char *a2, ...)
{
  return [a1 traitChangeRegistration];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_updateContentIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 updateContentIfNecessary];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllerDidLoadTime(void *a1, const char *a2, ...)
{
  return [a1 viewControllerDidLoadTime];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}