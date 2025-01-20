id sub_1000029D8()
{
  void *v0;
  uint64_t vars8;

  if (qword_100029388 != -1) {
    dispatch_once(&qword_100029388, &stru_10001C480);
  }
  v0 = (void *)qword_100029380;

  return v0;
}

void sub_10000324C(id a1)
{
  qword_100029380 = (uint64_t)os_log_create("com.apple.InputUI", "General");

  _objc_release_x1();
}

id sub_100003290()
{
  if (qword_100029398 != -1) {
    dispatch_once(&qword_100029398, &stru_10001C4A0);
  }
  v0 = (void *)qword_100029390;

  return v0;
}

void sub_1000032E4(id a1)
{
  qword_100029390 = (uint64_t)os_log_create("com.apple.InputUI", "InputSessionChange");

  _objc_release_x1();
}

void sub_10000346C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"com.apple.inputservice.teletype"];
  [v3 setService:@"com.apple.inputservice.teletype"];
  [v3 setDelegate:*(void *)(a1 + 32)];
}

void sub_100003EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000408C(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitForSpringBoardToForegroundInputUIScene];
}

Class sub_100004460(uint64_t a1)
{
  sub_1000044B0();
  Class result = objc_getClass("AFUIServiceDelegate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000293A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000044B0()
{
  if (!qword_1000293A8) {
    qword_1000293A8 = _sl_dlopen();
  }
}

uint64_t sub_100004580()
{
  uint64_t result = _sl_dlopen();
  qword_1000293A8 = result;
  return result;
}

Class sub_1000045F4(uint64_t a1)
{
  sub_1000044B0();
  Class result = objc_getClass("AFUIServiceListener");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000293B0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *sub_100004BA0(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    v2 = +[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), v1];
  }
  else
  {
    v2 = @"(nil)";
  }

  return v2;
}

void sub_1000052E0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t sub_10000530C()
{
  return v0;
}

void sub_100005318(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void sub_10000559C(id a1)
{
  byte_1000293B8 = _os_feature_enabled_impl();
}

void sub_100005C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005CE8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [*(id *)(a1 + 32) handleTeardownExistingDelegate:v6];

  [v7 returnExecutionToParent];
}

void sub_100005E00(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v6 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [*(id *)(a1 + 32) handleSetupNewDelegate:v6];

  [v7 returnExecutionToParent];
}

id sub_100006074(uint64_t a1)
{
  return [*(id *)(a1 + 32) _main_handleSessionChange:*(void *)(a1 + 40)];
}

void sub_100006C90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006D00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006D10(uint64_t a1)
{
}

void sub_100006D18(id a1, IUISessionChangeResponse *a2)
{
  v2 = sub_100003290();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[IUISessionCoordinator _main_handleSessionChange:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s  Placeholder service session and input source are (or were) removed.", (uint8_t *)&v3, 0xCu);
  }
}

void sub_100006DC0(uint64_t a1)
{
  v2 = sub_100003290();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) sessionChange];
    *(_DWORD *)buf = 136315394;
    id v6 = "-[IUISessionCoordinator _main_handleSessionChange:]_block_invoke";
    __int16 v7 = 2112;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s  Will remove placeholder input source, if not already removed: %@", buf, 0x16u);
  }
  [*(id *)(a1 + 40) _queue_queueSessionChange:*(void *)(a1 + 32)];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006EF8;
  block[3] = &unk_10001C518;
  block[4] = *(void *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100006EF8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_10000706C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007114;
  block[3] = &unk_10001C650;
  v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100007114(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
    [v4 inputSystemService:*(void *)(a1 + 40) didCreateInputSession:*(void *)(a1 + 48)];
  }
}

void sub_100007584(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007640;
  v3[3] = &unk_10001C678;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_100007640(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
    [v4 inputSystemService:*(void *)(a1 + 40) inputSessionDidBegin:*(void *)(a1 + 48) options:*(void *)(a1 + 56)];
  }
}

id sub_1000076E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_queueSessionChange:*(void *)(a1 + 40)];
}

void sub_1000076EC(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007794;
  block[3] = &unk_10001C650;
  v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100007794(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) textInputSource];
  if ([*(id *)(a1 + 32) needsToReloadInputSource])
  {
    [*(id *)(a1 + 32) setNeedsToReloadInputSource:0];
    [*(id *)(a1 + 32) reloadInputSource];
  }
  [*(id *)(a1 + 32) setCurrentSession:*(void *)(a1 + 40)];
  v2 = +[RTIInputSystemDataPayload payloadWithData:0];
  char v3 = [*(id *)(a1 + 40) documentTraits];
  id v4 = [v3 copy];
  [v2 setDocumentTraits:v4];

  id v5 = [*(id *)(a1 + 40) documentState];
  id v6 = [v5 copy];
  [v2 setDocumentState:v6];

  __int16 v7 = [*(id *)(a1 + 40) uuid];
  id v8 = [v7 copy];
  [v2 setSessionUUID:v8];

  [v2 updateData];
  v9 = [*(id *)(a1 + 32) textInputSource];
  [v9 ingestDataPayload:v2];

  uint64_t v10 = [*(id *)(a1 + 32) textInputSource];
  [v10 setCanBecomeFirstResponder:1];

  v11 = [*(id *)(a1 + 32) assertionForOptions:*(void *)(a1 + 48)];
  v12 = [*(id *)(a1 + 32) textInputSource];
  [v12 becomeFirstResponder];

  [*(id *)(a1 + 32) invalidateAssertionIfNeeded:v11 resetKeyboardAlpha:1];
  [*(id *)(a1 + 32) handlePendingSuggestionsDataIfNecessary];
  id v13 = [*(id *)(a1 + 32) textInputSource];

  if (v14 != v13) {
    [v14 removeFromSuperview];
  }
}

