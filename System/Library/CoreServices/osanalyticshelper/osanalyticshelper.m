void sub_100003EE0(void *a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  long long v8;
  long long v9;
  long long v10;
  long long v11;
  unsigned char v12[128];

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1[4] + 24);
  v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    v4 = v3;
    v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "entitled", (void)v8)) {
          [v7 willWriteLog:a1[5] details:a1[6]];
        }
      }
      v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void sub_100003FF0(void *a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1[4] + 24);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "entitled", (void)v8)) {
          [v7 didWriteLog:a1[5] filePath:a1[6]];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void sub_100004424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004454(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100004638;
    v5[3] = &unk_1000211F8;
    objc_copyWeak(&v7, (id *)(a1 + 32));
    id v4 = v3;
    id v6 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, v5);
    xpc_connection_resume((xpc_connection_t)v4);

    objc_destroyWeak(&v7);
  }
}

void sub_100004524(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100004638(uint64_t a1, void *a2)
{
  xpc_object_t original = a2;
  if (xpc_get_type(original) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    uint64_t uint64 = xpc_dictionary_get_uint64(original, "operation");
    if (WeakRetained)
    {
      unsigned __int8 v7 = [WeakRetained serviceRequest:original forOperation:uint64 fromConnection:*(void *)(a1 + 32) forReply:reply];
      if (!reply) {
        goto LABEL_8;
      }
    }
    else
    {
      unsigned __int8 v7 = 0;
      if (!reply)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    if (uint64 != 8)
    {
      xpc_dictionary_set_BOOL(reply, "result", v7);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
    }
    goto LABEL_8;
  }
LABEL_9:
}

BOOL sub_1000049C0(uint64_t a1, int a2, void *a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "S3. helper service utilizing back-channel with file descriptor for payload", buf, 2u);
  }
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "datawriter_endpoint");
  uint64_t v5 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
  id v6 = xpc_connection_create_from_endpoint(v5);
  unsigned __int8 v7 = v6;
  *(void *)buf = 0;
  v36 = buf;
  uint64_t v37 = 0x3032000000;
  v38 = sub_10000588C;
  v39 = sub_100005874;
  id v40 = 0;
  if (v6)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100010510;
    handler[3] = &unk_100021140;
    handler[4] = buf;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_resume(v7);
    long long v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_fd(v8, "fileDesc", a2);
    xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v7, v8);
    long long v10 = v9;
    if (v9) {
      BOOL v11 = xpc_dictionary_get_BOOL(v9, "result");
    }
    else {
      BOOL v11 = 0;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v49 = 67109120;
      LODWORD(v50) = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "S5. helper service recieved back-channel payload write result: %d", v49, 8u);
    }
    if (v10)
    {
      if (!v11)
      {
        if (xpc_get_type(v10) == (xpc_type_t)&_xpc_type_error)
        {
          string = xpc_dictionary_get_string(v10, _xpc_error_key_description);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v49 = 136446210;
            v50 = string;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got back-channel xpc error message: %{public}s\n", v49, 0xCu);
          }
          NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
          v19 = +[NSString stringWithUTF8String:string];
          v48 = v19;
          v20 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          uint64_t v21 = +[NSError errorWithDomain:@"OSALog" code:102 userInfo:v20];
          v22 = (void *)*((void *)v36 + 5);
          *((void *)v36 + 5) = v21;
        }
        else
        {
          v13 = xpc_dictionary_get_string(v10, "error_desc");
          v14 = xpc_dictionary_get_string(v10, "error_domain");
          uint64_t uint64 = xpc_dictionary_get_uint64(v10, "error_code");
          if (v14)
          {
            v32 = +[NSString stringWithUTF8String:v14];
          }
          else
          {
            v32 = @"OSALog";
          }
          NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
          if (v13)
          {
            v23 = +[NSString stringWithUTF8String:v13];
          }
          else
          {
            v23 = @"<unknown>";
          }
          v46 = v23;
          v24 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1, uint64);
          uint64_t v25 = +[NSError errorWithDomain:v32 code:v31 userInfo:v24];
          v26 = (void *)*((void *)v36 + 5);
          *((void *)v36 + 5) = v25;

          if (v13) {
          if (v14)
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v27 = (const char *)*((void *)v36 + 5);
            *(_DWORD *)v49 = 138412290;
            v50 = v27;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "non-xpc (via xpc) error: %@", v49, 0xCu);
          }
        }
      }
    }
    else
    {
      NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
      CFStringRef v44 = @"no response from private datawriter request";
      v15 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      uint64_t v16 = +[NSError errorWithDomain:@"OSALog" code:103 userInfo:v15];
      v17 = (void *)*((void *)v36 + 5);
      *((void *)v36 + 5) = v16;
    }
  }
  else
  {
    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    CFStringRef v42 = @"failed to create back-channel XPC connection";
    long long v8 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    uint64_t v12 = +[NSError errorWithDomain:@"OSALog" code:104 userInfo:v8];
    BOOL v11 = 0;
    long long v10 = (void *)*((void *)v36 + 5);
    *((void *)v36 + 5) = v12;
  }

  v28 = (void *)*((void *)v36 + 5);
  if (v28) {
    *a3 = v28;
  }
  _Block_object_dispose(buf, 8);

  return v11;
}

void sub_100004F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004FAC(uint64_t a1)
{
  id v2 = &_s13JobQuiescence15JQXPCConnectionCACycfc_ptr;
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = kOSALogMetadataBugType;
    string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 40), (const char *)[kOSALogMetadataBugType UTF8String]);
    if (!string)
    {
      xpc_object_t v9 = 0;
      unsigned __int8 v7 = @"<unknown>";
      long long v10 = "illegal request -- missing bug type";
      goto LABEL_29;
    }
    uint64_t v5 = string;
    id v6 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 40), "caller");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      NSErrorUserInfoKey v47 = (void *)v5;
      __int16 v48 = 2080;
      v49 = (void *)v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "S1. helper service invoked for '%s' report creation on behalf of %s", buf, 0x16u);
    }
    unsigned __int8 v7 = +[NSString stringWithUTF8String:v5];
    CFStringRef v42 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "additionalHeaders");
    if (v42)
    {
      long long v8 = xpc2ns();
    }
    else
    {
      long long v8 = 0;
    }
    id v40 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "options");
    if (v40)
    {
      BOOL v11 = xpc2ns();
    }
    else
    {
      BOOL v11 = 0;
    }
    uint64_t v12 = +[NSMutableDictionary dictionary];
    v13 = [v11 objectForKeyedSubscript:kOSALogOptionObserverInfo];
    [v12 addEntriesFromDictionary:v13];

    uint64_t v14 = kOSALogMetadataIncidentID;
    v15 = [v8 objectForKeyedSubscript:kOSALogMetadataIncidentID];
    if (v15)
    {
      CFStringRef v16 = [v8 objectForKeyedSubscript:v14];
    }
    else
    {
      CFStringRef v16 = @"<unknown>";
    }

    if ([(__CFString *)v7 isEqualToString:@"210"]) {
      [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:kOSALogOptionUrgent];
    }
    [v12 setObject:v16 forKeyedSubscript:@"logInfo"];
    v17 = [v12 objectForKeyedSubscript:v3];

    if (!v17) {
      [v12 setObject:v7 forKeyedSubscript:v3];
    }
    v39 = (__CFString *)v16;
    id v18 = [objc_alloc((Class)OSALogIdentity) initWithIncidentID:v16 bugType:v7];
    v19 = +[OSADiagnosticMonitorServer sharedInstance];
    [v19 willWriteLog:v18 details:v12];

    v20 = [v11 objectForKeyedSubscript:kOSALogOptionOverridePath];

    NSErrorUserInfoKey v41 = v8;
    if (v20)
    {
      long long v10 = "illegal request -- invalid arguments";
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "S2. helper service creating file", buf, 2u);
      }
      id v45 = 0;
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000049C0;
      v43[3] = &unk_100021168;
      CFStringRef v44 = (__CFString *)*(id *)(a1 + 40);
      v29 = +[OSALog locallyCreateForSubmission:v7 metadata:v8 options:v11 error:&v45 writing:v43];
      id v30 = v45;
      v23 = v30;
      if (v29)
      {
        uint64_t v31 = *(void **)(a1 + 32);
        id v32 = [v29 filepath];
        xpc_dictionary_set_string(v31, "filePath", (const char *)[v32 fileSystemRepresentation]);

        xpc_object_t v9 = [v29 filepath];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        v33 = [v29 oldFilePath];

        if (v33)
        {
          v34 = *(void **)(a1 + 32);
          id v35 = [v29 oldFilePath];
          xpc_dictionary_set_string(v34, "oldFilePath", (const char *)[v35 fileSystemRepresentation]);
        }
        if (v9)
        {
          v24 = +[OSADiagnosticMonitorServer sharedInstance];
          [v24 didWriteLog:v18 filePath:v9];
          long long v10 = 0;
LABEL_28:

          id v2 = &_s13JobQuiescence15JQXPCConnectionCACycfc_ptr;
          if (!v10)
          {
LABEL_31:
            xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "result", *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
            goto LABEL_32;
          }
LABEL_29:
          xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "result", 0);
          xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), "error_desc", v10);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            NSErrorUserInfoKey v47 = (void *)v10;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "helper unable to create log: %{public}s", buf, 0xCu);
          }
          goto LABEL_31;
        }
        long long v10 = 0;
        if (v23)
        {
LABEL_27:
          v24 = +[OSADiagnosticMonitorServer sharedInstance];
          [v24 failedToWriteLog:v18 error:v23];
          xpc_object_t v9 = 0;
          goto LABEL_28;
        }
        uint64_t v21 = @"failed to create log (unknown reason)";
        goto LABEL_25;
      }
      if (v30)
      {
        id v36 = [v30 localizedDescription];
        long long v10 = (const char *)[v36 UTF8String];

        uint64_t v37 = *(void **)(a1 + 32);
        id v38 = [v23 domain];
        xpc_dictionary_set_string(v37, "error_domain", (const char *)[v38 UTF8String]);

        xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "error_code", (uint64_t)[v23 code]);
        uint64_t v21 = v44;
        goto LABEL_26;
      }

      long long v10 = "failed to create log (unknown reason)";
    }
    uint64_t v21 = +[NSString stringWithUTF8String:v10];
LABEL_25:
    NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
    v53 = v21;
    v22 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    v23 = +[NSError errorWithDomain:@"OSALog" code:0 userInfo:v22];

LABEL_26:
    goto LABEL_27;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't create XPC reply -- refusing to create file", buf, 2u);
  }
  xpc_object_t v9 = 0;
  long long v10 = "unable to create log -- no xpc reply";
  unsigned __int8 v7 = @"<unknown>";
LABEL_32:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && [(__CFString *)v7 isEqualToString:@"210"])
  {
    [*(id *)(a1 + 56) triggerUrgentSubmission];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    LODWORD(v47) = v25;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "S6. helper service complete with final result %d", buf, 8u);
  }
  v26 = [v2[303] logObjForBugType:v7];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      CFStringRef v27 = @"success";
    }
    else {
      CFStringRef v27 = @"FAILED";
    }
    if (v10)
    {
      v28 = +[NSString stringWithUTF8String:v10];
    }
    else
    {
      v28 = v9;
    }
    *(_DWORD *)buf = 138543874;
    NSErrorUserInfoKey v47 = v7;
    __int16 v48 = 2112;
    v49 = (void *)v27;
    __int16 v50 = 2114;
    v51 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "xpc log creation type %{public}@ result %@: %{public}@", buf, 0x20u);
    if (v10) {
  }
    }
}

void sub_10000586C(uint64_t a1)
{
}

void sub_100005874(uint64_t a1)
{
}

