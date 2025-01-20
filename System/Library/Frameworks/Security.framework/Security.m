void start()
{
  void *v0;

  sub_100004E14();
  dispatch_main();
}

void sub_100004E14()
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.security.swcagent", 0, 1uLL);
  v1 = (void *)qword_100010318;
  qword_100010318 = (uint64_t)mach_service;

  if (!qword_100010318)
  {
    v3 = sub_1000067C0("SecCritical");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "swcagent failed to register xpc listener, exiting", v4, 2u);
    }

    abort();
  }
  xpc_connection_set_event_handler((xpc_connection_t)qword_100010318, &stru_10000C608);
  v2 = (_xpc_connection_s *)qword_100010318;

  xpc_connection_resume(v2);
}

void sub_100004ED4(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    xpc_connection_get_audit_token();
    memset(&token, 0, sizeof(token));
    v3 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    if (v3)
    {
      v4 = v3;
      CFBooleanRef v5 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v3, @"com.apple.private.associated-domains", 0);
      if (v5)
      {
        CFBooleanRef v6 = v5;
        CFTypeID v7 = CFGetTypeID(v5);
        if (CFBooleanGetTypeID() == v7)
        {
          int Value = CFBooleanGetValue(v6);
          CFRelease(v6);
          if (Value)
          {
            CFRelease(v4);
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_100005120;
            handler[3] = &unk_10000C658;
            v9 = v2;
            v13 = v9;
            xpc_connection_set_event_handler(v9, handler);
            xpc_connection_resume(v9);

            goto LABEL_15;
          }
        }
        else
        {
          CFRelease(v6);
        }
      }
      v11 = sub_1000067C0("SecError");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138412546;
        *(void *)&token.val[1] = v4;
        LOWORD(token.val[3]) = 2112;
        *(void *)((char *)&token.val[3] + 2) = @"com.apple.private.associated-domains";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "client %@ lacks entitlement %@", (uint8_t *)&token, 0x16u);
      }

      CFRelease(v4);
    }
    else
    {
      v10 = sub_1000067C0("SecError");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138412290;
        *(void *)&token.val[1] = v2;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "can't get sectask of connection %@", (uint8_t *)&token, 0xCu);
      }
    }
    xpc_connection_cancel(v2);
  }
LABEL_15:
}

void sub_100005120(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v4 = dispatch_get_global_queue(0, 0);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000051FC;
    v5[3] = &unk_10000C630;
    id v6 = *(id *)(a1 + 32);
    id v7 = v3;
    dispatch_async(v4, v5);
  }
}

void sub_1000051FC(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  v2 = (_xpc_connection_s *)*(id *)(a1 + 32);
  id v3 = v1;
  CFTypeRef cf = 0;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
  {
    sub_100007CEC(1, @"com.apple.security.xpc", v4, &cf, v5, @"Messages expect to be xpc dictionary, got: %@", v3);
    id v6 = sub_1000067C0("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      buf[0].val[0] = 138412546;
      *(void *)&buf[0].val[1] = 0;
      LOWORD(buf[0].val[3]) = 2112;
      *(void *)((char *)&buf[0].val[3] + 2) = cf;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: returning error: %@", (uint8_t *)buf, 0x16u);
    }

    id v7 = sub_10000A088((__CFError *)cf);
    reply_with_format = (void *)xpc_create_reply_with_format();
    v9 = 0;
    v10 = 0;
    goto LABEL_80;
  }
  reply_with_format = xpc_dictionary_create_reply(v3);
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "operation");
  v12 = sub_1000067C0("swcagent_xpc");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if ((uint64 & 0xFFFFFFF8) != 0) {
      CFStringRef v37 = @"Unknown xpc operation";
    }
    else {
      CFStringRef v37 = off_10000C6F8[(int)uint64];
    }
    buf[0].val[0] = 138412546;
    *(void *)&buf[0].val[1] = v37;
    LOWORD(buf[0].val[3]) = 2048;
    *(void *)((char *)&buf[0].val[3] + 2) = uint64;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "operation: %@ (%llu)", (uint8_t *)buf, 0x16u);
  }

  if (uint64 - 5 <= 1)
  {
    v13 = (void *)xpc_connection_copy_entitlement_value();

    v10 = 0;
    v9 = 0;
    if (v13) {
      goto LABEL_8;
    }
    goto LABEL_71;
  }
  size_t length = 0;
  data = (audit_token_t *)xpc_dictionary_get_data(v3, "client", &length);
  if (length != 32)
  {
    sub_100007D20(-34018, (__CFString **)&cf, @"swcagent_xpc - wrong length for client id");
LABEL_24:
    v10 = 0;
    v9 = 0;
    goto LABEL_71;
  }
  buf[0] = *data;
  audit_token_t token = buf[0];
  v22 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (!v22)
  {
    pid_t pidp = 0;
    audit_token_t token = buf[0];
    audit_token_to_au32(&token, 0, 0, 0, 0, 0, &pidp, 0, 0);
    sub_100007D20(-34018, (__CFString **)&cf, @"can't get entitlement of original client pid %d", pidp);
    goto LABEL_24;
  }
  v23 = v22;
  v24 = sub_100005CDC(v22);
  if (!v24)
  {
    sub_100007D20(-34018, (__CFString **)&cf, @"%@ lacks entitlement %@", v23, @"com.apple.developer.associated-domains");
    CFRelease(v23);
    goto LABEL_24;
  }
  CFRelease(v24);
  v9 = sub_100005CDC(v23);
  LODWORD(length) = -1431655766;
  long long v25 = *((_OWORD *)v23 + 2);
  *(_OWORD *)buf[0].val = *((_OWORD *)v23 + 1);
  *(_OWORD *)&buf[0].val[4] = v25;
  audit_token_to_au32(buf, 0, 0, 0, 0, 0, (pid_t *)&length, 0, 0);
  int v26 = length;
  v27 = objc_alloc_init(Client);
  if (v27)
  {
    bzero(buf, 0x400uLL);
    if (proc_pidpath(v26, buf, 0x400u) <= 0)
    {
      v30 = sub_1000067C0("swcagent");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 67109120;
        token.val[1] = v26;
        goto LABEL_60;
      }
    }
    else
    {
      char v63 = 0;
      v28 = +[NSString stringWithUTF8String:buf];
      [(Client *)v27 setPath:v28];
      if (v28)
      {
        [(Client *)v27 path];
        v29 = v57 = v27;
        v30 = +[NSURL fileURLWithPath:v29];

        v27 = v57;
        if (v30)
        {
          v56 = (void *)_CFBundleCopyBundleURLForExecutableURL();
          if (!v56) {
            goto LABEL_64;
          }
          v31 = +[NSBundle bundleWithURL:v56];
          [(Client *)v57 setBundle:v31];
          if (!v31) {
            goto LABEL_64;
          }
          v32 = [(Client *)v57 bundle];
          v33 = [v32 bundleIdentifier];
          [(Client *)v57 setClient:v33];

          v27 = v57;
          if (v33)
          {
            [(Client *)v57 setClient_type:0];
            v34 = [(Client *)v57 client];
            v35 = +[LSApplicationProxy applicationProxyForIdentifier:v34];
            v36 = [v35 localizedNameForContext:0];
            [(Client *)v57 setClient_name:v36];

            v27 = v57;
            v10 = v57;
          }
          else
          {
LABEL_64:
            v53 = sub_1000067C0("swcagent");
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              token.val[0] = 136315138;
              *(void *)&token.val[1] = buf;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Refusing client without bundle identifier (%s)", (uint8_t *)&token, 0xCu);
            }

            v10 = 0;
          }

          goto LABEL_68;
        }
      }
      v30 = sub_1000067C0("swcagent");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 67109120;
        token.val[1] = v26;
