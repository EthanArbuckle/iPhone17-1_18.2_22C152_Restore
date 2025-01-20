void sub_100002B80(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t vars8;

  v3 = objc_alloc_init((Class)NSOperationQueue);
  v2 = [*(id *)(a1 + 32) urlRequest];
  +[NSURLConnection sendAsynchronousRequest:v2 queue:v3 completionHandler:*(void *)(a1 + 40)];
}

void sub_100002DE4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v32 = a3;
  id v8 = a4;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_100003360;
  v46 = sub_100003370;
  id v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_100003360;
  v40 = sub_100003370;
  id v41 = 0;
  if (v7)
  {
    id v9 = v7;
    v10 = [v9 valueForHTTPHeaderField:@"Location"];
    v11 = [v9 valueForHTTPHeaderField:@"Replay-Nonce"];
    if (v10)
    {
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100003378;
      v35[3] = &unk_100008678;
      v35[4] = &v36;
      sub_100004590(v10, (uint64_t)v35);
    }
    if (v11)
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000033C0;
      v34[3] = &unk_100008678;
      v34[4] = &v42;
      sub_100004590(v11, (uint64_t)v34);
      CFStringRef v50 = @"Replay-Nonce";
      v51 = v11;
      v12 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      uint64_t v33 = 0;
      v13 = +[NSJSONSerialization dataWithJSONObject:v12 options:0 error:&v33];
    }
    else
    {
      v13 = 0;
    }
    id v17 = [v9 statusCode];
    int64_t v18 = (int64_t)v17;
    if (v17 == (id)204 && v13 || v17 == (id)200 || v17 == (id)201 && [(__CFString *)v10 length])
    {
      xpc_object_t v14 = 0;
      v16 = 0;
    }
    else
    {
      v16 = +[NSHTTPURLResponse localizedStringForStatusCode:v18];
      xpc_object_t v14 = xpc_int64_create(v18);
    }

    if (v8)
    {
      if (v16) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    if (v16)
    {
      NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
      v49 = v16;
      v19 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      v20 = +[NSError errorWithDomain:NSURLErrorDomain code:v18 userInfo:v19];

      v15 = sub_100003408(v20);

      xpc_object_t v21 = 0;
      goto LABEL_30;
    }
    v15 = 0;
  }
  else
  {
    xpc_object_t v14 = 0;
    v13 = 0;
    v15 = 0;
    v16 = 0;
    if (v8)
    {
LABEL_18:
      v16 = [v8 description];
LABEL_19:
      v15 = sub_100003408(v8);
      if (!v14) {
        xpc_object_t v14 = xpc_int64_create((int64_t)[v8 code]);
      }
    }
  }
  xpc_object_t v21 = 0;
  if (v32 && !v16)
  {
    id v22 = [v32 length];
    if (v22) {
      xpc_object_t v21 = xpc_data_create([v32 bytes], (size_t)v22);
    }
    else {
      xpc_object_t v21 = 0;
    }
    v16 = 0;
  }
LABEL_30:
  if (v13)
  {
    id v23 = v13;
    xpc_object_t v24 = xpc_data_create([v23 bytes], (size_t)objc_msgSend(v23, "length"));
  }
  else
  {
    xpc_object_t v24 = 0;
  }
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v25 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  v27 = reply;
  if (reply)
  {
    if (v15) {
      xpc_dictionary_set_value(reply, "AcmeError", v15);
    }
    if (v14) {
      xpc_dictionary_set_value(v27, "AcmeStatus", v14);
    }
    v28 = (void *)v43[5];
    if (v28) {
      xpc_dictionary_set_value(v27, "AcmeNonce", v28);
    }
    v29 = (void *)v37[5];
    if (v29) {
      xpc_dictionary_set_value(v27, "AcmeLocation", v29);
    }
    v30 = v21;
    if (v21 || (v30 = v24) != 0) {
      xpc_dictionary_set_value(v27, "AcmeReply", v30);
    }
    xpc_connection_send_message(v25, v27);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
}

void sub_10000330C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_100003360(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003370(uint64_t a1)
{
}

uint64_t sub_100003378(uint64_t a1, char *string)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = xpc_string_create(string);

  return _objc_release_x1();
}

uint64_t sub_1000033C0(uint64_t a1, char *string)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = xpc_string_create(string);

  return _objc_release_x1();
}

id sub_100003408(void *a1)
{
  id v1 = a1;
  v2 = [v1 userInfo];
  v3 = [v2 objectForKey:NSUnderlyingErrorKey];
  v4 = [v3 userInfo];

  if (!v4)
  {
    v4 = [v1 userInfo];
  }
  v5 = +[NSMutableDictionary dictionaryWithCapacity:0];
  v6 = [v4 objectForKey:NSErrorFailingURLStringKey];
  id v7 = [v4 objectForKey:NSLocalizedDescriptionKey];
  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:NSErrorFailingURLStringKey];
  }
  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  id v8 = [v1 code];
  id v9 = [v1 domain];
  v10 = +[NSError errorWithDomain:v9 code:v8 userInfo:v5];
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  CFStringRef Domain = CFErrorGetDomain(v10);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 0x40000000;
  v27[2] = sub_1000065C0;
  v27[3] = &unk_100008880;
  v27[4] = v11;
  v27[5] = "domain";
  sub_100004590(Domain, (uint64_t)v27);
  int64_t Code = CFErrorGetCode(v10);
  xpc_dictionary_set_int64(v11, "code", Code);
  CFStringRef v14 = (const __CFString *)CFErrorCopyUserInfo(v10);
  size_t v18 = sub_100004CDC(v14, 0, v15, v16, v17);
  if (v18)
  {
    size_t v19 = v18;
    v26 = v7;
    v20 = v6;
    xpc_object_t v21 = (UInt8 *)malloc_type_malloc(v18, 0x4ABABCFuLL);
    unint64_t v22 = (unint64_t)&v21[v19];
    id v23 = (const void *)sub_100004F70(v14, 0, 0, v21, v22);
    if (v23) {
      xpc_dictionary_set_data(v11, "userinfo", v23, v22 - (void)v23);
    }
    free(v21);
    v6 = v20;
    id v7 = v26;
  }
  CFRelease(v14);
  id v24 = v11;

  return v24;
}

