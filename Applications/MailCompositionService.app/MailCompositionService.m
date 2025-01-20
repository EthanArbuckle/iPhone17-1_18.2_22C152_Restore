void sub_100003C68(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;
  uint64_t vars8;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)qword_10001F920;
  qword_10001F920 = (uint64_t)v1;
}

void sub_100003CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100003E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100003EE0(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  self;
  v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:MSMailActivityHandoffComposeKeyAutosaveID];
  v8 = [v6 objectForKeyedSubscript:MSMailActivityHandoffComposeKeyPreferredSendingEmailAddress];
  if (!v7
    || (+[MSAutosave autosave],
        v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 hasAutosavedMessageWithIdentifier:v7],
        v9,
        !v10))
  {
    id v17 = [objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:0];
    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v21 = v5;
  v11 = [v6 objectForKeyedSubscript:MSMailActivityHandoffComposeKeySubject];
  v12 = [v6 objectForKeyedSubscript:MSMailActivityHandoffComposeKeyOriginalMessageObjectID];
  v13 = +[EMObjectID objectIDFromSerializedRepresentation:v12];
  id v14 = objc_alloc((Class)_MFMailCompositionContext);
  v15 = [v5 daemonInterface];
  v16 = [v15 messageRepository];
  id v17 = [v14 initRecoveredAutosavedMessageWithIdentifier:v7 draftSubject:v11 messageRepository:v16 originalMessageObjectID:v13];

  id v5 = v21;
  if (v8) {
LABEL_6:
  }
    [v17 setPreferredSendingEmailAddress:v8];
LABEL_7:
  v18 = [v6 objectForKeyedSubscript:MSMailActivityHandoffComposeKeyDeferredAction];
  [v17 setDeferredAction:[v18 integerValue]];

  v19 = [v6 objectForKeyedSubscript:MSMailActivityHandoffComposeKeyDeferredActionUserInfo];
  [v17 setDeferredActionUserInfo:v19];

  return v17;
}

void sub_100004128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000042D0(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000043B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000444C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000045AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004884(_Unwind_Exception *a1)
{
  v9 = v6;

  _Unwind_Resume(a1);
}

BOOL sub_100004930(void *a1)
{
  if (!a1) {
    return 0;
  }
  v1 = [a1 _mailComposeController];
  v2 = [v1 subject];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

void sub_100004990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004B08(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_100004B44(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (!v1 || (BOOL v3 = v1, [v1 isEqualToString:&stru_100018898]))
  {
    if (+[UIDevice mf_isPad]) {
      sub_1000055E4(@"NEW_MESSAGE_LONG");
    }
    else {
    BOOL v3 = sub_1000055E4(@"NEW_MESSAGE");
    }
  }

  return v3;
}

void sub_100004BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004CBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100004E9C(_Unwind_Exception *exception_object)
{
}

void sub_100004EB4(uint64_t a1, int a2)
{
  if (a2)
  {
    id v7 = +[UIApplication sharedApplication];
    BOOL v3 = [*(id *)(a1 + 32) view];
    id v4 = [v3 window];
    id v5 = [v4 windowScene];
    v6 = [v5 session];
    [v7 requestSceneSessionRefresh:v6];
  }
}

void sub_100004F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v14 = v12;

  _Unwind_Resume(a1);
}

void sub_100004FBC(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100005190;
      v6[3] = &unk_100018538;
      id v7 = v3;
      [a1 dismissViewControllerAnimated:1 completion:v6];
    }
    else
    {
      (*((void (**)(id, void))v3 + 2))(v3, 0);
    }
  }
}

void sub_1000050AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100005124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100005190(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000529C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000053B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000053E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000054C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000054E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000055A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000055E4(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:v1 value:&stru_100018898 table:@"Main"];

  return v3;
}

void sub_100005674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000056F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000058C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000060CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000064DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(v25);
  objc_destroyWeak((id *)(v30 - 88));

  _Unwind_Resume(a1);
}

