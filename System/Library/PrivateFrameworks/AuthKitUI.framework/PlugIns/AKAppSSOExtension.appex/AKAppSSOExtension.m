void sub_100002398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v4)(void);
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t vars8;

  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    v5 = objc_alloc((Class)NSHTTPURLResponse);
    v6 = [*(id *)(a1 + 32) url];
    v8 = [v5 initWithURL:v6 statusCode:200 HTTPVersion:0 headerFields:0];

    v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v8, 0);
    }
  }
}

void sub_100004F4C(id a1)
{
  v1 = (void *)qword_1000151A0;
  qword_1000151A0 = (uint64_t)&off_100013340;
}

void sub_100004FE4(id a1)
{
  v1 = (void *)qword_1000151B8;
  qword_1000151B8 = (uint64_t)&off_100013358;
}

uint64_t sub_100005908()
{
  uint64_t v2 = 0;
  v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_1000151C8;
  uint64_t v5 = qword_1000151C8;
  if (!qword_1000151C8)
  {
    long long v6 = *(_OWORD *)off_100010550;
    long long v7 = *(_OWORD *)&off_100010560;
    v3[3] = _sl_dlopen();
    qword_1000151C8 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_100005A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005A30(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000151C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100005AC0()
{
  uint64_t v0 = sub_100005908();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t sub_100005B1C()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_1000151D0;
  uint64_t v6 = qword_1000151D0;
  if (!qword_1000151D0)
  {
    v1 = (void *)sub_100005AC0();
    v4[3] = (uint64_t)dlsym(v1, "AMSAccountMediaTypeAppStore");
    qword_1000151D0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100005BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100005C0C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100005AC0();
  uint64_t result = dlsym(v2, "AMSAccountMediaTypeAppStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000151D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100005C5C()
{
  uint64_t v0 = (void **)sub_100005B1C();
  if (v0)
  {
    v1 = *v0;
    return v1;
  }
  else
  {
    uint64_t v3 = sub_100008B08();
    return (id)sub_100005C90(v3);
  }
}

uint64_t sub_100005C90()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_1000151D8;
  uint64_t v6 = qword_1000151D8;
  if (!qword_1000151D8)
  {
    v1 = (void *)sub_100005AC0();
    v4[3] = (uint64_t)dlsym(v1, "AMSAccountMediaTypeiTunes");
    qword_1000151D8 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100005D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100005D80(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100005AC0();
  uint64_t result = dlsym(v2, "AMSAccountMediaTypeiTunes");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000151D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100005DD0()
{
  uint64_t v0 = (void **)sub_100005C90();
  if (v0)
  {
    v1 = *v0;
    id v2 = v1;
  }
  else
  {
    uint64_t v3 = (AKWebAuthorizationController *)sub_100008B08();
    [(AKWebAuthorizationController *)v3 beginAuthorizationWithRequest:v5];
  }
}

void sub_1000067F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006874(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006884(uint64_t a1)
{
}

void sub_10000688C(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_1000068DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = v6;
  if (v5)
  {
    v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v5 credential];
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Authorization Succeded with credential: %@", buf, 0xCu);
    }
    v10 = *(NSObject **)(a1 + 32);
    v11 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006B18;
    block[3] = &unk_1000105F0;
    uint64_t v12 = *(void *)(a1 + 40);
    v13 = *(void **)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 64);
    block[4] = v12;
    id v17 = v13;
    id v18 = v5;
    id v19 = *(id *)(a1 + 56);
    dispatch_group_notify(v10, v11, block);
  }
  else if (*(unsigned char *)(a1 + 72) || !objc_msgSend(v6, "ak_isUserCancelError"))
  {
    v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100008CC4();
    }

    [*(id *)(a1 + 48) completeWithError:v7];
  }
  else
  {
    v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Authorization cancelled by user.", buf, 2u);
    }

    [*(id *)(a1 + 48) cancel];
  }
}

void sub_100006B18(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v1)
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) credential];
    objc_msgSend(v2, "_sendAuthorizationResponseToRequest:usingTemplate:withCredential:requestParams:", v3, v1);
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = +[NSError ak_errorWithCode:-7029];
    objc_msgSend(v4, "completeWithError:");
  }
}

void sub_100007D5C(id a1)
{
  qword_1000151E0 = +[NSSet setWithObjects:@"form_post", @"web_message", 0];

  _objc_release_x1();
}

void sub_100007DB8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007DE0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100007DFC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000083F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = v6;
  if (v5)
  {
    v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = [v5 statusCode];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reset password response received: %d", (uint8_t *)v12, 8u);
    }

    uint64_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000090B0();
    }
  }
  else
  {
    unsigned int v10 = objc_msgSend(v6, "ak_isUserCancelError");
    v11 = _AKLogSystem();
    uint64_t v9 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Reset password cancelled by user.", (uint8_t *)v12, 2u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_10000903C();
    }
  }

  [*(id *)(a1 + 32) cancel];
}

uint64_t sub_100008B08()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_100008B2C(v0);
}

void sub_100008B2C()
{
  sub_100007DD4();
  sub_100007DFC((void *)&_mh_execute_header, v0, v1, "Web authorization controller NOT permitted to perform credential request with error: %@", v2, v3, v4, v5, v6);
}

void sub_100008B94(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Found a store account with handle: %@", buf, 0xCu);
}

void sub_100008BF4()
{
  sub_100007E18();
  sub_100007DB8((void *)&_mh_execute_header, v0, v1, "Invalid redirect URL.", v2, v3, v4, v5, v6);
}