LABEL_60:
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Refusing client without path (pid %d)", (uint8_t *)&token, 8u);
      }
    }
    v10 = 0;
LABEL_68:

    goto LABEL_69;
  }
  v10 = 0;
LABEL_69:

  CFRelease(v23);
  if (v9 && v10)
  {
LABEL_8:
    switch(uint64)
    {
      case 0uLL:
        CFDictionaryRef v16 = (const __CFDictionary *)sub_1000065D4(v3, (__CFString **)&cf);
        if (v16)
        {
          CFDictionaryRef v17 = v16;
          v10 = v10;
          *(void *)buf[0].val = CFDictionaryGetValue(v17, kSecAttrServer);
          CFAllocatorRef v18 = kCFAllocatorDefault;
          CFArrayRef v19 = CFArrayCreate(kCFAllocatorDefault, (const void **)buf, 1, &kCFTypeArrayCallBacks);
          int v20 = 0;
          goto LABEL_34;
        }
        break;
      case 1uLL:
        CFDictionaryRef v38 = (const __CFDictionary *)sub_1000065D4(v3, (__CFString **)&cf);
        if (v38)
        {
          CFDictionaryRef v17 = v38;
          v10 = v10;
          *(void *)buf[0].val = CFDictionaryGetValue(v17, kSecAttrServer);
          CFAllocatorRef v18 = kCFAllocatorDefault;
          CFArrayRef v19 = CFArrayCreate(kCFAllocatorDefault, (const void **)buf, 1, &kCFTypeArrayCallBacks);
          int v20 = 1;
          goto LABEL_34;
        }
        break;
      case 2uLL:
        CFDictionaryRef v39 = (const __CFDictionary *)sub_1000065D4(v3, (__CFString **)&cf);
        if (v39)
        {
          CFDictionaryRef v17 = v39;
          v10 = v10;
          *(void *)buf[0].val = CFDictionaryGetValue(v17, kSecAttrServer);
          CFAllocatorRef v18 = kCFAllocatorDefault;
          CFArrayRef v19 = CFArrayCreate(kCFAllocatorDefault, (const void **)buf, 1, &kCFTypeArrayCallBacks);
          int v20 = 2;
          goto LABEL_34;
        }
        break;
      case 3uLL:
        CFDictionaryRef v40 = (const __CFDictionary *)sub_1000065D4(v3, (__CFString **)&cf);
        if (v40)
        {
          CFDictionaryRef v17 = v40;
          v10 = v10;
          *(void *)buf[0].val = CFDictionaryGetValue(v17, kSecAttrServer);
          CFAllocatorRef v18 = kCFAllocatorDefault;
          CFArrayRef v19 = CFArrayCreate(kCFAllocatorDefault, (const void **)buf, 1, &kCFTypeArrayCallBacks);
          int v20 = 3;
LABEL_34:
          char v41 = sub_100005D88(v20, v10, v19);

          token.val[0] = v41 & 3;
          CFStringRef v42 = (const __CFString *)CFNumberCreate(v18, kCFNumberSInt32Type, &token);
          if (v42)
          {
            CFStringRef v45 = v42;
            sub_1000062B4(reply_with_format, v42, &cf, v43, v44);
            CFRelease(v45);
          }
          goto LABEL_39;
        }
        break;
      case 4uLL:
        CFDictionaryRef v17 = (const __CFDictionary *)sub_100006538(v3, (__CFString **)&cf);
        v46 = sub_1000067C0("SecError");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          buf[0].val[0] = 138412290;
          *(void *)&buf[0].val[1] = v17;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "swcagent: unexpectedly got swca_select_request_id, items: %@", (uint8_t *)buf, 0xCu);
        }

        if (v17) {
LABEL_39:
        }
          CFRelease(v17);
        break;
      case 5uLL:
        sub_100007D20(-50, (__CFString **)&cf, @"object for key %s is NULL", "status");
        break;
      case 6uLL:
        v47 = sub_1000065D4(v3, (__CFString **)&cf);
        if (v47)
        {
          buf[0].val[0] = 1;
          CFStringRef v48 = (const __CFString *)CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, buf);
          sub_1000062B4(reply_with_format, v48, &cf, v49, v50);
          if (v48) {
            CFRelease(v48);
          }
        }
        if (qword_100010320) {
          CFRelease((CFTypeRef)qword_100010320);
        }
        qword_100010320 = (uint64_t)v47;
        break;
      case 7uLL:
        if (qword_100010350 != -1) {
          dispatch_once(&qword_100010350, &stru_10000C6D8);
        }
        if (off_100010348)
        {
          char v51 = off_100010348();
          v52 = (const __CFString **)&kCFBooleanTrue;
          if ((v51 & 1) == 0) {
            v52 = (const __CFString **)&kCFBooleanFalse;
          }
        }
        else
        {
          v52 = (const __CFString **)&kCFBooleanFalse;
        }
        sub_1000062B4(reply_with_format, *v52, &cf, v14, v15);
        break;
      default:
        break;
    }
  }
LABEL_71:
  if (!cf) {
    goto LABEL_81;
  }
  if (SecErrorGetOSStatus() != -25300)
  {
    v54 = sub_1000067C0("SecError");
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      if ((uint64 & 0xFFFFFFF8) != 0) {
        CFStringRef v55 = @"Unknown xpc operation";
      }
      else {
        CFStringRef v55 = off_10000C6F8[(int)uint64];
      }
      buf[0].val[0] = 138412802;
      *(void *)&buf[0].val[1] = 0;
      LOWORD(buf[0].val[3]) = 2112;
      *(void *)((char *)&buf[0].val[3] + 2) = v55;
      HIWORD(buf[0].val[5]) = 2112;
      *(void *)&buf[0].val[6] = cf;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%@ %@ %@", (uint8_t *)buf, 0x20u);
    }
  }
  id v7 = sub_10000A088((__CFError *)cf);
  xpc_dictionary_set_value(reply_with_format, "error", v7);
LABEL_80:

LABEL_81:
  if (reply_with_format) {
    xpc_connection_send_message(v2, reply_with_format);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v9) {
    CFRelease(v9);
  }
}

const void *sub_100005CDC(__SecTask *a1)
{
  CFTypeRef v1 = SecTaskCopyValueForEntitlement(a1, @"com.apple.developer.associated-domains", 0);
  v2 = v1;
  if (v1)
  {
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 != CFArrayGetTypeID())
    {
LABEL_8:
      CFRelease(v2);
      return 0;
    }
    CFIndex Count = CFArrayGetCount((CFArrayRef)v2);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      CFIndex v6 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v2, v6);
        CFTypeID v8 = CFGetTypeID(ValueAtIndex);
        if (v8 != CFStringGetTypeID()) {
          break;
        }
        if (v5 == ++v6) {
          return v2;
        }
      }
      goto LABEL_8;
    }
  }
  return v2;
}