uint64_t sub_100007C38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007C48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008178(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008234;
  v3[3] = &unk_10001C678;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_100008234(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
    [v4 inputSystemService:*(void *)(a1 + 40) inputSessionDidEnd:*(void *)(a1 + 48) options:*(void *)(a1 + 56)];
  }
}

uint64_t sub_1000082D0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_1000082E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_queueSessionChange:*(void *)(a1 + 40)];
}

void sub_1000082F4(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000083C0;
  block[3] = &unk_10001C710;
  id v6 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = v4;
  id v10 = *(id *)(a1 + 64);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1000083C0(uint64_t a1)
{
  id v2 = sub_1000029D8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000E018();
  }

  return [*(id *)(a1 + 48) _endSession:*(void *)(a1 + 32) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

void sub_10000857C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008624;
  block[3] = &unk_10001C650;
  id v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100008624(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
    [v4 inputSystemService:*(void *)(a1 + 40) inputSessionDidDie:*(void *)(a1 + 48)];
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 _endSession:v6 options:0 completion:0];
}

void sub_100008810(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000088B8;
  block[3] = &unk_10001C650;
  id v5 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1000088B8(uint64_t a1)
{
  id v2 = sub_1000029D8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000E12C();
  }

  uint64_t v3 = (id *)(a1 + 48);
  id v4 = [*(id *)(a1 + 48) autofillUIServiceDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [*(id *)(a1 + 48) autofillUIServiceDelegate];
    [v6 inputSystemService:*(void *)(a1 + 40) inputSessionDocumentDidChange:*(void *)(a1 + 32)];
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v7 = (id *)(a1 + 32);
  id v9 = [v8 uuid];
  id v10 = [v7[2] currentSession];
  v11 = [v10 uuid];
  unsigned __int8 v12 = [v9 isEqual:v11];

  if (v12)
  {
    id v13 = [*v3 textInputSource];
    id v14 = [*v7 currentDataPayload];
    [v13 ingestDataPayload:v14];
  }
  else
  {
    id v13 = sub_1000029D8();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000E080();
    }
  }
}

void sub_100008B94(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008C4C;
  v5[3] = &unk_10001C678;
  id v6 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_100008C4C(uint64_t a1)
{
  id v2 = sub_1000029D8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000E240();
  }

  uint64_t v3 = [*(id *)(a1 + 48) autofillUIServiceDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [*(id *)(a1 + 48) autofillUIServiceDelegate];
    [v5 inputSystemService:*(void *)(a1 + 40) inputSession:*(void *)(a1 + 32) documentTraitsDidChange:*(void *)(a1 + 56)];
  }
  id v6 = [*(id *)(a1 + 32) uuid];
  id v7 = [*(id *)(a1 + 48) currentSession];
  uint64_t v8 = [v7 uuid];
  unsigned __int8 v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 48) textInputSource];
    [v10 ingestDocumentTraits:*(void *)(a1 + 56)];
  }
  else
  {
    id v10 = sub_1000029D8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000E194();
    }
  }
}

void sub_100008F20(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008FD8;
  v5[3] = &unk_10001C678;
  id v6 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  char v4 = *(void **)(a1 + 56);
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_100008FD8(uint64_t a1)
{
  id v2 = sub_1000029D8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000E354();
  }

  uint64_t v3 = [*(id *)(a1 + 48) autofillUIServiceDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [*(id *)(a1 + 48) autofillUIServiceDelegate];
    [v5 inputSystemService:*(void *)(a1 + 40) inputSession:*(void *)(a1 + 32) documentStateDidChange:*(void *)(a1 + 56)];
  }
  id v6 = [*(id *)(a1 + 32) uuid];
  id v7 = [*(id *)(a1 + 48) currentSession];
  uint64_t v8 = [v7 uuid];
  unsigned __int8 v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 48) textInputSource];
    [v10 ingestDocumentState:*(void *)(a1 + 56)];
  }
  else
  {
    id v10 = sub_1000029D8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000E2A8();
    }
  }
}

void sub_1000092AC(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100009368;
  v3[3] = &unk_10001C678;
  id v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_100009368(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
    [v5 inputSystemService:*(void *)(a1 + 40) inputSession:*(void *)(a1 + 48) textSuggestionsChanged:*(void *)(a1 + 56)];
  }
  id v6 = [*(id *)(a1 + 48) uuid];
  id v7 = [*(id *)(a1 + 32) currentSession];
  uint64_t v8 = [v7 uuid];
  unsigned __int8 v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = [*v2 textInputSource];
    v11 = [v10 inputDelegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v19 = +[UITextSuggestion decodeTextSuggestions:*(void *)(a1 + 56)];
      id v13 = [*(id *)(a1 + 32) textInputSource];
      id v14 = [v13 inputDelegate];
      [v14 setSuggestions:v19];
    }
    else
    {
      if (!*(void *)(a1 + 56)) {
        return;
      }
      v16 = [*v2 pendingSuggestions];

      if (!v16)
      {
        v17 = +[NSMutableDictionary dictionary];
        [*v2 setPendingSuggestions:v17];
      }
      id v19 = [*(id *)(a1 + 32) pendingSuggestions];
      uint64_t v18 = *(void *)(a1 + 56);
      id v13 = [*(id *)(a1 + 48) uuid];
      [v19 setObject:v18 forKey:v13];
    }
  }
  else
  {
    v15 = sub_1000029D8();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000E3BC();
    }
  }
}