void sub_100008C28()
{
  sub_100007E18();
  sub_100007DB8((void *)&_mh_execute_header, v0, v1, "Request params do not meet all requirements. Authorization request not handled.", v2, v3, v4, v5, v6);
}

void sub_100008C5C()
{
  sub_100007DD4();
  sub_100007DE0((void *)&_mh_execute_header, v0, v1, "authorizationOptions %@", v2, v3, v4, v5, v6);
}

void sub_100008CC4()
{
  sub_100007DD4();
  sub_100007DFC((void *)&_mh_execute_header, v0, v1, "Authorization failed with error: %@", v2, v3, v4, v5, v6);
}

void sub_100008D2C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 objectForKeyedSubscript:@"client_id"];
  sub_100007DD4();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Unable to fetch Primary Bundle ID for service id: %@, error: %@", v6, 0x16u);
}

void sub_100008DE0()
{
  sub_100007E18();
  sub_100007DB8((void *)&_mh_execute_header, v0, v1, "Request parameters are missing 'originURL'. Unable to proceed.", v2, v3, v4, v5, v6);
}

void sub_100008E14()
{
  sub_100007E18();
  sub_100007DB8((void *)&_mh_execute_header, v0, v1, "Request parameters are missing 'client_id'. Unable to proceed.", v2, v3, v4, v5, v6);
}

void sub_100008E48()
{
  sub_100007DD4();
  sub_100007DFC((void *)&_mh_execute_header, v0, v1, "Request parameters with scopes have unsupported response_mode '%@'. Unable to proceed.", v2, v3, v4, v5, v6);
}

void sub_100008EB0()
{
  sub_100007DD4();
  sub_100007DE0((void *)&_mh_execute_header, v0, v1, "verifying if request can be processed with url parameters: %@", v2, v3, v4, v5, v6);
}

void sub_100008F18()
{
  sub_100007DD4();
  sub_100007DE0((void *)&_mh_execute_header, v0, v1, "Store account: %@", v2, v3, v4, v5, v6);
}

void sub_100008F80()
{
  sub_100007E18();
  sub_100007DB8((void *)&_mh_execute_header, v0, v1, "Missing resource template for authorization response body.", v2, v3, v4, v5, v6);
}

void sub_100008FB4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Caller is not entitled for first party origin. Authorization request not handled.", v1, 2u);
}

void sub_100008FF8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Password reset native take over feature not enabled", v1, 2u);
}

void sub_10000903C()
{
  sub_100007DD4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Reset password failed with error: %@", v1, 0xCu);
}

void sub_1000090B0()
{
  sub_100007DD4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Reset password response: %@", v1, 0xCu);
}

void sub_100009124()
{
  sub_100007DD4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken failed for entitlement %@", v1, 0xCu);
}

void sub_100009198()
{
  sub_100007DD4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "SecTaskCopyValueForEntitlement failed for %@, error: %@", v2, 0x16u);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t _AKLogSystem()
{
  return __AKLogSystem();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_SPDForStandardAccountSRPSuccessWithEDPInfo(void *a1, const char *a2, ...)
{
  return [a1 SPDForStandardAccountSRPSuccessWithEDPInfo];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__acceptedResponseModes(void *a1, const char *a2, ...)
{
  return [a1 _acceptedResponseModes];
}

id objc_msgSend__activeStoreAccount(void *a1, const char *a2, ...)
{
  return [a1 _activeStoreAccount];
}

id objc_msgSend__authorizationController(void *a1, const char *a2, ...)
{
  return [a1 _authorizationController];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditTokenData(void *a1, const char *a2, ...)
{
  return [a1 auditTokenData];
}

id objc_msgSend_authorizationCode(void *a1, const char *a2, ...)
{
  return [a1 authorizationCode];
}

id objc_msgSend_authorizationOptions(void *a1, const char *a2, ...)
{
  return [a1 authorizationOptions];
}

id objc_msgSend_authorizationRequest(void *a1, const char *a2, ...)
{
  return [a1 authorizationRequest];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callerBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 callerBundleIdentifier];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return [a1 credential];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultScale(void *a1, const char *a2, ...)
{
  return [a1 defaultScale];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doNotHandle(void *a1, const char *a2, ...)
{
  return [a1 doNotHandle];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_identityToken(void *a1, const char *a2, ...)
{
  return [a1 identityToken];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isFirstPartyURLEntitlementCheckDisabled(void *a1, const char *a2, ...)
{
  return [a1 isFirstPartyURLEntitlementCheckDisabled];
}

id objc_msgSend_isForgotPasswordNativeTakeoverEnabled(void *a1, const char *a2, ...)
{
  return [a1 isForgotPasswordNativeTakeoverEnabled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_percentEncodedQuery(void *a1, const char *a2, ...)
{
  return [a1 percentEncodedQuery];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_primaryAuthKitAccount(void *a1, const char *a2, ...)
{
  return [a1 primaryAuthKitAccount];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_selectedEmail(void *a1, const char *a2, ...)
{
  return [a1 selectedEmail];
}

id objc_msgSend_sharedBag(void *a1, const char *a2, ...)
{
  return [a1 sharedBag];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shouldAutocycleAppsInWebTakeover(void *a1, const char *a2, ...)
{
  return [a1 shouldAutocycleAppsInWebTakeover];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_testTiburonWebApplicationName(void *a1, const char *a2, ...)
{
  return [a1 testTiburonWebApplicationName];
}

id objc_msgSend_testTiburonWebBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 testTiburonWebBundleIdentifier];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInformation(void *a1, const char *a2, ...)
{
  return [a1 userInformation];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}