id sub_100006EA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateHeadersWithModel:v3];
  [*(id *)(a1 + 32) setNavigationDelegate:WeakRetained];
  id v5 = [WeakRetained snapshotImageView];
  [v5 frame];
  [*(id *)(a1 + 32) setFrame:];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [WeakRetained snapshotImageView];
  [WeakRetained insertSubview:v6 below:v7];

  v8 = +[EFPromise promise];
  [WeakRetained setContentLoadingPromise:v8];

  v9 = *(void **)(a1 + 32);
  unsigned int v10 = [v3 htmlContent];
  v11 = [v9 loadHTMLString:v10 baseURL:0];
  [WeakRetained setExpectedContentNavigation:v11];

  v12 = [WeakRetained contentLoadingPromise];
  v13 = [v12 future];

  return v13;
}

void sub_100006FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100007024(uint64_t a1)
{
  v2 = +[EFPromise promise];
  id v3 = *(void **)(a1 + 32);
  id v4 = [v2 completionHandlerAdapter];
  [v3 takeSnapshotWithConfiguration:0 completionHandler:v4];

  id v5 = [v2 future];

  return v5;
}

void sub_1000070AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000070C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) setNavigationDelegate:0];
  [*(id *)(a1 + 32) removeFromSuperview];
  id v5 = [WeakRetained snapshotImageView];
  unsigned int v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_100007250;
  v13 = &unk_1000185D8;
  id v14 = WeakRetained;
  id v6 = v3;
  id v15 = v6;
  +[UIView transitionWithView:v5 duration:5242880 options:&v10 animations:0 completion:0.25];

  id v7 = +[NSNull null];
  v8 = +[EFFuture futureWithResult:v7];

  return v8;
}

void sub_10000720C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100007250(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) snapshotImageView];
  [v2 setImage:v1];
}

void sub_1000072A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000731C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000739C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000077C0(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100007990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1000079E4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) webview];
  id v4 = [v1 snapshotContentUsingWebView:v2];

  id v3 = [v4 result];
}

void sub_100007A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100007C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  v20 = v18;

  _Unwind_Resume(a1);
}

void sub_100007C64()
{
  JUMPOUT(0x100007C58);
}

void sub_100007C70()
{
}

void sub_100007C78(uint64_t a1)
{
  id v2 = +[MSAutosave autosave];
  id v3 = [v2 autosavedMessageDataWithIdentifier:*(void *)(a1 + 32)];

  id v8 = 0;
  id v4 = [v3 result:&v8];
  id v5 = v8;
  if (v5)
  {
    [*(id *)(a1 + 40) finishWithError:v5];
  }
  else
  {
    id v6 = +[MFMailMessage messageWithRFC822Data:v4];
    id v7 = [*(id *)(a1 + 48) _placeholderContentWithMessage:v6];
    [*(id *)(a1 + 40) finishWithResult:v7];
  }
}