void sub_100009720(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000097D8;
  v5[3] = &unk_10001C678;
  id v6 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  char v4 = *(void **)(a1 + 56);
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_1000097D8(uint64_t a1)
{
  id v2 = sub_1000029D8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000E514();
  }

  uint64_t v3 = (id *)(a1 + 48);
  char v4 = [*(id *)(a1 + 48) autofillUIServiceDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [*(id *)(a1 + 48) autofillUIServiceDelegate];
    [v6 inputSystemService:*(void *)(a1 + 40) inputSession:*(void *)(a1 + 32) performInputOperation:*(void *)(a1 + 56)];
  }
  id v7 = [*(id *)(a1 + 32) uuid];
  uint64_t v8 = [*(id *)(a1 + 48) currentSession];
  id v9 = [v8 uuid];
  unsigned __int8 v10 = [v7 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    v11 = [*(id *)(a1 + 56) keyboardInput];

    char v12 = sub_1000029D8();
    id v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10000E468();
      }
      goto LABEL_14;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [*(id *)(a1 + 32) uuid];
      v15 = [*v3 currentSession];
      v16 = [v15 uuid];
      int v21 = 138412546;
      v22 = v14;
      __int16 v23 = 2112;
      v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Warning: allowing performInputOperation received for sessionID=%@ while current sessionID=%@", (uint8_t *)&v21, 0x16u);
    }
  }
  v17 = [*v3 textInputSource];
  uint64_t v18 = [v17 sourceSessionDelegate];
  char v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0) {
    return;
  }
  id v13 = [*(id *)(a1 + 48) textInputSource];
  v20 = [v13 sourceSessionDelegate];
  [v20 inputSession:*(void *)(a1 + 32) performInputOperation:*(void *)(a1 + 56)];

LABEL_14:
}

void sub_100009BEC(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009CBC;
  block[3] = &unk_10001C710;
  id v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100009CBC(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
    [v5 inputSystemService:*(void *)(a1 + 40) inputSession:*(void *)(a1 + 48) performInputOperation:*(void *)(a1 + 56) withResponse:*(void *)(a1 + 64)];
  }
  id v6 = [*(id *)(a1 + 48) uuid];
  id v7 = [*(id *)(a1 + 32) currentSession];
  uint64_t v8 = [v7 uuid];
  unsigned __int8 v9 = [v6 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    unsigned __int8 v10 = [*(id *)(a1 + 56) keyboardInput];

    v11 = sub_1000029D8();
    char v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10000E57C();
      }

      uint64_t v13 = *(void *)(a1 + 64);
      if (v13)
      {
        id v14 = *(void (**)(void))(v13 + 16);
LABEL_16:
        v14();
        return;
      }
      return;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [*(id *)(a1 + 48) uuid];
      v16 = [*v2 currentSession];
      v17 = [v16 uuid];
      int v24 = 138412546;
      v25 = v15;
      __int16 v26 = 2112;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: allowing performInputOperation without keyboardInput received for sessionID=%@ while current sessionID=%@", (uint8_t *)&v24, 0x16u);
    }
  }
  uint64_t v18 = [*v2 textInputSource];
  char v19 = [v18 sourceSessionDelegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    int v21 = [*(id *)(a1 + 32) textInputSource];
    v22 = [v21 sourceSessionDelegate];
    [v22 inputSession:*(void *)(a1 + 48) performInputOperation:*(void *)(a1 + 56) withResponse:*(void *)(a1 + 64)];

    return;
  }
  uint64_t v23 = *(void *)(a1 + 64);
  if (v23)
  {
    id v14 = *(void (**)(void))(v23 + 16);
    goto LABEL_16;
  }
}

void sub_10000A0B8(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A174;
  v3[3] = &unk_10001C678;
  id v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_10000A174(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
    [v4 inputSystemService:*(void *)(a1 + 40) inputSessionDidPause:*(void *)(a1 + 48) withReason:*(void *)(a1 + 56)];
  }
}

void sub_10000A398(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A454;
  v3[3] = &unk_10001C678;
  id v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_10000A454(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
    [v4 inputSystemService:*(void *)(a1 + 40) inputSessionDidUnpause:*(void *)(a1 + 48) withReason:*(void *)(a1 + 56)];
  }
}

void sub_10000A678(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A734;
  v3[3] = &unk_10001C678;
  id v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_10000A734(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
    [v4 inputSystemService:*(void *)(a1 + 40) inputSession:*(void *)(a1 + 48) didAddRTISupplementalLexicon:*(void *)(a1 + 56)];
  }
  id v5 = [*(id *)(a1 + 48) uuid];
  id v6 = [*(id *)(a1 + 32) currentSession];
  id v7 = [v6 uuid];
  unsigned __int8 v8 = [v5 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    unsigned __int8 v9 = sub_1000029D8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v10 = [*(id *)(a1 + 48) uuid];
      v11 = [*(id *)(a1 + 32) currentSession];
      char v12 = [v11 uuid];
      int v18 = 138412546;
      char v19 = v10;
      __int16 v20 = 2112;
      int v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Warning: allowing didAddRTISupplementalLexicon received for sessionID=%@ while current sessionID=%@", (uint8_t *)&v18, 0x16u);
    }
  }
  uint64_t v13 = [*(id *)(a1 + 32) textInputSource];
  id v14 = [v13 sourceSessionDelegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    v16 = [*(id *)(a1 + 32) textInputSource];
    v17 = [v16 sourceSessionDelegate];
    [v17 inputSession:*(void *)(a1 + 48) didAddRTISupplementalLexicon:*(void *)(a1 + 56)];
  }
}