CFOptionFlags sub_100005D88(int a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = 0;
  CFOptionFlags responseFlags = 3;
  while (qword_100010330 == -1)
  {
    if (v6) {
      goto LABEL_7;
    }
LABEL_4:
    if (!dispatch_semaphore_wait((dispatch_semaphore_t)qword_100010328, 0)) {
      goto LABEL_7;
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)qword_100010328, 0xFFFFFFFFFFFFFFFFLL);
    char v6 = 1;
  }
  dispatch_once(&qword_100010330, &stru_10000C698);
  if ((v6 & 1) == 0) {
    goto LABEL_4;
  }
LABEL_7:
  id v7 = +[NSMutableDictionary dictionary];
  if ([a3 count] == (id)1)
  {
    v29 = [a3 objectAtIndex:0];
  }
  else
  {
    v29 = 0;
  }
  CFTypeID v8 = v5;
  v9 = "ADD";
  switch(a1)
  {
    case 0:
      break;
    case 1:
      v9 = "UPDATE";
      break;
    case 2:
      v9 = "DELETE";
      break;
    case 3:
      if (v29) {
        v9 = "COPY";
      }
      else {
        v9 = "COPYALL";
      }
      break;
    default:
      v9 = "USE";
      break;
  }
  v10 = +[NSString stringWithFormat:@"SWC_REQUEST_%s", v9];
  v11 = sub_1000061D8();
  v12 = [v11 localizedStringForKey:v10 value:&stru_10000CB20 table:@"SharedWebCredentials"];

  v13 = +[NSString stringWithFormat:@"SWC_ALLOW_%s", v9];
  uint64_t v14 = objc_msgSend(v5, "client_name");
  uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v14, v29);
  [v7 setObject:v15 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

  CFDictionaryRef v16 = sub_1000061D8();
  CFDictionaryRef v17 = [v16 localizedStringForKey:@"SWC_INFO_MESSAGE" value:&stru_10000CB20 table:@"SharedWebCredentials"];
  [v7 setObject:v17 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

  CFAllocatorRef v18 = sub_1000061D8();
  CFArrayRef v19 = [v18 localizedStringForKey:@"SWC_NEVER" value:&stru_10000CB20 table:@"SharedWebCredentials"];
  [v7 setObject:v19 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

  int v20 = sub_1000061D8();
  v21 = [v20 localizedStringForKey:v13 value:&stru_10000CB20 table:@"SharedWebCredentials"];
  [v7 setObject:v21 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];

  v22 = sub_1000061D8();
  v23 = [v22 bundleURL];
  [v7 setObject:v23 forKeyedSubscript:kCFUserNotificationLocalizationURLKey];

  v24 = [v8 client];
  [v7 setObject:v24 forKeyedSubscript:SBUserNotificationAllowedApplicationsKey];

  SInt32 error = -1431655766;
  long long v25 = CFUserNotificationCreate(0, 0.0, 0x20uLL, &error, (CFDictionaryRef)v7);
  int v26 = v25;
  if (v25 && !error)
  {
    CFUserNotificationReceiveResponse(v25, 0.0, &responseFlags);
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_100010328);
    goto LABEL_21;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_100010328);
  if (v26)
  {
LABEL_21:
    CFRelease(v26);
    CFOptionFlags v27 = responseFlags;
  }
  else
  {
    CFOptionFlags v27 = 3;
  }

  return v27;
}

void sub_100006194(id a1)
{
  CFTypeRef v1 = dlopen("/System/Library/PrivateFrameworks/WebUI.framework/WebUI", 5);
  qword_100010358 = (uint64_t)v1;
  if (v1) {
    off_100010348 = (uint64_t (*)(void))dlsym(v1, "WBUAutoFillGetEnabledDataClasses");
  }
}

id sub_1000061D8()
{
  if (qword_100010340 != -1) {
    dispatch_once(&qword_100010340, &stru_10000C6B8);
  }
  v0 = (void *)qword_100010338;

  return v0;
}

void sub_10000622C(id a1)
{
  qword_100010338 = +[NSBundle bundleWithPath:@"/System/Library/Frameworks/Security.framework"];

  _objc_release_x1();
}

void sub_100006274(id a1)
{
  dispatch_semaphore_t v1 = dispatch_semaphore_create(1);
  v2 = (void *)qword_100010328;
  qword_100010328 = (uint64_t)v1;

  if (!v1) {
    abort();
  }
}

void sub_1000062B4(void *a1, const __CFString *a2, CFTypeRef *a3, uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    size_t v8 = sub_100008838(a2, a3, (uint64_t)a3, a4, a5);
    if (v8)
    {
      size_t v9 = v8;
      v10 = (UInt8 *)malloc_type_malloc(v8, 0x91A96E61uLL);
      unint64_t v11 = (unint64_t)&v10[v9];
      v12 = (const void *)sub_100008ADC(a2, a3, 0, v10, v11);
      if (v12 && v11 > (unint64_t)v12) {
        xpc_dictionary_set_data(a1, "status", v12, v11 - (void)v12);
      }
      free(v10);
    }
  }
  else
  {
    sub_100007D20(-50, (__CFString **)a3, @"object for key %s is NULL", "status");
  }
}

CFTypeRef sub_1000063A4(void *a1, __CFString **a2)
{
  size_t length = 0;
  CFTypeRef cf = 0;
  data = xpc_dictionary_get_data(a1, "query", &length);
  if (data)
  {
    uint64_t v4 = (uint64_t)data;
    uint64_t v5 = (uint64_t)data + length;
    uint64_t v6 = SecCFAllocatorZeroize();
    if (sub_100007DA4(v6, (uint64_t)&cf, (CFTypeRef *)a2, v4, v5) == v5)
    {
      CFTypeRef v10 = cf;
    }
    else
    {
      id v7 = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"trailing garbage after der decoded object for key %s", "query");
      sub_100007D20(-50, a2, @"%@", v7);
      if (a2)
      {
        size_t v8 = sub_1000067C0("SecError");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          size_t v9 = *a2;
          *(_DWORD *)buf = 138412290;
          uint64_t v15 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "xpc: %@", buf, 0xCu);
        }
      }
      sub_100009A60(v7);
      if (v7) {
        CFRelease(v7);
      }
      if (cf) {
        CFRelease(cf);
      }
      CFTypeRef v10 = 0;
    }
    cc_clear();
  }
  else
  {
    sub_100007D20(-50, a2, @"no object for key %s", "query");
    return 0;
  }
  return v10;
}

const void *sub_100006538(void *a1, __CFString **a2)
{
  CFTypeRef v3 = sub_1000063A4(a1, a2);
  uint64_t v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFArrayGetTypeID())
    {
      CFStringRef v6 = CFCopyTypeIDDescription(v5);
      sub_100007D20(-50, a2, @"object for key %s not array but %@", "query", v6);
      if (v6) {
        CFRelease(v6);
      }
      CFRelease(v4);
      return 0;
    }
  }
  return v4;
}

const void *sub_1000065D4(void *a1, __CFString **a2)
{
  CFTypeRef v3 = sub_1000063A4(a1, a2);
  uint64_t v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFDictionaryGetTypeID())
    {
      CFStringRef v6 = CFCopyTypeIDDescription(v5);
      sub_100007D20(-50, a2, @"object for key %s not dictionary but %@", "query", v6);
      if (v6) {
        CFRelease(v6);
      }
      CFRelease(v4);
      return 0;
    }
  }
  return v4;
}