void sub_1000036A0(void *a1)
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x4012000000;
  v6 = sub_1000037CC;
  id v7 = sub_1000037E4;
  uint64_t v8 = 256;
  id v1 = a1;
  id v9 = v1;
  v4[7] = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000037EC;
  handler[3] = &unk_100008650;
  handler[4] = &v3;
  xpc_connection_set_event_handler((xpc_connection_t)v1, handler);
  xpc_connection_set_finalizer_f((xpc_connection_t)v1, (xpc_finalizer_t)j__xpc_transaction_end);
  xpc_transaction_begin();
  xpc_connection_resume((xpc_connection_t)v1);
  _Block_object_dispose(&v3, 8);
}

void sub_1000037AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000037CC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(result + 48) = v2;
  *(void *)(result + 56) = *(void *)(a2 + 56);
  return result;
}

void sub_1000037E4(uint64_t a1)
{
}

void sub_1000037EC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = a2;
  v4 = xpc_dictionary_get_remote_connection(v3);
  xpc_type_t type = xpc_get_type(v3);
  if (*(_DWORD *)(v2 + 60)) {
    goto LABEL_2;
  }
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 != &_xpc_error_termination_imminent) {
      *(_DWORD *)(v2 + 60) = 1;
    }
  }
  else
  {
    if (type != (xpc_type_t)&_xpc_type_dictionary) {
      goto LABEL_2;
    }
    size_t length = 0;
    string = xpc_dictionary_get_string(v3, "operation");
    xpc_connection_get_audit_token();
    if (!string || strcmp(string, "AcmeRequest")) {
      goto LABEL_2;
    }
    memset(&token, 0, sizeof(token));
    id v7 = SecTaskCreateWithAuditToken(0, &token);
    if (!v7) {
      goto LABEL_12;
    }
    uint64_t v8 = v7;
    CFTypeRef v9 = SecTaskCopyValueForEntitlement(v7, @"com.apple.security.app-sandbox", 0);
    if (!v9) {
      goto LABEL_11;
    }
    v10 = v9;
    if (CFEqual(kCFBooleanFalse, v9))
    {
      CFRelease(v10);
LABEL_11:
      CFRelease(v8);
LABEL_12:
      data = (const UInt8 *)xpc_dictionary_get_data(v3, "request", &length);
      v12 = xpc_dictionary_get_string(v3, "url");
      v13 = xpc_dictionary_get_string(v3, "method");
      xpc_dictionary_get_int64(v3, "state");
      size_t v14 = length;
      id v15 = v3;
      if (v12)
      {
        CFDataRef v16 = CFDataCreate(kCFAllocatorDefault, data, v14);
        *(void *)token.val = _NSConcreteStackBlock;
        *(void *)&token.val[2] = 3221225472;
        *(void *)&token.val[4] = sub_100002DE4;
        *(void *)&token.val[6] = &unk_1000086A0;
        id v32 = v15;
        uint64_t v17 = objc_retainBlock(&token);
        size_t v18 = +[NSString stringWithUTF8String:v13];
        if ([v18 isEqualToString:@"POST"]) {
          size_t v19 = @"application/jose+json";
        }
        else {
          size_t v19 = @"application/json";
        }
        CFDataRef v20 = v16;
        id v21 = v18;
        unint64_t v22 = v19;
        id v23 = v17;
        v25 = +[NSString stringWithCString:v12 encoding:4];
        v26 = [[AcmeClient alloc] initWithURLString:v25];
        [(AcmeClient *)v26 post:v20 withMethod:v21 contentType:v22];
        [(AcmeClient *)v26 start3:v23];
      }

      goto LABEL_2;
    }
    CFTypeRef v27 = SecTaskCopyValueForEntitlement(v8, @"com.apple.security.network.client", 0);
    if (!v27)
    {
      CFRelease(v10);
      CFRelease(v8);
      goto LABEL_2;
    }
    v28 = v27;
    int v29 = CFEqual(kCFBooleanFalse, v27);
    CFRelease(v28);
    CFRelease(v10);
    CFRelease(v8);
    if (!v29) {
      goto LABEL_12;
    }
  }
LABEL_2:
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = getenv("WAIT4DEBUGGER");
  if (v3)
  {
    if (!strcasecmp("YES", v3))
    {
      syslog(3, "Waiting for debugger");
      pid_t v4 = getpid();
      kill(v4, 17);
    }
  }
  sub_100003BCC();
  sub_100003C44();
  xpc_main((xpc_connection_handler_t)sub_1000036A0);
}

size_t sub_100003BCC()
{
  bzero(v1, 0x400uLL);
  _set_user_dir_suffix();
  return confstr(65537, v1, 0x400uLL);
}

void sub_100003C44()
{
  signal(15, (void (__cdecl *)(int))1);
  v0 = dispatch_get_global_queue(25, 0);
  dispatch_source_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v0);
  uint64_t v2 = (void *)qword_10000C308;
  qword_10000C308 = (uint64_t)v1;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10000C308, &stru_1000086E0);
  id v3 = qword_10000C308;

  dispatch_activate(v3);
}

void sub_100003CD0(id a1)
{
  dispatch_source_t v1 = sub_100003E94("acme");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Received signal SIGTERM. Will terminate when clean.", v2, 2u);
  }

  xpc_transaction_exit_clean();
}

const void *sub_100003D44(const __CFString *a1)
{
  if (a1) {
    CFStringRef v1 = a1;
  }
  else {
    CFStringRef v1 = @"logging";
  }
  os_unfair_lock_lock_with_options();
  CFDictionaryRef Mutable = (const __CFDictionary *)qword_10000C318;
  if (!qword_10000C318)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFCopyStringDictionaryKeyCallBacks, 0);
    qword_10000C318 = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, v1);
  if (!Value)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000;
    v5[2] = sub_100003E44;
    v5[3] = &unk_100008700;
    v5[4] = v1;
    sub_100004590(v1, (uint64_t)v5);
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_10000C318, v1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10000C310);
  return Value;
}

void sub_100003E44(uint64_t a1, const char *a2)
{
  uint64_t v2 = (__CFDictionary *)qword_10000C318;
  id v3 = *(const void **)(a1 + 32);
  os_log_t v4 = os_log_create("com.apple.securityd", a2);

  CFDictionaryAddValue(v2, v3, v4);
}