void sub_100007D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100007FAC(void *a1)
{
  id v1 = a1;
  if ([v1 count])
  {
    id v2 = [v1 ef_map:&stru_100018668];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_100008010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000080DC(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = [objc_alloc((Class)CNComposeRecipient) initWithContact:0 address:v2 kind:0];

  return v3;
}

void sub_100008138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008398(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1000084E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)ComposeServiceRemoteViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000085E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000086B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000087E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000088CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000089A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008CB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100008F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100009214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000095F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100009718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100009B40(_Unwind_Exception *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009BD8(uint64_t a1)
{
  id v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "#CompositionServices Background task expired (framesForAttachmentsWithIdentifiers)", v4, 2u);
  }

  id v3 = +[UIApplication sharedApplication];
  [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

void sub_100009C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100009E04(uint64_t a1)
{
  id v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "#CompositionServices Background task expired (autosaveWithReply)", v4, 2u);
  }

  id v3 = +[UIApplication sharedApplication];
  [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

void sub_100009E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009EA8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#CompositionServices %p: Identifier for autosaved composition: %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(a1[5] + 16))();
  id v6 = +[UIApplication sharedApplication];
  [v6 endBackgroundTask:*(void *)(*(void *)(a1[6] + 8) + 24)];
}

void sub_100009FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000A0BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000A17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000A194(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000A58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

_CDContact *__cdecl sub_10000A70C(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = [(NSString *)v2 emailAddressValue];
  id v4 = [v3 simpleAddress];

  if (v4)
  {
    id v5 = objc_alloc((Class)_CDContact);
    id v6 = [(NSString *)v2 emailAddressValue];
    int v7 = [v6 simpleAddress];
    id v4 = [v5 initWithIdentifier:v7 type:2 displayName:0 personId:0 personIdType:0];
  }

  return (_CDContact *)v4;
}

void sub_10000A7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_CDAttachment *__cdecl sub_10000A7F4(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init((Class)_CDAttachment);
  [v3 setUti:v2];

  return (_CDAttachment *)v3;
}

void sub_10000A850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000A86C(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init((Class)_CDAttachment);
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v2];
  [v3 setIdentifier:v4];

  return v3;
}

void sub_10000A8E8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

id sub_10000A914(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init((Class)_CDAttachment);
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v2];
  [v3 setIdentifier:v4];

  return v3;
}

void sub_10000A990(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

_CDAttachment *__cdecl sub_10000A9BC(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init((Class)_CDAttachment);
  id v4 = +[NSURL URLWithString:v2];
  [v3 setContentURL:v4];

  [v3 setUti:@"public.url"];

  return (_CDAttachment *)v3;
}

void sub_10000AA48(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

_CDAttachment *__cdecl sub_10000AA74(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init((Class)_CDAttachment);
  [v3 setContentText:v2];
  [v3 setUti:@"public.plain-text"];

  return (_CDAttachment *)v3;
}

void sub_10000AAE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AAFC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [*(id *)(a1 + 32) _hostApplicationBundleIdentifier];
    uint64_t v8 = [v5 description];
    __int16 v9 = (void *)v8;
    CFStringRef v10 = @"No";
    int v11 = 138412802;
    v12 = v7;
    __int16 v13 = 2112;
    if (a2) {
      CFStringRef v10 = @"Yes";
    }
    CFStringRef v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#CompositionServices Recorded interaction from %@ with success %@, error %@.", (uint8_t *)&v11, 0x20u);
  }
}

void sub_10000AC14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AD10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10000AD80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10000AE60(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentSaveDeleteDialogOrClose];
}

void sub_10000AFB8(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10000B2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B3E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B4B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B5C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000BB08(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10000BE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BEB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BF40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000C020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v10;

  _Unwind_Resume(a1);
}

void sub_10000C0AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000C128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

void sub_10000C9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000CA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t start(int a1, char **a2)
{
  uint64_t v5 = UIApplicationMain(a1, a2, 0, 0);
  id v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#CompositionServices MailCompositionService exiting...", v8, 2u);
  }

  return v5;
}

void sub_10000CDB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000CE98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000CEA8(uint64_t a1)
{
  [*(id *)(a1 + 32) setDocked:*(unsigned __int8 *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 setNeedsLayout];
}

void sub_10000CF54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D1FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D3F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int16 v13 = v12;

  _Unwind_Resume(a1);
}

void sub_10000D5AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D63C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t MFIsMobileMail()
{
  return _MFIsMobileMail();
}

uint64_t MFLogGeneral()
{
  return _MFLogGeneral();
}