void sub_10000AAAC(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000AB68;
  v3[3] = &unk_10001C678;
  id v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_10000AB68(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) autofillUIServiceDelegate];
    [v4 inputSystemService:*(void *)(a1 + 40) inputSession:*(void *)(a1 + 48) didRemoveRTISupplementalLexicon:*(void *)(a1 + 56)];
  }
  id v5 = [*(id *)(a1 + 48) uuid];
  id v6 = [*(id *)(a1 + 32) currentSession];
  id v7 = [v6 uuid];
  unsigned __int8 v8 = [v5 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    unsigned __int8 v9 = sub_1000029D8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v10 = [*(id *)(a1 + 48) uuid];
      v11 = [*(id *)(a1 + 32) currentSession];
      char v12 = [v11 uuid];
      int v18 = 138412546;
      char v19 = v10;
      __int16 v20 = 2112;
      int v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Warning: allowing didRemoveRTISupplementalLexicon received for sessionID=%@ while current sessionID=%@", (uint8_t *)&v18, 0x16u);
    }
  }
  uint64_t v13 = [*(id *)(a1 + 32) textInputSource];
  id v14 = [v13 sourceSessionDelegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    v16 = [*(id *)(a1 + 32) textInputSource];
    v17 = [v16 sourceSessionDelegate];
    [v17 inputSession:*(void *)(a1 + 48) didRemoveRTISupplementalLexicon:*(void *)(a1 + 56)];
  }
}

void sub_10000AE40(id a1)
{
  byte_1000293C8 = +[UIKeyboard usingEndInputSessionCompletion];
  uint64_t v1 = sub_100003290();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_10000E628(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

Class sub_10000AE98(uint64_t a1)
{
  if (!qword_1000293E0) {
    qword_1000293E0 = _sl_dlopen();
  }
  Class result = objc_getClass("AFUIServiceDelegate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000293D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000AF98()
{
  uint64_t result = _sl_dlopen();
  qword_1000293E0 = result;
  return result;
}

void sub_10000B024(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000B05C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t sub_10000B078()
{
  return *(void *)v0;
}

uint64_t sub_10000B084(uint64_t a1)
{
  return *(void *)a1;
}

void sub_10000B090(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t start(int a1, char **a2)
{
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    uint64_t v5 = sub_1000029D8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000E6CC(v5);
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  uint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = UIApplicationMain(a1, a2, v9, v7);

  return v10;
}

void sub_10000BB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

id sub_10000BBB0()
{
  if (qword_1000293F0 != -1) {
    dispatch_once(&qword_1000293F0, &stru_10001C808);
  }
  uint64_t v0 = (void *)qword_1000293E8;

  return v0;
}

__n128 sub_10000BC04(uint64_t a1)
{
  BKSHIDServicesGetCALayerTransform();
  uint64_t v2 = *(_OWORD **)(*(void *)(a1 + 32) + 8);
  __n128 result = v7;
  v2[2] = v4;
  v2[3] = v5;
  v2[6] = v8;
  v2[7] = v9;
  v2[8] = v10;
  v2[9] = v11;
  v2[4] = v6;
  v2[5] = v7;
  return result;
}

__n128 sub_10000BC64(uint64_t a1)
{
  BKSHIDServicesGetCALayerTransform();
  uint64_t v2 = *(_OWORD **)(*(void *)(a1 + 32) + 8);
  __n128 result = v7;
  v2[2] = v4;
  v2[3] = v5;
  v2[6] = v8;
  v2[7] = v9;
  v2[8] = v10;
  v2[9] = v11;
  v2[4] = v6;
  v2[5] = v7;
  return result;
}

void sub_10000BCC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(_OWORD **)(*(void *)(a1 + 32) + 8);
    long long v4 = v3[7];
    *(_OWORD *)&v18.m31 = v3[6];
    *(_OWORD *)&v18.m33 = v4;
    long long v5 = v3[9];
    *(_OWORD *)&v18.m41 = v3[8];
    *(_OWORD *)&v18.m43 = v5;
    long long v6 = v3[3];
    *(_OWORD *)&v18.m11 = v3[2];
    *(_OWORD *)&v18.m13 = v6;
    long long v7 = v3[5];
    *(_OWORD *)&v18.m21 = v3[4];
    *(_OWORD *)&v18.m23 = v7;
    CA_CGPointApplyTransform();
    long long v8 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
    long long v9 = v8[7];
    *(_OWORD *)&v18.m31 = v8[6];
    *(_OWORD *)&v18.m33 = v9;
    long long v10 = v8[9];
    *(_OWORD *)&v18.m41 = v8[8];
    *(_OWORD *)&v18.m43 = v10;
    long long v11 = v8[3];
    *(_OWORD *)&v18.m11 = v8[2];
    *(_OWORD *)&v18.m13 = v11;
    long long v12 = v8[5];
    *(_OWORD *)&v18.m21 = v8[4];
    *(_OWORD *)&v18.m23 = v12;
    CATransform3DInvert(&v17, &v18);
    CA_CGPointApplyTransform();
    double v14 = v13;
    double v16 = v15;
    [WeakRetained frame];
    [WeakRetained setFrame:v16, v14];
  }
}

void sub_10000C080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

NSUInteger sub_10000C0C0(void *a1, NSUInteger a2, NSUInteger a3, int a4, unsigned char *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1[4] + 8) + 32)))
  {
    if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24) || (a4 & 1) != 0)
    {
      if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
        BOOL v22 = a4 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (!v22)
      {
        double MinX = CGRectGetMinX(*(CGRect *)(*(void *)(a1[4] + 8) + 32));
        v29.origin.x = a6;
        v29.origin.y = a7;
        v29.size.width = a8;
        v29.size.height = a9;
        if (MinX <= CGRectGetMidX(v29))
        {
          v30.origin.x = a6;
          v30.origin.y = a7;
          v30.size.width = a8;
          v30.size.height = a9;
          double MidX = CGRectGetMidX(v30);
          double MaxX = CGRectGetMaxX(*(CGRect *)(*(void *)(a1[4] + 8) + 32));
LABEL_13:
          if (MidX <= MaxX)
          {
            v31.origin.x = a6;
            v31.origin.y = a7;
            v31.size.width = a8;
            v31.size.height = a9;
            *(CGRect *)(*(void *)(a1[4] + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(a1[4] + 8) + 32), v31);
            goto LABEL_15;
          }
        }
      }
    }
    else
    {
      double MinY = CGRectGetMinY(*(CGRect *)(*(void *)(a1[4] + 8) + 32));
      v27.origin.x = a6;
      v27.origin.y = a7;
      v27.size.width = a8;
      v27.size.height = a9;
      if (MinY <= CGRectGetMidY(v27))
      {
        v28.origin.x = a6;
        v28.origin.y = a7;
        v28.size.width = a8;
        v28.size.height = a9;
        double MidX = CGRectGetMidY(v28);
        double MaxX = CGRectGetMaxY(*(CGRect *)(*(void *)(a1[4] + 8) + 32));
        goto LABEL_13;
      }
    }
    *a5 = 1;
    goto LABEL_15;
  }
  CATransform3D v18 = *(double **)(a1[4] + 8);
  v18[4] = a6;
  v18[5] = a7;
  v18[6] = a8;
  v18[7] = a9;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a4;