const void *sub_100006670(const __CFString *a1)
{
  if (a1) {
    CFStringRef v1 = a1;
  }
  else {
    CFStringRef v1 = @"logging";
  }
  os_unfair_lock_lock_with_options();
  CFDictionaryRef Mutable = (const __CFDictionary *)qword_100010368;
  if (!qword_100010368)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFCopyStringDictionaryKeyCallBacks, 0);
    qword_100010368 = (uint64_t)Mutable;
  }
  int Value = CFDictionaryGetValue(Mutable, v1);
  if (!Value)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000;
    v5[2] = sub_100006770;
    v5[3] = &unk_10000C738;
    void v5[4] = v1;
    sub_100006F7C(v1, (uint64_t)v5);
    int Value = CFDictionaryGetValue((CFDictionaryRef)qword_100010368, v1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100010360);
  return Value;
}

void sub_100006770(uint64_t a1, const char *a2)
{
  v2 = (__CFDictionary *)qword_100010368;
  CFTypeRef v3 = *(const void **)(a1 + 32);
  os_log_t v4 = os_log_create("com.apple.securityd", a2);

  CFDictionaryAddValue(v2, v3, v4);
}

const void *sub_1000067C0(const char *a1)
{
  pthread_mutex_lock(&stru_1000102D0);
  pthread_mutex_unlock(&stru_1000102D0);
  if (a1)
  {
    CFStringRef v2 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x600u);
    CFTypeRef v3 = sub_100006670(v2);
    if (v2) {
      CFRelease(v2);
    }
    return v3;
  }
  else
  {
    return sub_100006670(0);
  }
}

uint64_t sub_100006850(const __CFDictionary *a1, uint64_t a2)
{
  long long v3 = xmmword_10000AF80;
  LOBYTE(v3) = 1;
  uint64_t v4 = a2;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)sub_1000068BC, &v3);
  if ((_BYTE)v3) {
    return ccder_sizeof();
  }
  else {
    return 0;
  }
}

uint64_t sub_1000068BC(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)a3)
  {
    result = sub_100006904(result, a2, *(CFTypeRef **)(a3 + 16));
    if (result) {
      *(void *)(a3 + 8) += result;
    }
    else {
      *(unsigned char *)a3 = 0;
    }
  }
  return result;
}

uint64_t sub_100006904(uint64_t a1, uint64_t a2, CFTypeRef *a3)
{
  if (sub_100008838(a1, a3) && sub_100008838(a2, a3))
  {
    return ccder_sizeof();
  }
  else
  {
    sub_100007CEC(-6, @"com.apple.security.cfder.error", v5, a3, v6, @"null input");
    return 0;
  }
}

uint64_t sub_10000699C(const __CFDictionary *a1, CFTypeRef *a2, char a3)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  v13[0] = 0xAAAAAAAAAAAAAA01;
  v13[1] = a2;
  BYTE1(v13[0]) = a3;
  v13[2] = Mutable;
  v13[3] = 0;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)sub_100006BE8, v13);
  if (!LOBYTE(v13[0]))
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0;
  }
  v14.size_t length = CFArrayGetCount(Mutable);
  v14.location = 0;
  CFArraySortValues(Mutable, v14, (CFComparatorFunction)sub_100006B20, 0);
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
    sub_100007CEC(-7, @"com.apple.security.cfder.error", v11, a2, v12, @"ccder failed to encode");
    return 0;
  }
  return result;
}

uint64_t sub_100006B20(const __CFData *a1, const __CFData *a2)
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
    size_t v9 = CFDataGetBytePtr(a2);
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

void sub_100006BE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)a3)
  {
    CFIndex v6 = sub_100006904(a1, a2, *(CFTypeRef **)(a3 + 8));
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
    uint64_t v13 = sub_100008ADC(a2, v11, v12, MutableBytePtr, v10);
    sub_100008ADC(a1, v11, v12, MutableBytePtr, v13);
    uint64_t v14 = ccder_encode_constructed_tl();
    if (v14)
    {
      v18.size_t length = v14 - (void)MutableBytePtr;
      v18.location = 0;
      CFDataDeleteBytes(Mutable, v18);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 16), Mutable);
      if (!Mutable) {
        return;
      }
    }
    else
    {
      sub_100007CEC(-7, @"com.apple.security.cfder.error", v15, v11, v16, @"ccder failed to encode");
      *(unsigned char *)a3 = 0;
      if (!Mutable) {
        return;
      }
    }
    CFRelease(Mutable);
  }
}

void sub_100006D38(uint64_t a1)
{
  if (qword_100010370 != -1) {
    dispatch_once(&qword_100010370, &stru_10000C7D0);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100006DE0;
  block[3] = &unk_10000C760;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_100010378, block);
}

uint64_t sub_100006DE0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (qword_100010380 != -1) {
    dispatch_once(&qword_100010380, &stru_10000C810);
  }
  uint64_t v2 = qword_100010388;
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

void sub_100006E4C(id a1)
{
  qword_100010388 = (uint64_t)CFCalendarCreateWithIdentifier(kCFAllocatorDefault, kCFGregorianCalendar);
  CFTimeZoneRef v1 = CFTimeZoneCreateWithTimeIntervalFromGMT(kCFAllocatorDefault, 0.0);
  CFCalendarSetTimeZone((CFCalendarRef)qword_100010388, v1);
  if (v1)
  {
    CFRelease(v1);
  }
}

void sub_100006ED0(id a1)
{
  qword_100010378 = (uint64_t)dispatch_queue_create("ZuluCalendar", 0);
}

uint64_t sub_100006EFC(uint64_t result, int a2, UInt8 *buffer)
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

void sub_100006F7C(const __CFString *a1, uint64_t a2)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 0x40000000;
  CFRange v8 = sub_1000070C4;
  size_t v9 = &unk_10000C7B0;
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
    v11[2] = sub_100006EFC;
    v11[3] = &unk_10000C788;
    v11[6] = 0;
    v11[7] = Length;
    v11[8] = usedBufLen;
    v11[4] = v7;
    v11[5] = a1;
    sub_100009F00(usedBufLen + 1, (uint64_t)v11);
  }
}

uint64_t sub_1000070C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000070D4(unsigned __int8 **a1, unint64_t a2, CFTypeRef *a3, uint64_t a4, uint64_t a5)
{
  CFIndex v7 = *a1;
  if (*a1)
  {
    if ((unint64_t)v7 >= a2)
    {
      sub_100007CEC(-1, @"com.apple.security.cfder.error", (uint64_t)a3, a3, a5, @"Unexpected end of datetime");
      *a1 = 0;
    }
    else
    {
      int v9 = *v7;
      int v8 = v9;
      *a1 = v7 + 1;
      if (((v9 << 24) - 956301313) > 0xF6FFFFFE) {
        return (v8 - 48);
      }
    }
  }
  sub_100007CEC(-1, @"com.apple.security.cfder.error", (uint64_t)a3, a3, a5, @"Not a decimal digit");
  *a1 = 0;
  return 0xFFFFFFFFLL;
}