uint64_t sub_10000587C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000588C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id sub_1000059E0(uint64_t a1)
{
  CFStringRef v4 = @"state";
  v1 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  uint64_t v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_100005C98(uint64_t a1)
{
  CFStringRef v1 = @"YES";
  if (!*(unsigned char *)(a1 + 32)) {
    CFStringRef v1 = @"NO";
  }
  CFStringRef v4 = @"prodFused";
  CFStringRef v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

void sub_100005D88(id a1)
{
  v3[0] = CTCategoryIdentifierGames;
  v3[1] = CTCategoryIdentifierSocialNetworking;
  v4[0] = @"Games";
  v4[1] = @"Social Networking";
  v3[2] = CTCategoryIdentifierEntertainment;
  v3[3] = CTCategoryIdentifierCreativity;
  v4[2] = @"Entertainment";
  v4[3] = @"Creativity";
  v3[4] = CTCategoryIdentifierProductivity;
  v3[5] = CTCategoryIdentifierEducation;
  v4[4] = @"Productivity";
  v4[5] = @"Education";
  v3[6] = CTCategoryIdentifierReadingAndReference;
  v3[7] = CTCategoryIdentifierHealthAndFitness;
  v4[6] = @"Reading & Reference";
  v4[7] = @"Health & Fitness";
  v3[8] = CTCategoryIdentifierOther;
  v3[9] = CTCategoryIdentifierUtilities;
  v4[8] = @"Other";
  v4[9] = @"Utilities";
  v3[10] = CTCategoryIdentifierShoppingAndFood;
  v3[11] = CTCategoryIdentifierTravel;
  v4[10] = @"Shopping & Food";
  v4[11] = @"Travel";
  v3[12] = CTCategoryIdentifierSystemUnblockable;
  v3[13] = CTCategoryIdentifierSystemBlockable;
  v4[12] = @"System Unblockable Applications";
  v4[13] = @"System Blockable Applications";
  v3[14] = CTCategoryIdentifierSystemHidden;
  v4[14] = @"System Hidden Applications";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:15];
  id v2 = (void *)qword_100026248;
  qword_100026248 = v1;
}

void sub_100005FC4(id a1)
{
  v3[0] = CTCategoryIdentifierShoppingAndFood;
  v3[1] = CTCategoryIdentifierOther;
  v4[0] = &off_100022D18;
  v4[1] = &off_100022D30;
  v3[2] = CTCategoryIdentifierSystemUnblockable;
  v3[3] = CTCategoryIdentifierTravel;
  v4[2] = &off_100022D48;
  v4[3] = &off_100022D60;
  v3[4] = CTCategoryIdentifierEducation;
  v3[5] = CTCategoryIdentifierEntertainment;
  v4[4] = &off_100022D78;
  v4[5] = &off_100022D90;
  v3[6] = CTCategoryIdentifierUtilities;
  v3[7] = CTCategoryIdentifierSocialNetworking;
  v4[6] = &off_100022DA8;
  v4[7] = &off_100022DC0;
  v3[8] = CTCategoryIdentifierReadingAndReference;
  v3[9] = CTCategoryIdentifierHealthAndFitness;
  v4[8] = &off_100022DD8;
  v4[9] = &off_100022DF0;
  v3[10] = CTCategoryIdentifierCreativity;
  v3[11] = CTCategoryIdentifierSystemBlockable;
  v4[10] = &off_100022E08;
  v4[11] = &off_100022E20;
  v3[12] = CTCategoryIdentifierSystemHidden;
  v3[13] = CTCategoryIdentifierSystemBlockable;
  v4[12] = &off_100022E38;
  v4[13] = &off_100022E50;
  v3[14] = CTCategoryIdentifierGames;
  void v3[15] = CTCategoryIdentifierUtilities;
  v4[14] = &off_100022E68;
  void v4[15] = &off_100022E80;
  v3[16] = CTCategoryIdentifierProductivity;
  v4[16] = &off_100022E98;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:17];
  id v2 = (void *)qword_100026258;
  qword_100026258 = v1;
}

void sub_1000062A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000062B4(id a1)
{
  v3[0] = @"com.apple.AccessibilityInspector";
  v3[1] = @"com.apple.ActivityMonitor";
  v4[0] = CTCategoryIdentifierUtilities;
  v4[1] = CTCategoryIdentifierUtilities;
  v3[2] = @"com.apple.ActivityMonitorApp";
  v3[3] = @"com.apple.BarcodeScanner";
  v4[2] = CTCategoryIdentifierUtilities;
  v4[3] = CTCategoryIdentifierUtilities;
  v3[4] = @"com.apple.Bridge";
  v3[5] = @"com.apple.clock";
  v4[4] = CTCategoryIdentifierUtilities;
  v4[5] = CTCategoryIdentifierUtilities;
  v3[6] = @"com.apple.compass";
  v3[7] = @"com.apple.DeepBreathing";
  v4[6] = CTCategoryIdentifierUtilities;
  v4[7] = CTCategoryIdentifierHealthAndFitness;
  v3[8] = @"com.apple.Diagnostics";
  v3[9] = @"com.apple.dock";
  v4[8] = CTCategoryIdentifierUtilities;
  v4[9] = CTCategoryIdentifierUtilities;
  v3[10] = @"com.apple.DocumentsApp";
  v3[11] = @"com.apple.finder";
  v4[10] = CTCategoryIdentifierProductivity;
  v4[11] = CTCategoryIdentifierUtilities;
  v3[12] = @"com.apple.findmy";
  v3[13] = @"com.apple.Fitness";
  v4[12] = CTCategoryIdentifierUtilities;
  v4[13] = CTCategoryIdentifierHealthAndFitness;
  v3[14] = @"com.apple.Health";
  void v3[15] = @"com.apple.HeartRate";
  v4[14] = CTCategoryIdentifierHealthAndFitness;
  void v4[15] = CTCategoryIdentifierHealthAndFitness;
  v3[16] = @"com.apple.Home";
  void v3[17] = @"com.apple.InCallService";
  v4[16] = CTCategoryIdentifierUtilities;
  void v4[17] = CTCategoryIdentifierProductivity;
  v3[18] = @"com.apple.keychainaccess";
  v3[19] = @"com.apple.Magnifier";
  v4[18] = CTCategoryIdentifierUtilities;
  v4[19] = CTCategoryIdentifierUtilities;
  v3[20] = @"com.apple.MigrateAssistant";
  v3[21] = @"com.apple.mobilephone";
  v4[20] = CTCategoryIdentifierUtilities;
  v4[21] = CTCategoryIdentifierProductivity;
  v3[22] = @"com.apple.mobilesafari";
  v3[23] = @"com.apple.mobiletimer";
  v4[22] = CTCategoryIdentifierUtilities;
  v4[23] = CTCategoryIdentifierUtilities;
  v3[24] = @"com.apple.Passbook";
  v3[25] = @"com.apple.Preferences";
  v4[24] = CTCategoryIdentifierProductivity;
  v4[25] = CTCategoryIdentifierUtilities;
  v3[26] = @"com.apple.PreviewShell";
  v3[27] = @"com.apple.Safari";
  v4[26] = CTCategoryIdentifierProductivity;
  v4[27] = CTCategoryIdentifierUtilities;
  v3[28] = @"com.apple.SafariTechnologyPreview";
  v3[29] = @"com.apple.Siri";
  v4[28] = CTCategoryIdentifierUtilities;
  v4[29] = CTCategoryIdentifierProductivity;
  v3[30] = @"com.apple.ScreenTimeWidgetApplication";
  v3[31] = @"com.apple.SharingViewService";
  v4[30] = CTCategoryIdentifierUtilities;
  v4[31] = CTCategoryIdentifierUtilities;
  v3[32] = @"com.apple.sidecar";
  v3[33] = @"com.apple.siri";
  v4[32] = CTCategoryIdentifierUtilities;
  v4[33] = CTCategoryIdentifierProductivity;
  v3[34] = @"com.apple.SleepLockScreen";
  v3[35] = @"com.apple.SoftwareUpdate";
  v4[34] = CTCategoryIdentifierUtilities;
  v4[35] = CTCategoryIdentifierUtilities;
  v3[36] = @"com.apple.systempreferences";
  v3[37] = @"com.apple.SystemProfiler";
  v4[36] = CTCategoryIdentifierUtilities;
  v4[37] = CTCategoryIdentifierUtilities;
  v3[38] = @"com.google.Chrome";
  v3[39] = @"com.parallels.desktop.console";
  v4[38] = CTCategoryIdentifierUtilities;
  v4[39] = CTCategoryIdentifierUtilities;
  v3[40] = @"org.mozilla.firefox";
  v3[41] = @"com.operasoftware.OperaGX";
  v4[40] = CTCategoryIdentifierUtilities;
  v4[41] = CTCategoryIdentifierUtilities;
  v3[42] = @"com.microsoft.edgemac";
  v3[43] = @"com.operasoftware.Opera";
  v4[42] = CTCategoryIdentifierUtilities;
  v4[43] = CTCategoryIdentifierUtilities;
  v3[44] = @"org.mozilla.firefoxdeveloperedition";
  v3[45] = @"com.brave.Browser";
  v4[44] = CTCategoryIdentifierUtilities;
  v4[45] = CTCategoryIdentifierUtilities;
  v3[46] = @"ru.yandex.desktop.yandex-browser";
  v3[47] = @"company.thebrowser.Browser";
  v4[46] = CTCategoryIdentifierUtilities;
  v4[47] = CTCategoryIdentifierUtilities;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:48];
  id v2 = (void *)qword_100026268;
  qword_100026268 = v1;
}

void sub_1000068F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006A88(uint64_t a1, void *a2, void *a3)
{
  id v72 = a2;
  id v63 = a3;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v4) {
    sub_100014B00(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  v71 = [*(id *)(a1 + 32) _DHIDtoCategoryDisplayNameMap];
  v70 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &stru_100021D98, &stru_100021D98, 0);
  [*(id *)(a1 + 32) generateTopThreeCategories:v72];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [obj countByEnumeratingWithState:&v86 objects:v101 count:16];
  if (v12)
  {
    v13 = 0;
    uint64_t v14 = *(void *)v87;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v87 != v14) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v16 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          v19 = [v71 objectForKeyedSubscript:v16];
          v20 = [v72 objectForKeyedSubscript:v16];
          *(_DWORD *)buf = 138412802;
          v91 = v16;
          __int16 v92 = 2112;
          v93 = v19;
          __int16 v94 = 2112;
          v95 = v20;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "HighEngagement: Top three total: %@, %@, %@", buf, 0x20u);
        }
        v17 = +[NSString stringWithFormat:@"com.apple.topCategory%d", (char *)i + (void)v13];
        v79 = _NSConcreteStackBlock;
        uint64_t v80 = 3221225472;
        v81 = sub_100007468;
        v82 = &unk_100020BE0;
        v83 = v16;
        id v84 = v71;
        id v85 = v72;
        AnalyticsSendEventLazy();

        id v18 = [v84 objectForKeyedSubscript:v16];
        [v70 setObject:v18 atIndexedSubscript:(char *)i + (int)v13];
      }
      id v12 = [obj countByEnumeratingWithState:&v86 objects:v101 count:16];
      v13 = (char *)i + (int)v13;
    }
    while (v12);
  }

  v68 = [*(id *)(a1 + 32) _DHIDto95thPercentile];
  v65 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &stru_100021D98, 0);
  id v64 = objc_alloc_init((Class)NSMutableArray);
  BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v21) {
    sub_100014AC4(v21, v22, v23, v24, v25, v26, v27, v28);
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v67 = obj;
  id v29 = [v67 countByEnumeratingWithState:&v75 objects:v100 count:16];
  if (v29)
  {
    int v30 = 0;
    uint64_t v31 = *(void *)v76;
LABEL_16:
    uint64_t v32 = 0;
    uint64_t v33 = v30;
    if (v30 <= 1) {
      int v34 = 1;
    }
    else {
      int v34 = v30;
    }
    uint64_t v35 = (v34 - v30);
    uint64_t v36 = v30;
    while (1)
    {
      if (*(void *)v76 != v31) {
        objc_enumerationMutation(v67);
      }
      uint64_t v37 = *(void *)(*((void *)&v75 + 1) + 8 * v32);
      id v38 = [v68 objectForKeyedSubscript:v37];
      v39 = [v72 objectForKeyedSubscript:v37];
      [v39 doubleValue];
      double v41 = v40;
      [v38 doubleValue];
      BOOL v43 = v41 < v42;

      if (!v43)
      {
        [v64 addObject:v37];
        CFStringRef v44 = +[NSString stringWithFormat:@"com.apple.highEngagementCategory%d", v36 + v32 + 1];
        id v73 = v71;
        id v74 = v72;
        AnalyticsSendEventLazy();

        id v45 = [v73 objectForKeyedSubscript:v37];
        [v65 setObject:v45 atIndexedSubscript:v33 + v32];
      }
      if (v35 == v32) {
        break;
      }
      if (v29 == (id)++v32)
      {
        id v29 = [v67 countByEnumeratingWithState:&v75 objects:v100 count:16];
        int v30 = v33 + v32;
        if (v29) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v46 = [v70 objectAtIndexedSubscript:0];
    NSErrorUserInfoKey v47 = [v70 objectAtIndexedSubscript:1];
    __int16 v48 = [v70 objectAtIndexedSubscript:2];
    v49 = [v65 objectAtIndexedSubscript:0];
    __int16 v50 = [v65 objectAtIndexedSubscript:1];
    *(_DWORD *)buf = 138413314;
    v91 = v46;
    __int16 v92 = 2112;
    v93 = v47;
    __int16 v94 = 2112;
    v95 = v48;
    __int16 v96 = 2112;
    v97 = v49;
    __int16 v98 = 2112;
    v99 = v50;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: Posting to Biome: topCategory1: %@, topCategory2: %@, topCategory3: %@, highEngagementCategory1: %@, highEngagementCategory2: %@", buf, 0x34u);
  }
  id v51 = objc_alloc((Class)BMOSAnalyticsHighEngagementDevices);
  NSErrorUserInfoKey v52 = [v70 objectAtIndexedSubscript:0];
  v53 = [v70 objectAtIndexedSubscript:1];
  v54 = [v70 objectAtIndexedSubscript:2];
  v55 = [v65 objectAtIndexedSubscript:0];
  v56 = [v65 objectAtIndexedSubscript:1];
  id v57 = [v51 initWithTopCategory1:v52 topCategory2:v53 topCategory3:v54 highEngagementCategory1:v55 highEngagementCategory2:v56];

  v58 = BiomeLibrary();
  v59 = [v58 OSAnalytics];
  v60 = [v59 CA];
  v61 = [v60 HighEngagementDevices];

  v62 = [v61 source];
  [v62 sendEvent:v57];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: Done posting to Biome", buf, 2u);
  }
}

void sub_100007250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

id sub_100007468(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  v10[0] = v4;
  v9[0] = @"category";
  v9[1] = @"name";
  uint64_t v5 = objc_msgSend(v3, "objectForKeyedSubscript:");
  v10[1] = v5;
  v9[2] = @"total";
  uint64_t v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 32)];
  v10[2] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