const void *sub_100003E94(const char *a1)
{
  pthread_mutex_lock(&stru_10000C2C0);
  pthread_mutex_unlock(&stru_10000C2C0);
  if (a1)
  {
    CFStringRef v2 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x600u);
    id v3 = sub_100003D44(v2);
    if (v2) {
      CFRelease(v2);
    }
    return v3;
  }
  else
  {
    return sub_100003D44(0);
  }
}

uint64_t sub_100003F24(const __CFDictionary *a1, uint64_t a2)
{
  long long v3 = xmmword_1000074B0;
  LOBYTE(v3) = 1;
  uint64_t v4 = a2;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)sub_100003F90, &v3);
  if ((_BYTE)v3) {
    return ccder_sizeof();
  }
  else {
    return 0;
  }
}

uint64_t sub_100003F90(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)a3)
  {
    result = sub_100003FD8(result, a2, *(CFTypeRef **)(a3 + 16));
    if (result) {
      *(void *)(a3 + 8) += result;
    }
    else {
      *(unsigned char *)a3 = 0;
    }
  }
  return result;
}

uint64_t sub_100003FD8(uint64_t a1, uint64_t a2, CFTypeRef *a3)
{
  if (sub_100004CDC(a1, a3) && sub_100004CDC(a2, a3))
  {
    return ccder_sizeof();
  }
  else
  {
    sub_100004C0C(-6, v5, v6, a3, v7, @"null input");
    return 0;
  }
}

uint64_t sub_100004068(const __CFDictionary *a1, CFTypeRef *a2, char a3)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  v14[0] = 0xAAAAAAAAAAAAAA01;
  v14[1] = a2;
  BYTE1(v14[0]) = a3;
  v14[2] = Mutable;
  v14[3] = 0;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)sub_1000042AC, v14);
  if (!LOBYTE(v14[0]))
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0;
  }
  v15.size_t length = CFArrayGetCount(Mutable);
  v15.location = 0;
  CFArraySortValues(Mutable, v15, (CFComparatorFunction)sub_1000041E4, 0);
  CFIndex Count = CFArrayGetCount(Mutable);
  if (Count >= 1)
  {
    unint64_t v8 = Count + 1;
    do
    {
      CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(Mutable, v8 - 2);
      CFDataGetLength(ValueAtIndex);
      CFDataGetBytePtr(ValueAtIndex);
      ccder_encode_body();
      --v8;
    }
    while (v8 > 1);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t result = ccder_encode_constructed_tl();
  if (!result)
  {
    sub_100004C0C(-7, v11, v12, a2, v13, @"ccder failed to encode");
    return 0;
  }
  return result;
}

uint64_t sub_1000041E4(const __CFData *a1, const __CFData *a2)
{
  CFIndex Length = CFDataGetLength(a1);
  CFIndex v5 = CFDataGetLength(a2);
  unint64_t v6 = v5;
  if (Length < 0 || v5 < 0)
  {
    if (Length >= v5) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = -1;
    }
    if (Length <= v5) {
      return v12;
    }
    else {
      return 1;
    }
  }
  else
  {
    if (Length >= v5) {
      size_t v7 = v5;
    }
    else {
      size_t v7 = Length;
    }
    BytePtr = CFDataGetBytePtr(a1);
    CFTypeRef v9 = CFDataGetBytePtr(a2);
    int v10 = memcmp(BytePtr, v9, v7);
    if (v10 <= 0 && (v10 || Length <= v6))
    {
      LODWORD(v13) = v10 == 0;
      if (Length >= v6) {
        LODWORD(v13) = 0;
      }
      if (v10 < 0) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v13;
      }
      return v13 << 63 >> 63;
    }
    else
    {
      return 1;
    }
  }
}

void sub_1000042AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)a3)
  {
    CFIndex v6 = sub_100003FD8(a1, a2, *(CFTypeRef **)(a3 + 8));
    if (!v6)
    {
      *(unsigned char *)a3 = 0;
      return;
    }
    CFIndex v7 = v6;
    CFMutableArrayRef Mutable = CFDataCreateMutable(*(CFAllocatorRef *)(a3 + 24), v6);
    CFDataSetLength(Mutable, v7);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    int v10 = &MutableBytePtr[v7];
    uint64_t v11 = *(CFTypeRef **)(a3 + 8);
    uint64_t v12 = *(unsigned __int8 *)(a3 + 1);
    uint64_t v13 = sub_100004F70(a2, v11, v12, MutableBytePtr, v10);
    sub_100004F70(a1, v11, v12, MutableBytePtr, v13);
    uint64_t v14 = ccder_encode_constructed_tl();
    if (v14)
    {
      v19.size_t length = v14 - (void)MutableBytePtr;
      v19.location = 0;
      CFDataDeleteBytes(Mutable, v19);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 16), Mutable);
      if (!Mutable) {
        return;
      }
    }
    else
    {
      sub_100004C0C(-7, v15, v16, v11, v17, @"ccder failed to encode");
      *(unsigned char *)a3 = 0;
      if (!Mutable) {
        return;
      }
    }
    CFRelease(Mutable);
  }
}

uint64_t sub_1000043F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (qword_10000C330 != -1) {
    dispatch_once(&qword_10000C330, &stru_1000087D8);
  }
  uint64_t v2 = qword_10000C338;
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

void sub_100004460(id a1)
{
  qword_10000C338 = (uint64_t)CFCalendarCreateWithIdentifier(kCFAllocatorDefault, kCFGregorianCalendar);
  CFTimeZoneRef v1 = CFTimeZoneCreateWithTimeIntervalFromGMT(kCFAllocatorDefault, 0.0);
  CFCalendarSetTimeZone((CFCalendarRef)qword_10000C338, v1);
  if (v1)
  {
    CFRelease(v1);
  }
}

void sub_1000044E4(id a1)
{
  qword_10000C328 = (uint64_t)dispatch_queue_create("ZuluCalendar", 0);
}