unint64_t sub_100007174(double *a1, CFTypeRef *a2, unsigned int a3, unsigned __int8 *a4, unint64_t a5)
{
  unint64_t v5 = a5;
  v71 = a4;
  int v68 = sub_1000070D4(&v71, a5, a2, (uint64_t)a4, a5);
  int v67 = sub_1000070D4(&v71, v5, a2, v7, v8);
  int v66 = sub_1000070D4(&v71, v5, a2, v9, v10);
  int v13 = sub_1000070D4(&v71, v5, a2, v11, v12);
  int v16 = sub_1000070D4(&v71, v5, a2, v14, v15);
  int v19 = sub_1000070D4(&v71, v5, a2, v17, v18);
  int v22 = sub_1000070D4(&v71, v5, a2, v20, v21);
  int v25 = sub_1000070D4(&v71, v5, a2, v23, v24);
  int v28 = sub_1000070D4(&v71, v5, a2, v26, v27);
  int v34 = sub_1000070D4(&v71, v5, a2, v29, v30);
  v35 = 0;
  v36 = v71;
  double v37 = NAN;
  if (v71 && (unint64_t)v71 < v5)
  {
    int v38 = *v71;
    if (v38 == 46)
    {
      CFDictionaryRef v39 = v71 + 1;
      if ((unint64_t)(v71 + 1) < v5)
      {
        int v38 = *v39;
        if ((v38 - 58) < 0xFFFFFFF6)
        {
          CFStringRef v40 = @"fraction without digits";
LABEL_14:
          CFIndex v42 = -1;
LABEL_23:
          sub_100007CEC(v42, @"com.apple.security.cfder.error", v31, a2, v33, v40);
          v35 = 0;
          goto LABEL_24;
        }
        uint64_t v43 = 0;
        uint64_t v44 = v5 - (void)v71 - 2;
        unint64_t v45 = 1;
        while (v44)
        {
          int v46 = v38;
          if (v45 < 0x1999999999999999)
          {
            v45 *= 10;
            uint64_t v43 = (v38 - 48) + 10 * v43;
          }
          int v47 = *++v39;
          int v38 = v47;
          --v44;
          if ((v47 - 58) < 0xFFFFFFF6)
          {
            if (v46 == 48)
            {
              CFStringRef v40 = @"fraction ends in 0";
              goto LABEL_14;
            }
            double v37 = (double)(unint64_t)v43 / (double)v45;
            v36 = v39;
            goto LABEL_8;
          }
        }
      }
      CFStringRef v40 = @"overflow";
      CFIndex v42 = -8;
      goto LABEL_23;
    }
    double v37 = 0.0;
LABEL_8:
    if ((unint64_t)v36 < v5)
    {
      v35 = v36 + 1;
      v71 = v36 + 1;
      switch(v38)
      {
        case 'Z':
          double v48 = 0.0;
          goto LABEL_25;
        case '-':
          int v41 = -60;
          break;
        case '+':
          int v41 = 60;
          break;
        default:
          goto LABEL_24;
      }
      int v65 = v41;
      int v56 = sub_1000070D4(&v71, v5, a2, v32, v33);
      int v64 = sub_1000070D4(&v71, v5, a2, v57, v58) + 10 * v56;
      int v61 = sub_1000070D4(&v71, v5, a2, v59, v60);
      double v48 = (double)(int)((sub_1000070D4(&v71, v5, a2, v62, v63) + 10 * v61 + 60 * v64) * v65);
      v35 = v71;
      if (!v71) {
        return 0;
      }
      goto LABEL_25;
    }
    CFStringRef v40 = @"Unexpected end of datetime";
    goto LABEL_14;
  }
LABEL_24:
  sub_100007CEC(-1, @"com.apple.security.cfder.error", v31, a2, v33, @"Invalid datetime character");
  double v48 = NAN;
  if (!v35) {
    return 0;
  }
LABEL_25:
  if (v35 != (unsigned __int8 *)v5)
  {
    sub_100007CEC(-1, @"com.apple.security.cfder.error", v31, a2, v33, @"trailing garbage at end of datetime");
    return 0;
  }
  uint64_t v50 = (v13 + 10 * v66);
  uint64_t v51 = (v19 + 10 * v16);
  uint64_t v52 = (v25 + 10 * v22);
  v87[0] = 0;
  if (sub_10000761C(a3, (v67 + 10 * v68), v50, v51, v52, (v34 + 10 * v28), v87, (__CFString **)a2))
  {
    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x2000000000;
    char v86 = 0;
    int v79 = 0;
    v80 = (double *)((char *)&v78 + 4);
    uint64_t v81 = 0x2000000000;
    uint64_t v82 = 0;
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 0x40000000;
    v72[2] = sub_100007734;
    v72[3] = &unk_10000C838;
    v72[4] = &v83;
    v72[5] = (char *)&v78 + 4;
    unsigned int v73 = a3;
    int v74 = v67 + 10 * v68;
    int v75 = v50;
    int v76 = v51;
    int v77 = v52;
    uint64_t v78 = (v34 + 10 * v28);
    sub_100006D38((uint64_t)v72);
    if (*((unsigned char *)v84 + 24))
    {
      double v55 = v80[3] - v48;
    }
    else
    {
      sub_100007CEC(-1, @"com.apple.security.cfder.error", v53, a2, v54, @"Failed to encode date from components");
      double v55 = NAN;
    }
    _Block_object_dispose((char *)&v78 + 4, 8);
    _Block_object_dispose(&v83, 8);
    *a1 = v55;
    *a1 = v37 + v55;
  }
  else
  {
    unint64_t v5 = 0;
    *a1 = NAN;
  }
  return v5;
}