void sub_100007558(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

id sub_100007580(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  v10[0] = v4;
  v9[0] = @"category";
  v9[1] = @"name";
  uint64_t v5 = objc_msgSend(v3, "objectForKeyedSubscript:");
  v10[1] = v5;
  v9[2] = @"total";
  uint64_t v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 32)];
  v10[2] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

void sub_100007670(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_100007790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1000077C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v8 = [v7 compare:v6];

  return v8;
}

void sub_10000783C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100007B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007B98(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v18 = a3;
  if (v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v5 = [v18 description];
      uint64_t v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v18 code]);
      uint64_t v7 = [v18 localizedFailureReason];
      *(_DWORD *)buf = 138412802;
      id v26 = v5;
      __int16 v27 = 2112;
      uint64_t v28 = v6;
      __int16 v29 = 2112;
      int v30 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "HighEngagement: Category error: %@, %@, %@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HighEngagement: generateTotalByCategory in completion handler", buf, 2u);
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v19;
    id v8 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v12 = [obj objectForKeyedSubscript:v11];
          v13 = [v12 identifier];

          uint64_t v14 = [*(id *)(a1 + 56) _OverrideIfNeeded:v11 givenCategory:v13];
          if (v14)
          {
            v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
            CFStringRef v16 = [*(id *)(a1 + 40) objectForKeyedSubscript:v11];
            v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v15 integerValue] + (void)objc_msgSend(v16, "integerValue"));
            [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:v14];
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
      }
      while (v8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100007E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100008018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000082BC(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_100008888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100008964(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100008C60(void *a1)
{
  size_t v18 = 8;
  uint64_t v19 = 0;
  sysctlbyname("vm.shared_region_control", &v19, &v18, 0, 0);
  if (v19)
  {
    p_super = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "Skipping stability check in pre-reboot state.", buf, 2u);
    }
LABEL_4:

    goto LABEL_5;
  }
  uint64_t v4 = [[OSAStabilityMonitor alloc] initWithParameters:a1[4] targetBundleID:a1[5] completionHandler:a1[7]];
  if (!v4)
  {
LABEL_5:
    uint64_t v3 = a1[7];
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    }
    return;
  }
  p_super = &v4->super;
  if (a1[5])
  {
    if (a1[6])
    {
      id v5 = [(OSAStabilityMonitor *)v4 coalitionBasedBundleIDs];
      unsigned int v6 = [v5 containsObject:a1[5]];

      if (v6) {
        [p_super setTargetBundleID:a1[6]];
      }
    }
    uint64_t v7 = a1[5];
    uint64_t v17 = 0;
    if (v7
      && ([p_super isRollbackSupportedForBundleID:v7 reason:&v17] & 1) == 0)
    {
      id v8 = OSAStabilityMonitorLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = a1[5];
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v9;
        __int16 v22 = 2050;
        uint64_t v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Targeted mode for %{public}@ is not available: %{public}lu", buf, 0x16u);
      }

      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_100008EB8;
  v15 = &unk_100020C90;
  CFStringRef v16 = p_super;
  uint64_t v10 = qword_100026278;
  uint64_t v11 = p_super;
  if (v10 != -1) {
    dispatch_once(&qword_100026278, &v12);
  }
  [v11 evaluateStability];
}

id sub_100008EB8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) checkForOSUpdate];
}

void sub_100009218(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = objc_msgSend(v8, "dateByAddingTimeInterval:", -(double)(unint64_t)(86400 * (void)objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue")));
    uint64_t v11 = v7;
    id v12 = v11;
    if (!v11 || ([v11 timeIntervalSinceDate:v10], v13 < 0.0))
    {
      uint64_t v14 = v10;

      id v12 = v14;
    }
    v15 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v12;
      __int16 v24 = 2114;
      id v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Calculating baseline from %{public}@ to %{public}@", buf, 0x16u);
    }

    CFStringRef v16 = *(void **)(a1 + 40);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100009448;
    v18[3] = &unk_100020D08;
    v18[4] = v16;
    uint64_t v19 = v12;
    id v20 = v8;
    id v21 = *(id *)(a1 + 48);
    uint64_t v17 = v12;
    [v16 totalUptimeFrom:v17 to:v20 targetBundleID:0 targetAppVersions:0 firstPartyBundleIDs:0 completionHandler:v18];
  }
  else
  {
    uint64_t v10 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100014CD0();
    }
  }
}

void sub_100009448(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = [v5 versions];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000957C;
    v12[3] = &unk_100020CE0;
    double v13 = v5;
    id v14 = *(id *)(a1 + 56);
    [v7 totalCrashesFrom:v8 to:v9 targetBundleID:0 appVersions:v10 isBaseline:1 completionHandler:v12];

    uint64_t v11 = v13;
  }
  else
  {
    uint64_t v11 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100014D3C();
    }
  }
}

void sub_10000957C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[NSUserDefaults standardUserDefaults];
    uint64_t v8 = [v5 aggregatedTotalsAsUnsignedInteger];
    [v7 setObject:v8 forKey:@"stability-monitor.baselineCrashCount"];

    uint64_t v9 = +[NSUserDefaults standardUserDefaults];
    uint64_t v10 = [*(id *)(a1 + 32) versions];
    [v9 setObject:v10 forKey:@"stability-monitor.baselineVersions"];

    uint64_t v11 = [*(id *)(a1 + 32) aggregatedTotalsAsDouble];
    id v12 = +[NSMutableDictionary dictionary];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v19 = -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v18, (void)v24);
          [v19 doubleValue];
          double v21 = v20 / 3600.0;

          __int16 v22 = +[NSNumber numberWithDouble:round(v21 * 10.0) / 10.0];
          [v12 setObject:v22 forKeyedSubscript:v18];
        }
        id v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }

    uint64_t v23 = +[NSUserDefaults standardUserDefaults];
    [v23 setObject:v12 forKey:@"stability-monitor.baselineUptime"];
  }
  else
  {
    double v13 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100014DA8();
    }
  }
}

void sub_100009FB4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = OSAStabilityMonitorLogDomain();
  uint64_t v11 = v10;
  if (v7 && v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v36 = v7;
      __int16 v37 = 2114;
      id v38 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Evaluating stability from %{public}@ to %{public}@", buf, 0x16u);
    }

    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = v12[3];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000A2A4;
    v23[3] = &unk_100020D80;
    v23[4] = v12;
    id v24 = v7;
    id v25 = v8;
    id v26 = *(id *)(a1 + 40);
    id v27 = *(id *)(a1 + 48);
    id v28 = *(id *)(a1 + 56);
    id v29 = *(id *)(a1 + 64);
    id v30 = *(id *)(a1 + 72);
    id v31 = *(id *)(a1 + 80);
    id v32 = *(id *)(a1 + 88);
    id v33 = *(id *)(a1 + 96);
    id v34 = *(id *)(a1 + 104);
    [v12 totalCrashesFrom:v24 to:v25 targetBundleID:v14 appVersions:v13 isBaseline:0 completionHandler:v23];
  }
  else
  {
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100015014((uint64_t)v9, v11, v15, v16, v17, v18, v19, v20);
      }

      double v21 = *(void **)(a1 + 32);
      CFStringRef v22 = @"Error determining end date";
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Duration on current build has exceeded maximum days.", buf, 2u);
      }

      double v21 = *(void **)(a1 + 32);
      CFStringRef v22 = @"Exceeded maximum days on target build";
    }
    [v21 reportResultsForBundleID:0 crashes:0 uptime:0 MTBF:0 result:0 status:v22];
  }
}

void sub_10000A2A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = v7[3];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v12 = [v5 firstPartyBundleIDs];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000A49C;
    v20[3] = &unk_100020D58;
    v20[4] = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 64);
    id v22 = *(id *)(a1 + 72);
    id v23 = *(id *)(a1 + 80);
    id v24 = v5;
    id v25 = *(id *)(a1 + 88);
    id v26 = *(id *)(a1 + 96);
    id v27 = *(id *)(a1 + 104);
    id v28 = *(id *)(a1 + 112);
    id v29 = *(id *)(a1 + 120);
    [v7 totalUptimeFrom:v8 to:v11 targetBundleID:v9 targetAppVersions:v10 firstPartyBundleIDs:v12 completionHandler:v20];
  }
  else
  {
    uint64_t v13 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100015080((uint64_t)v6, v13, v14, v15, v16, v17, v18, v19);
    }

    [*(id *)(a1 + 32) reportResultsForBundleID:0 crashes:0 uptime:0 MTBF:0 result:0 status:@"Error calculating crash count"];
  }
}

void sub_10000A49C(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 totals];
    id v8 = [v7 count];

    if (!v8)
    {
      uint64_t v9 = OSAStabilityMonitorLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No uptime values for target apps.", buf, 2u);
      }

      [a1[4] reportResultsForBundleID:0 crashes:0 uptime:0 MTBF:0 result:0 status:@"No uptime on target build"];
    }
    id v84 = v6;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id obj = [v5 totals];
    id v10 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v91;
      uint64_t v85 = *(void *)v91;
      id v86 = v5;
      do
      {
        uint64_t v13 = 0;
        id v87 = v11;
        do
        {
          if (*(void *)v91 != v12) {
            objc_enumerationMutation(obj);
          }
          double v14 = *(double *)(*((void *)&v90 + 1) + 8 * (void)v13);
          uint64_t v15 = [a1[5] objectForKeyedSubscript:*(void *)&v14];
          id v16 = [v15 unsignedIntegerValue];

          uint64_t v17 = [a1[6] objectForKeyedSubscript:*(void *)&v14];
          [v17 doubleValue];
          double v19 = v18;

          [a1[7] doubleValue];
          if (v19 >= v20)
          {
            id v22 = [v5 totals];
            id v23 = [v22 objectForKeyedSubscript:*(void *)&v14];
            id v24 = [a1[8] totals];
            id v25 = [v24 objectForKeyedSubscript:*(void *)&v14];
            id v26 = +[OSAStabilityMonitor calculateStabilityRateWithAppUsage:v23 crashCounts:v25];

            id v27 = [v26 crashCount];
            if (v27 < [a1[9] unsignedIntegerValue])
            {
              id v28 = OSAStabilityMonitorLogDomain();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                double v29 = COERCE_DOUBLE([v26 crashCount]);
                *(_DWORD *)buf = 138543618;
                double v95 = v14;
                __int16 v96 = 2050;
                double v97 = v29;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Crash count for %{public}@ is %{public}lu, which is below the threshold.", buf, 0x16u);
              }

              id v30 = a1[4];
              id v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v26 crashCount]);
              [v30 reportResultsForBundleID:*(void *)&v14 crashes:v31 uptime:0 MTBF:0 result:0 status:@"Crash count below threshold"];
              goto LABEL_32;
            }
            id v32 = [v26 MTBF];

            if (v32)
            {
              uint64_t v89 = 0;
              id v33 = OSAStabilityMonitorLogDomain();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                double v70 = COERCE_DOUBLE([v26 crashCount]);
                [v26 uptime];
                uint64_t v72 = v71;
                id v73 = [v26 MTBF];
                [v73 doubleValue];
                *(_DWORD *)buf = 138544130;
                double v95 = v14;
                __int16 v96 = 2050;
                double v97 = v70;
                __int16 v98 = 2050;
                uint64_t v99 = v72;
                __int16 v100 = 2050;
                uint64_t v101 = v74;
                _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Evaluating stability for %{public}@ with results: crash count=%{public}lu; uptime=%{public}0.1f; MTBF=%{public}0.1f",
                  buf,
                  0x2Au);
              }
              if (v16)
              {
                id v34 = [v26 MTBF];
                [v34 doubleValue];
                double v36 = v35;
                [a1[10] doubleValue];
                if (v36 > v37) {
                  goto LABEL_26;
                }
                double v38 = v19 / (double)(unint64_t)v16;
                v39 = [v26 MTBF];
                [v39 doubleValue];
                double v41 = v38 - v40;
                [a1[11] doubleValue];
                if (v41 < v42)
                {

LABEL_26:
LABEL_27:
                  BOOL v43 = OSAStabilityMonitorLogDomain();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    CFStringRef v44 = [v26 MTBF];
                    [v44 doubleValue];
                    *(_DWORD *)buf = 134349314;
                    double v95 = v45;
                    __int16 v96 = 2114;
                    double v97 = v14;
                    v46 = v43;
                    NSErrorUserInfoKey v47 = "MTBF of %{public}f for %{public}@ does not meet filtering criteria.";
                    goto LABEL_38;
                  }
                  goto LABEL_39;
                }
                v60 = [v26 MTBF];
                [v60 doubleValue];
                double v62 = v61;
                [a1[12] doubleValue];
                double v64 = v38 * v63;

                if (v62 > v64) {
                  goto LABEL_27;
                }