uint64_t sub_100004510(uint64_t result, int a2, UInt8 *buffer)
{
  if (buffer)
  {
    uint64_t v4 = result;
    CFStringRef v5 = *(const __CFString **)(result + 40);
    CFRange v8 = *(CFRange *)(v4 + 48);
    CFIndex v6 = *(void *)(v4 + 64);
    CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    CFStringGetBytes(v5, v8, 0x8000100u, 0, 0, buffer, v6, &usedBufLen);
    buffer[usedBufLen] = 0;
    return (*(uint64_t (**)(void))(*(void *)(v4 + 32) + 16))();
  }
  return result;
}

void sub_100004590(const __CFString *a1, uint64_t a2)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 0x40000000;
  CFRange v8 = sub_1000046D8;
  CFTypeRef v9 = &unk_100008778;
  uint64_t v10 = a2;
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    uint64_t v4 = CStringPtr;
    size_t v5 = strlen(CStringPtr);
    ((void (*)(void *, const char *, size_t))v8)(v7, v4, v5);
  }
  else
  {
    CFIndex usedBufLen = 0;
    CFIndex Length = CFStringGetLength(a1);
    v13.location = 0;
    v13.size_t length = Length;
    CFStringGetBytes(a1, v13, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 0x40000000;
    v11[2] = sub_100004510;
    v11[3] = &unk_100008750;
    v11[6] = 0;
    v11[7] = Length;
    v11[8] = usedBufLen;
    v11[4] = v7;
    v11[5] = a1;
    sub_100006438(usedBufLen + 1, (uint64_t)v11);
  }
}

uint64_t sub_1000046D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000046E8(uint64_t a1, CFCalendarRef calendar)
{
  uint64_t result = CFCalendarDecomposeAbsoluteTime(calendar, *(CFAbsoluteTime *)(a1 + 40), "yMdHms", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

uint64_t sub_10000474C(const __CFNumber *a1, CFTypeRef *a2)
{
  uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  if (CFNumberGetValue(a1, kCFNumberLongLongType, &valuePtr))
  {
    if ((HIBYTE(valuePtr) + 1) <= 1u)
    {
      uint64_t v6 = 9;
      uint64_t v7 = 48;
      do
      {
        if ((unint64_t)(v6 - 2) < 2) {
          break;
        }
        uint64_t v8 = valuePtr >> v7;
        --v6;
        v7 -= 8;
      }
      while (HIBYTE(valuePtr) == v8);
    }
    return ccder_sizeof();
  }
  else
  {
    sub_100004C0C(-4, v3, v4, a2, v5, @"Unable to get number from data");
    return 0;
  }
}

uint64_t sub_100004820(const __CFNumber *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4)
{
  uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  if (!CFNumberGetValue(a1, kCFNumberLongLongType, &valuePtr))
  {
    sub_100004C0C(-4, v7, v8, a2, v9, @"Unable to get number from data");
    return 0;
  }
  uint64_t v10 = valuePtr;
  unint64_t v11 = HIBYTE(valuePtr);
  if ((HIBYTE(valuePtr) + 1) > 1u)
  {
    uint64_t v16 = 8;
    if (!a4) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v12 = 9;
    uint64_t v13 = 48;
    uint64_t v14 = 1;
    while ((unint64_t)(v12 - 2) >= 2)
    {
      uint64_t v15 = valuePtr >> v13;
      --v12;
      v13 -= 8;
      if (v11 != v15)
      {
        uint64_t v14 = v12 - 1;
        goto LABEL_11;
      }
    }
    uint64_t v12 = 2;
LABEL_11:
    if ((((valuePtr >> (8 * v14 - 8)) ^ v11) & 0x80) != 0) {
      uint64_t v16 = v12;
    }
    else {
      uint64_t v16 = v14;
    }
    if (!a4) {
      goto LABEL_22;
    }
  }
  if (a4 - a3 < v16)
  {
LABEL_22:
    sub_100004C0C(-3, v16, v8, a2, v9, @"Unknown size");
    return 0;
  }
  if ((unint64_t)v16 <= 1) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = v16;
  }
  do
  {
    *(unsigned char *)--a4 = v10;
    v10 >>= 8;
    --v17;
  }
  while (v17);
  uint64_t valuePtr = v10;
  uint64_t result = ccder_encode_tl();
  if (!result)
  {
    sub_100004C0C(-7, v19, v20, a2, v21, @"ccder failed to encode");
    return 0;
  }
  return result;
}

void sub_10000495C(CFIndex a1, const __CFString *a2, __CFString *cf, CFTypeRef *a4, CFStringRef format, va_list arguments)
{
  if (!a4) {
    return;
  }
  if (*a4)
  {
    if (cf && *a4 != cf)
    {
      CFRelease(cf);
    }
    return;
  }
  CFStringRef v10 = CFStringCreateWithFormatAndArguments(0, 0, format, arguments);
  uint64_t v28 = 0;
  if (!cf) {
    goto LABEL_30;
  }
  CFDictionaryRef v11 = CFErrorCopyUserInfo((CFErrorRef)cf);
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v11, kCFErrorDescriptionKey);
  if (Value)
  {
    BOOL v13 = CFEqual(v10, Value);
    if (!v11) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  BOOL v13 = 0;
  if (v11) {
LABEL_11:
  }
    CFRelease(v11);
LABEL_12:
  CFIndex Code = CFErrorGetCode((CFErrorRef)cf);
  CFStringRef Domain = CFErrorGetDomain((CFErrorRef)cf);
  CFComparisonResult v16 = CFStringCompare(a2, Domain, 0);
  BOOL v18 = Code == a1 && v16 == kCFCompareEqualTo && v13;
  uint64_t v19 = cf;
  if (v18) {
    goto LABEL_19;
  }
  CFDictionaryRef v21 = CFErrorCopyUserInfo((CFErrorRef)cf);
  if (v21)
  {
    CFDictionaryRef v22 = v21;
    id v23 = (const void *)kSOSCountKey;
    if (CFDictionaryContainsKey(v21, kSOSCountKey) == 1)
    {
      CFNumberRef v24 = (const __CFNumber *)CFDictionaryGetValue(v22, v23);
      if (v24)
      {
        uint64_t valuePtr = 0;
        CFNumberGetValue(v24, kCFNumberLongType, &valuePtr);
        if (valuePtr > 199)
        {
          CFRelease(v22);
          uint64_t v19 = cf;
LABEL_19:
          CFRetain(v19);
          *a4 = cf;
          CFRelease(cf);
          if (!v10) {
            return;
          }
          CFStringRef v20 = v10;
          goto LABEL_44;
        }
        uint64_t v28 = valuePtr + 1;
      }
    }
    CFRelease(v22);
  }
LABEL_30:
  CFNumberRef v25 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongType, &v28);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFTypeRef v27 = Mutable;
  if (cf) {
    CFDictionaryAddValue(Mutable, kCFErrorUnderlyingErrorKey, cf);
  }
  if (v25) {
    CFDictionaryAddValue(v27, kSOSCountKey, v25);
  }
  if (v10) {
    CFDictionaryAddValue(v27, kCFErrorDescriptionKey, v10);
  }
  *a4 = CFErrorCreate(kCFAllocatorDefault, a2, a1, v27);
  if (v25) {
    CFRelease(v25);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (cf)
  {
    CFStringRef v20 = cf;
LABEL_44:
    CFRelease(v20);
  }
}

void sub_100004C0C(CFIndex a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, CFStringRef format, ...)
{
  va_start(va, format);
  sub_10000495C(a1, @"com.apple.security.cfder.error", 0, a4, format, va);
}

void sub_100004C48(uint64_t a1, __CFString **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFTypeRef cf = 0;
  if (a2)
  {
    sub_10000495C(-1, kCFErrorDomainOSStatus, *a2, &cf, @"Invalid date: %i, %i, %i, %i, %i, %i, %i", &a9);
    *a2 = (__CFString *)cf;
  }
  else
  {
    sub_10000495C(-1, kCFErrorDomainOSStatus, 0, &cf, @"Invalid date: %i, %i, %i, %i, %i, %i, %i", &a9);
    CFTypeRef v10 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v10);
    }
  }
}