LABEL_15:
  v26.location = a2;
  v26.length = a3;
  NSRange v25 = NSUnionRange(*(NSRange *)(*(void *)(a1[6] + 8) + 32), v26);
  NSUInteger result = v25.location;
  *(NSRange *)(*(void *)(a1[6] + 8) + 32) = v25;
  return result;
}

void sub_10000C3A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  +[IUIRemoteSelectionRect rectWithCGRect:isVertical:](IUIRemoteSelectionRect, "rectWithCGRect:isVertical:", a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v5];
}

void sub_10000D298(id a1)
{
  qword_1000293E8 = (uint64_t)os_log_create("com.apple.InputUI", "IUIRTIInputSource");

  _objc_release_x1();
}

void sub_10000D588(id a1)
{
  id v1 = +[TIPreferencesController sharedPreferencesController];
  [v1 _configureKey:@"InputUIWindowDebug" domain:@"com.apple.keyboard" defaultValue:&__kCFBooleanFalse];
}

void sub_10000D5E8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IUISessionChangeAssistant handleTeardownExistingDelegate:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s  Removed input source placeholder", (uint8_t *)&v1, 0xCu);
}

void sub_10000D66C()
{
  sub_100005300();
  [v1 endSessionID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000530C() sourceSession];
  uint64_t v3 = [v2 uuid];
  sub_1000052C4();
  sub_1000052E0((void *)&_mh_execute_header, v4, v5, "%s  sessionChange's endSessionID: %@ does not match lastInputSource sourceSession ID: %@", v6, v7, v8, v9, 2u);
}

void sub_10000D724()
{
  sub_100005300();
  sub_100004BA0(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000530C() outgoingInputSource];
  uint64_t v3 = sub_100004BA0(v2);
  sub_1000052C4();
  sub_100005318((void *)&_mh_execute_header, v4, v5, "%s  existingDelegate: %@ does not match outgoingInputSource: %@", v6, v7, v8, v9, 2u);
}

void sub_10000D7DC(void *a1, NSObject *a2)
{
  uint64_t v3 = sub_100004BA0(a1);
  int v4 = 136315394;
  uint64_t v5 = "-[IUISessionChangeAssistant handleTeardownExistingDelegate:]";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%s  Called with non-nil existingDelegate: %@ after handling outgoing input source", (uint8_t *)&v4, 0x16u);
}

void sub_10000D888(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IUISessionChangeAssistant handleSetupNewDelegate:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s  Installed an input source placeholder", (uint8_t *)&v1, 0xCu);
}

void sub_10000D90C()
{
  sub_100005300();
  [v1 beginSessionID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000530C() sourceSession];
  uint64_t v3 = [v2 uuid];
  sub_1000052C4();
  sub_1000052E0((void *)&_mh_execute_header, v4, v5, "%s  sessionChange's beginSessionID (%@) does not match inputSource sourceSession ID (%@)", v6, v7, v8, v9, 2u);
}

void sub_10000D9C4()
{
  sub_100005300();
  sub_100004BA0(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000530C() incomingInputSource];
  uint64_t v3 = sub_100004BA0(v2);
  sub_1000052C4();
  sub_100005318((void *)&_mh_execute_header, v4, v5, "%s  newDelegate: %@ does not match incomingInputSource: %@", v6, v7, v8, v9, 2u);
}