uint64_t sub_10000761C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7, __CFString **a8)
{
  if ((a1 & 3) != 0)
  {
    BOOL v8 = 0;
  }
  else
  {
    HIDWORD(v9) = -1030792151 * a1 + 85899344;
    LODWORD(v9) = HIDWORD(v9);
    if ((v9 >> 2) <= 0x28F5C28)
    {
      HIDWORD(v10) = -1030792151 * a1 + 85899344;
      LODWORD(v10) = HIDWORD(v10);
      BOOL v8 = (v10 >> 4) < 0xA3D70B;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  if (a7) {
    *a7 = v8;
  }
  if ((int)a6 <= 61
    && (int)a5 <= 59
    && (int)a4 <= 23
    && (a2 - 13) >= 0xFFFFFFF4
    && (a3 - 32) >= 0xFFFFFFE1
    && (a2 != 2 || (v8 | 0x1C) >= a3)
    && (a2 == 2 || dword_10000AFF0[a2] - dword_10000AFF0[(a2 - 1)] >= (int)a3))
  {
    return 1;
  }
  sub_100007D20(-1, a8, @"Invalid date: %i, %i, %i, %i, %i, %i, %i", a1, a2, a3, a4, a5, a6, v8);
  return 0;
}

uint64_t sub_100007734(uint64_t a1, CFCalendarRef calendar)
{
  uint64_t result = CFCalendarComposeAbsoluteTime(calendar, (CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), "yMdHms", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

uint64_t sub_1000077A8(uint64_t a1, CFCalendarRef calendar)
{
  uint64_t result = CFCalendarDecomposeAbsoluteTime(calendar, *(CFAbsoluteTime *)(a1 + 40), "yMdHms", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

uint64_t sub_10000780C(const __CFNumber *a1, CFTypeRef *a2)
{
  uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  if (CFNumberGetValue(a1, kCFNumberLongLongType, &valuePtr))
  {
    if ((HIBYTE(valuePtr) + 1) <= 1u)
    {
      uint64_t v5 = 9;
      uint64_t v6 = 48;
      do
      {
        if ((unint64_t)(v5 - 2) < 2) {
          break;
        }
        uint64_t v7 = valuePtr >> v6;
        --v5;
        v6 -= 8;
      }
      while (HIBYTE(valuePtr) == v7);
    }
    return ccder_sizeof();
  }
  else
  {
    sub_100007CEC(-4, @"com.apple.security.cfder.error", v3, a2, v4, @"Unable to get number from data");
    return 0;
  }
}

uint64_t sub_1000078E8(const __CFNumber *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4)
{
  uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  if (!CFNumberGetValue(a1, kCFNumberLongLongType, &valuePtr))
  {
    sub_100007CEC(-4, @"com.apple.security.cfder.error", v7, a2, v8, @"Unable to get number from data");
    return 0;
  }
  uint64_t v9 = valuePtr;
  unint64_t v10 = HIBYTE(valuePtr);
  if ((HIBYTE(valuePtr) + 1) > 1u)
  {
    unint64_t v15 = 8;
    if (!a4) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v11 = 9;
    uint64_t v12 = 48;
    uint64_t v13 = 1;
    while ((unint64_t)(v11 - 2) >= 2)
    {
      uint64_t v14 = valuePtr >> v12;
      --v11;
      v12 -= 8;
      if (v10 != v14)
      {
        uint64_t v13 = v11 - 1;
        goto LABEL_11;
      }
    }
    uint64_t v11 = 2;
LABEL_11:
    if ((((valuePtr >> (8 * v13 - 8)) ^ v10) & 0x80) != 0) {
      unint64_t v15 = v11;
    }
    else {
      unint64_t v15 = v13;
    }
    if (!a4) {
      goto LABEL_22;
    }
  }
  if (a4 - a3 < (uint64_t)v15)
  {
LABEL_22:
    sub_100007CEC(-3, @"com.apple.security.cfder.error", v7, a2, v8, @"Unknown size");
    return 0;
  }
  if (v15 <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v15;
  }
  do
  {
    *(unsigned char *)--a4 = v9;
    v9 >>= 8;
    --v16;
  }
  while (v16);
  uint64_t valuePtr = v9;
  uint64_t result = ccder_encode_tl();
  if (!result)
  {
    sub_100007CEC(-7, @"com.apple.security.cfder.error", v18, a2, v19, @"ccder failed to encode");
    return 0;
  }
  return result;
}

void sub_100007A3C(CFIndex a1, const __CFString *a2, __CFString *cf, CFTypeRef *a4, CFStringRef format, va_list arguments)
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
    uint64_t v23 = (const void *)kSOSCountKey;
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
  uint64_t v27 = Mutable;
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

void sub_100007CEC(CFIndex a1, const __CFString *a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, CFStringRef format, ...)
{
  va_start(va, format);
  sub_100007A3C(a1, a2, 0, a4, format, va);
}

void sub_100007D20(int a1, __CFString **a2, CFStringRef format, ...)
{
  va_start(va, format);
  CFTypeRef cf = 0;
  if (a2)
  {
    sub_100007A3C(a1, kCFErrorDomainOSStatus, *a2, &cf, format, va);
    *a2 = (__CFString *)cf;
  }
  else
  {
    sub_100007A3C(a1, kCFErrorDomainOSStatus, 0, &cf, format, va);
    CFTypeRef v4 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v4);
    }
  }
}

uint64_t sub_100007DA4(uint64_t a1, uint64_t a2, CFTypeRef *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a4;
  if (a4)
  {
    if (ccder_decode_tag()) {
      sub_100007CEC(-2, @"com.apple.security.cfder.error", v7, a3, v8, @"Unsupported DER Type");
    }
    else {
      sub_100007CEC(-1, @"com.apple.security.cfder.error", v7, a3, v8, @"invalid tag");
    }
    return 0;
  }
  else
  {
    sub_100007CEC(-6, @"com.apple.security.cfder.error", (uint64_t)a3, a3, a5, @"null input");
  }
  return v5;
}

uint64_t sub_100008838(const __CFString *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a1)
  {
    sub_100007CEC(-5, @"com.apple.security.cfder.error", a3, a2, a5, @"Null CFType");
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
        v9 += sub_100008838(ValueAtIndex, a2);
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
    return sub_100006850((const __CFDictionary *)a1, (uint64_t)a2);
  }
  if (CFSetGetTypeID() == v7)
  {
    return sub_100009678((const __CFSet *)a1, (uint64_t)a2);
  }
  if (CFStringGetTypeID() == v7)
  {
    return sub_100009494(a1);
  }
  if (CFNumberGetTypeID() != v7)
  {
    if (CFNullGetTypeID() == v7) {
      goto LABEL_14;
    }
    sub_100007CEC(-5, @"com.apple.security.cfder.error", v14, a2, v15, @"Unsupported CFType");
    return 0;
  }

  return sub_10000780C((const __CFNumber *)a1, a2);
}

uint64_t sub_100008ADC(const __CFString *a1, CFTypeRef *a2, uint64_t a3, UInt8 *a4, unint64_t a5)
{
  if (!a1)
  {
    sub_100007CEC(-5, @"com.apple.security.cfder.error", a3, a2, a5, @"Null CFType");
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
        uint64_t v13 = sub_100008ADC(ValueAtIndex, a2, a3, a4, v13);
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
    uint64_t v18 = v15;
    if (!v15) {
      sub_100007CEC(-7, @"com.apple.security.cfder.error", v16, a2, v17, @"ccder failed to encode");
    }
    return v18;
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
    uint64_t v56 = 0;
    uint64_t v57 = 0;
    uint64_t v55 = 0;
    CFErrorRef err = 0;
    p_CFErrorRef err = &err;
    uint64_t v60 = 0x2000000000;
    char v61 = -86;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 0x40000000;
    *(void *)&buf[16] = sub_1000077A8;
    int v65 = &unk_10000C860;
    int v66 = &err;
    double v67 = AbsoluteTime;
    int v68 = (char *)&v57 + 4;
    v69 = &v57;
    v70 = (char *)&v56 + 4;
    v71 = &v56;
    v72 = (char *)&v55 + 4;
    unsigned int v73 = &v55;
    sub_100006D38((uint64_t)buf);
    if (*((unsigned char *)p_err + 24))
    {
      _Block_object_dispose(&err, 8);
    }
    else
    {
      sub_100007CEC(-1, @"com.apple.security.cfder.error", v21, a2, v22, @"Failed to encode date.");
      int v23 = *((unsigned __int8 *)p_err + 24);
      _Block_object_dispose(&err, 8);
      if (!v23)
      {
        uint64_t v44 = sub_1000067C0("SecError");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          if (a2) {
            CFTypeRef v45 = *a2;
          }
          else {
            CFTypeRef v45 = 0;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "der: unable to encode date: %@", buf, 0xCu);
        }
        goto LABEL_6;
      }
    }
    CFErrorRef err = 0;
    if ((sub_10000761C(HIDWORD(v57), v57, HIDWORD(v56), v56, HIDWORD(v55), v55, 0, (__CFString **)&err) & 1) == 0)
    {
      CFNumberRef v24 = (__CFString *)CFErrorCopyDescription(err);
      sub_100009A60(v24);
      if (v24) {
        CFRelease(v24);
      }
      CFNumberRef v25 = sub_1000067C0("SecError");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = "continuing";
        if (a3) {
          uint64_t v26 = "setting default value";
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = err;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "der: invalid date: %@; %s", buf, 0x16u);
      }
      CFErrorRef v27 = err;
      if (err)
      {
        CFErrorRef err = 0;
        CFRelease(v27);
      }
      if (a3)
      {
        uint64_t v57 = 0x7D100000001;
        HIDWORD(v56) = 1;
        HIDWORD(v55) = 1;
      }
    }
    if ((unint64_t)(a4 + 1) <= a5)
    {
      *(unsigned char *)(a5 - 1) = 90;
      unint64_t v28 = a5 - 1;
    }
    else
    {
      unint64_t v28 = 0;
    }
    int v30 = v57;
    int v29 = HIDWORD(v57);
    int v31 = HIDWORD(v55);
    int v53 = HIDWORD(v56);
    int v54 = v56;
    int v32 = v55;
    int v62 = -1431655766;
    int v63 = -1431655766;
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v33 = __dtoa();
    int v34 = v63;
    uint64_t v35 = *(void *)buf;
    if (AbsoluteTime < 0.0)
    {
      unint64_t v36 = v33 + (v63 & ~(v63 >> 31));
      if (v36 < *(void *)buf)
      {
        double v37 = (unsigned char *)(*(void *)buf - 1);
        for (*double v37 = 106 - *(unsigned char *)(*(void *)buf - 1); (unint64_t)v37 > v36; *double v37 = 105 - v38)
          char v38 = *--v37;
      }
      int v34 = v63;
      uint64_t v35 = *(void *)buf;
    }
    if (v35 - v33 <= v34) {
      goto LABEL_75;
    }
    if (v34 < 0)
    {
      int v52 = v30;
      int v40 = v29;
      ccder_encode_body();
      size_t v41 = -(uint64_t)v63;
      CFIndex v42 = (void *)ccder_encode_body_nocopy();
      unint64_t v28 = (unint64_t)v42;
      if (!v42)
      {
        int v29 = v40;
        int v30 = v52;
        goto LABEL_75;
      }
      if (AbsoluteTime >= 0.0) {
        int v43 = 48;
      }
      else {
        int v43 = 57;
      }
      memset(v42, v43, v41);
      int v29 = v40;
      int v30 = v52;
    }
    else
    {
      unint64_t v28 = ccder_encode_body();
    }
    if ((unint64_t)(a4 + 1) <= v28) {
      *(unsigned char *)--unint64_t v28 = 46;
    }
    else {
      unint64_t v28 = 0;
    }
LABEL_75:
    __freedtoa();
    if (!v28) {
      goto LABEL_83;
    }
    unint64_t v50 = (unint64_t)(a4 + 2);
    if ((unint64_t)(a4 + 2) > v28) {
      goto LABEL_83;
    }
    *(unsigned char *)(v28 - 2) = v32 / 10 + 48;
    *(unsigned char *)(v28 - 1) = v32 % 10 + 48;
    if (v50 > v28 - 2) {
      goto LABEL_83;
    }
    *(unsigned char *)(v28 - 4) = v31 / 10 + 48;
    *(unsigned char *)(v28 - 3) = v31 % 10 + 48;
    if (v50 > v28 - 4) {
      goto LABEL_83;
    }
    *(unsigned char *)(v28 - 6) = v54 / 10 + 48;
    *(unsigned char *)(v28 - 5) = v54 % 10 + 48;
    if (v50 > v28 - 6) {
      goto LABEL_83;
    }
    *(unsigned char *)(v28 - 8) = v53 / 10 + 48;
    *(unsigned char *)(v28 - 7) = v53 % 10 + 48;
    if (v50 <= v28 - 8
      && (*(unsigned char *)(v28 - 10) = v30 / 10 + 48, *(unsigned char *)(v28 - 9) = v30 % 10 + 48, v50 <= v28 - 10)
      && (unsigned int v51 = (((103 * (v29 % 100)) >> 15) & 1) + ((103 * (v29 % 100)) >> 10),
          *(unsigned char *)(v28 - 12) = v51 + 48,
          *(unsigned char *)(v28 - 11) = v29 % 100 - 10 * v51 + 48,
          v50 <= v28 - 12))
    {
      *(unsigned char *)(v28 - 14) = v29 / 1000 + 48;
      *(unsigned char *)(v28 - 13) = v29 / 100 % 10 + 48;
    }
    else
    {
LABEL_83:
      sub_100007CEC(-7, @"com.apple.security.cfder.error", v48, a2, v49, @"ccder failed to encode");
    }
    goto LABEL_6;
  }
  if (CFDictionaryGetTypeID() == v10)
  {
    return sub_10000699C((const __CFDictionary *)a1, a2, a3);
  }
  if (CFSetGetTypeID() == v10)
  {
    return sub_10000972C((const __CFSet *)a1, a2, a3);
  }
  if (CFStringGetTypeID() == v10)
  {
    return sub_100009514(a1, a2, a4, a5, v39);
  }
  if (CFNumberGetTypeID() == v10)
  {
    return sub_1000078E8((const __CFNumber *)a1, a2, (uint64_t)a4, a5);
  }
  if (CFNullGetTypeID() != v10)
  {
    sub_100007CEC(-5, @"com.apple.security.cfder.error", v46, a2, v47, @"Unsupported CFType");
    return 0;
  }

  return sub_10000961C(a2);
}

uint64_t sub_100009494(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex usedBufLen = 0;
  v6.location = 0;
  v6.size_t length = Length;
  CFStringGetBytes(a1, v6, 0x8000100u, 0, 0, 0, MaximumSizeForEncoding, &usedBufLen);
  return ccder_sizeof();
}

uint64_t sub_100009514(const __CFString *a1, CFTypeRef *a2, UInt8 *a3, uint64_t a4, uint64_t a5)
{
  if (a4)
  {
    CFIndex Length = CFStringGetLength(a1);
    CFIndex usedBufLen = 0;
    v16.location = 0;
    v16.size_t length = Length;
    if (CFStringGetBytes(a1, v16, 0x8000100u, 0, 0, a3, a4 - (void)a3, &usedBufLen) == Length)
    {
      ccder_encode_body();
      uint64_t result = ccder_encode_tl();
      if (result) {
        return result;
      }
      sub_100007CEC(-7, @"com.apple.security.cfder.error", v13, a2, v14, @"ccder failed to encode");
    }
    else
    {
      sub_100007CEC(-5, @"com.apple.security.cfder.error", v10, a2, v11, @"String extraction failed");
    }
  }
  else
  {
    sub_100007CEC(-6, @"com.apple.security.cfder.error", (uint64_t)a3, a2, a5, @"null input");
  }
  return 0;
}

uint64_t sub_10000961C(CFTypeRef *a1)
{
  uint64_t v4 = ccder_encode_tl();
  if (!v4) {
    sub_100007CEC(-7, @"com.apple.security.cfder.error", v2, a1, v3, @"ccder failed to encode");
  }
  return v4;
}

uint64_t sub_100009678(const __CFSet *a1, uint64_t a2)
{
  long long v3 = xmmword_10000AF80;
  LOBYTE(v3) = 1;
  uint64_t v4 = a2;
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_1000096E4, &v3);
  if ((_BYTE)v3) {
    return ccder_sizeof();
  }
  else {
    return 0;
  }
}