uint64_t MSMailComposeWindowTargetContentIdentifierWithIdentifier()
{
  return _MSMailComposeWindowTargetContentIdentifierWithIdentifier();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UIAuditTokenTaskHasEntitlement()
{
  return _UIAuditTokenTaskHasEntitlement();
}

uint64_t _ArrayContainsKindOfObjects()
{
  return __ArrayContainsKindOfObjects();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UISheetPageSize()
{
  return __UISheetPageSize();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void objc_terminate(void)
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UTITypes(void *a1, const char *a2, ...)
{
  return [a1 UTITypes];
}

id objc_msgSend__createPrimaryViews(void *a1, const char *a2, ...)
{
  return [a1 _createPrimaryViews];
}

id objc_msgSend__createSubviews(void *a1, const char *a2, ...)
{
  return [a1 _createSubviews];
}

id objc_msgSend__dimmingViewColor(void *a1, const char *a2, ...)
{
  return [a1 _dimmingViewColor];
}

id objc_msgSend__hostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _hostApplicationBundleIdentifier];
}

id objc_msgSend__hostAuditToken(void *a1, const char *a2, ...)
{
  return [a1 _hostAuditToken];
}

id objc_msgSend__mailComposeController(void *a1, const char *a2, ...)
{
  return [a1 _mailComposeController];
}

id objc_msgSend__mailComposeView(void *a1, const char *a2, ...)
{
  return [a1 _mailComposeView];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 _rootSheetPresentationController];
}

id objc_msgSend__updateShadow(void *a1, const char *a2, ...)
{
  return [a1 _updateShadow];
}

id objc_msgSend_accountRepository(void *a1, const char *a2, ...)
{
  return [a1 accountRepository];
}

id objc_msgSend_attachmentContext(void *a1, const char *a2, ...)
{
  return [a1 attachmentContext];
}

id objc_msgSend_autosave(void *a1, const char *a2, ...)
{
  return [a1 autosave];
}

id objc_msgSend_autosaveIdentifier(void *a1, const char *a2, ...)
{
  return [a1 autosaveIdentifier];
}

id objc_msgSend_backUpDraft(void *a1, const char *a2, ...)
{
  return [a1 backUpDraft];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return [a1 backgroundView];
}

id objc_msgSend_bcc(void *a1, const char *a2, ...)
{
  return [a1 bcc];
}

id objc_msgSend_bccField(void *a1, const char *a2, ...)
{
  return [a1 bccField];
}

id objc_msgSend_bccRecipients(void *a1, const char *a2, ...)
{
  return [a1 bccRecipients];
}

