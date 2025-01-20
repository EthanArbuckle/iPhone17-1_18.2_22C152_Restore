void sub_3714(void *a1, int a2)
{
  objc_begin_catch(a1);
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x3700);
  }
  objc_exception_rethrow();
}

void sub_3734(_Unwind_Exception *a1)
{
}

id sub_3980(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _finishWithCompletion:*(void *)(a1 + 40) result:a2];
}

id sub_3D80(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _finishWithCompletion:*(void *)(a1 + 40) result:a2];
}

void sub_3FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4024;
  v5[3] = &unk_81C0;
  long long v6 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v7 = a2;
  uint64_t v8 = a3;
  uint64_t v9 = a4;
  uint64_t v10 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

id sub_4024(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedPostRequest:*(void *)(a1 + 40) withCompletionBlock:*(void *)(a1 + 72) responseData:*(void *)(a1 + 48) urlResponse:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

uint64_t sub_42B8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 dictionary];
  uint64_t v4 = *(uint64_t (**)(uint64_t, id))(v2 + 16);

  return v4(v2, v3);
}

void sub_45D8(uint64_t a1, char a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4664;
  v3[3] = &unk_8238;
  char v7 = a2;
  char v8 = *(unsigned char *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 64);
  long long v2 = *(_OWORD *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 32);
  long long v5 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

id sub_4664(uint64_t a1, double a2, double a3)
{
  if (*(unsigned char *)(a1 + 72))
  {
    long long v4 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 73))
    {
      LODWORD(a2) = *(_DWORD *)(a1 + 64);
      LODWORD(a3) = *(_DWORD *)(a1 + 68);
      [v4 _setLocationWithLatitude:a2 longitude:a3];
    }
    else
    {
      [v4 initializeLocationSearch];
    }
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    return [v10 _createAndExecutePostRequestWithStatus:v11 account:v12 completion:v13];
  }
  else
  {
    long long v5 = +[SACommandFailed commandFailedWithErrorCode:SAMicroblogMicroblogLocationDisabledFromProviderErrorCode];
    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = [(SACommandFailed *)v5 dictionary];
    char v8 = *(uint64_t (**)(uint64_t, id))(v6 + 16);
    return (id)v8(v6, v7);
  }
}

id sub_470C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createAndExecutePostRequestWithStatus:*(void *)(a1 + 40) account:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

id sub_4790(uint64_t a1, void *a2)
{
  if (a2)
  {
    [a2 coordinate];
    long long v4 = [+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") stringValue];
    [a2 coordinate];
    uint64_t v6 = [+[NSNumber numberWithDouble:v5] stringValue];
  }
  else
  {
    uint64_t v6 = 0;
    long long v4 = 0;
  }
  id v7 = [*(id *)(*(void *)(a1 + 32) + 8) requestForPostWithStatus:*(void *)(a1 + 40) latitude:v4 longitude:v6];
  [v7 setAccount:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(a1 + 32) + 58) = 1;
  *(void *)(*(void *)(a1 + 32) + 64) = 4;
  [*(id *)(a1 + 32) performSelector:"_stopRetrying" withObject:0 afterDelay:2.0];
  char v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 56);

  return [v8 _attemptPostRequest:v7 withCompletionBlock:v9];
}

void sub_499C(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_4A18;
  v2[3] = &unk_82D8;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_4A18(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_4CC4(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4D40;
  block[3] = &unk_8328;
  char v4 = a2;
  long long v3 = *(_OWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_4D40(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 81) = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
  return [*(id *)(a1 + 32) _processResponseFromServiceWithHandler:*(void *)(a1 + 40)];
}

void sub_4D60(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4DDC;
  block[3] = &unk_8328;
  char v4 = a2;
  long long v3 = *(_OWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_4DDC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 82) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 83) = *(unsigned char *)(a1 + 48);
  return [*(id *)(a1 + 32) _processResponseFromServiceWithHandler:*(void *)(a1 + 40)];
}

void sub_5548(void *a1, int a2)
{
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x5534);
  }
  objc_exception_rethrow();
}

void sub_5568(_Unwind_Exception *a1)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _SLLog()
{
  return __SLLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

void objc_exception_rethrow(void)
{
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

void objc_terminate(void)
{
}

id objc_msgSend__cleanupHandler(void *a1, const char *a2, ...)
{
  return [a1 _cleanupHandler];
}

id objc_msgSend__cleanupLocationServices(void *a1, const char *a2, ...)
{
  return [a1 _cleanupLocationServices];
}

id objc_msgSend__makeLocationSwitchVisible(void *a1, const char *a2, ...)
{
  return [a1 _makeLocationSwitchVisible];
}

id objc_msgSend__shouldInitializeLocationSearch(void *a1, const char *a2, ...)
{
  return [a1 _shouldInitializeLocationSearch];
}

id objc_msgSend__stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 _stopUpdatingLocation];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_accountTypeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountTypeIdentifier];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_desiredAccuracy(void *a1, const char *a2, ...)
{
  return [a1 desiredAccuracy];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domainObjectCommitCompleted(void *a1, const char *a2, ...)
{
  return [a1 domainObjectCommitCompleted];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return [a1 horizontalAccuracy];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_initializeLocationSearch(void *a1, const char *a2, ...)
{
  return [a1 initializeLocationSearch];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isWeiboDuplicatePostError(void *a1, const char *a2, ...)
{
  return [a1 isWeiboDuplicatePostError];
}

id objc_msgSend_lastAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 lastAccountIdentifier];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationPermissionBundle(void *a1, const char *a2, ...)
{
  return [a1 locationPermissionBundle];
}

id objc_msgSend_locationPermissionBundleForSiri(void *a1, const char *a2, ...)
{
  return [a1 locationPermissionBundleForSiri];
}

id objc_msgSend_locationServicesEnabled(void *a1, const char *a2, ...)
{
  return [a1 locationServicesEnabled];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_playPostSound(void *a1, const char *a2, ...)
{
  return [a1 playPostSound];
}

id objc_msgSend_startUpdatingLocationWithPrompt(void *a1, const char *a2, ...)
{
  return [a1 startUpdatingLocationWithPrompt];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingLocation];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_useLocation(void *a1, const char *a2, ...)
{
  return [a1 useLocation];
}

id objc_msgSend_waitUntilLocationAcquiredOrTimeElapsed_andExecute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilLocationAcquiredOrTimeElapsed:andExecute:");
}