uint64_t sub_100004CDC(const __CFString *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a1)
  {
    sub_100004C0C(-5, (uint64_t)a2, a3, a2, a5, @"Null CFType");
    return 0;
  }
  CFTypeID v7 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() == v7)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    if (Count >= 1)
    {
      uint64_t v9 = 0;
      unint64_t v10 = Count + 1;
      do
      {
        CFDataRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v10 - 2);
        v9 += sub_100004CDC(ValueAtIndex, a2);
        --v10;
      }
      while (v10 > 1);
    }
    goto LABEL_14;
  }
  if (CFBooleanGetTypeID() == v7)
  {
LABEL_14:
    return ccder_sizeof();
  }
  if (CFDataGetTypeID() == v7)
  {
    CFIndex Length = CFDataGetLength((CFDataRef)a1);
    return _ccder_sizeof_raw_octet_string(Length);
  }
  if (CFDateGetTypeID() == v7)
  {
    CFDateGetAbsoluteTime((CFDateRef)a1);
    __dtoa();
    __freedtoa();
    goto LABEL_14;
  }
  if (CFDictionaryGetTypeID() == v7)
  {
    return sub_100003F24((const __CFDictionary *)a1, (uint64_t)a2);
  }
  if (CFSetGetTypeID() == v7)
  {
    return sub_100005E14((const __CFSet *)a1, (uint64_t)a2);
  }
  if (CFStringGetTypeID() == v7)
  {
    return sub_100005C50(a1);
  }
  if (CFNumberGetTypeID() != v7)
  {
    if (CFNullGetTypeID() == v7) {
      goto LABEL_14;
    }
    sub_100004C0C(-5, v14, v15, a2, v16, @"Unsupported CFType");
    return 0;
  }

  return sub_10000474C((const __CFNumber *)a1, a2);
}

uint64_t sub_100004F70(const __CFString *a1, CFTypeRef *a2, uint64_t a3, UInt8 *a4, unint64_t a5)
{
  if (!a1)
  {
    sub_100004C0C(-5, (uint64_t)a2, a3, a2, a5, @"Null CFType");
    return 0;
  }
  CFTypeID v10 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() == v10)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    if (Count >= 1)
    {
      unint64_t v12 = Count + 1;
      uint64_t v13 = a5;
      do
      {
        CFDataRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v12 - 2);
        uint64_t v13 = sub_100004F70(ValueAtIndex, a2, a3, a4, v13);
        --v12;
      }
      while (v12 > 1);
    }