uint64_t sub_1000096E4(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)a2)
  {
    uint64_t result = sub_100008838(result, *(void *)(a2 + 16));
    if (result) {
      *(void *)(a2 + 8) += result;
    }
    else {
      *(unsigned char *)a2 = 0;
    }
  }
  return result;
}

uint64_t sub_10000972C(const __CFSet *a1, CFTypeRef *a2, char a3)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  v13[0] = 0xAAAAAAAAAAAAAA01;
  v13[1] = a2;
  BYTE1(v13[0]) = a3;
  v13[2] = Mutable;
  v13[3] = 0;
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_100009978, v13);
  if (!LOBYTE(v13[0]))
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0;
  }
  v14.size_t length = CFArrayGetCount(Mutable);
  v14.location = 0;
  CFArraySortValues(Mutable, v14, (CFComparatorFunction)sub_1000098B0, 0);
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
    sub_100007CEC(-7, @"com.apple.security.cfder.error", v11, a2, v12, @"ccder failed to encode");
    return 0;
  }
  return result;
}

uint64_t sub_1000098B0(const __CFData *a1, const __CFData *a2)
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

void sub_100009978(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(unsigned char *)a2)
  {
    CFIndex v7 = sub_100008838(a1, *(CFTypeRef **)(a2 + 8), a3, a4, a5);
    if (!v7)
    {
      *(unsigned char *)a2 = 0;
      return;
    }
    CFIndex v8 = v7;
    CFMutableArrayRef Mutable = CFDataCreateMutable(*(CFAllocatorRef *)(a2 + 24), v7);
    CFDataSetLength(Mutable, v8);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    uint64_t v11 = sub_100008ADC(a1, *(void *)(a2 + 8), *(unsigned __int8 *)(a2 + 1), MutableBytePtr, &MutableBytePtr[v8]);
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

void sub_100009A60(void *a1)
{
  uint64_t v2 = sub_1000067C0("SecError");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1405091842;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Simulating crash, reason: %@, code=%08x", buf, 0x12u);
  }

  int v3 = dword_100010310;
  if (dword_100010310 != -1) {
    goto LABEL_4;
  }
  if (!sub_100009CBC())
  {
    int v3 = dword_100010310;
LABEL_4:
    dword_100010310 = v3 + 1;
    return;
  }
  uint64_t v4 = getpid();
  id v5 = a1;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  unint64_t v6 = (void (*)(uint64_t, uint64_t, id))off_100010398;
  CFRange v14 = off_100010398;
  if (!off_100010398)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100009D8C;
    CFRange v16 = &unk_10000C8C0;
    uint64_t v17 = &v11;
    CFIndex v7 = sub_100009DDC();
    CFIndex v8 = dlsym(v7, "SimulateCrash");
    *(void *)(v17[1] + 24) = v8;
    off_100010398 = *(_UNKNOWN **)(v17[1] + 24);
    unint64_t v6 = (void (*)(uint64_t, uint64_t, id))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v6)
  {
    uint64_t v9 = +[NSAssertionHandler currentHandler];
    int v10 = +[NSString stringWithUTF8String:"BOOL soft_SimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"simulate_crash.m", 22, @"%s", dlerror());

    __break(1u);
  }
  v6(v4, 1405091842, v5);
}