void sub_10000DA7C()
{
  sub_100005300();
  sub_100004BA0(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000530C() sessionChangeContext];
  uint64_t v3 = [v2 sessionChange];
  sub_1000052C4();
  sub_1000052E0((void *)&_mh_execute_header, v4, v5, "%s  Called before handling outgoing input source (newDelegate: %@, sessionChange: %@)", v6, v7, v8, v9, 2u);
}

void sub_10000DB34()
{
  sub_100005300();
  sub_100004BA0(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000530C() sessionChangeContext];
  uint64_t v3 = [v2 sessionChange];
  sub_1000052C4();
  sub_1000052E0((void *)&_mh_execute_header, v4, v5, "%s  Called again after handling incoming input source (newDelegate: %@, sessionChange: %@)", v6, v7, v8, v9, 2u);
}

void sub_10000DBEC(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 sessionChangeContext];
  uint64_t v5 = [v4 sessionChange];
  uint64_t v6 = [a1 outgoingInputSource];
  uint64_t v7 = sub_100004BA0(v6);
  uint64_t v8 = [a1 incomingInputSource];
  uint64_t v9 = sub_100004BA0(v8);
  int v10 = 136315906;
  long long v11 = "-[IUISessionChangeAssistant finalizeSessionChange]";
  __int16 v12 = 2112;
  double v13 = v5;
  __int16 v14 = 2112;
  double v15 = v7;
  __int16 v16 = 2112;
  CATransform3D v17 = v9;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%s  Outgoing or incoming input source not handled during -become/resignFirstResponder for unknown reason: unknown. Handling now. (sessionChange: %@, outgoingInputSource: %@, incomingInputSource: %@)", (uint8_t *)&v10, 0x2Au);
}

void sub_10000DD1C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IUISessionCoordinator inputSource:didGenerateTextActionPayload:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s dropping payload: there is no current service session", (uint8_t *)&v1, 0xCu);
}

void sub_10000DDA0(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[IUISessionCoordinator serviceSessionPayloadDelegate]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s returning nil: there is no current service session", (uint8_t *)&v1, 0xCu);
}

void sub_10000DE24(void *a1)
{
  int v1 = [a1 sessionChange];
  sub_10000B09C();
  sub_10000B024((void *)&_mh_execute_header, v2, v3, "%s  Session change does nothing (sessionChange=%@)", v4, v5, v6, v7, 2u);
}

void sub_10000DEB4()
{
  v1[0] = 136315394;
  sub_10000B09C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s  inputSource is not becoming first responder and lastInputSource is not resigning (sessionChange: %@)", (uint8_t *)v1, 0x16u);
}

void sub_10000DF34(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "-[IUISessionCoordinator _main_handleSessionChange:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s  Nothing to do: change ends a session that is not current: %@", buf, 0x16u);
}

void sub_10000DFA0(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "-[IUISessionCoordinator _main_handleSessionChange:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s  Ending currentSession: %@ as a side-effect of this sessionChange: %@", buf, 0x20u);
}

void sub_10000E018()
{
  sub_10000B090(__stack_chk_guard);
  sub_10000B044();
  sub_10000B05C((void *)&_mh_execute_header, v0, v1, "(MAIN) did end session %@, service: %@", v2, v3, v4, v5, v6);
}

void sub_10000E080()
{
  sub_100005300();
  [(id)sub_10000B084(v1) uuid];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000B078() currentSession];
  uint64_t v3 = [v2 uuid];
  sub_10000B00C();
  sub_10000B024((void *)&_mh_execute_header, v4, v5, "Ignoring inputSessionDocumentDidChange received for sessionID=%@ while current sessionID=%@", v6, v7, v8, v9, v10);
}

void sub_10000E12C()
{
  sub_10000B090(__stack_chk_guard);
  sub_10000B044();
  sub_10000B05C((void *)&_mh_execute_header, v0, v1, "(MAIN) did change document for session %@, service: %@", v2, v3, v4, v5, v6);
}

void sub_10000E194()
{
  sub_100005300();
  [(id)sub_10000B084(v1) uuid];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000B078() currentSession];
  uint64_t v3 = [v2 uuid];
  sub_10000B00C();
  sub_10000B024((void *)&_mh_execute_header, v4, v5, "Ignoring documentTraitsDidChange received for sessionID=%@ while current sessionID=%@", v6, v7, v8, v9, v10);
}

void sub_10000E240()
{
  sub_10000B090(__stack_chk_guard);
  sub_10000B044();
  sub_10000B05C((void *)&_mh_execute_header, v0, v1, "(MAIN) did change document traits for session %@, service: %@", v2, v3, v4, v5, v6);
}

void sub_10000E2A8()
{
  sub_100005300();
  [(id)sub_10000B084(v1) uuid];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000B078() currentSession];
  uint64_t v3 = [v2 uuid];
  sub_10000B00C();
  sub_10000B024((void *)&_mh_execute_header, v4, v5, "Ignoring documentStateDidChange received for sessionID=%@ while current sessionID=%@", v6, v7, v8, v9, v10);
}

void sub_10000E354()
{
  sub_10000B090(__stack_chk_guard);
  sub_10000B044();
  sub_10000B05C((void *)&_mh_execute_header, v0, v1, "(MAIN) did change document state for session %@, service: %@", v2, v3, v4, v5, v6);
}

void sub_10000E3BC()
{
  sub_100005300();
  [(id)sub_10000B084(v1) uuid];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000B078() currentSession];
  uint64_t v3 = [v2 uuid];
  sub_10000B00C();
  sub_10000B024((void *)&_mh_execute_header, v4, v5, "Ignoring textSuggestionsChanged received for sessionID=%@ while current sessionID=%@", v6, v7, v8, v9, v10);
}