LABEL_6:
    uint64_t v15 = ccder_encode_constructed_tl();
    goto LABEL_14;
  }
  if (CFBooleanGetTypeID() == v10)
  {
    buf[0] = CFBooleanGetValue((CFBooleanRef)a1);
    ccder_encode_body();
LABEL_13:
    uint64_t v15 = ccder_encode_tl();
LABEL_14:
    uint64_t v19 = v15;
    if (!v15) {
      sub_100004C0C(-7, v16, v17, a2, v18, @"ccder failed to encode");
    }
    return v19;
  }
  if (CFDataGetTypeID() == v10)
  {
    CFDataGetLength((CFDataRef)a1);
    CFDataGetBytePtr((CFDataRef)a1);
    ccder_encode_body();
    goto LABEL_13;
  }
  if (CFDateGetTypeID() == v10)
  {
    double AbsoluteTime = CFDateGetAbsoluteTime((CFDateRef)a1);
    uint64_t v84 = 0;
    uint64_t v85 = 0;
    uint64_t v83 = 0;
    CFErrorRef err = 0;
    p_CFErrorRef err = &err;
    uint64_t v88 = 0x2000000000;
    char v89 = -86;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 0x40000000;
    *(void *)&buf[16] = sub_1000046E8;
    v97 = &unk_100008800;
    v98 = &err;
    double v99 = AbsoluteTime;
    v100 = (char *)&v85 + 4;
    v101 = &v85;
    v102 = (char *)&v84 + 4;
    v103 = &v84;
    v104 = (char *)&v83 + 4;
    v105 = &v83;
    if (qword_10000C320 != -1) {
      dispatch_once(&qword_10000C320, &stru_100008798);
    }
    block = _NSConcreteStackBlock;
    uint64_t p_block = 0x40000000;
    uint64_t v93 = (uint64_t)sub_1000043F4;
    v94 = &unk_100008728;
    v95 = buf;
    dispatch_sync((dispatch_queue_t)qword_10000C328, &block);
    if (*((unsigned char *)p_err + 24))
    {
      _Block_object_dispose(&err, 8);
    }
    else
    {
      sub_100004C0C(-1, v22, v23, a2, v24, @"Failed to encode date.");
      int v32 = *((unsigned __int8 *)p_err + 24);
      _Block_object_dispose(&err, 8);
      if (!v32)
      {
        v37 = sub_100003E94("SecError");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          if (a2) {
            CFTypeRef v38 = *a2;
          }
          else {
            CFTypeRef v38 = 0;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "der: unable to encode date: %@", buf, 0xCu);
        }
        goto LABEL_6;
      }
    }
    CFErrorRef err = 0;
    int v33 = HIDWORD(v85);
    if ((v85 & 0x300000000) != 0)
    {
      BOOL v34 = 0;
    }
    else
    {
      HIDWORD(v35) = -1030792151 * HIDWORD(v85) + 85899344;
      LODWORD(v35) = HIDWORD(v35);
      if ((v35 >> 2) <= 0x28F5C28)
      {
        HIDWORD(v39) = -1030792151 * HIDWORD(v85) + 85899344;
        LODWORD(v39) = HIDWORD(v39);
        BOOL v34 = (v39 >> 4) < 0xA3D70B;
      }
      else
      {
        BOOL v34 = 1;
      }
    }
    int v41 = HIDWORD(v84);
    int v40 = v85;
    int v42 = HIDWORD(v83);
    if ((int)v83 <= 61
      && SHIDWORD(v83) <= 59
      && (int)v84 <= 23
      && (v85 - 13) >= 0xFFFFFFF4
      && (HIDWORD(v84) - 32) >= 0xFFFFFFE1
      && (v85 != 2 || (v34 | 0x1C) >= HIDWORD(v84)))
    {
      if (v85 == 2)
      {
        int v40 = 2;
        goto LABEL_77;
      }
      if (dword_100007508[v85] - dword_100007508[(v85 - 1)] >= SHIDWORD(v84))
      {
LABEL_77:
        if ((unint64_t)(a4 + 1) <= a5)
        {
          *(unsigned char *)(a5 - 1) = 90;
          unint64_t v54 = a5 - 1;
        }
        else
        {
          unint64_t v54 = 0;
        }
        int v81 = v84;
        int v82 = v83;
        int v90 = -1431655766;
        LODWORD(block) = -1431655766;
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v55 = __dtoa();
        int v56 = (int)block;
        uint64_t v57 = *(void *)buf;
        if (AbsoluteTime < 0.0)
        {
          unint64_t v58 = v55 + (block & ~((int)block >> 31));
          if (v58 < *(void *)buf)
          {
            v59 = (unsigned char *)(*(void *)buf - 1);
            for (unsigned char *v59 = 106 - *(unsigned char *)(*(void *)buf - 1); (unint64_t)v59 > v58; unsigned char *v59 = 105 - v60)
              char v60 = *--v59;
          }
          int v56 = (int)block;
          uint64_t v57 = *(void *)buf;
        }
        if (v57 - v55 <= v56) {
          goto LABEL_102;
        }
        if (v56 < 0)
        {
          int v80 = v33;
          ccder_encode_body();
          size_t v61 = -(uint64_t)(int)block;
          v62 = (void *)ccder_encode_body_nocopy();
          unint64_t v54 = (unint64_t)v62;
          if (!v62)
          {
            int v33 = v80;
            goto LABEL_102;
          }
          if (AbsoluteTime >= 0.0) {
            int v63 = 48;
          }
          else {
            int v63 = 57;
          }
          memset(v62, v63, v61);
          int v33 = v80;
        }
        else
        {
          unint64_t v54 = ccder_encode_body();
        }
        if ((unint64_t)(a4 + 1) <= v54) {
          *(unsigned char *)--unint64_t v54 = 46;
        }
        else {
          unint64_t v54 = 0;
        }
LABEL_102:
        __freedtoa();
        if (!v54) {
          goto LABEL_110;
        }
        unint64_t v70 = (unint64_t)(a4 + 2);
        if ((unint64_t)(a4 + 2) > v54) {
          goto LABEL_110;
        }
        *(unsigned char *)(v54 - 2) = v82 / 10 + 48;
        *(unsigned char *)(v54 - 1) = v82 % 10 + 48;
        if (v70 > v54 - 2) {
          goto LABEL_110;
        }
        *(unsigned char *)(v54 - 4) = v42 / 10 + 48;
        *(unsigned char *)(v54 - 3) = v42 % 10 + 48;
        if (v70 > v54 - 4) {
          goto LABEL_110;
        }
        *(unsigned char *)(v54 - 6) = v81 / 10 + 48;
        *(unsigned char *)(v54 - 5) = v81 % 10 + 48;
        if (v70 > v54 - 6) {
          goto LABEL_110;
        }
        *(unsigned char *)(v54 - 8) = v41 / 10 + 48;
        *(unsigned char *)(v54 - 7) = v41 % 10 + 48;
        if (v70 <= v54 - 8
          && (*(unsigned char *)(v54 - 10) = v40 / 10 + 48, *(unsigned char *)(v54 - 9) = v40 % 10 + 48, v70 <= v54 - 10)
          && (unsigned int v71 = (((103 * (v33 % 100)) >> 15) & 1) + ((103 * (v33 % 100)) >> 10),
              *(unsigned char *)(v54 - 12) = v71 + 48,
              *(unsigned char *)(v54 - 11) = v33 % 100 - 10 * v71 + 48,
              v70 <= v54 - 12))
        {
          *(unsigned char *)(v54 - 14) = v33 / 1000 + 48;
          *(unsigned char *)(v54 - 13) = v33 / 100 % 10 + 48;
        }
        else
        {
LABEL_110:
          sub_100004C0C(-7, v67, v68, a2, v69, @"ccder failed to encode");
        }
        goto LABEL_6;
      }
    }
    uint64_t v78 = v83;
    BOOL v79 = v34;
    uint64_t v76 = v84;
    uint64_t v77 = HIDWORD(v83);
    uint64_t v74 = v85;
    uint64_t v75 = HIDWORD(v84);
    sub_100004C48(v25, (__CFString **)&err, v26, v27, v28, v29, v30, v31, SBYTE4(v85));
    v43 = (__CFString *)CFErrorCopyDescription(err);
    uint64_t v44 = sub_100003E94("SecError");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1405091842;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Simulating crash, reason: %@, code=%08x", buf, 0x12u);
    }

    int v45 = dword_10000C300;
    if (dword_10000C300 == -1)
    {
      if (sub_1000061F4())
      {
        uint64_t v46 = getpid();
        id v47 = v43;
        block = 0;
        uint64_t p_block = (uint64_t)&block;
        uint64_t v93 = 0x2020000000;
        NSErrorUserInfoKey v48 = (void (*)(uint64_t, uint64_t, __CFString *))off_10000C348;
        v94 = off_10000C348;
        if (!off_10000C348)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_1000062C4;
          v97 = &unk_100008860;
          v98 = (CFErrorRef *)&block;
          v49 = sub_100006314();
          CFStringRef v50 = dlsym(v49, "SimulateCrash");
          *((void *)v98[1] + 3) = v50;
          off_10000C348 = (_UNKNOWN *)*((void *)v98[1] + 3);
          NSErrorUserInfoKey v48 = *(void (**)(uint64_t, uint64_t, __CFString *))(p_block + 24);
        }
        _Block_object_dispose(&block, 8);
        if (!v48)
        {
          v72 = +[NSAssertionHandler currentHandler];
          v73 = +[NSString stringWithUTF8String:"BOOL soft_SimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)"];
          objc_msgSend(v72, "handleFailureInFunction:file:lineNumber:description:", v73, @"simulate_crash.m", 22, @"%s", dlerror(), v74, v75, v76, v77, v78, v79);

          __break(1u);
        }
        v48(v46, 1405091842, v47);

        goto LABEL_66;
      }
      int v45 = dword_10000C300;
    }
    dword_10000C300 = v45 + 1;