LABEL_41:
                id v59 = [a1[4] recommendRollbackForBundleID:*(void *)&v14 reason:&v89];
              }
              else
              {
                id v51 = OSAStabilityMonitorLogDomain();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                {
                  id v52 = a1[13];
                  *(_DWORD *)buf = 138543362;
                  double v95 = *(double *)&v52;
                  _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Baseline has no crashes; adjusting maximum MTBF to %{public}@",
                    buf,
                    0xCu);
                }

                v53 = [v26 MTBF];
                [v53 doubleValue];
                double v55 = v54;
                [a1[13] doubleValue];
                double v57 = v56;

                if (v55 <= v57) {
                  goto LABEL_41;
                }
                BOOL v43 = OSAStabilityMonitorLogDomain();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  CFStringRef v44 = [v26 MTBF];
                  [v44 doubleValue];
                  *(_DWORD *)buf = 134349314;
                  double v95 = v58;
                  __int16 v96 = 2114;
                  double v97 = v14;
                  v46 = v43;
                  NSErrorUserInfoKey v47 = "MTBF of %{public}f for %{public}@ does not meet adjusted filtering criteria.";
LABEL_38:
                  _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, v47, buf, 0x16u);
                }
LABEL_39:

                id v59 = 0;
              }
              if ((unint64_t)(v89 - 1) > 5) {
                uint64_t v65 = 0;
              }
              else {
                uint64_t v65 = (uint64_t)*(&off_100020F28 + v89 - 1);
              }
              id v66 = a1[4];
              id v67 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v26 crashCount]);
              [v26 uptime];
              v68 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v69 = [v26 MTBF];
              [v66 reportResultsForBundleID:*(void *)&v14 crashes:v67 uptime:v68 MTBF:v69 result:v59 status:v65];
            }
            else
            {
              __int16 v48 = OSAStabilityMonitorLogDomain();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                double v75 = COERCE_DOUBLE([v26 crashCount]);
                [v26 uptime];
                *(_DWORD *)buf = 138543874;
                double v95 = v14;
                __int16 v96 = 2050;
                double v97 = v75;
                __int16 v98 = 2050;
                uint64_t v99 = v76;
                _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Error calculating MTBF for %{public}@ with crash count=%{public}lu and uptime=%{public}0.1f", buf, 0x20u);
              }

              id v49 = a1[4];
              id v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v26 crashCount]);
              [v26 uptime];
              __int16 v50 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              [v49 reportResultsForBundleID:*(void *)&v14 crashes:v31 uptime:v50 MTBF:0 result:0 status:@"Error calculating MTBF"];

LABEL_32:
            }
            uint64_t v12 = v85;
            id v5 = v86;

            id v11 = v87;
            goto LABEL_47;
          }
          id v21 = OSAStabilityMonitorLogDomain();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            double v95 = v14;
            __int16 v96 = 2050;
            double v97 = v19;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Baseline uptime for %{public}@ is %{public}lf, which is below the threshold.", buf, 0x16u);
          }

          [a1[4] reportResultsForBundleID:*(void *)&v14 crashes:0 uptime:0 MTBF:0 result:0 status:@"Baseline uptime below threshold"];
LABEL_47:
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
      }
      while (v11);
    }

    id v6 = v84;
  }
  else
  {
    long long v77 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
      sub_1000150EC((uint64_t)v6, v77, v78, v79, v80, v81, v82, v83);
    }

    [a1[4] reportResultsForBundleID:0 crashes:0 uptime:0 MTBF:0 result:0 status:@"Error calculating uptime"];
  }
}

uint64_t sub_10000B0D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 stringValue];
  if ([v4 isValidBundleID:v5])
  {
    id v6 = [*(id *)(a1 + 32) coalitionBasedBundleIDs];
    id v7 = [v3 stringValue];
    uint64_t v8 = [v6 containsObject:v7] ^ 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_10000B174(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 state];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3)
  {
    id v5 = [v6 error];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
  else
  {
    (*(void (**)(void, void, void))(v4 + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
  }
}

id sub_10000B210(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) addEvent:a2];
}

void sub_10000B440(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 state];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3)
  {
    id v5 = [v6 error];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
  else
  {
    (*(void (**)(void, void, void))(v4 + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
  }
}

id sub_10000B4DC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) addCrashEvent:a2 to:*(void *)(a1 + 40)];
}

void sub_10000B93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10000B96C(void *a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 state];
  uint64_t v4 = a1[4];
  if (v3)
  {
    id v5 = [v6 error];
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v5);
  }
  else
  {
    (*(void (**)(void, void, void, void))(v4 + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), 0);
  }
}

uint64_t sub_10000BA1C(void *a1, void *a2)
{
  id v3 = a2;
  [v3 timestamp];
  uint64_t v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v5 = [v3 eventBody];
  id v6 = [v5 supplementalBuild];
  unsigned int v7 = [v6 isEqualToString:a1[4]];

  if (v7)
  {
    uint64_t v8 = [v3 eventBody];
    unsigned int v9 = [v8 rapidSecurityResponsePreReboot];

    if (!v9)
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      uint64_t v10 = a1[7];
LABEL_7:
      objc_storeStrong((id *)(*(void *)(v10 + 8) + 40), v4);
      uint64_t v11 = 1;
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v10 = a1[5];
    goto LABEL_7;
  }
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    goto LABEL_6;
  }
  uint64_t v11 = 0;
LABEL_8:

  return v11;
}

id sub_10000BF28(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = [v3 unsignedIntegerValue];
    if ((unint64_t)v4 > 5)
    {
      CFStringRef v6 = @"(20, Inf)";
      if ((unint64_t)v4 < 0x15) {
        CFStringRef v6 = CFSTR("(10, 20]");
      }
      if ((unint64_t)v4 >= 0xB) {
        id v5 = (__CFString *)v6;
      }
      else {
        id v5 = CFSTR("(5, 10]");
      }
    }
    else
    {
      id v5 = +[NSString stringWithFormat:@"%lu", v4];
    }
    [v2 setObject:v5 forKeyedSubscript:@"crashCount"];
  }
  unsigned int v7 = *(void **)(a1 + 40);
  if (v7)
  {
    [v7 doubleValue];
    if (v8 >= 0.0)
    {
      if (v8 <= 5.0)
      {
        unsigned int v9 = +[NSString stringWithFormat:@"%ld", llround(v8)];
      }
      else
      {
        CFStringRef v10 = CFSTR("(12, 24]");
        if (v8 > 24.0) {
          CFStringRef v10 = @"(24, Inf)";
        }
        if (v8 > 12.0) {
          unsigned int v9 = (__CFString *)v10;
        }
        else {
          unsigned int v9 = CFSTR("(5, 12]");
        }
      }
    }
    else
    {
      unsigned int v9 = @"(-Inf, 0)";
    }
    [v2 setObject:v9 forKeyedSubscript:@"uptime"];
  }
  [v2 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"bundleID"];
  [v2 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"MTBF"];
  uint64_t v11 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
  [v2 setObject:v11 forKeyedSubscript:@"result"];

  [v2 setObject:*(void *)(a1 + 64) forKeyedSubscript:@"status"];

  return v2;
}

void sub_10000C758(id a1)
{
  qword_100026280 = (uint64_t)dispatch_queue_create("com.apple.osanalytics.stabilityMonitor", 0);

  _objc_release_x1();
}

void sub_10000DB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000DBBC(uint64_t a1, uint64_t a2)
{
  id v3 = 0;
  if (a1 && a2)
  {
    id v3 = +[NSString stringWithFormat:@"%@-%@", a1, a2];
    uint64_t v2 = vars8;
  }
  return v3;
}

void sub_10000DC1C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  [v15 timeIntervalSinceDate:*(void *)(a1 + 32)];
  unsigned int v7 = *(void **)(a1 + 40);
  if (v8 >= 0.0)
  {
    [*(id *)(a1 + 32) timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    double v13 = v12;
    double v14 = [*(id *)(a1 + 48) stringValue];
    [v7 addDouble:v14 forKey:*(void *)(a1 + 32) onDate:v13];

    *a4 = 1;
  }
  else
  {
    [v15 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    double v10 = v9;
    uint64_t v11 = [*(id *)(a1 + 48) stringValue];
    [v7 addDouble:v11 forKey:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) onDate:v10];

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
}

void sub_10000E308(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000E340(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000E394(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_10000E3B4(id a1)
{
  qword_100026290 = objc_alloc_init(OSADiagnosticMonitorServer);

  _objc_release_x1();
}

void sub_10000E5F4(void *a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1[4] + 24);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "entitled", (void)v8)) {
          [v7 failedToWriteLog:a1[5] error:a1[6]];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

id sub_10000E81C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "q_addConnection:entitled:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

id sub_10000E958(uint64_t a1)
{
  id v2 = DiagnosticMonitorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100015418(a1);
  }

  return [*(id *)(*(void *)(a1 + 40) + 24) removeObject:*(void *)(a1 + 32)];
}

void sub_10000EE04(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    +[NSException raise:NSInvalidUnarchiveOperationException, @"Putative set of strings was a %@", objc_opt_class() format];
  }
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = v1;
  id v3 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          +[NSException raise:NSInvalidUnarchiveOperationException, @"Putative set of strings contained a %@", objc_opt_class() format];
        }
      }
      id v4 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

id sub_10000EF9C()
{
  v0 = +[NSString stringWithFormat:@"Diagnostic monitor client lacks %@ entitlement", @"com.apple.osanalytics.canusediagnosticmonitor"];
  NSErrorUserInfoKey v4 = NSLocalizedDescriptionKey;
  uint64_t v5 = v0;
  id v1 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  id v2 = +[NSError errorWithDomain:@"OSADiagnosticMonitor" code:0 userInfo:v1];

  return v2;
}

void sub_10000F1B0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_10000F1F8(id a1)
{
  id v1 = objc_alloc_init(OSABridgeLinkRemote);
  id v2 = (void *)qword_1000262A0;
  qword_1000262A0 = (uint64_t)v1;

  xpc_set_event_stream_handler("com.apple.remoteservicediscovery.events", (dispatch_queue_t)&_dispatch_main_q, &stru_100021030);
  if (qword_1000262A0)
  {
    +[OSABridgeLinkProxy setLink:](OSABridgeLinkProxy, "setLink:");
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Remote link is unavailable", v3, 2u);
  }
}

void sub_10000F2C4(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2 && xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      CFStringRef v6 = _xpc_event_key_name;
      __int16 v7 = 2080;
      long long v8 = string;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got com.apple.remoteservicediscovery.events %s:%s", (uint8_t *)&v5, 0x16u);
    }
    if (!strcmp(string, "com.apple.SubmitDiagInfo.available")) {
      [(id)qword_1000262A0 handleLaunchEvent];
    }
    if (!strcmp(string, "com.apple.SubmitDiagInfo.available.display")) {
      [(id)qword_1000262A0 handleLaunchEvent];
    }
  }
}

void sub_10000F664(void *a1)
{
  time_t v2 = time(0);
  if (v2 >= 0) {
    uint64_t v3 = (v2 / 0x15180uLL);
  }
  else {
    uint64_t v3 = v2;
  }
  NSErrorUserInfoKey v4 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:@"<current_day>"];
  unsigned int v5 = [v4 intValue];

  if (v5 != v3)
  {
    [*(id *)(a1[4] + 24) removeAllObjects];
    CFStringRef v6 = +[NSNumber numberWithInt:v3];
    [*(id *)(a1[4] + 24) setObject:v6 forKeyedSubscript:@"<current_day>"];
  }
  __int16 v7 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  int v8 = [v7 intValue];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = a1[5];
    int v13 = 138412802;
    *(void *)double v14 = v9;
    *(_WORD *)&v14[8] = 1024;
    *(_DWORD *)&v14[10] = v8;
    __int16 v15 = 1024;
    int v16 = 50;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "daily xfer limit for %@ %d/%d", (uint8_t *)&v13, 0x18u);
  }
  uint64_t v10 = +[NSNumber numberWithInt:(v8 + 1)];
  [*(id *)(a1[4] + 24) setObject:v10 forKeyedSubscript:a1[5]];

  if (v8 > 49)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[6];
      int v13 = 67109378;
      *(_DWORD *)double v14 = v8;
      *(_WORD *)&v14[4] = 2112;
      *(void *)&v14[6] = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "daily xfer limit exceeded (%d), deleting %@", (uint8_t *)&v13, 0x12u);
    }
    long long v11 = +[NSFileManager defaultManager];
    [v11 removeItemAtPath:a1[6] error:0];
  }
  else
  {
    [*(id *)(a1[4] + 8) initiate:0 transferLog:a1[6] withOptions:&off_100022F28 job:0];
    long long v11 = +[NSUserDefaults standardUserDefaults];
    [v11 setObject:*(void *)(a1[4] + 24) forKey:@"xfer-counts"];
  }
}