id objc_msgSend_bestAlternativePart(void *a1, const char *a2, ...)
{
  return [a1 bestAlternativePart];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blinkAnimation(void *a1, const char *a2, ...)
{
  return [a1 blinkAnimation];
}

id objc_msgSend_blinkLayer(void *a1, const char *a2, ...)
{
  return [a1 blinkLayer];
}

id objc_msgSend_bodyFinishedDrawing(void *a1, const char *a2, ...)
{
  return [a1 bodyFinishedDrawing];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cc(void *a1, const char *a2, ...)
{
  return [a1 cc];
}

id objc_msgSend_ccField(void *a1, const char *a2, ...)
{
  return [a1 ccField];
}

id objc_msgSend_ccRecipients(void *a1, const char *a2, ...)
{
  return [a1 ccRecipients];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_cloudPhotoIDs(void *a1, const char *a2, ...)
{
  return [a1 cloudPhotoIDs];
}

id objc_msgSend_completionHandlerAdapter(void *a1, const char *a2, ...)
{
  return [a1 completionHandlerAdapter];
}

id objc_msgSend_composeTitle(void *a1, const char *a2, ...)
{
  return [a1 composeTitle];
}

id objc_msgSend_compositionContext(void *a1, const char *a2, ...)
{
  return [a1 compositionContext];
}

id objc_msgSend_contentFuturesByID(void *a1, const char *a2, ...)
{
  return [a1 contentFuturesByID];
}

id objc_msgSend_contentID(void *a1, const char *a2, ...)
{
  return [a1 contentID];
}

id objc_msgSend_contentLoadingPromise(void *a1, const char *a2, ...)
{
  return [a1 contentLoadingPromise];
}

id objc_msgSend_contentText(void *a1, const char *a2, ...)
{
  return [a1 contentText];
}

id objc_msgSend_contentURLs(void *a1, const char *a2, ...)
{
  return [a1 contentURLs];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_cornerCurve(void *a1, const char *a2, ...)
{
  return [a1 cornerCurve];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return [a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_daemonInterface(void *a1, const char *a2, ...)
{
  return [a1 daemonInterface];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 defaultCornerRadius];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deliveryAccounts(void *a1, const char *a2, ...)
{
  return [a1 deliveryAccounts];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_didAppear(void *a1, const char *a2, ...)
{
  return [a1 didAppear];
}

id objc_msgSend_dimmingLayer(void *a1, const char *a2, ...)
{
  return [a1 dimmingLayer];
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return [a1 directionalLayoutMargins];
}

id objc_msgSend_docked(void *a1, const char *a2, ...)
{
  return [a1 docked];
}

id objc_msgSend_documentID(void *a1, const char *a2, ...)
{
  return [a1 documentID];
}

id objc_msgSend_donateShareInteractionToDuet(void *a1, const char *a2, ...)
{
  return [a1 donateShareInteractionToDuet];
}

id objc_msgSend_emailAddressValue(void *a1, const char *a2, ...)
{
  return [a1 emailAddressValue];
}

id objc_msgSend_falseEdgeShadowView(void *a1, const char *a2, ...)
{
  return [a1 falseEdgeShadowView];
}

id objc_msgSend_falseShadowEdge(void *a1, const char *a2, ...)
{
  return [a1 falseShadowEdge];
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return [a1 fileName];
}

id objc_msgSend_firstSender(void *a1, const char *a2, ...)
{
  return [a1 firstSender];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromField(void *a1, const char *a2, ...)
{
  return [a1 fromField];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_globalAsyncScheduler(void *a1, const char *a2, ...)
{
  return [a1 globalAsyncScheduler];
}

id objc_msgSend_hasDuetDonationContext(void *a1, const char *a2, ...)
{
  return [a1 hasDuetDonationContext];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return [a1 headerView];
}

id objc_msgSend_hostApplicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return [a1 hostApplicationDidEnterBackground];
}

id objc_msgSend_hostApplicationWillEnterForeground(void *a1, const char *a2, ...)
{
  return [a1 hostApplicationWillEnterForeground];
}

id objc_msgSend_htmlContent(void *a1, const char *a2, ...)
{
  return [a1 htmlContent];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interactionRecorder(void *a1, const char *a2, ...)
{
  return [a1 interactionRecorder];
}

id objc_msgSend_isDirty(void *a1, const char *a2, ...)
{
  return [a1 isDirty];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isQuickReply(void *a1, const char *a2, ...)
{
  return [a1 isQuickReply];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 leftBarButtonItem];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mailComposeView(void *a1, const char *a2, ...)
{
  return [a1 mailComposeView];
}

id objc_msgSend_mailDockedPlaceholderViewBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 mailDockedPlaceholderViewBackgroundColor];
}

id objc_msgSend_mailHeaderSeparatorLayerColor(void *a1, const char *a2, ...)
{
  return [a1 mailHeaderSeparatorLayerColor];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return [a1 mainThreadScheduler];
}

id objc_msgSend_messageRepository(void *a1, const char *a2, ...)
{
  return [a1 messageRepository];
}

id objc_msgSend_modelFuture(void *a1, const char *a2, ...)
{
  return [a1 modelFuture];
}

id objc_msgSend_multiField(void *a1, const char *a2, ...)
{
  return [a1 multiField];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationBarTitle(void *a1, const char *a2, ...)
{
  return [a1 navigationBarTitle];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_originalMessage(void *a1, const char *a2, ...)
{
  return [a1 originalMessage];
}

id objc_msgSend_originalMessageObjectID(void *a1, const char *a2, ...)
{
  return [a1 originalMessageObjectID];
}

id objc_msgSend_originatingBundleID(void *a1, const char *a2, ...)
{
  return [a1 originatingBundleID];
}

id objc_msgSend_overlayView(void *a1, const char *a2, ...)
{
  return [a1 overlayView];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_photoIDs(void *a1, const char *a2, ...)
{
  return [a1 photoIDs];
}

id objc_msgSend_preferredHeaderHeight(void *a1, const char *a2, ...)
{
  return [a1 preferredHeaderHeight];
}

id objc_msgSend_preferredSendingEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 preferredSendingEmailAddress];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_promise(void *a1, const char *a2, ...)
{
  return [a1 promise];
}

id objc_msgSend_reloadAccounts(void *a1, const char *a2, ...)
{
  return [a1 reloadAccounts];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_roundedBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 roundedBackgroundView];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_saveFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 saveFirstResponder];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_senderAddress(void *a1, const char *a2, ...)
{
  return [a1 senderAddress];
}

id objc_msgSend_separatorHeight(void *a1, const char *a2, ...)
{
  return [a1 separatorHeight];
}

id objc_msgSend_serializedRepresentation(void *a1, const char *a2, ...)
{
  return [a1 serializedRepresentation];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_shadowOpacity(void *a1, const char *a2, ...)
{
  return [a1 shadowOpacity];
}

id objc_msgSend_shadowRadius(void *a1, const char *a2, ...)
{
  return [a1 shadowRadius];
}

id objc_msgSend_shadowVisible(void *a1, const char *a2, ...)
{
  return [a1 shadowVisible];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_shouldAutorotate(void *a1, const char *a2, ...)
{
  return [a1 shouldAutorotate];
}

id objc_msgSend_shouldUseMultiField(void *a1, const char *a2, ...)
{
  return [a1 shouldUseMultiField];
}

id objc_msgSend_showSenderAddress(void *a1, const char *a2, ...)
{
  return [a1 showSenderAddress];
}

id objc_msgSend_showSenderField(void *a1, const char *a2, ...)
{
  return [a1 showSenderField];
}

id objc_msgSend_simpleAddress(void *a1, const char *a2, ...)
{
  return [a1 simpleAddress];
}

id objc_msgSend_snapshotImageView(void *a1, const char *a2, ...)
{
  return [a1 snapshotImageView];
}

id objc_msgSend_snapshotQueue(void *a1, const char *a2, ...)
{
  return [a1 snapshotQueue];
}

id objc_msgSend_sourceAccountManagement(void *a1, const char *a2, ...)
{
  return [a1 sourceAccountManagement];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return [a1 subject];
}

id objc_msgSend_subjectField(void *a1, const char *a2, ...)
{
  return [a1 subjectField];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return [a1 superlayer];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemMinimumLayoutMargins(void *a1, const char *a2, ...)
{
  return [a1 systemMinimumLayoutMargins];
}

id objc_msgSend_targetView(void *a1, const char *a2, ...)
{
  return [a1 targetView];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_to(void *a1, const char *a2, ...)
{
  return [a1 to];
}

id objc_msgSend_toField(void *a1, const char *a2, ...)
{
  return [a1 toField];
}

id objc_msgSend_toRecipients(void *a1, const char *a2, ...)
{
  return [a1 toRecipients];
}

id objc_msgSend_topItem(void *a1, const char *a2, ...)
{
  return [a1 topItem];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userActivityForRestoration(void *a1, const char *a2, ...)
{
  return [a1 userActivityForRestoration];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_webview(void *a1, const char *a2, ...)
{
  return [a1 webview];
}

id objc_msgSend_willDisappear(void *a1, const char *a2, ...)
{
  return [a1 willDisappear];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}