LABEL_66:
    if (v43) {
      CFRelease(v43);
    }
    v51 = sub_100003E94("SecError");
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = "continuing";
      if (a3) {
        v52 = "setting default value";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = err;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v52;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "der: invalid date: %@; %s", buf, 0x16u);
    }
    CFErrorRef v53 = err;
    if (err)
    {
      CFErrorRef err = 0;
      CFRelease(v53);
    }
    if (a3)
    {
      int v33 = 2001;
      int v42 = 1;
      uint64_t v85 = 0x7D100000001;
      HIDWORD(v84) = 1;
      HIDWORD(v83) = 1;
      int v41 = 1;
      int v40 = 1;
    }
    else
    {
      int v40 = v85;
      int v33 = HIDWORD(v85);
      int v41 = HIDWORD(v84);
      int v42 = HIDWORD(v83);
    }
    goto LABEL_77;
  }
  if (CFDictionaryGetTypeID() == v10)
  {
    return sub_100004068((const __CFDictionary *)a1, a2, a3);
  }
  if (CFSetGetTypeID() == v10)
  {
    return sub_100005EC8((const __CFSet *)a1, a2, a3);
  }
  if (CFStringGetTypeID() == v10)
  {
    return sub_100005CD0(a1, a2, a4, a5, v36);
  }
  if (CFNumberGetTypeID() == v10)
  {
    return sub_100004820((const __CFNumber *)a1, a2, (uint64_t)a4, a5);
  }
  if (CFNullGetTypeID() != v10)
  {
    sub_100004C0C(-5, v64, v65, a2, v66, @"Unsupported CFType");
    return 0;
  }

  return sub_100005DC0(a2);
}

void sub_100005C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t sub_100005C50(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex usedBufLen = 0;
  v6.location = 0;
  v6.size_t length = Length;
  CFStringGetBytes(a1, v6, 0x8000100u, 0, 0, 0, MaximumSizeForEncoding, &usedBufLen);
  return ccder_sizeof();
}

uint64_t sub_100005CD0(const __CFString *a1, CFTypeRef *a2, UInt8 *a3, uint64_t a4, uint64_t a5)
{
  if (a4)
  {
    CFIndex Length = CFStringGetLength(a1);
    CFIndex usedBufLen = 0;
    v18.location = 0;
    v18.size_t length = Length;
    if (CFStringGetBytes(a1, v18, 0x8000100u, 0, 0, a3, a4 - (void)a3, &usedBufLen) == Length)
    {
      ccder_encode_body();
      uint64_t result = ccder_encode_tl();
      if (result) {
        return result;
      }
      sub_100004C0C(-7, v14, v15, a2, v16, @"ccder failed to encode");
    }
    else
    {
      sub_100004C0C(-5, v10, v11, a2, v12, @"String extraction failed");
    }
  }
  else
  {
    sub_100004C0C(-6, (uint64_t)a2, (uint64_t)a3, a2, a5, @"null input");
  }
  return 0;
}

uint64_t sub_100005DC0(CFTypeRef *a1)
{
  uint64_t v5 = ccder_encode_tl();
  if (!v5) {
    sub_100004C0C(-7, v2, v3, a1, v4, @"ccder failed to encode");
  }
  return v5;
}

uint64_t sub_100005E14(const __CFSet *a1, uint64_t a2)
{
  long long v3 = xmmword_1000074B0;
  LOBYTE(v3) = 1;
  uint64_t v4 = a2;
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_100005E80, &v3);
  if ((_BYTE)v3) {
    return ccder_sizeof();
  }
  else {
    return 0;
  }
}

uint64_t sub_100005E80(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)a2)
  {
    uint64_t result = sub_100004CDC(result, *(void *)(a2 + 16));
    if (result) {
      *(void *)(a2 + 8) += result;
    }
    else {
      *(unsigned char *)a2 = 0;
    }
  }
  return result;
}