void sub_10000E468()
{
  sub_100005300();
  [(id)sub_10000B084(v1) uuid];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000B078() currentSession];
  uint64_t v3 = [v2 uuid];
  sub_10000B00C();
  sub_10000B024((void *)&_mh_execute_header, v4, v5, "Ignoring performInputOperation received for sessionID=%@ while current sessionID=%@", v6, v7, v8, v9, v10);
}

void sub_10000E514()
{
  sub_10000B090(__stack_chk_guard);
  sub_10000B044();
  sub_10000B05C((void *)&_mh_execute_header, v0, v1, "(MAIN) did receive input operation from session %@, service: %@", v2, v3, v4, v5, v6);
}

void sub_10000E57C()
{
  sub_100005300();
  [(id)sub_10000B084(v1) uuid];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10000B078() currentSession];
  uint64_t v3 = [v2 uuid];
  sub_10000B00C();
  sub_10000B024((void *)&_mh_execute_header, v4, v5, "Ignoring performInputOperation received with keyboardInput for sessionID=%@ while current sessionID=%@", v6, v7, v8, v9, v10);
}

void sub_10000E628(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E6CC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set user dir suffix", v1, 2u);
}

uint64_t BKSHIDServicesGetCALayerTransform()
{
  return _BKSHIDServicesGetCALayerTransform();
}

uint64_t CALayerGetRenderId()
{
  return _CALayerGetRenderId();
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return _CATransform3DInvert(retstr, t);
}

uint64_t CA_CGPointApplyTransform()
{
  return _CA_CGPointApplyTransform();
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSUnionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
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

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
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

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return _sel_isEqual(lhs, rhs);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__changeHasNonUIKeyInputInputSource(void *a1, const char *a2, ...)
{
  return [a1 _changeHasNonUIKeyInputInputSource];
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return [a1 _contextId];
}

id objc_msgSend__useRTIInterfaceForAutoFillOnIphone(void *a1, const char *a2, ...)
{
  return [a1 _useRTIInterfaceForAutoFillOnIphone];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activeKeyboardSceneDelegate(void *a1, const char *a2, ...)
{
  return [a1 activeKeyboardSceneDelegate];
}

id objc_msgSend_additionalLocaleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 additionalLocaleIdentifiers];
}

id objc_msgSend_animated(void *a1, const char *a2, ...)
{
  return [a1 animated];
}

id objc_msgSend_autofillUIServiceDelegate(void *a1, const char *a2, ...)
{
  return [a1 autofillUIServiceDelegate];
}