void sub_10000FB18(const char *a1, void *a2)
{
  uint64_t v3 = a2;
  NSErrorUserInfoKey v4 = opendir(a1);
  if (v4)
  {
    unsigned int v5 = v4;
    for (i = readdir(v4); i; i = readdir(v5))
    {
      int d_type = i->d_type;
      if (d_type == 4)
      {
        if (i->d_name[0] != 46 || i->d_name[1] && (i->d_name[1] != 46 || i->d_name[2]))
        {
          snprintf(__str, 0x400uLL, "%s/%s", a1, i->d_name);
          sub_10000FB18(__str, v3);
        }
      }
      else if (d_type == 8)
      {
        v3[2](v3, a1, (uint64_t)i->d_name);
      }
    }
    closedir(v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = __error();
    uint64_t v9 = strerror(*v8);
    *(_DWORD *)__str = 136315394;
    long long v11 = a1;
    __int16 v12 = 2080;
    int v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to open log directory '%s': %s", (uint8_t *)__str, 0x16u);
  }
}

void sub_10000FC9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5 = +[NSString stringWithUTF8String:a2];
  CFStringRef v6 = +[NSString stringWithUTF8String:a3];
  __int16 v7 = [v5 stringByAppendingPathComponent:v6];

  int v8 = *(void **)(a1 + 32);
  id v20 = 0;
  uint64_t v9 = [v8 attributesOfItemAtPath:v7 error:&v20];
  id v10 = v20;
  if (v9)
  {
    long long v11 = [v9 fileModificationDate];
    [v11 timeIntervalSinceNow];
    double v13 = fabs(v12);

    id v14 = [v9 fileSize];
    uint64_t v15 = (uint64_t)v14;
    if (!*(unsigned char *)(a1 + 40) && v13 <= 604800.0 && (unint64_t)v14 <= 0x100000)
    {
      id v16 = v10;
      goto LABEL_12;
    }
  }
  else
  {
    double v13 = 604801.0;
    uint64_t v15 = 1048577;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    double v22 = v13;
    __int16 v23 = 2048;
    uint64_t v24 = v15;
    __int16 v25 = 2114;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Removing old (%.0f) or big (%llu) log '%{public}@'", buf, 0x20u);
  }
  uint64_t v17 = *(void **)(a1 + 32);
  id v19 = v10;
  unsigned __int8 v18 = [v17 removeItemAtPath:v7 error:&v19];
  id v16 = v19;

  if ((v18 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    double v22 = *(double *)&v7;
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to remove log '%@': %@", buf, 0x16u);
  }
LABEL_12:
}

uint64_t start(int a1, uint64_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "osanalyticshelper launched", v5, 2u);
  }
  if (a1 == 2 && !strcmp("server-init", *(const char **)(a2 + 8))) {
    sub_10001551C();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100015678();
  }
  return 1;
}

id sub_1000100D0()
{
  xpc_activity_register("com.apple.osanalytics.state-monitor", XPC_ACTIVITY_CHECK_IN, &stru_100021078);
  xpc_activity_register("com.apple.osanalytics.stability-monitor", XPC_ACTIVITY_CHECK_IN, &stru_100021098);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Registering the daily telemetry activity.", buf, 2u);
  }
  xpc_activity_register("com.apple.osanalytics.daily.telemetry", XPC_ACTIVITY_CHECK_IN, &stru_1000210B8);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Registering the boot time rtc beacon activity.", v1, 2u);
  }
  xpc_activity_register("com.apple.osanalytics.postboot.telemetry", XPC_ACTIVITY_CHECK_IN, &stru_1000210D8);
  xpc_set_event_stream_handler("com.apple.alarm", 0, &stru_1000210F8);
  return +[HighEngagementGenerator setAlarm:0];
}

void sub_100010208(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)time_t v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running the state monitor.", v2, 2u);
    }
    +[OSAStateMonitor evaluateState];
  }
}

void sub_100010280(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    OSAStabilityMonitorLoadParameters();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    +[OSAStabilityMonitor evaluateStabilityWithParameters:v2];
  }
}

void sub_1000102F8(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running the daily telemetry collection.", v2, 2u);
    }
    +[OSADailyTelemetryMonitor evaluateState];
    +[OSADailyTelemetryMonitor sendRTCBeacon:0];
  }
}

void sub_100010384(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running the post-boot telemetry.", v2, 2u);
    }
    +[OSADailyTelemetryMonitor sendRTCBeacon:1];
  }
}

void sub_100010400(id a1, OS_xpc_object *a2)
{
  xpc_dictionary_get_string(a2, _xpc_event_key_name);
  xpc_set_event();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running the High Engagement Alarm.", v2, 2u);
  }
  +[HighEngagementGenerator createBiomeFeed];
  +[HighEngagementGenerator setAlarm:1];
}

void sub_1000104CC(id a1)
{
  qword_1000262B8 = (uint64_t)dispatch_queue_create("com.apple.osanalytics.reportCreateQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);

  _objc_release_x1();
}

void sub_100010510(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSErrorUserInfoKey v4 = v3;
  if (v3 != &_xpc_error_connection_interrupted && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(v4, _xpc_error_key_description);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v14 = string;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got back-channel xpc error event: %{public}s\n", buf, 0xCu);
    }
    CFStringRef v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string, NSLocalizedDescriptionKey);
    double v12 = v6;
    __int16 v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v8 = +[NSError errorWithDomain:@"OSALog" code:101 userInfo:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void sub_100010700(id a1)
{
  qword_1000262C0 = (uint64_t)dispatch_queue_create("com.apple.osanalytics.urgentSubmissionsQ", 0);

  _objc_release_x1();
}

void sub_100010740(id a1)
{
  id v2 = (id)objc_opt_new();
  [v2 setUrgentSubmission:1];
  id v1 = objc_alloc_init((Class)OSASubmissionClient);
  [v1 submitWithOptions:v2];
}

void sub_10001090C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL sub_100010998(void *a1)
{
  BOOL result = +[OSAXPCServices handleDefaultsRequestWithParams:a1[4] forReply:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

void sub_100011148(uint64_t a1, BOOL a2)
{
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "result", 1);
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "stability_result", a2);
  unsigned int v5 = *(void **)(a1 + 32);
  NSErrorUserInfoKey v4 = *(_xpc_connection_s **)(a1 + 40);

  xpc_connection_send_message(v4, v5);
}

void sub_100011A4C(id a1)
{
  dispatch_semaphore_t v1 = dispatch_semaphore_create(1);
  id v2 = (void *)qword_1000262D0;
  qword_1000262D0 = (uint64_t)v1;

  qword_100026300 = CFAbsoluteTimeGetCurrent();
}

uint64_t sub_100011A84(uint64_t a1, uint64_t a2, xpc_object_t xstring)
{
  unsigned int v5 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(xstring)];
  CFStringRef v6 = *(void **)(a1 + 32);
  __int16 v7 = +[NSString stringWithUTF8String:a2];
  [v6 setObject:v5 forKeyedSubscript:v7];

  return 1;
}

void *sub_100011B08(uint64_t a1)
{
  if (snprintf(__str, 0x80uLL, "0x%llx", *(void *)(a1 + 40)) < 0)
  {
    long long v17 = xmmword_1000193E0;
    long long v18 = unk_1000193F0;
    long long v19 = xmmword_100019400;
    long long v20 = unk_100019410;
    *(_OWORD *)__str = *(_OWORD *)"<unknown>";
    long long v14 = *(_OWORD *)&algn_1000193AA[6];
    long long v15 = xmmword_1000193C0;
    long long v16 = unk_1000193D0;
  }
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  id v3 = v2;
  if (*(void *)(a1 + 48)) {
    NSErrorUserInfoKey v4 = *(const char **)(a1 + 48);
  }
  else {
    NSErrorUserInfoKey v4 = "<anonymous>";
  }
  xpc_dictionary_set_string(v2, "caller", v4);
  xpc_dictionary_set_uint64(v3, "latency", *(void *)(a1 + 56));
  xpc_dictionary_set_uint64(v3, "latency_outer", *(void *)(a1 + 64));
  xpc_dictionary_set_uint64(v3, "latency_inner", *(void *)(a1 + 72));
  xpc_dictionary_set_uint64(v3, "latency_prior", *(void *)(a1 + 80));
  xpc_dictionary_set_BOOL(v3, "result", *(unsigned char *)(a1 + 112));
  xpc_dictionary_set_uint64(v3, "size", *(void *)(a1 + 88));
  xpc_dictionary_set_uint64(v3, "size_adj", *(void *)(a1 + 96));
  unint64_t v5 = *(void *)(a1 + 104);
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 88);
    int64_t v7 = v6 - v5;
    if ((uint64_t)(v6 - v5) >= 0) {
      uint64_t v8 = v6 - v5;
    }
    else {
      uint64_t v8 = v5 - v6;
    }
    unint64_t v9 = (v5 + 100 * v8 - 1) / v5;
    if (v7 >= 0) {
      int64_t v10 = v9;
    }
    else {
      int64_t v10 = -(uint64_t)v9;
    }
  }
  else
  {
    int64_t v10 = 0;
    int64_t v7 = 0;
  }
  xpc_dictionary_set_int64(v3, "size_deltapct", v10);
  xpc_dictionary_set_int64(v3, "size_delta", v7);
  xpc_dictionary_set_string(v3, "exception_code", __str);
  uint64_t v11 = *(void **)(a1 + 32);
  if (v11) {
    xpc_dictionary_set_BOOL(v3, "tasked", (BOOL)[v11 BOOLValue]);
  }
  return v3;
}

uint64_t sub_100011EBC(uint64_t a1, uint64_t a2, xpc_object_t xstring)
{
  unint64_t v5 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(xstring)];
  uint64_t v6 = *(void **)(a1 + 32);
  int64_t v7 = +[NSString stringWithUTF8String:a2];
  [v6 setObject:v5 forKeyedSubscript:v7];

  return 1;
}

uint64_t variable initialization expression of OSAJobQuiescenceMonitor.logger()
{
  sub_1000149A8(0, &qword_1000261C0);
  static OS_os_log.default.getter();

  return Logger.init(_:)();
}

uint64_t static OSAJobQuiescenceMonitor.isAvailable()()
{
  if (&metaclass for JQXPCConnection) {
    BOOL v0 = &nominal type descriptor for JQXPCConnection == 0;
  }
  else {
    BOOL v0 = 1;
  }
  int v7 = v0
    || &type metadata for JQXPCConnection == 0
    || &type metadata accessor for JQXPCConnection == 0
    || &protocol witness table for JQXPCConnection == 0
    || &protocol conformance descriptor for JQXPCConnection == 0
    || &protocol conformance descriptor for JQXPCConnection == 0
    || &class metadata base offset for JQXPCConnection == 0;
  if (&nominal type descriptor for JQLaunchEventSubscription) {
    BOOL v8 = &type metadata for JQLaunchEventSubscription == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8
    || &type metadata accessor for JQLaunchEventSubscription == 0
    || &class metadata base offset for JQLaunchEventSubscription == 0)
  {
    int v7 = 1;
  }
  if (&metaclass for JQTask) {
    BOOL v11 = &nominal type descriptor for JQTask == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11
    || &type metadata for JQTask == 0
    || &type metadata accessor for JQTask == 0
    || &class metadata base offset for JQTask == 0)
  {
    int v7 = 1;
  }
  if (&nominal type descriptor for JQTaskDescriptor) {
    BOOL v15 = &type metadata for JQTaskDescriptor == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15
    || &type metadata accessor for JQTaskDescriptor == 0
    || &protocol conformance descriptor for JQTaskDescriptor == 0
    || &protocol conformance descriptor for JQTaskDescriptor == 0)
  {
    int v7 = 1;
  }
  if (&nominal type descriptor for JQNotificationType) {
    BOOL v19 = &type metadata for JQNotificationType == 0;
  }
  else {
    BOOL v19 = 1;
  }
  int v25 = !v19
     && &type metadata accessor for JQNotificationType != 0
     && &protocol conformance descriptor for JQNotificationType != 0
     && &protocol conformance descriptor for JQNotificationType != 0
     && &protocol conformance descriptor for JQNotificationType != 0
     && &protocol conformance descriptor for JQNotificationType != 0;
  unsigned int v26 = v25 & ~v7;
  if (&nominal type descriptor for PostQuiesceActions) {
    BOOL v27 = &type metadata for PostQuiesceActions == 0;
  }
  else {
    BOOL v27 = 1;
  }
  if (v27
    || &type metadata accessor for PostQuiesceActions == 0
    || &protocol conformance descriptor for PostQuiesceActions == 0
    || &protocol conformance descriptor for PostQuiesceActions == 0
    || &protocol conformance descriptor for PostQuiesceActions == 0
    || &protocol conformance descriptor for PostQuiesceActions == 0
    || &protocol conformance descriptor for PostQuiesceActions == 0
    || &protocol conformance descriptor for PostQuiesceActions == 0
    || &protocol conformance descriptor for PostQuiesceActions == 0)
  {
    return 0;
  }
  else
  {
    return v26;
  }
}