uint64_t sub_100005EC8(const __CFSet *a1, CFTypeRef *a2, char a3)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  v14[0] = 0xAAAAAAAAAAAAAA01;
  v14[1] = a2;
  BYTE1(v14[0]) = a3;
  v14[2] = Mutable;
  v14[3] = 0;
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_10000610C, v14);
  if (!LOBYTE(v14[0]))
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0;
  }
  v15.size_t length = CFArrayGetCount(Mutable);
  v15.location = 0;
  CFArraySortValues(Mutable, v15, (CFComparatorFunction)sub_100006044, 0);
  CFIndex Count = CFArrayGetCount(Mutable);
  if (Count >= 1)
  {
    unint64_t v8 = Count + 1;
    do
    {
      CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(Mutable, v8 - 2);
      CFDataGetLength(ValueAtIndex);
      CFDataGetBytePtr(ValueAtIndex);
      ccder_encode_body();
      --v8;
    }
    while (v8 > 1);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t result = ccder_encode_constructed_tl();
  if (!result)
  {
    sub_100004C0C(-7, v11, v12, a2, v13, @"ccder failed to encode");
    return 0;
  }
  return result;
}

uint64_t sub_100006044(const __CFData *a1, const __CFData *a2)
{
  CFIndex Length = CFDataGetLength(a1);
  CFIndex v5 = CFDataGetLength(a2);
  unint64_t v6 = v5;
  if (Length < 0 || v5 < 0)
  {
    if (Length >= v5) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = -1;
    }
    if (Length <= v5) {
      return v12;
    }
    else {
      return 1;
    }
  }
  else
  {
    if (Length >= v5) {
      size_t v7 = v5;
    }
    else {
      size_t v7 = Length;
    }
    BytePtr = CFDataGetBytePtr(a1);
    uint64_t v9 = CFDataGetBytePtr(a2);
    int v10 = memcmp(BytePtr, v9, v7);
    if (v10 <= 0 && (v10 || Length <= v6))
    {
      LODWORD(v13) = v10 == 0;
      if (Length >= v6) {
        LODWORD(v13) = 0;
      }
      if (v10 < 0) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v13;
      }
      return v13 << 63 >> 63;
    }
    else
    {
      return 1;
    }
  }
}

void sub_10000610C(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(unsigned char *)a2)
  {
    CFIndex v7 = sub_100004CDC(a1, *(CFTypeRef **)(a2 + 8), a3, a4, a5);
    if (!v7)
    {
      *(unsigned char *)a2 = 0;
      return;
    }
    CFIndex v8 = v7;
    CFMutableArrayRef Mutable = CFDataCreateMutable(*(CFAllocatorRef *)(a2 + 24), v7);
    CFDataSetLength(Mutable, v8);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    uint64_t v11 = sub_100004F70(a1, *(void *)(a2 + 8), *(unsigned __int8 *)(a2 + 1), MutableBytePtr, &MutableBytePtr[v8]);
    if (v11)
    {
      v13.size_t length = v11 - (void)MutableBytePtr;
      v13.location = 0;
      CFDataDeleteBytes(Mutable, v13);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 16), Mutable);
      if (!Mutable) {
        return;
      }
    }
    else
    {
      *(unsigned char *)a2 = 0;
      if (!Mutable) {
        return;
      }
    }
    CFRelease(Mutable);
  }
}

uint64_t sub_1000061F4()
{
  if (!qword_10000C340) {
    qword_10000C340 = _sl_dlopen();
  }
  return qword_10000C340;
}

void *sub_1000062C4(uint64_t a1)
{
  uint64_t v2 = sub_100006314();
  uint64_t result = dlsym(v2, "SimulateCrash");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000C348 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100006314()
{
  uint64_t v0 = sub_1000061F4();
  if (v0) {
    return (void *)v0;
  }
  CFTimeZoneRef v1 = +[NSAssertionHandler currentHandler];
  long long v3 = +[NSString stringWithUTF8String:"void *CrashReporterSupportLibrary(void)"];
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v3, @"simulate_crash.m", 18, @"%s", 0);

  __break(1u);
  free(v4);
  return v1;
}

uint64_t sub_1000063C4()
{
  uint64_t result = _sl_dlopen();
  qword_10000C340 = result;
  return result;
}

void sub_100006438(size_t size, uint64_t a2)
{
  if (size)
  {
    if (size > 0x800)
    {
      CFIndex v5 = malloc_type_malloc(size, 0x9C1A2F70uLL);
      (*(void (**)(uint64_t, size_t, void *))(a2 + 16))(a2, size, v5);
      if (v5)
      {
        free(v5);
      }
    }
    else
    {
      __chkstk_darwin();
      memset((char *)&v6 - ((size + 15) & 0xFFFFFFFFFFFFFFF0), 170, size);
      (*(void (**)(uint64_t, size_t, char *))(a2 + 16))(a2, size, (char *)&v6 - ((size + 15) & 0xFFFFFFFFFFFFFFF0));
    }
  }
  else
  {
    uint64_t v4 = *(void (**)(uint64_t, void, void))(a2 + 16);
    v4(a2, 0, 0);
  }
}

void sub_1000065C0(uint64_t a1, char *string)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return _CFCalendarCreateWithIdentifier(allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  long long v3 = va_arg(va, const char *);
  return _CFCalendarDecomposeAbsoluteTime(calendar, at, v3);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return _CFDataGetMutableBytePtr(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return _CFDateGetAbsoluteTime(theDate);
}

CFTypeID CFDateGetTypeID(void)
{
  return _CFDateGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return _CFErrorCopyUserInfo(err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return _CFNullGetTypeID();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFTypeID CFSetGetTypeID(void)
{
  return _CFSetGetTypeID();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return _CFTimeZoneCreateWithTimeIntervalFromGMT(allocator, ti);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __dtoa()
{
  return ___dtoa();
}

uint64_t __freedtoa()
{
  return ___freedtoa();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void bzero(void *a1, size_t a2)
{
}

uint64_t ccder_encode_body()
{
  return _ccder_encode_body();
}

uint64_t ccder_encode_body_nocopy()
{
  return _ccder_encode_body_nocopy();
}

uint64_t ccder_encode_constructed_tl()
{
  return _ccder_encode_constructed_tl();
}

uint64_t ccder_encode_tl()
{
  return _ccder_encode_tl();
}

uint64_t ccder_sizeof()
{
  return _ccder_sizeof();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void syslog(int a1, const char *a2, ...)
{
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_urlRequest(void *a1, const char *a2, ...)
{
  return [a1 urlRequest];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForHTTPHeaderField:");
}