void sub_100009C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009CBC()
{
  if (!qword_100010390) {
    qword_100010390 = _sl_dlopen();
  }
  return qword_100010390;
}

void *sub_100009D8C(uint64_t a1)
{
  uint64_t v2 = sub_100009DDC();
  uint64_t result = dlsym(v2, "SimulateCrash");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100010398 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100009DDC()
{
  uint64_t v0 = sub_100009CBC();
  if (v0) {
    return (void *)v0;
  }
  CFTimeZoneRef v1 = +[NSAssertionHandler currentHandler];
  int v3 = +[NSString stringWithUTF8String:"void *CrashReporterSupportLibrary(void)"];
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v3, @"simulate_crash.m", 18, @"%s", 0);

  __break(1u);
  free(v4);
  return v1;
}

uint64_t sub_100009E8C()
{
  uint64_t result = _sl_dlopen();
  qword_100010390 = result;
  return result;
}

void sub_100009F00(size_t size, uint64_t a2)
{
  if (size)
  {
    if (size > 0x800)
    {
      id v5 = malloc_type_malloc(size, 0x9C1A2F70uLL);
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

xpc_object_t sub_10000A088(__CFError *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  CFStringRef Domain = CFErrorGetDomain(a1);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 0x40000000;
  v15[2] = sub_10000A1C0;
  v15[3] = &unk_10000C8E0;
  v15[4] = v2;
  v15[5] = "domain";
  sub_100006F7C(Domain, (uint64_t)v15);
  int64_t Code = CFErrorGetCode(a1);
  xpc_dictionary_set_int64(v2, "code", Code);
  CFStringRef v5 = (const __CFString *)CFErrorCopyUserInfo(a1);
  size_t v9 = sub_100008838(v5, 0, v6, v7, v8);
  if (v9)
  {
    size_t v10 = v9;
    uint64_t v11 = (UInt8 *)malloc_type_malloc(v9, 0x4ABABCFuLL);
    unint64_t v12 = (unint64_t)&v11[v10];
    uint64_t v13 = (const void *)sub_100008ADC(v5, 0, 0, v11, v12);
    if (v13) {
      xpc_dictionary_set_data(v2, "userinfo", v13, v12 - (void)v13);
    }
    free(v11);
  }
  CFRelease(v5);
  return v2;
}

void sub_10000A1C0(uint64_t a1, char *string)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
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

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return _CFCalendarComposeAbsoluteTime(calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return _CFCalendarCreateWithIdentifier(allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  int v3 = va_arg(va, const char *);
  return _CFCalendarDecomposeAbsoluteTime(calendar, at, v3);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return _CFCopyTypeIDDescription(type_id);
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

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
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

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

CFTypeID CFSetGetTypeID(void)
{
  return _CFSetGetTypeID();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
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

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t SecCFAllocatorZeroize()
{
  return _SecCFAllocatorZeroize();
}

uint64_t SecErrorGetOSStatus()
{
  return _SecErrorGetOSStatus();
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

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return __CFBundleCopyBundleURLForExecutableURL();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void abort(void)
{
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_clear()
{
  return _cc_clear();
}

uint64_t ccder_decode_constructed_tl()
{
  return _ccder_decode_constructed_tl();
}

uint64_t ccder_decode_sequence_tl()
{
  return _ccder_decode_sequence_tl();
}

uint64_t ccder_decode_tag()
{
  return _ccder_decode_tag();
}

uint64_t ccder_decode_tl()
{
  return _ccder_decode_tl();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
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

uint64_t xpc_create_reply_with_format()
{
  return _xpc_create_reply_with_format();
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

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
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

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}