id sub_1000122D4()
{
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v4);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  sub_1000149A8(0, &qword_1000261C0);
  uint64_t v6 = v0;
  static OS_os_log.default.getter();
  Logger.init(_:)();
  sub_1000149A8(0, &qword_100026228);
  static DispatchQoS.utility.getter();
  double v12 = &_swiftEmptyArrayStorage;
  sub_1000149E4(&qword_100026230, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100014788(&qword_100026238);
  sub_100014A2C(&qword_100026240, &qword_100026238);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v10);
  *(void *)&v6[OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_queue] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();

  int v7 = (objc_class *)type metadata accessor for OSAJobQuiescenceMonitor();
  v11.receiver = v6;
  v11.super_class = v7;
  id v8 = objc_msgSendSuper2(&v11, "init");
  sub_1000138B0();

  return v8;
}

uint64_t sub_1000125C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v66 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v65 = (char *)&v61 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  double v63 = (char *)&v61 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  double v64 = (char *)&v61 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  long long v14 = (char *)&v61 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  double v62 = (char *)&v61 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  BOOL v19 = (char *)&v61 - v18;
  __chkstk_darwin(v17);
  id v21 = (char *)&v61 - v20;
  double v22 = *(void (**)(void))(v3 + 16);
  v68 = (void (*)(char *, uint64_t))(v1 + OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_logger);
  __int16 v23 = (void (*)(char *, uint64_t (*)(void, void), uint64_t))v22;
  v22((char *)&v61 - v20);
  uint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    unsigned int v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Syncing and submitting logs", v26, 2u);
    swift_slowDealloc();
  }

  BOOL v27 = *(void (**)(char *, uint64_t))(v3 + 8);
  v27(v21, v2);
  id v28 = v68;
  v23(v19, (uint64_t (*)(void, void))v68, v2);
  uint64_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.default.getter();
  BOOL v31 = os_log_type_enabled(v29, v30);
  uint64_t v67 = v3 + 8;
  if (v31)
  {
    id v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Attempting rollover of CoreAnalytics log", v32, 2u);
    swift_slowDealloc();
  }

  v27(v19, v2);
  int v33 = AnalyticsRolloverEvents();
  if (v33)
  {
    long long v14 = v62;
    v23(v62, (uint64_t (*)(void, void))v28, v2);
    id v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v34, v35)) {
      goto LABEL_11;
    }
    double v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v36 = 0;
    double v37 = "Successful CoreAnalytics log rollover";
  }
  else
  {
    v23(v14, (uint64_t (*)(void, void))v28, v2);
    id v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v34, v35)) {
      goto LABEL_11;
    }
    double v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v36 = 0;
    double v37 = "Failed to rollover CoreAnalytics log";
  }
  _os_log_impl((void *)&_mh_execute_header, v34, v35, v37, v36, 2u);
  swift_slowDealloc();
LABEL_11:
  double v38 = v68;

  v27(v14, v2);
  v39 = v64;
  v23(v64, (uint64_t (*)(void, void))v38, v2);
  double v40 = Logger.logObject.getter();
  os_log_type_t v41 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v40, v41))
  {
    double v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v42 = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "Attempting submission of logs", v42, 2u);
    swift_slowDealloc();
  }

  v27(v39, v2);
  id v43 = [objc_allocWithZone((Class)OSASubmissionClient) init];
  unsigned int v44 = [v43 submit];

  double v45 = v65;
  LODWORD(v64) = v44;
  if (v44)
  {
    double v45 = v63;
    v23(v63, (uint64_t (*)(void, void))v38, v2);
    v46 = Logger.logObject.getter();
    os_log_type_t v47 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v46, v47))
    {
LABEL_19:
      id v51 = v66;
      goto LABEL_21;
    }
    __int16 v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)__int16 v48 = 0;
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "Logs submitted successfully", v48, 2u);
LABEL_18:
    swift_slowDealloc();
    goto LABEL_19;
  }
  v23(v65, (uint64_t (*)(void, void))v38, v2);
  v46 = Logger.logObject.getter();
  os_log_type_t v49 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v46, v49))
  {
    __int16 v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)__int16 v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v46, v49, "Failed to submit logs", v50, 2u);
    double v38 = v68;
    goto LABEL_18;
  }
  id v51 = v66;
  double v38 = v68;
LABEL_21:

  v27(v45, v2);
  v23(v51, (uint64_t (*)(void, void))v38, v2);
  id v52 = Logger.logObject.getter();
  os_log_type_t v53 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = swift_slowAlloc();
    v68 = v27;
    uint64_t v55 = v54;
    uint64_t v70 = swift_slowAlloc();
    *(_DWORD *)uint64_t v55 = 136446466;
    if (v33) {
      uint64_t v56 = 1702195828;
    }
    else {
      uint64_t v56 = 0x65736C6166;
    }
    if (v33) {
      unint64_t v57 = 0xE400000000000000;
    }
    else {
      unint64_t v57 = 0xE500000000000000;
    }
    uint64_t v69 = sub_100013D8C(v56, v57, &v70);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v55 + 12) = 2082;
    if (v64) {
      uint64_t v58 = 1702195828;
    }
    else {
      uint64_t v58 = 0x65736C6166;
    }
    if (v64) {
      unint64_t v59 = 0xE400000000000000;
    }
    else {
      unint64_t v59 = 0xE500000000000000;
    }
    uint64_t v69 = sub_100013D8C(v58, v59, &v70);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v52, v53, "Completed sync and submission of logs (rollover: %{public}s, submission: %{public}s)", (uint8_t *)v55, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return ((uint64_t (*)(char *, uint64_t))v68)(v66, v2);
  }
  else
  {

    return ((uint64_t (*)(char *, uint64_t))v27)(v51, v2);
  }
}

void sub_100012DCC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v37 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  os_log_type_t v35 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = type metadata accessor for DispatchQoS();
  uint64_t v34 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v39 - 8);
  uint64_t v7 = __chkstk_darwin(v39);
  double v38 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = type metadata accessor for PostQuiesceActions();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  long long v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PostQuiesceActions.shutdown.getter();
  sub_1000147CC();
  char v15 = dispatch thunk of SetAlgebra.isSuperset(of:)();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if ((v15 & 1) != 0
    || (id v16 = [self standardUserDefaults],
        NSString v17 = String._bridgeToObjectiveC()(),
        unsigned int v18 = [v16 BOOLForKey:v17],
        v16,
        v17,
        v18))
  {
    uint64_t v32 = v2;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, &v1[OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_logger], v39);
    BOOL v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      id v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Quiesce request accepted. Queueing quiescence tasks.", v21, 2u);
      swift_slowDealloc();
    }

    int v33 = *(void (**)(char *, uint64_t))(v6 + 8);
    v33(v10, v39);
    type metadata accessor for JQXPCConnection();
    swift_allocObject();
    JQXPCConnection.init()();
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = 0;
    uint64_t v23 = type metadata accessor for JQTaskDescriptor();
    __chkstk_darwin(v23 - 8);
    swift_retain();
    getpid();
    JQTaskDescriptor.init(name:pid:duration:jobGroup:)();
    type metadata accessor for JQTask();
    swift_allocObject();
    uint64_t v24 = JQTask.init(conn:description:)();
    *(void *)(v22 + 16) = v24;
    if (v24)
    {
      swift_retain();
      dispatch thunk of JQTask.begin()();
      swift_release();
      os_log_type_t v25 = *(void **)&v1[OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_queue];
      uint64_t v26 = swift_allocObject();
      *(void *)(v26 + 16) = v1;
      *(void *)(v26 + 24) = v22;
      aBlock[4] = sub_100014890;
      aBlock[5] = v26;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10001386C;
      aBlock[3] = &unk_1000213F0;
      BOOL v27 = _Block_copy(aBlock);
      id v28 = v25;
      uint64_t v29 = v1;
      swift_retain();
      static DispatchQoS.unspecified.getter();
      double v40 = &_swiftEmptyArrayStorage;
      sub_1000149E4(&qword_100026208, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100014788(&qword_100026210);
      sub_100014A2C(&qword_100026218, &qword_100026210);
      os_log_type_t v30 = v35;
      uint64_t v31 = v32;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v27);
      swift_release();

      (*(void (**)(char *, uint64_t))(v37 + 8))(v30, v31);
      (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v36);
      swift_release();
      swift_release();
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_1000135F4(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a2;
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v21 - v8;
  uint64_t v10 = a1 + OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_logger;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v11((char *)v21 - v8, a1 + OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_logger, v3);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    long long v14 = (uint8_t *)swift_slowAlloc();
    v21[1] = a1;
    *(_WORD *)long long v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Beginning quiescence task", v14, 2u);
    swift_slowDealloc();
  }
  char v15 = (void *)(v22 + 16);

  id v16 = *(void (**)(char *, uint64_t))(v4 + 8);
  v16(v9, v3);
  sub_1000125C4();
  v11(v7, v10, v3);
  NSString v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    BOOL v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Completed quiescence task", v19, 2u);
    swift_slowDealloc();
  }

  v16(v7, v3);
  uint64_t result = swift_beginAccess();
  if (*v15)
  {
    swift_retain();
    dispatch thunk of JQTask.end()();
    return swift_release();
  }
  return result;
}

uint64_t sub_10001386C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_1000138B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  os_log_type_t v18 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - v6;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)&v16 - v6, &v1[OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_logger], v2);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Starting JobQuiescence monitor", v10, 2u);
    swift_slowDealloc();
  }

  NSString v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v17(v7, v2);
  id v11 = objc_allocWithZone((Class)type metadata accessor for JQLaunchEventSubscription());
  uint64_t v12 = (void *)JQLaunchEventSubscription.init(subscriptionName:subscriberName:)();
  os_log_type_t v13 = *(void **)&v1[OBJC_IVAR____TtC17osanalyticshelper23OSAJobQuiescenceMonitor_queue];
  *(void *)(swift_allocObject() + 16) = v1;
  id v14 = v13;
  char v15 = v1;
  dispatch thunk of JQLaunchEventSubscription.register(on:for:notification:)();

  swift_release();
}

id OSAJobQuiescenceMonitor.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OSAJobQuiescenceMonitor();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_100013D58()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for OSAJobQuiescenceMonitor()) init];
  qword_100026310 = (uint64_t)result;
  return result;
}