id objc_msgSend_autofillUIServiceQueue(void *a1, const char *a2, ...)
{
  return [a1 autofillUIServiceQueue];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_beginSessionDocumentState(void *a1, const char *a2, ...)
{
  return [a1 beginSessionDocumentState];
}

id objc_msgSend_beginSessionDocumentTraits(void *a1, const char *a2, ...)
{
  return [a1 beginSessionDocumentTraits];
}

id objc_msgSend_beginSessionID(void *a1, const char *a2, ...)
{
  return [a1 beginSessionID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_contextAfterInput(void *a1, const char *a2, ...)
{
  return [a1 contextAfterInput];
}

id objc_msgSend_contextBeforeInput(void *a1, const char *a2, ...)
{
  return [a1 contextBeforeInput];
}

id objc_msgSend_contextDelegate(void *a1, const char *a2, ...)
{
  return [a1 contextDelegate];
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return [a1 contextID];
}

id objc_msgSend_contextId(void *a1, const char *a2, ...)
{
  return [a1 contextId];
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return [a1 controller];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDataPayload(void *a1, const char *a2, ...)
{
  return [a1 currentDataPayload];
}

id objc_msgSend_currentServiceSession(void *a1, const char *a2, ...)
{
  return [a1 currentServiceSession];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return [a1 currentSession];
}

id objc_msgSend_dataTransportDelegate(void *a1, const char *a2, ...)
{
  return [a1 dataTransportDelegate];
}

id objc_msgSend_defaultTextInputTraits(void *a1, const char *a2, ...)
{
  return [a1 defaultTextInputTraits];
}

id objc_msgSend_delegateConformanceType(void *a1, const char *a2, ...)
{
  return [a1 delegateConformanceType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableAutomaticKeyboardUI(void *a1, const char *a2, ...)
{
  return [a1 disableAutomaticKeyboardUI];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchQueue];
}

id objc_msgSend_documentState(void *a1, const char *a2, ...)
{
  return [a1 documentState];
}

id objc_msgSend_documentTraits(void *a1, const char *a2, ...)
{
  return [a1 documentTraits];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endSessionID(void *a1, const char *a2, ...)
{
  return [a1 endSessionID];
}

id objc_msgSend_enhancedWindowingModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 enhancedWindowingModeEnabled];
}

id objc_msgSend_finalizeSessionChange(void *a1, const char *a2, ...)
{
  return [a1 finalizeSessionChange];
}

id objc_msgSend_firstSelectionRectInWindow(void *a1, const char *a2, ...)
{
  return [a1 firstSelectionRectInWindow];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return [a1 greenColor];
}

id objc_msgSend_handlePendingSuggestionsDataIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 handlePendingSuggestionsDataIfNecessary];
}

id objc_msgSend_incomingInputSource(void *a1, const char *a2, ...)
{
  return [a1 incomingInputSource];
}

id objc_msgSend_inputDelegate(void *a1, const char *a2, ...)
{
  return [a1 inputDelegate];
}

id objc_msgSend_inputSourceViewController(void *a1, const char *a2, ...)
{
  return [a1 inputSourceViewController];
}

id objc_msgSend_inputUIOOP(void *a1, const char *a2, ...)
{
  return [a1 inputUIOOP];
}

id objc_msgSend_inputViewInfo(void *a1, const char *a2, ...)
{
  return [a1 inputViewInfo];
}

id objc_msgSend_insets(void *a1, const char *a2, ...)
{
  return [a1 insets];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isBeginningSession(void *a1, const char *a2, ...)
{
  return [a1 isBeginningSession];
}

id objc_msgSend_isEndingSession(void *a1, const char *a2, ...)
{
  return [a1 isEndingSession];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_isServicePaused(void *a1, const char *a2, ...)
{
  return [a1 isServicePaused];
}

id objc_msgSend_keyboardInput(void *a1, const char *a2, ...)
{
  return [a1 keyboardInput];
}

id objc_msgSend_keyboardSceneDelegate(void *a1, const char *a2, ...)
{
  return [a1 keyboardSceneDelegate];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layerID(void *a1, const char *a2, ...)
{
  return [a1 layerID];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_markedText(void *a1, const char *a2, ...)
{
  return [a1 markedText];
}

id objc_msgSend_matchInputDestinationFrame(void *a1, const char *a2, ...)
{
  return [a1 matchInputDestinationFrame];
}

id objc_msgSend_needsToReloadInputSource(void *a1, const char *a2, ...)
{
  return [a1 needsToReloadInputSource];
}

id objc_msgSend_offscreenDirection(void *a1, const char *a2, ...)
{
  return [a1 offscreenDirection];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_outgoingInputSource(void *a1, const char *a2, ...)
{
  return [a1 outgoingInputSource];
}

id objc_msgSend_pauseTextInputService(void *a1, const char *a2, ...)
{
  return [a1 pauseTextInputService];
}

id objc_msgSend_payloadDelegate(void *a1, const char *a2, ...)
{
  return [a1 payloadDelegate];
}

id objc_msgSend_pendingSuggestions(void *a1, const char *a2, ...)
{
  return [a1 pendingSuggestions];
}

id objc_msgSend_primaryDelegate(void *a1, const char *a2, ...)
{
  return [a1 primaryDelegate];
}

id objc_msgSend_processId(void *a1, const char *a2, ...)
{
  return [a1 processId];
}

id objc_msgSend_reloadInputSource(void *a1, const char *a2, ...)
{
  return [a1 reloadInputSource];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_resumeTextInputService(void *a1, const char *a2, ...)
{
  return [a1 resumeTextInputService];
}

id objc_msgSend_returnExecutionToParent(void *a1, const char *a2, ...)
{
  return [a1 returnExecutionToParent];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_rtiService(void *a1, const char *a2, ...)
{
  return [a1 rtiService];
}

id objc_msgSend_selectedRangeInMarkedText(void *a1, const char *a2, ...)
{
  return [a1 selectedRangeInMarkedText];
}

id objc_msgSend_selectedText(void *a1, const char *a2, ...)
{
  return [a1 selectedText];
}

id objc_msgSend_selectedTextRange(void *a1, const char *a2, ...)
{
  return [a1 selectedTextRange];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_servicePausedLock(void *a1, const char *a2, ...)
{
  return [a1 servicePausedLock];
}

id objc_msgSend_serviceSessionPayloadDelegate(void *a1, const char *a2, ...)
{
  return [a1 serviceSessionPayloadDelegate];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sessionChange(void *a1, const char *a2, ...)
{
  return [a1 sessionChange];
}

id objc_msgSend_sessionChangeContext(void *a1, const char *a2, ...)
{
  return [a1 sessionChangeContext];
}

id objc_msgSend_sessionCoordinator(void *a1, const char *a2, ...)
{
  return [a1 sessionCoordinator];
}

id objc_msgSend_sessionCoordinatorQueue(void *a1, const char *a2, ...)
{
  return [a1 sessionCoordinatorQueue];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPreferencesController(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferencesController];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return [a1 sharedServer];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_shouldResign(void *a1, const char *a2, ...)
{
  return [a1 shouldResign];
}

id objc_msgSend_shouldShowDockView(void *a1, const char *a2, ...)
{
  return [a1 shouldShowDockView];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sourceSession(void *a1, const char *a2, ...)
{
  return [a1 sourceSession];
}

id objc_msgSend_sourceSessionDelegate(void *a1, const char *a2, ...)
{
  return [a1 sourceSessionDelegate];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_supportsAutoFillPanel(void *a1, const char *a2, ...)
{
  return [a1 supportsAutoFillPanel];
}

id objc_msgSend_systemDelegateMultiplexer(void *a1, const char *a2, ...)
{
  return [a1 systemDelegateMultiplexer];
}

id objc_msgSend_textInputContextIdentifier(void *a1, const char *a2, ...)
{
  return [a1 textInputContextIdentifier];
}

id objc_msgSend_textInputModeData(void *a1, const char *a2, ...)
{
  return [a1 textInputModeData];
}

id objc_msgSend_textInputSource(void *a1, const char *a2, ...)
{
  return [a1 textInputSource];
}

id objc_msgSend_textInputTraits(void *a1, const char *a2, ...)
{
  return [a1 textInputTraits];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_updateData(void *a1, const char *a2, ...)
{
  return [a1 updateData];
}

id objc_msgSend_usingEndInputSessionCompletion(void *a1, const char *a2, ...)
{
  return [a1 usingEndInputSessionCompletion];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}