uint64_t sub_100013D8C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100013E60(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100014948((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100014948((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000148F8((uint64_t)v12);
  return v7;
}

uint64_t sub_100013E60(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001401C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10001401C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000140B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100014294(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100014294(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000140B4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10001422C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001422C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100014788(&qword_100026220);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100014294(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100014788(&qword_100026220);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t _s17osanalyticshelper23OSAJobQuiescenceMonitorC14sharedInstanceACSgvgZ_0()
{
  uint64_t v0 = 0;
  if (&metaclass for JQXPCConnection) {
    BOOL v1 = &nominal type descriptor for JQXPCConnection == 0;
  }
  else {
    BOOL v1 = 1;
  }
  char v8 = v1
    || &type metadata for JQXPCConnection == 0
    || &type metadata accessor for JQXPCConnection == 0
    || &protocol witness table for JQXPCConnection == 0
    || &protocol conformance descriptor for JQXPCConnection == 0
    || &protocol conformance descriptor for JQXPCConnection == 0
    || &class metadata base offset for JQXPCConnection == 0;
  if (&nominal type descriptor for JQLaunchEventSubscription) {
    BOOL v9 = &type metadata for JQLaunchEventSubscription == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9
    || &type metadata accessor for JQLaunchEventSubscription == 0
    || &class metadata base offset for JQLaunchEventSubscription == 0)
  {
    char v12 = 1;
  }
  else
  {
    char v12 = v8;
  }
  if (&metaclass for JQTask) {
    BOOL v13 = &nominal type descriptor for JQTask == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13
    || &type metadata for JQTask == 0
    || &type metadata accessor for JQTask == 0
    || &class metadata base offset for JQTask == 0)
  {
    char v12 = 1;
  }
  if (&nominal type descriptor for JQTaskDescriptor) {
    BOOL v17 = &type metadata for JQTaskDescriptor == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17
    || &type metadata accessor for JQTaskDescriptor == 0
    || &protocol conformance descriptor for JQTaskDescriptor == 0
    || &protocol conformance descriptor for JQTaskDescriptor == 0)
  {
    char v12 = 1;
  }
  if ((v12 & 1) == 0)
  {
    BOOL v21 = !&protocol conformance descriptor for JQNotificationType
       || &protocol conformance descriptor for JQNotificationType == 0;
    BOOL v22 = v21 || &protocol conformance descriptor for JQNotificationType == 0;
    BOOL v23 = v22 || &protocol conformance descriptor for JQNotificationType == 0;
    BOOL v24 = v23 || &type metadata accessor for JQNotificationType == 0;
    BOOL v25 = v24 || &type metadata for JQNotificationType == 0;
    if (!v25 && &nominal type descriptor for JQNotificationType != 0)
    {
      BOOL v27 = !&nominal type descriptor for PostQuiesceActions || &type metadata for PostQuiesceActions == 0;
      BOOL v28 = v27 || &type metadata accessor for PostQuiesceActions == 0;
      BOOL v29 = v28 || &protocol conformance descriptor for PostQuiesceActions == 0;
      BOOL v30 = v29 || &protocol conformance descriptor for PostQuiesceActions == 0;
      BOOL v31 = v30 || &protocol conformance descriptor for PostQuiesceActions == 0;
      BOOL v32 = v31 || &protocol conformance descriptor for PostQuiesceActions == 0;
      BOOL v33 = v32 || &protocol conformance descriptor for PostQuiesceActions == 0;
      BOOL v34 = v33 || &protocol conformance descriptor for PostQuiesceActions == 0;
      if (!v34 && &protocol conformance descriptor for PostQuiesceActions != 0)
      {
        if (qword_100026308 != -1) {
          swift_once();
        }
        uint64_t v0 = qword_100026310;
        id v36 = (id)qword_100026310;
      }
    }
  }
  return v0;
}

uint64_t type metadata accessor for OSAJobQuiescenceMonitor()
{
  uint64_t result = qword_100026320;
  if (!qword_100026320) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100014680()
{
  return type metadata accessor for OSAJobQuiescenceMonitor();
}

uint64_t sub_100014688()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100014728()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100014760()
{
}

uint64_t sub_100014788(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000147CC()
{
  unint64_t result = qword_100026200;
  if (!qword_100026200)
  {
    type metadata accessor for PostQuiesceActions();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100026200);
  }
  return result;
}

uint64_t sub_100014818()
{
  swift_release();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100014850()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014890()
{
  return sub_1000135F4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100014898(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000148A8()
{
  return swift_release();
}

uint64_t sub_1000148B0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000148F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100014948(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000149A8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1000149E4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100014A2C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000148B0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100014A7C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "HighEngagement: Biome class not available.  Returning.", v0, 2u);
}

void sub_100014AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014BB4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "HighEngagement: Failed to get _DKEventQuery class", v0, 2u);
}

void sub_100014BFC(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "HighEngagement: Error querying knowledge store: %@", buf, 0xCu);
}

void sub_100014C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014CD0()
{
  sub_10000E328();
  sub_10000E308((void *)&_mh_execute_header, v0, v1, "Error finding end date from baseline (%{public}@): %{public}@");
}

void sub_100014D3C()
{
  sub_10000E328();
  sub_10000E308((void *)&_mh_execute_header, v0, v1, "Error calculating app uptime from baseline (%{public}@): %{public}@");
}

void sub_100014DA8()
{
  sub_10000E328();
  sub_10000E308((void *)&_mh_execute_header, v0, v1, "Error calculating crashes count from baseline (%{public}@): %{public}@");
}

void sub_100014E14()
{
  sub_10000E37C();
  sub_10000E308((void *)&_mh_execute_header, v0, v1, "Rollback recommendation failed for %{public}@: %{public}@");
}

void sub_100014E7C()
{
  sub_10000E328();
  sub_10000E308((void *)&_mh_execute_header, v0, v1, "Unexpectedly would have recommended a rollback when targeting %{public}@ for %{public}@");
}

void sub_100014EE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014F58()
{
  sub_10000E37C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Retrieved baseline values: crash count=%{public}@; uptime=%{public}@",
    v1,
    0x16u);
}

void sub_100014FD0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error retrieving baseline values.", v1, 2u);
}

void sub_100015014(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015080(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000150EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015158(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "The stability monitor is not available on this platform.", v1, 2u);
}

void sub_10001519C(void *a1)
{
  uint64_t v2 = [a1 stringValue];
  uint64_t v3 = [a1 endDate];
  sub_10000E35C();
  sub_10000E394((void *)&_mh_execute_header, v4, v5, "Clamping end date for %{public}@ from %{public}@ to %{public}@", v6, v7, v8, v9, v10);
}

void sub_10001524C(void *a1)
{
  uint64_t v2 = [a1 stringValue];
  uint64_t v3 = [a1 startDate];
  sub_10000E35C();
  sub_10000E394((void *)&_mh_execute_header, v4, v5, "Clamping start date for %{public}@ from %{public}@ to %{public}@", v6, v7, v8, v9, v10);
}

void sub_1000152FC(void *a1)
{
  [a1 processIdentifier];
  sub_10000F1B0((void *)&_mh_execute_header, v1, v2, "Adding entitled client connection from pid %d", v3, v4, v5, v6, 0);
}

void sub_100015378(void *a1, NSObject *a2)
{
  v3[0] = 67109378;
  v3[1] = [a1 processIdentifier];
  __int16 v4 = 2114;
  CFStringRef v5 = @"com.apple.osanalytics.canusediagnosticmonitor";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Adding client connection from pid %d which lacks entitlement %{public}@ -- observer registration attempts will fail.", (uint8_t *)v3, 0x12u);
}

void sub_100015418(uint64_t a1)
{
  [*(id *)(a1 + 32) pid];
  sub_10000F1B0((void *)&_mh_execute_header, v1, v2, "Removing invalidated client connection for pid %d", v3, v4, v5, v6, 0);
}

void sub_100015498(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "initial xfer-counts %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001551C()
{
  uint64_t v1 = objc_alloc_init(OSAXPCServices);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "instantiating the diagnostic monitor server", v7, 2u);
  }
  id v2 = +[OSADiagnosticMonitorServer sharedInstance];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "instantiating the job quiescence monitor server if available", buf, 2u);
  }
  id v3 = +[OSAJobQuiescenceMonitor sharedInstance];
  uint64_t v4 = +[OSASystemConfiguration sharedInstance];
  id v5 = [v4 pathSubmissionSubdirDiagnosticLogs];

  if ((OSAIsRSDDisplay() & 1) == 0) {
    +[OSASubmissionScheduler scheduleSubmission];
  }
  +[OSASubmissionScheduler scheduleCleanupWithHomeDirectory:0];
  sub_1000100D0();
  uint64_t v6 = +[NSRunLoop currentRunLoop];
  [v6 run];

  __assert_rtn("main", "main.m", 160, "false");
}

void sub_100015678()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unsupported arguments passed. Exiting..", v0, 2u);
}

void sub_1000156C0()
{
  int v0 = 136446210;
  uint64_t v1 = "com.apple.osanalytics.osanalyticshelper";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create the listenerConnection for %{public}s", (uint8_t *)&v0, 0xCu);
}

void sub_100015748()
{
  sub_100012054();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Unknown operation requested: %lu", v0, 0xCu);
}

void sub_1000157C4(uint8_t *buf, int a2)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Client (%d) is not entitled to read/write defaults.", buf, 8u);
}

void sub_100015810()
{
  sub_100012054();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unsupported defaults operation: %llu", v0, 0xCu);
}

void sub_10001588C(_xpc_connection_s *a1)
{
  v1[0] = 67109120;
  v1[1] = xpc_connection_get_pid(a1);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Client (%d) is not entitled to read/write all defaults.", (uint8_t *)v1, 8u);
}

void sub_100015910(_xpc_connection_s *a1, NSObject *a2)
{
  v3[0] = 67109120;
  v3[1] = xpc_connection_get_pid(a1);
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Client (%d) is not entitled to run the stability monitor.", (uint8_t *)v3, 8u);
}

void sub_10001599C()
{
  sub_100012054();
  __int16 v3 = 2081;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Error handling XPC request to run stability monitor: %{public}s. Request: %{private}s", v2, 0x16u);
}

void sub_100015A20()
{
  sub_100012054();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Set the additionalPayload to %@", v0, 0xCu);
}

void sub_100015A9C(double a1)
{
  int v1 = 134218496;
  double v2 = a1;
  __int16 v3 = 1024;
  int v4 = dword_1000262F8;
  __int16 v5 = 2048;
  double v6 = CFAbsoluteTimeGetCurrent() - *(double *)&qword_100026300;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ReportCrash.Stackshot seems to be wedged (for %.2f secs); aborting after %u requests and %.1f secs",
    (uint8_t *)&v1,
    0x1Cu);
}

uint64_t JQXPCConnection.init()()
{
  return JQXPCConnection.init()();
}

uint64_t type metadata accessor for JQXPCConnection()
{
  return type metadata accessor for JQXPCConnection();
}

uint64_t JQTaskDescriptor.init(name:pid:duration:jobGroup:)()
{
  return JQTaskDescriptor.init(name:pid:duration:jobGroup:)();
}

uint64_t type metadata accessor for JQTaskDescriptor()
{
  return type metadata accessor for JQTaskDescriptor();
}

uint64_t static PostQuiesceActions.shutdown.getter()
{
  return static PostQuiesceActions.shutdown.getter();
}

uint64_t type metadata accessor for PostQuiesceActions()
{
  return type metadata accessor for PostQuiesceActions();
}

uint64_t JQLaunchEventSubscription.init(subscriptionName:subscriberName:)()
{
  return JQLaunchEventSubscription.init(subscriptionName:subscriberName:)();
}

uint64_t dispatch thunk of JQLaunchEventSubscription.register(on:for:notification:)()
{
  return dispatch thunk of JQLaunchEventSubscription.register(on:for:notification:)();
}

uint64_t type metadata accessor for JQLaunchEventSubscription()
{
  return type metadata accessor for JQLaunchEventSubscription();
}

uint64_t dispatch thunk of JQTask.end()()
{
  return dispatch thunk of JQTask.end()();
}

uint64_t JQTask.init(conn:description:)()
{
  return JQTask.init(conn:description:)();
}

uint64_t dispatch thunk of JQTask.begin()()
{
  return dispatch thunk of JQTask.begin()();
}

uint64_t type metadata accessor for JQTask()
{
  return type metadata accessor for JQTask();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Logger.init(_:)()
{
  return Logger.init(_:)();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.utility.getter()
{
  return static DispatchQoS.utility.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.isSuperset(of:)()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t AnalyticsRolloverEvents()
{
  return _AnalyticsRolloverEvents();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

uint64_t DiagnosticMonitorLog()
{
  return _DiagnosticMonitorLog();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t OSADiagnosticMonitorClientInterface()
{
  return _OSADiagnosticMonitorClientInterface();
}

uint64_t OSADiagnosticMonitorServerInterface()
{
  return _OSADiagnosticMonitorServerInterface();
}

uint64_t OSAIsRSDDevice()
{
  return _OSAIsRSDDevice();
}

uint64_t OSAIsRSDDisplay()
{
  return _OSAIsRSDDisplay();
}

uint64_t OSAStabilityMonitorLoadParameters()
{
  return _OSAStabilityMonitorLoadParameters();
}

uint64_t OSAStabilityMonitorLogDomain()
{
  return _OSAStabilityMonitorLogDomain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t abort_with_reason()
{
  return _abort_with_reason();
}

uint64_t analytics_send_event_lazy()
{
  return _analytics_send_event_lazy();
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

uint64_t dirstat_np()
{
  return _dirstat_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint64_t ns2xpc()
{
  return _ns2xpc();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

id objc_retainAutoreleasedReturnValue(id a1)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

uint64_t rtcsc_send()
{
  return _rtcsc_send();
}

uint64_t rtcsc_send_realtime()
{
  return _rtcsc_send_realtime();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

uint64_t xpc2ns()
{
  return _xpc2ns();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return _xpc_connection_create_from_endpoint(endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend_CA(void *a1, const char *a2, ...)
{
  return _[a1 CA];
}

id objc_msgSend_Crash(void *a1, const char *a2, ...)
{
  return _[a1 Crash];
}

id objc_msgSend_HighEngagementDevices(void *a1, const char *a2, ...)
{
  return _[a1 HighEngagementDevices];
}

id objc_msgSend_MTBF(void *a1, const char *a2, ...)
{
  return _[a1 MTBF];
}

id objc_msgSend_OSAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 OSAnalytics];
}

id objc_msgSend_Stability(void *a1, const char *a2, ...)
{
  return _[a1 Stability];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__DHIDto95thPercentile(void *a1, const char *a2, ...)
{
  return _[a1 _DHIDto95thPercentile];
}

id objc_msgSend__DHIDtoCategoryDisplayNameMap(void *a1, const char *a2, ...)
{
  return _[a1 _DHIDtoCategoryDisplayNameMap];
}

id objc_msgSend__OverrideIfNeeded_givenCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_OverrideIfNeeded:givenCategory:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend_acquireJetsamData(void *a1, const char *a2, ...)
{
  return _[a1 acquireJetsamData];
}

id objc_msgSend_acquireStackshot(void *a1, const char *a2, ...)
{
  return _[a1 acquireStackshot];
}

id objc_msgSend_addDouble_forKey_onDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDouble:forKey:onDate:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addEvent_withBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEvent:withBundleID:");
}

id objc_msgSend_addNotes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotes:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addUnsignedInteger_forKey_onDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUnsignedInteger:forKey:onDate:");
}

id objc_msgSend_aggregatedTotalsAsDouble(void *a1, const char *a2, ...)
{
  return _[a1 aggregatedTotalsAsDouble];
}

id objc_msgSend_aggregatedTotalsAsUnsignedInteger(void *a1, const char *a2, ...)
{
  return _[a1 aggregatedTotalsAsUnsignedInteger];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_appInFocusStream(void *a1, const char *a2, ...)
{
  return _[a1 appInFocusStream];
}

id objc_msgSend_appVersion(void *a1, const char *a2, ...)
{
  return _[a1 appVersion];
}

id objc_msgSend_appleInternal(void *a1, const char *a2, ...)
{
  return _[a1 appleInternal];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_baselineCrashCount(void *a1, const char *a2, ...)
{
  return _[a1 baselineCrashCount];
}

id objc_msgSend_baselineUptime(void *a1, const char *a2, ...)
{
  return _[a1 baselineUptime];
}

id objc_msgSend_baselineVersions(void *a1, const char *a2, ...)
{
  return _[a1 baselineVersions];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bugType(void *a1, const char *a2, ...)
{
  return _[a1 bugType];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _[a1 buildVersion];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return _[a1 bundleVersion];
}

id objc_msgSend_calculateStabilityRateWithAppUsage_crashCounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateStabilityRateWithAppUsage:crashCounts:");
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return _[a1 calendar];
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_categoriesForBundleIDs_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoriesForBundleIDs:completionHandler:");
}

id objc_msgSend_coalitionBasedBundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 coalitionBasedBundleIDs];
}

id objc_msgSend_coalitionName(void *a1, const char *a2, ...)
{
  return _[a1 coalitionName];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectDeveloperOptIn(void *a1, const char *a2, ...)
{
  return _[a1 collectDeveloperOptIn];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_crashCount(void *a1, const char *a2, ...)
{
  return _[a1 crashCount];
}

id objc_msgSend_createBiomeFeed(void *a1, const char *a2, ...)
{
  return _[a1 createBiomeFeed];
}

id objc_msgSend_createForSubmissionWithXPCRequest_forReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createForSubmissionWithXPCRequest:forReply:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingComponents:toDate:options:");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateRangeOnBuild_from_to_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateRangeOnBuild:from:to:completionHandler:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceMetadataStream(void *a1, const char *a2, ...)
{
  return _[a1 deviceMetadataStream];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didWriteLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didWriteLog:");
}

id objc_msgSend_didWriteLog_filePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didWriteLog:filePath:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_endDateSortDescriptorAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endDateSortDescriptorAscending:");
}

id objc_msgSend_entitled(void *a1, const char *a2, ...)
{
  return _[a1 entitled];
}

id objc_msgSend_enumerateDatesStartingAfterDate_matchingComponents_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluateStability(void *a1, const char *a2, ...)
{
  return _[a1 evaluateStability];
}

id objc_msgSend_evaluateStabilityOfBundleID_coalitionName_parameters_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateStabilityOfBundleID:coalitionName:parameters:completionHandler:");
}

id objc_msgSend_evaluateStabilityWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateStabilityWithParameters:");
}

id objc_msgSend_evaluateState(void *a1, const char *a2, ...)
{
  return _[a1 evaluateState];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return _[a1 eventBody];
}

id objc_msgSend_eventQueryWithPredicate_eventStreams_offset_limit_sortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:");
}

id objc_msgSend_exactBundleVersion(void *a1, const char *a2, ...)
{
  return _[a1 exactBundleVersion];
}

id objc_msgSend_excludeThirdParty(void *a1, const char *a2, ...)
{
  return _[a1 excludeThirdParty];
}

id objc_msgSend_executeQuery_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:error:");
}

id objc_msgSend_failedToWriteLog_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedToWriteLog:error:");
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return _[a1 fileModificationDate];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return _[a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_filepath(void *a1, const char *a2, ...)
{
  return _[a1 filepath];
}

id objc_msgSend_filterWithIsIncluded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithIsIncluded:");
}

id objc_msgSend_firstPartyBundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 firstPartyBundleIDs];
}

id objc_msgSend_generateCrackShotWithParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateCrackShotWithParams:");
}

id objc_msgSend_generateLastDayAppUsage(void *a1, const char *a2, ...)
{
  return _[a1 generateLastDayAppUsage];
}

id objc_msgSend_generateStackShotWithParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateStackShotWithParams:");
}

id objc_msgSend_generateSystemMemoryResetWithParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateSystemMemoryResetWithParams:");
}

id objc_msgSend_generateTopThreeCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateTopThreeCategories:");
}

id objc_msgSend_generateTotalByCategory_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateTotalByCategory:completionHandler:");
}

id objc_msgSend_getAppUsageArray_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAppUsageArray:to:");
}

id objc_msgSend_getExtraData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getExtraData:");
}

id objc_msgSend_getTaskingKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTaskingKey:");
}

id objc_msgSend_handleDefaultsRequestWithParams_forReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDefaultsRequestWithParams:forReply:");
}

id objc_msgSend_handleLaunchEvent(void *a1, const char *a2, ...)
{
  return _[a1 handleLaunchEvent];
}

id objc_msgSend_handleStabilityMonitorRequest_fromConnection_forReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStabilityMonitorRequest:fromConnection:forReply:");
}

id objc_msgSend_hasSupplementalBuild(void *a1, const char *a2, ...)
{
  return _[a1 hasSupplementalBuild];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initForPid_exitSnapshot_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForPid:exitSnapshot:reason:");
}

id objc_msgSend_initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:");
}

id objc_msgSend_initWithAppUptime_crashCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppUptime:crashCount:");
}

id objc_msgSend_initWithConnection_entitled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:entitled:");
}

id objc_msgSend_initWithDelegate_queue_clientType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:queue:clientType:");
}

id objc_msgSend_initWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEndpoint:");
}

id objc_msgSend_initWithEvent_code_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEvent:code:");
}

id objc_msgSend_initWithIdentity_details_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentity:details:");
}

id objc_msgSend_initWithIdentity_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentity:error:");
}

id objc_msgSend_initWithIdentity_filePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentity:filePath:");
}

id objc_msgSend_initWithIncidentID_bugType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIncidentID:bugType:");
}

id objc_msgSend_initWithKnowledgeStore_clientContext_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKnowledgeStore:clientContext:identifier:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithParameters_targetBundleID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameters:targetBundleID:completionHandler:");
}

id objc_msgSend_initWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPid:");
}

id objc_msgSend_initWithProcessID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProcessID:");
}

id objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:maxEvents:lastN:reversed:");
}

id objc_msgSend_initWithStartDate_endDate_targetAppVersions_firstPartyBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:targetAppVersions:firstPartyBundleIDs:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTargetAppVersions_isBaseline_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTargetAppVersions:isBaseline:");
}

id objc_msgSend_initWithTopCategory1_topCategory2_topCategory3_highEngagementCategory1_highEngagementCategory2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTopCategory1:topCategory2:topCategory3:highEngagementCategory1:highEngagementCategory2:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initiate_transferLog_withOptions_job_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiate:transferLog:withOptions:job:");
}

id objc_msgSend_instantiate(void *a1, const char *a2, ...)
{
  return _[a1 instantiate];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAvailable];
}

id objc_msgSend_isBeta(void *a1, const char *a2, ...)
{
  return _[a1 isBeta];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFirstParty(void *a1, const char *a2, ...)
{
  return _[a1 isFirstParty];
}

id objc_msgSend_isRollbackEnabledForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRollbackEnabledForBundleID:");
}

id objc_msgSend_isRollbackSupportedForBundleID_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRollbackSupportedForBundleID:reason:");
}

id objc_msgSend_isValidBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidBundleID:");
}

id objc_msgSend_isValidEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidEvent:");
}

id objc_msgSend_keyForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyForDate:");
}

id objc_msgSend_knowledgeStore(void *a1, const char *a2, ...)
{
  return _[a1 knowledgeStore];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_loadParameterForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadParameterForKey:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localizedFailureReason];
}

id objc_msgSend_locallyCreateForSubmission_metadata_options_error_writing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locallyCreateForSubmission:metadata:options:error:writing:");
}

id objc_msgSend_logObjForBugType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logObjForBugType:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_maximumDays(void *a1, const char *a2, ...)
{
  return _[a1 maximumDays];
}

id objc_msgSend_maximumMTBF(void *a1, const char *a2, ...)
{
  return _[a1 maximumMTBF];
}

id objc_msgSend_maximumMTBFIfNoBaselineCrashes(void *a1, const char *a2, ...)
{
  return _[a1 maximumMTBFIfNoBaselineCrashes];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_minimumCrashCount(void *a1, const char *a2, ...)
{
  return _[a1 minimumCrashCount];
}

id objc_msgSend_minimumMTBFDelta(void *a1, const char *a2, ...)
{
  return _[a1 minimumMTBFDelta];
}

id objc_msgSend_minimumMTBFFactor(void *a1, const char *a2, ...)
{
  return _[a1 minimumMTBFFactor];
}

id objc_msgSend_minimumUptime(void *a1, const char *a2, ...)
{
  return _[a1 minimumUptime];
}

id objc_msgSend_monitorQueue(void *a1, const char *a2, ...)
{
  return _[a1 monitorQueue];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_namespaceName(void *a1, const char *a2, ...)
{
  return _[a1 namespaceName];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberForKey_onDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberForKey:onDate:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_oldFilePath(void *a1, const char *a2, ...)
{
  return _[a1 oldFilePath];
}

id objc_msgSend_optIn3rdParty(void *a1, const char *a2, ...)
{
  return _[a1 optIn3rdParty];
}

id objc_msgSend_pathSubmissionSubdirDiagnosticLogs(void *a1, const char *a2, ...)
{
  return _[a1 pathSubmissionSubdirDiagnosticLogs];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_predicateForEventsIntersectingDateRangeFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEventsIntersectingDateRangeFrom:to:");
}

id objc_msgSend_processDailyUsage_from_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processDailyUsage:from:to:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_publisherForQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publisherForQuery:");
}

id objc_msgSend_publisherWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publisherWithOptions:");
}

id objc_msgSend_publisherWithStartTime_endTime_maxEvents_reversed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publisherWithStartTime:endTime:maxEvents:reversed:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rapidSecurityResponsePreReboot(void *a1, const char *a2, ...)
{
  return _[a1 rapidSecurityResponsePreReboot];
}

id objc_msgSend_receivedLogEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedLogEvent:");
}

id objc_msgSend_recommendRollbackForBundleID_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recommendRollbackForBundleID:reason:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_reportResultsForBundleID_crashes_uptime_MTBF_result_status_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportResultsForBundleID:crashes:uptime:MTBF:result:status:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_saveWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveWithOptions:");
}

id objc_msgSend_scheduleCleanupWithHomeDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleCleanupWithHomeDirectory:");
}

id objc_msgSend_scheduleSubmission(void *a1, const char *a2, ...)
{
  return _[a1 scheduleSubmission];
}

id objc_msgSend_securityResponseRollbackSuggested_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "securityResponseRollbackSuggested:error:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendRTCBeacon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRTCBeacon:");
}

id objc_msgSend_serviceRequest_forOperation_fromConnection_forReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceRequest:forOperation:fromConnection:forReply:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAdditionalPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalPayload:");
}

id objc_msgSend_setAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlarm:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientIdentifier:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEventStreams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventStreams:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setNumber_forKey_onDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumber:forKey:onDate:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setResponsibleProcessesInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponsibleProcessesInfo:");
}

id objc_msgSend_setRollbackSuggestionError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRollbackSuggestionError:");
}

id objc_msgSend_setSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecond:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setTargetBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetBundleID:");
}

id objc_msgSend_setTargetKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetKey:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setUrgentSubmission_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrgentSubmission:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_sharedCategories(void *a1, const char *a2, ...)
{
  return _[a1 sharedCategories];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return _[a1 shortVersionString];
}

id objc_msgSend_sinkWithCompletion_receiveInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinkWithCompletion:receiveInput:");
}

id objc_msgSend_sinkWithCompletion_shouldContinue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinkWithCompletion:shouldContinue:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_ss_trace_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ss_trace_length");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_startDateSortDescriptorAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDateSortDescriptorAscending:");
}

id objc_msgSend_startOfDayForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOfDayForDate:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_submitWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitWithOptions:");
}

id objc_msgSend_supplementalBuild(void *a1, const char *a2, ...)
{
  return _[a1 supplementalBuild];
}

id objc_msgSend_targetKey(void *a1, const char *a2, ...)
{
  return _[a1 targetKey];
}

id objc_msgSend_terminationReason(void *a1, const char *a2, ...)
{
  return _[a1 terminationReason];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeZoneWithAbbreviation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneWithAbbreviation:");
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneWithName:");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_totalCrashesFrom_to_targetBundleID_appVersions_isBaseline_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalCrashesFrom:to:targetBundleID:appVersions:isBaseline:completionHandler:");
}

id objc_msgSend_totalUptimeFrom_to_targetBundleID_targetAppVersions_firstPartyBundleIDs_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalUptimeFrom:to:targetBundleID:targetAppVersions:firstPartyBundleIDs:completionHandler:");
}

id objc_msgSend_totals(void *a1, const char *a2, ...)
{
  return _[a1 totals];
}

id objc_msgSend_transfer_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transfer:key:");
}

id objc_msgSend_triggerUrgentSubmission(void *a1, const char *a2, ...)
{
  return _[a1 triggerUrgentSubmission];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_uptime(void *a1, const char *a2, ...)
{
  return _[a1 uptime];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_versions(void *a1, const char *a2, ...)
{
  return _[a1 versions];
}

id objc_msgSend_willWriteLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willWriteLog:");
}

id objc_msgSend_willWriteLog_details_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willWriteLog:details:");
}