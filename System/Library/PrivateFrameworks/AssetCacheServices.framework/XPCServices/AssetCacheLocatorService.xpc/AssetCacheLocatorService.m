const char *currentQueueName()
{
  NSObject *current_queue;
  uint64_t vars8;

  current_queue = dispatch_get_current_queue();
  if (!current_queue) {
    return "defunct";
  }

  return dispatch_queue_get_label(current_queue);
}

void sub_100004914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_100004938(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  id v9 = a2;
  v10 = objc_msgSend(v8, "stringByAppendingFormat:", @"[%ld]", a3);
  LOBYTE(v7) = [v7 verify:v9 name:v10 withTemplate:*(void *)(a1 + 48) tag:*(unsigned int *)(a1 + 64)];

  if ((v7 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void sub_1000049DC(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  id v12 = [v7 objectForKey:v9];
  v10 = *(void **)(a1 + 40);
  v11 = [*(id *)(a1 + 48) stringByAppendingFormat:@".%@", v9];

  LOBYTE(v9) = [v10 verify:v12 name:v11 withTemplate:v8 tag:*(unsigned int *)(a1 + 64)];
  if ((v9 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
  }
}

uint64_t sub_100004D24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) sanitize:a2 withTemplate:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 56)];
  if (v3) {
    [*(id *)(a1 + 48) addObject:v3];
  }

  return _objc_release_x1();
}

void sub_100004D90(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 objectForKey:v9];
  id v8 = [*(id *)(a1 + 40) sanitize:v7 withTemplate:v6 tag:*(unsigned int *)(a1 + 56)];

  if (v8) {
    [*(id *)(a1 + 48) setObject:v8 forKey:v9];
  }
}

void sub_100008FA4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callback];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

int main(int argc, const char **argv, const char **envp)
{
  v4 = objc_alloc_init(AssetCacheLocatorService);
  [(AssetCacheLocatorService *)v4 start];

  return 1;
}

void sub_10000B33C(id a1)
{
  id v1 = +[NSFileManager defaultManager];
  [v1 removeItemAtPath:@"/var/mobile/Library/Caches/com.apple.AssetCacheLocatorService" error:0];
}

void sub_10000B390(uint64_t a1)
{
  id v2 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    *(_DWORD *)buf = 67109378;
    int v9 = 0;
    __int16 v10 = 2080;
    v11 = currentQueueName();
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#%08x [%s] automatic disk cache refresh", buf, 0x12u);
  }
  v4 = [*(id *)(a1 + 32) singleLocate];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  if ([*(id *)(a1 + 32) singleLocateTag]) {
    sub_10002336C();
  }
  v5 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B4F4;
  block[3] = &unk_100034B60;
  id v7 = *(id *)(a1 + 32);
  dispatch_async(v5, block);
}

void sub_10000B4F4(uint64_t a1)
{
  [*(id *)(a1 + 32) loadDiskCacheWithTag:0];
  id v2 = [*(id *)(a1 + 32) singleLocate];
  dispatch_semaphore_signal(v2);
}

void sub_10000B550(uint64_t a1)
{
  [*(id *)(a1 + 32) loadDiskCacheWithTag:0];
  id v2 = [*(id *)(a1 + 32) singleLocate];
  dispatch_semaphore_signal(v2);
}

uint64_t sub_10000BBD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = [*(id *)(a1 + 32) NSObjectFromXPCObject:a3 tag:*(unsigned int *)(a1 + 48)];
  if (v4) {
    [*(id *)(a1 + 40) addObject:v4];
  }

  return 1;
}

uint64_t sub_10000BC1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = [*(id *)(a1 + 32) NSObjectFromXPCObject:a3 tag:*(unsigned int *)(a1 + 48)];
  if (v5)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = +[NSString stringWithUTF8String:a2];
    [v6 setObject:v5 forKey:v7];
  }
  return 1;
}

uint64_t sub_10000BEF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) XPCObjectFromNSObject:a2 tag:*(unsigned int *)(a1 + 48)];
  if (v3) {
    xpc_array_append_value(*(xpc_object_t *)(a1 + 40), v3);
  }

  return _objc_release_x1();
}

void sub_10000BF58(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  v5 = [*(id *)(a1 + 32) XPCObjectFromNSObject:a3 tag:*(unsigned int *)(a1 + 48)];
  if (v5) {
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 40), (const char *)[v6 UTF8String], v5);
  }
}

void sub_10000C7D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_100023648(v4, v3);
  }
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    [*(id *)(a1 + 32) handleConnection:v3];
  }
  else if (v3 == &_xpc_error_connection_invalid && type == (xpc_type_t)&_xpc_type_error)
  {
    [*(id *)(a1 + 32) setListenerConnection:0];
  }
}

void sub_10000C880(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) listenerConnection];

  if (!v1)
  {
    id v2 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v2;
      v4[0] = 67109634;
      v4[1] = 0;
      __int16 v5 = 2080;
      id v6 = currentQueueName();
      __int16 v7 = 2080;
      id v8 = "AssetCacheLocatorService";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#%08x [%s] %s exiting:  XPC listener gone and no more XPC connections", (uint8_t *)v4, 0x1Cu);
    }
    exit(0);
  }
}

void sub_10000CADC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_100023704(v4, a1, v3);
  }
  if (([*(id *)(a1 + 40) handleEvent:v3 forConnection:*(void *)(a1 + 32)] & 1) == 0) {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
}

void sub_10000D764(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D79C(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  if (!strcmp(a2, "import") && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v5))
  {
    id v6 = *(void **)(a1 + 32);
    CFStringRef v7 = @"im";
LABEL_17:
    [v6 setObject:&__kCFBooleanTrue forKey:v7];
    goto LABEL_18;
  }
  if (!strcmp(a2, "namespaces") && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v5))
  {
    id v6 = *(void **)(a1 + 32);
    CFStringRef v7 = @"ns";
    goto LABEL_17;
  }
  if (!strcmp(a2, "personalCaching") && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v5))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else if (!strcmp(a2, "queryParameters") && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v5))
  {
    id v6 = *(void **)(a1 + 32);
    CFStringRef v7 = @"query-parameters";
    goto LABEL_17;
  }
LABEL_18:

  return 1;
}

void sub_10000D910(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v78 = *(_DWORD *)(a1 + 80);
    v24 = v14;
    v25 = currentQueueName();
    v26 = [*(id *)(a1 + 32) redactObject:v11];
    v27 = [*(id *)(a1 + 32) redactObject:v12];
    *(_DWORD *)buf = 67110658;
    int v86 = v78;
    __int16 v87 = 2080;
    v88 = v25;
    __int16 v89 = 2112;
    *(void *)v90 = v26;
    *(_WORD *)&v90[8] = 1024;
    *(_DWORD *)v91 = a3;
    *(_WORD *)&v91[4] = 2112;
    *(void *)&v91[6] = v27;
    *(_WORD *)&v91[14] = 2048;
    *(double *)&v91[16] = a6;
    *(_WORD *)&v91[24] = 2112;
    *(void *)&v91[26] = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "#%08x [%s] handleLocateEvent callback(servers=%@, sorted=%{BOOL}d, other=%@, validityInterval=%.3f, error=%@)", buf, 0x40u);

    if (v13) {
      goto LABEL_3;
    }
  }
  else if (v13)
  {
LABEL_3:
    v15 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      int v16 = *(_DWORD *)(a1 + 80);
      v17 = v15;
      v18 = currentQueueName();
      pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
      uid_t euid = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 40));
      [*(id *)(a1 + 48) timeIntervalSinceNow];
      *(_DWORD *)buf = 67110402;
      int v86 = v16;
      __int16 v87 = 2080;
      v88 = v18;
      __int16 v89 = 1024;
      *(_DWORD *)v90 = pid;
      *(_WORD *)&v90[4] = 1024;
      *(_DWORD *)&v90[6] = euid;
      *(_WORD *)v91 = 2112;
      *(void *)&v91[2] = v13;
      *(_WORD *)&v91[10] = 2048;
      *(double *)&v91[12] = -v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "#%08x [%s] XPC response to pid %d uid %d: error: %@, elapsed=%.3f", buf, 0x32u);
    }
    v22 = *(void **)(a1 + 56);
    v23 = [*(id *)(a1 + 32) objectWithError:v13];
    xpc_dictionary_set_value(v22, "error", v23);

    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 56));
    goto LABEL_35;
  }
  v76 = [*(id *)(a1 + 32) choose:*(unsigned int *)(a1 + 84) fromArray:v11 sorted:a3 other:v12 tag:*(unsigned int *)(a1 + 80)];
  v28 = gLogHandle;
  id v75 = v12;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
  {
    int v29 = *(_DWORD *)(a1 + 80);
    v30 = v28;
    v31 = currentQueueName();
    pid_t v32 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
    uid_t v33 = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 40));
    v34 = [*(id *)(a1 + 32) redactObject:v76];
    [*(id *)(a1 + 48) timeIntervalSinceNow];
    *(_DWORD *)buf = 67110658;
    int v86 = v29;
    __int16 v87 = 2080;
    v88 = v31;
    __int16 v89 = 1024;
    *(_DWORD *)v90 = v32;
    *(_WORD *)&v90[4] = 1024;
    *(_DWORD *)&v90[6] = v33;
    *(_WORD *)v91 = 2112;
    *(void *)&v91[2] = v34;
    *(_WORD *)&v91[10] = 2048;
    *(double *)&v91[12] = a6;
    *(_WORD *)&v91[20] = 2048;
    *(double *)&v91[22] = -v35;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "#%08x [%s] XPC response to pid %d uid %d: success: servers=%@ validityInterval=%.3f elapsed=%.3f", buf, 0x3Cu);
  }
  id v74 = v13;
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v72 = a1;
    id v73 = v11;
    xpc_object_t v36 = xpc_array_create(0, 0);
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id obj = v76;
    id v37 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v79 = *(void *)v81;
      do
      {
        for (i = 0; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v81 != v79) {
            objc_enumerationMutation(obj);
          }
          v40 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          xpc_object_t v41 = xpc_dictionary_create(0, 0, 0);
          v42 = [v40 objectForKey:@"localAddressAndPort"];
          v43 = v42;
          if (v42) {
            xpc_dictionary_set_string(v41, "hostport", (const char *)[v42 UTF8String]);
          }
          v44 = v36;
          v45 = [v40 objectForKey:@"guid"];
          v46 = v45;
          if (v45) {
            xpc_dictionary_set_string(v41, "guid", (const char *)[v45 UTF8String]);
          }
          v47 = [v40 objectForKeyedSubscript:@"failureCount"];
          xpc_dictionary_set_BOOL(v41, "healthy", (unint64_t)[v47 unsignedIntegerValue] < 3);

          v48 = [v40 objectForKeyedSubscript:@"favored"];
          xpc_dictionary_set_BOOL(v41, "favored", (BOOL)[v48 BOOLValue]);

          v49 = [v40 objectForKey:@"details"];
          v50 = [v49 objectForKey:@"capabilities"];
          v51 = [v50 objectForKey:@"ur"];
          xpc_dictionary_set_BOOL(v41, "supportsUrgency", (BOOL)[v51 BOOLValue]);

          v52 = [v40 objectForKey:@"connectTimeout"];
          [v52 doubleValue];
          double v54 = v53;

          if (v54 >= 0.2) {
            double v55 = v54;
          }
          else {
            double v55 = 1.0;
          }
          xpc_dictionary_set_double(v41, "timeout", v55);
          v56 = [v40 objectForKey:@"rank"];
          xpc_dictionary_set_int64(v41, "rank", (int)[v56 intValue]);

          xpc_object_t v36 = v44;
          xpc_array_set_value(v44, 0xFFFFFFFFFFFFFFFFLL, v41);
        }
        id v38 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
      }
      while (v38);
    }

    a1 = v72;
    xpc_dictionary_set_value(*(xpc_object_t *)(v72 + 56), "servers", v36);
    id v11 = v73;
    id v12 = v75;
  }
  else
  {
    v57 = [v11 firstObject];
    v58 = [v57 objectForKey:@"localAddressAndPort"];
    v59 = v58;
    if (v58) {
      xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 56), "hostport", (const char *)[v58 UTF8String]);
    }
    v60 = *(void **)(a1 + 56);
    v61 = [v57 objectForKey:@"details"];
    v62 = [v61 objectForKey:@"capabilities"];
    [v62 objectForKey:@"ur"];
    v64 = v63 = v57;
    xpc_dictionary_set_BOOL(v60, "supportsUrgency", (BOOL)[v64 BOOLValue]);

    xpc_object_t v36 = v63;
    v65 = [v63 objectForKey:@"connectTimeout"];
    [v65 doubleValue];
    double v67 = v66;

    double v68 = 1.0;
    if (v67 >= 0.2) {
      double v68 = v67;
    }
    xpc_dictionary_set_double(*(xpc_object_t *)(a1 + 56), "timeout", v68);
  }
  double v69 = 3600.0;
  if (a6 > 0.0) {
    double v69 = a6;
  }
  xpc_dictionary_set_double(*(xpc_object_t *)(a1 + 56), "validityInterval", v69);

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 56));
  [*(id *)(a1 + 32) refreshValidityInterval];
  id v13 = v74;
  if (v70 > a6 && *(unsigned char *)(a1 + 89))
  {
    v71 = *(void **)(a1 + 32);
    [v71 locateTimeout];
    objc_msgSend(v71, "relocateCachingServersWithTimeout:capabilities:affinityID:forceRefresh:tag:", *(void *)(a1 + 64), *(void *)(a1 + 72), 1, *(unsigned int *)(a1 + 80));
  }
LABEL_35:
}

void sub_10000E110(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  double v4 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 76);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 77);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 78);
  uint64_t v10 = *(void *)(a1 + 64);
  dispatch_get_global_queue(0, 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = *(_DWORD *)(a1 + 72);
  [v2 locateCachingServersWithTimeout:v5 capabilities:v6 affinityID:v7 autoRefresh:v8 quickMiss:v9 forceMiss:v10 callback:v4 callbackQueue:v12 tag:v11];
}

void sub_10000E39C(uint64_t a1, BOOL a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v23 = *(_DWORD *)(a1 + 64);
    v24 = v6;
    int v25 = 67109890;
    int v26 = v23;
    __int16 v27 = 2080;
    v28 = currentQueueName();
    __int16 v29 = 1024;
    int v30 = a2;
    __int16 v31 = 2112;
    *(void *)pid_t v32 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "#%08x [%s] handleRecentlySeenEvent callback(recentlySeen=%{BOOL}d, error=%@)", (uint8_t *)&v25, 0x22u);
  }
  uint64_t v7 = gLogHandle;
  BOOL v8 = os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      int v9 = *(_DWORD *)(a1 + 64);
      uint64_t v10 = v7;
      uint64_t v11 = currentQueueName();
      pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      uid_t euid = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 32));
      [*(id *)(a1 + 40) timeIntervalSinceNow];
      int v25 = 67110402;
      int v26 = v9;
      __int16 v27 = 2080;
      v28 = v11;
      __int16 v29 = 1024;
      int v30 = pid;
      __int16 v31 = 1024;
      *(_DWORD *)pid_t v32 = euid;
      *(_WORD *)&v32[4] = 2112;
      *(void *)&v32[6] = v5;
      *(_WORD *)&v32[14] = 2048;
      *(double *)&v32[16] = -v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#%08x [%s] XPC response to pid %d uid %d: error: %@, elapsed=%.3f", (uint8_t *)&v25, 0x32u);
    }
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "recentlySeen", 1);
    v15 = *(void **)(a1 + 48);
    int v16 = [*(id *)(a1 + 56) objectWithError:v5];
    xpc_dictionary_set_value(v15, "error", v16);
  }
  else
  {
    if (v8)
    {
      int v17 = *(_DWORD *)(a1 + 64);
      v18 = v7;
      v19 = currentQueueName();
      pid_t v20 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      uid_t v21 = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 32));
      [*(id *)(a1 + 40) timeIntervalSinceNow];
      int v25 = 67110402;
      int v26 = v17;
      __int16 v27 = 2080;
      v28 = v19;
      __int16 v29 = 1024;
      int v30 = v20;
      __int16 v31 = 1024;
      *(_DWORD *)pid_t v32 = v21;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = a2;
      *(_WORD *)&v32[10] = 2048;
      *(double *)&v32[12] = -v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#%08x [%s] XPC response to pid %d uid %d: recentlySeen=%{BOOL}d, elapsed=%.3f", (uint8_t *)&v25, 0x2Eu);
    }
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "recentlySeen", a2);
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 48));
}

void sub_10000E670(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 52);
  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  dispatch_get_global_queue(0, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 recentlySeenCachingServerWithAutoRefresh:v2 callback:v4 callbackQueue:v5 tag:*(unsigned int *)(a1 + 48)];
}

void sub_10000E890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E8B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E8C0(uint64_t a1)
{
}

void sub_10000E8C8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 60);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E98C;
  v6[3] = &unk_100034D40;
  v6[4] = *(void *)(a1 + 48);
  id v5 = dispatch_get_global_queue(0, 0);
  [v2 updateHealthOfCachingServerWithHostport:v3 healthy:v4 override:0 callback:v6 callbackQueue:v5 tag:*(unsigned int *)(a1 + 56)];
}

void sub_10000E98C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_10000EEE8(uint64_t a1, BOOL a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v23 = *(_DWORD *)(a1 + 64);
    v24 = v6;
    int v25 = 67109890;
    int v26 = v23;
    __int16 v27 = 2080;
    v28 = currentQueueName();
    __int16 v29 = 1024;
    int v30 = a2;
    __int16 v31 = 2112;
    *(void *)pid_t v32 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "#%08x [%s] handleImportEvent callback(success=%{BOOL}d, error=%@)", (uint8_t *)&v25, 0x22u);
  }
  uint64_t v7 = gLogHandle;
  BOOL v8 = os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      int v9 = *(_DWORD *)(a1 + 64);
      uint64_t v10 = v7;
      uint64_t v11 = currentQueueName();
      pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      uid_t euid = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 32));
      [*(id *)(a1 + 40) timeIntervalSinceNow];
      int v25 = 67110402;
      int v26 = v9;
      __int16 v27 = 2080;
      v28 = v11;
      __int16 v29 = 1024;
      int v30 = pid;
      __int16 v31 = 1024;
      *(_DWORD *)pid_t v32 = euid;
      *(_WORD *)&v32[4] = 2112;
      *(void *)&v32[6] = v5;
      *(_WORD *)&v32[14] = 2048;
      *(double *)&v32[16] = -v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#%08x [%s] XPC response to pid %d uid %d: error: %@, elapsed=%.3f", (uint8_t *)&v25, 0x32u);
    }
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "success", 0);
    v15 = *(void **)(a1 + 48);
    int v16 = [*(id *)(a1 + 56) objectWithError:v5];
    xpc_dictionary_set_value(v15, "error", v16);
  }
  else
  {
    if (v8)
    {
      int v17 = *(_DWORD *)(a1 + 64);
      v18 = v7;
      v19 = currentQueueName();
      pid_t v20 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
      uid_t v21 = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 32));
      [*(id *)(a1 + 40) timeIntervalSinceNow];
      int v25 = 67110402;
      int v26 = v17;
      __int16 v27 = 2080;
      v28 = v19;
      __int16 v29 = 1024;
      int v30 = v20;
      __int16 v31 = 1024;
      *(_DWORD *)pid_t v32 = v21;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = a2;
      *(_WORD *)&v32[10] = 2048;
      *(double *)&v32[12] = -v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#%08x [%s] XPC response to pid %d uid %d: success=%{BOOL}d, elapsed=%.3f", (uint8_t *)&v25, 0x2Eu);
    }
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "success", a2);
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 48));
}

uint64_t sub_10000F1BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(v5);
    uint64_t v7 = *(void **)(a1 + 32);
    BOOL v8 = +[NSString stringWithUTF8String:string_ptr];
    int v9 = +[NSString stringWithUTF8String:a2];
    [v7 setObject:v8 forKey:v9];
  }
  return 1;
}

uint64_t sub_10000F264(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_uint64) {
    goto LABEL_6;
  }
  uint64_t value = xpc_uint64_get_value(v4);
  uint64_t v6 = value - 1;
  if (value - 1 > 3) {
    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v7 + v6)) {
    goto LABEL_6;
  }
  uint64_t v8 = value;
  *(unsigned char *)(v7 + v6) = 1;
  int v9 = *(void **)(a1 + 32);
  uint64_t v10 = +[NSNumber numberWithUnsignedLongLong:value];
  [v9 addObject:v10];

  if (v8 == 4) {
    uint64_t v11 = 0;
  }
  else {
LABEL_6:
  }
    uint64_t v11 = 1;

  return v11;
}

void sub_10000F42C(uint64_t a1)
{
  uint64_t v2 = +[NSMutableArray array];
  uint64_t v3 = +[NSMutableArray array];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10000F774;
  v38[3] = &unk_100034DE0;
  id v4 = v2;
  id v39 = v4;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v40 = v5;
  uint64_t v41 = v6;
  int v44 = *(_DWORD *)(a1 + 56);
  id v42 = v7;
  id v43 = *(id *)(a1 + 48);
  uint64_t v8 = objc_retainBlock(v38);
  id v9 = [*(id *)(a1 + 32) localAddresses];
  uint64_t v10 = [*(id *)(a1 + 32) gatewayIdentifiers];
  if (!v9)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    id v36 = v10;
    id v37 = 0;
    unsigned __int8 v12 = [v11 makeLocalAddresses:&v37 andGatewayIdentifiers:&v36 tag:*(unsigned int *)(a1 + 56)];
    id v9 = v37;
    id v13 = v36;

    if ((v12 & 1) == 0)
    {

      id v13 = 0;
      id v9 = 0;
    }
    [*(id *)(a1 + 32) setLocalAddresses:v9];
    [*(id *)(a1 + 32) setGatewayIdentifiers:v13];
    uint64_t v10 = v13;
  }
  if (*(unsigned char *)(a1 + 60))
  {
    unint64_t v14 = 0;
    unint64_t v15 = 0;
  }
  else
  {
    int v16 = *(void **)(a1 + 32);
    id v34 = 0;
    id v35 = 0;
    [v16 cachedDNSPublicAddressRanges:&v35 andFavoredServerRanges:&v34 forNetworkIdentifiers:v10 tag:*(unsigned int *)(a1 + 56)];
    unint64_t v14 = (unint64_t)v35;
    unint64_t v15 = (unint64_t)v34;
  }
  if (v14 | v15)
  {
    if (v14) {
      [v4 addObject:v14];
    }
    if (v15) {
      [v5 addObject:v15];
    }
    ((void (*)(void *))v8[2])(v8);
  }
  else
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000F934;
    v29[3] = &unk_100034E08;
    int v33 = *(_DWORD *)(a1 + 56);
    v29[4] = *(void *)(a1 + 32);
    id v30 = v4;
    id v31 = v5;
    pid_t v32 = v8;
    int v17 = objc_retainBlock(v29);
    v18 = *(void **)(a1 + 32);
    [v18 locateTimeout];
    double v20 = v19;
    [*(id *)(a1 + 32) queue];
    unint64_t v28 = v15;
    unint64_t v21 = v14;
    id v22 = v9;
    int v23 = v10;
    v24 = v8;
    id v25 = v5;
    v27 = id v26 = v4;
    [v18 resolveDNSRecordsWithTimeout:v17 callback:v27 callbackQueue:*(unsigned int *)(a1 + 56) tag:v20];

    id v4 = v26;
    id v5 = v25;
    uint64_t v8 = v24;
    uint64_t v10 = v23;
    id v9 = v22;
    unint64_t v14 = v21;
    unint64_t v15 = v28;
  }
}

void sub_10000F774(uint64_t a1)
{
  v22[0] = _kACSIntrospectionPublicAddressRangesKey;
  v22[1] = _kACSIntrospectionFavoredServerRangesKey;
  uint64_t v2 = *(void *)(a1 + 40);
  v23[0] = *(void *)(a1 + 32);
  v23[1] = v2;
  v22[2] = _kACSIntrospectionTestFlagsKey;
  uint64_t v3 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 48) testFlags]);
  v23[2] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

  id v5 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
  {
    int v6 = *(_DWORD *)(a1 + 72);
    uint64_t v7 = v5;
    uint64_t v8 = currentQueueName();
    pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 56));
    uid_t euid = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 56));
    v13[0] = 67110147;
    v13[1] = v6;
    __int16 v14 = 2080;
    unint64_t v15 = v8;
    __int16 v16 = 1024;
    pid_t v17 = pid;
    __int16 v18 = 1024;
    uid_t v19 = euid;
    __int16 v20 = 2113;
    unint64_t v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#%08x [%s] XPC response to pid %d uid %d: introspection=%{private}@", (uint8_t *)v13, 0x28u);
  }
  uint64_t v11 = *(void **)(a1 + 64);
  unsigned __int8 v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_dictionary_set_value(v11, "introspection", v12);

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), *(xpc_object_t *)(a1 + 64));
}

void sub_10000F934(uint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  unsigned __int8 v12 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v13 = *(_DWORD *)(a1 + 64);
    __int16 v14 = v12;
    v15[0] = 67110915;
    v15[1] = v13;
    __int16 v16 = 2080;
    pid_t v17 = currentQueueName();
    __int16 v18 = 2048;
    id v19 = [v9 count];
    __int16 v20 = 2113;
    id v21 = v9;
    __int16 v22 = 2048;
    id v23 = [v10 count];
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2048;
    double v27 = a5;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "#%08x [%s] handleIntrospectEvent callback(dnsPublicAddressRanges=[%ld]%{private}@ dnsFavoredServerRanges=[%ld]%@ dnsValidityInterval=%.3f dnsError=%@)", (uint8_t *)v15, 0x4Eu);
  }
  if (([*(id *)(a1 + 32) amRunningOnMyQueue] & 1) == 0) {
    sub_1000239C0();
  }
  if ([v9 count]) {
    [*(id *)(a1 + 40) addObject:v9];
  }
  if ([v10 count]) {
    [*(id *)(a1 + 48) addObject:v10];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

id sub_10000FF88(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) localAddresses];

  if (v2)
  {
    uint64_t v3 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      id v4 = v3;
      v6[0] = 67109378;
      v6[1] = 0;
      __int16 v7 = 2080;
      uint64_t v8 = currentQueueName();
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#%08x [%s] network configuration changed; invalidating saved local address info",
        (uint8_t *)v6,
        0x12u);
    }
  }
  [*(id *)(a1 + 32) setLocalAddresses:0];
  [*(id *)(a1 + 32) setGatewayIdentifiers:0];
  return [*(id *)(a1 + 32) uncacheAllAffinitiesWithTag:0];
}

id sub_100010338(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 networkChanged];
}

void sub_100011F8C(uint64_t a1)
{
  char v60 = 0;
  if (!*(unsigned char *)(a1 + 76))
  {
    if (*(unsigned char *)(a1 + 77))
    {
      NSErrorDomain v2 = NSURLErrorDomain;
      uint64_t v3 = *(unsigned int *)(a1 + 72);
      id v4 = @"simulated error";
      uint64_t v5 = -1011;
      goto LABEL_5;
    }
    unint64_t v15 = *(void **)(a1 + 32);
    __int16 v16 = +[NSString stringWithUTF8String:"prs="];
    id v17 = [v15 objectForKey:v16];

    if (v17)
    {
      __int16 v18 = [v17 dataUsingEncoding:4];
      id v19 = *(void **)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      id v21 = v18;
      id v22 = [v21 bytes];
      id v23 = [v21 length];
      id v59 = 0;
      LODWORD(v48) = *(_DWORD *)(a1 + 72);
      uint64_t v8 = [v19 makeRangesFromDNSRecordNamed:v20 withType:0 data:v22 length:v23 more:&v60 error:&v59 tag:v48];
      id v6 = v59;
    }
    else
    {
      __int16 v24 = *(void **)(a1 + 32);
      id v25 = +[NSString stringWithUTF8String:"prn="];
      uint64_t v8 = [v24 objectForKey:v25];

      if (!v8)
      {
        id v6 = 0;
LABEL_12:
        id v30 = *(void **)(a1 + 32);
        id v31 = +[NSString stringWithUTF8String:"fss="];
        id v32 = [v30 objectForKey:v31];

        if (v32)
        {
          int v33 = [v32 dataUsingEncoding:4];
          id v34 = *(void **)(a1 + 40);
          uint64_t v35 = *(void *)(a1 + 48);
          id v36 = v33;
          id v37 = [v36 bytes];
          id v38 = [v36 length];
          id v57 = v6;
          LODWORD(v48) = *(_DWORD *)(a1 + 72);
          __int16 v7 = [v34 makeRangesFromDNSRecordNamed:v35 withType:2 data:v37 length:v38 more:&v60 error:&v57 tag:v48];
          id v39 = v57;

          id v6 = v36;
        }
        else
        {
          id v40 = *(void **)(a1 + 32);
          uint64_t v41 = +[NSString stringWithUTF8String:"fsn="];
          __int16 v7 = [v40 objectForKey:v41];

          if (!v7)
          {
LABEL_17:
            v46 = [*(id *)(a1 + 32) objectForKey:@"ttl"];
            [v46 doubleValue];
            uint64_t v9 = v47;

            goto LABEL_6;
          }
          id v42 = *(void **)(a1 + 40);
          uint64_t v43 = *(void *)(a1 + 48);
          id v32 = v7;
          id v44 = [v32 bytes];
          id v45 = [v32 length];
          id v56 = v6;
          LODWORD(v48) = *(_DWORD *)(a1 + 72);
          __int16 v7 = [v42 makeRangesFromDNSRecordNamed:v43 withType:3 data:v44 length:v45 more:&v60 error:&v56 tag:v48];
          id v39 = v56;
        }

        id v6 = v39;
        goto LABEL_17;
      }
      __int16 v26 = *(void **)(a1 + 40);
      uint64_t v27 = *(void *)(a1 + 48);
      id v17 = v8;
      id v28 = [v17 bytes];
      id v29 = [v17 length];
      id v58 = 0;
      LODWORD(v48) = *(_DWORD *)(a1 + 72);
      uint64_t v8 = [v26 makeRangesFromDNSRecordNamed:v27 withType:1 data:v28 length:v29 more:&v60 error:&v58 tag:v48];
      id v6 = v58;
    }

    goto LABEL_12;
  }
  NSErrorDomain v2 = NSURLErrorDomain;
  uint64_t v3 = *(unsigned int *)(a1 + 72);
  id v4 = @"simulated timeout";
  uint64_t v5 = -1001;
LABEL_5:
  createTaggedError(v2, v5, v4, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
LABEL_6:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000123BC;
  block[3] = &unk_100034E58;
  id v10 = *(NSObject **)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  id v50 = v8;
  id v51 = v7;
  uint64_t v54 = v9;
  char v55 = v60;
  id v52 = v6;
  id v53 = v11;
  id v12 = v6;
  id v13 = v7;
  id v14 = v8;
  dispatch_async(v10, block);
}

uint64_t sub_1000123BC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, double))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 48), *(double *)(a1 + 64));
}

uint64_t sub_1000123DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void, void, void, double))(v3 + 16))(v3, 0, 0, 0, 0.0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void, void, double))(v3 + 16))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 64));
  }
}

void sub_100012EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_100012F24(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  double v4 = *(double *)(a1 + 80);
  BOOL v5 = *(void *)(a1 + 48) != (void)&stru_100035778;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100013024;
  v8[3] = &unk_100034ED0;
  int v13 = *(_DWORD *)(a1 + 88);
  id v6 = v2;
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  [v3 resolveDNSRecordNamed:v6 withTimeout:v5 errorIfNotFound:v8 callback:*(void *)(a1 + 72) callbackQueue:*(unsigned int *)(a1 + 88) tag:v4];
}

void sub_100013024(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v20 = *(_DWORD *)(a1 + 64);
    id v21 = v14;
    id v22 = currentQueueName();
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 67111427;
    int v31 = v20;
    __int16 v32 = 2080;
    int v33 = v22;
    __int16 v34 = 2112;
    uint64_t v35 = v23;
    __int16 v36 = 2048;
    id v37 = [v11 count];
    __int16 v38 = 2113;
    id v39 = v11;
    __int16 v40 = 2048;
    id v41 = [v12 count];
    __int16 v42 = 2112;
    id v43 = v12;
    __int16 v44 = 2048;
    double v45 = a6;
    __int16 v46 = 1024;
    int v47 = a4;
    __int16 v48 = 2112;
    id v49 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "#%08x [%s] resolveDNSRecords: %@ callback(publicAddressRanges=[%ld]%{private}@, favoredServerRanges=[%ld]%@, validityInterval=%.3f, more=%{BOOL}d, error=%@)", buf, 0x5Eu);
  }
  if (a6 == 0.0)
  {
    a6 = 3600.0;
  }
  else if (a6 < 300.0 && ((unint64_t)[*(id *)(a1 + 40) testFlags] & 2) == 0)
  {
    a6 = 300.0;
  }
  if (v13)
  {
    CFStringRef v28 = @"error";
    id v29 = v13;
    unint64_t v15 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    if (v15) {
LABEL_10:
    }
      [*(id *)(a1 + 48) setObject:v15 forKey:*(void *)(a1 + 32)];
  }
  else
  {
    __int16 v16 = &__NSArray0__struct;
    CFStringRef v24 = @"publicAddressRanges";
    CFStringRef v25 = @"favoredServerRanges";
    if (v11) {
      id v17 = v11;
    }
    else {
      id v17 = &__NSArray0__struct;
    }
    if (v12) {
      __int16 v16 = v12;
    }
    v27[0] = v17;
    v27[1] = v16;
    __int16 v18 = +[NSNumber numberWithDouble:a6, v24, v25, @"validityInterval"];
    v27[2] = v18;
    CFStringRef v26 = @"more";
    id v19 = +[NSNumber numberWithBool:a4];
    v27[3] = v19;
    unint64_t v15 = +[NSDictionary dictionaryWithObjects:v27 forKeys:&v24 count:4];

    if (v15) {
      goto LABEL_10;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t sub_1000132EC(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[7];
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void, void, double))(v3 + 16))(v3, 0, 0, 0.0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void, double))(v3 + 16))(v3, a1[5], a1[6], *(double *)(*(void *)(a1[8] + 8) + 24));
  }
}

void sub_100014D38(uint64_t a1)
{
  uint64_t v2 = +[NSFileManager defaultManager];
  NSFileAttributeKey v30 = NSFileProtectionKey;
  NSFileProtectionType v31 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  double v4 = [*(id *)(a1 + 32) diskCachePlistPath];
  id v21 = 0;
  unsigned __int8 v5 = [v2 setAttributes:v3 ofItemAtPath:v4 error:&v21];
  id v6 = v21;

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(a1 + 40);
      id v9 = v7;
      uint64_t v10 = currentQueueName();
      id v11 = [*(id *)(a1 + 32) diskCachePlistPath];
      *(_DWORD *)buf = 67109890;
      int v23 = v8;
      __int16 v24 = 2080;
      CFStringRef v25 = v10;
      __int16 v26 = 2112;
      uint64_t v27 = v11;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#%08x [%s] failed to set attributes of %@: %@", buf, 0x26u);
    }
  }
  uint64_t v12 = [*(id *)(a1 + 32) diskCachePlistPath];
  id v13 = +[NSURL fileURLWithPath:v12];

  id v20 = 0;
  LOBYTE(v12) = [v13 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v20];
  id v14 = v20;
  if ((v12 & 1) == 0)
  {
    unint64_t v15 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      int v16 = *(_DWORD *)(a1 + 40);
      id v17 = v15;
      __int16 v18 = currentQueueName();
      id v19 = [*(id *)(a1 + 32) diskCachePlistPath];
      *(_DWORD *)buf = 67109890;
      int v23 = v16;
      __int16 v24 = 2080;
      CFStringRef v25 = v18;
      __int16 v26 = 2112;
      uint64_t v27 = v19;
      __int16 v28 = 2112;
      id v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "#%08x [%s] failed to exclude %@ from backups: %@", buf, 0x26u);
    }
  }
}

id sub_100017840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

void sub_10001784C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) locateOpQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100017908;
  v5[3] = &unk_100034FD8;
  __int16 v10 = *(_WORD *)(a1 + 60);
  int v9 = *(_DWORD *)(a1 + 56);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  uint64_t v8 = *(void *)(a1 + 48);
  [v2 addOperationWithBlock:v5];
}

void sub_100017908(uint64_t a1)
{
  id v25 = +[NSNull null];
  if (*(unsigned char *)(a1 + 60))
  {
    NSErrorDomain v2 = NSURLErrorDomain;
    uint64_t v3 = *(unsigned int *)(a1 + 56);
    uint64_t v4 = @"simulated timeout";
    uint64_t v5 = -1001;
LABEL_5:
    id v6 = createTaggedError(v2, v5, v4, v3);
    goto LABEL_6;
  }
  if (*(unsigned char *)(a1 + 61))
  {
    NSErrorDomain v2 = NSURLErrorDomain;
    uint64_t v3 = *(unsigned int *)(a1 + 56);
    uint64_t v4 = @"simulated error";
    uint64_t v5 = -1011;
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 32) isEqual:&stru_100035778])
  {
    int v9 = 0;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      +[NSJSONSerialization dataWithJSONObject:v10 options:0 error:0];
    }
    else {
    int v9 = [@"NO_LOCAL_SERVER" dataUsingEncoding:4];
    }
  }
  id v11 = objc_alloc((Class)NSHTTPURLResponse);
  uint64_t v12 = [*(id *)(a1 + 40) locateURL];
  if (*(void *)(a1 + 48)) {
    uint64_t v13 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v13 = 404;
  }
  id v14 = [v11 initWithURL:v12 statusCode:v13 HTTPVersion:@"HTTP/1.1" headerFields:0];

  [*(id *)(a1 + 40) setLocateServerValidated:1];
  unint64_t v15 = *(void **)(a1 + 40);
  int v16 = [v15 locateSession];
  [v15 URLSession:v16 dataTask:v25 didReceiveResponse:v14 completionHandler:&stru_100034FB0];

  if ([v9 length])
  {
    unint64_t v17 = (unint64_t)[v9 length];
    unint64_t v18 = v17 >> 1;
    if (v17 >= 2)
    {
      id v19 = *(void **)(a1 + 40);
      id v20 = [v19 locateSession];
      id v21 = objc_msgSend(v9, "subdataWithRange:", 0, v18);
      [v19 URLSession:v20 dataTask:v25 didReceiveData:v21];
    }
    id v22 = *(void **)(a1 + 40);
    int v23 = [v22 locateSession];
    __int16 v24 = objc_msgSend(v9, "subdataWithRange:", v18, (char *)objc_msgSend(v9, "length") - v18);
    [v22 URLSession:v23 dataTask:v25 didReceiveData:v24];
  }
  id v6 = 0;
LABEL_6:
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v7 locateSession];
  [v7 URLSession:v8 task:v25 didCompleteWithError:v6];
}

void sub_100017BA8(id a1, int64_t a2)
{
  if (a2 != 1) {
    sub_100024B1C();
  }
}

uint64_t sub_100017BC4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32), 0.0);
}

void sub_100018334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_100018374(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 objectForKey:@"address"];
    uint64_t v8 = [v6 objectForKey:@"port"];
    int v9 = [v6 objectForKey:@"details"];
    uint64_t v10 = [v6 objectForKey:@"guid"];
    if (!v7) {
      goto LABEL_26;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
    if (!v8) {
      goto LABEL_26;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_26;
      }
    }
    if ((int)[v8 intValue] < 1) {
      goto LABEL_26;
    }
    if (v9)
    {
      uint64_t v3 = [*(id *)(a1 + 32) serverDetailsVerifier];
      a3 = +[NSString stringWithFormat:@"servers[%ld].details", a3];
      if (![v3 verify:v9 name:a3 tag:*(unsigned int *)(a1 + 72)] || !v10) {
        goto LABEL_25;
      }
    }
    else if (!v10)
    {
      goto LABEL_26;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v41 = v3;
      id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];

      if (v9)
      {
      }
      if (!v11) {
        goto LABEL_26;
      }
      unsigned int v39 = [*(id *)(a1 + 32) isAddress:v7 inCompiledRanges:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 72)];
      if ([v7 containsString:@":"]
        && ([v7 hasPrefix:@"["] & 1) == 0)
      {
        uint64_t v12 = +[NSString stringWithFormat:@"[%@]", v7];

        uint64_t v7 = v12;
      }
      uint64_t v13 = +[NSString stringWithFormat:@"%@:%@", v7, v8];
      double v14 = *(double *)(a1 + 64);
      unint64_t v15 = [v6 objectForKey:@"connect-timeout"];
      __int16 v42 = (void *)v13;
      if (v15)
      {
        int v16 = &CCHmac_ptr;
        if (objc_opt_respondsToSelector())
        {
          [v15 doubleValue];
          double v14 = v17;
          if (v17 < 0.2) {
            double v14 = 1.0;
          }
        }
      }
      else
      {
        int v16 = &CCHmac_ptr;
      }
      __int16 v40 = v15;
      __int16 v24 = [*(id *)(a1 + 32) serverDetailsVerifier];
      uint64_t v25 = [v24 sanitize:v9 tag:*(unsigned int *)(a1 + 72)];

      if (v25) {
        __int16 v26 = (void *)v25;
      }
      else {
        __int16 v26 = &__NSDictionary0__struct;
      }
      uint64_t v27 = [v6 objectForKey:@"rank"];
      if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        uint64_t v27 = &off_100037610;
      }
      __int16 v28 = v42;
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsObject:v42])goto LABEL_43; {
      }
        }
      else
      {
        uint64_t v29 = +[NSMutableArray array];
        uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
        NSFileProtectionType v31 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = v29;

        uint64_t v32 = +[NSMutableSet set];
        uint64_t v33 = *(void *)(*(void *)(a1 + 56) + 8);
        __int16 v34 = *(void **)(v33 + 40);
        *(void *)(v33 + 40) = v32;
      }
      __int16 v38 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v52[0] = v42;
      v51[0] = @"localAddressAndPort";
      v51[1] = @"connectTimeout";
      uint64_t v35 = [v16[246] numberWithDouble:v14];
      v52[1] = v35;
      v52[2] = v26;
      v51[2] = @"details";
      v51[3] = @"favored";
      __int16 v36 = [v16[246] numberWithBool:v39];
      v52[3] = v36;
      v52[4] = v10;
      v51[4] = @"guid";
      v51[5] = @"rank";
      v52[5] = v27;
      id v37 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:6];
      [v38 addObject:v37];

      __int16 v28 = v42;
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v42];
LABEL_43:

      goto LABEL_29;
    }
    if (v9)
    {
LABEL_25:
    }
LABEL_26:
  }
  unint64_t v18 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = *(_DWORD *)(a1 + 72);
    uint64_t v7 = v18;
    id v20 = currentQueueName();
    id v21 = [*(id *)(a1 + 32) locateURL];
    id v22 = [v21 absoluteString];
    int v23 = [*(id *)(a1 + 32) redactObject:v6];
    *(_DWORD *)buf = 67109890;
    int v44 = v19;
    __int16 v45 = 2080;
    __int16 v46 = v20;
    __int16 v47 = 2112;
    __int16 v48 = v22;
    __int16 v49 = 2112;
    id v50 = v23;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#%08x [%s] in response from %@, server entry is invalid: %@", buf, 0x26u);

LABEL_29:
  }
}

void sub_100018EC4(uint64_t a1, void *a2, void *a3)
{
  unint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  double v17 = sub_100019004;
  unint64_t v18 = &unk_100035050;
  int v22 = *(_DWORD *)(a1 + 72);
  id v6 = *(void **)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = v6;
  id v21 = *(id *)(a1 + 64);
  id v7 = a3;
  id v8 = a2;
  int v9 = objc_retainBlock(&v15);
  uint64_t v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow", v15, v16, v17, v18, v19);
  double v12 = v11;
  uint64_t v13 = *(void *)(a1 + 56);
  double v14 = dispatch_get_global_queue(0, 0);
  [v10 locateLocalCachingServersWithHeaders:v8 body:v7 timeout:v13 favoredServerRanges:v9 callback:v14 callbackQueue:*(unsigned int *)(a1 + 72) tag:v12];
}

void sub_100019004(uint64_t a1, void *a2, int a3, void *a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  double v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v20 = *(_DWORD *)(a1 + 56);
    id v21 = v14;
    int v22 = currentQueueName();
    int v23 = [*(id *)(a1 + 32) redactObject:v11];
    __int16 v24 = [*(id *)(a1 + 32) redactObject:v12];
    *(_DWORD *)buf = 67110658;
    int v33 = v20;
    __int16 v34 = 2080;
    uint64_t v35 = v22;
    __int16 v36 = 2112;
    id v37 = v23;
    __int16 v38 = 1024;
    int v39 = a3;
    __int16 v40 = 2112;
    id v41 = v24;
    __int16 v42 = 2048;
    double v43 = a6;
    __int16 v44 = 2112;
    id v45 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "#%08x [%s] locateLocalCachingServers callback(locateServers=%@, sorted=%{BOOL}d, other=%@, locateValidityInterval=%.3f, locateError=%@)", buf, 0x40u);
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100019230;
  v25[3] = &unk_100034E58;
  unint64_t v15 = *(NSObject **)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  char v31 = a3;
  id v26 = v11;
  id v27 = v12;
  double v30 = a6;
  id v28 = v13;
  id v29 = v16;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(v15, v25);
}

uint64_t sub_100019230(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, double))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 64));
}

id sub_100019250(uint64_t a1)
{
  NSErrorDomain v2 = +[NSMutableDictionary dictionary];
  uint64_t v3 = [*(id *)(a1 + 32) softwareVersions];
  [v2 setObject:v3 forKey:@"locator-software"];

  uint64_t v4 = +[NSString stringWithFormat:@"#%08x", *(unsigned int *)(a1 + 56)];
  [v2 setObject:v4 forKey:@"locator-tag"];

  [v2 setObject:*(void *)(a1 + 40) forKey:@"local-addresses"];
  if ([*(id *)(a1 + 48) count]) {
    [v2 setObject:*(void *)(a1 + 48) forKey:@"public-address-ranges"];
  }
  [v2 setObject:&__kCFBooleanTrue forKey:@"ranked-results"];
  id v5 = [v2 copy];

  return v5;
}

void sub_100019368(uint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v20 = *(_DWORD *)(a1 + 88);
    id v21 = v12;
    int v22 = 67110915;
    int v23 = v20;
    __int16 v24 = 2080;
    uint64_t v25 = currentQueueName();
    __int16 v26 = 2048;
    id v27 = [v9 count];
    __int16 v28 = 2113;
    id v29 = v9;
    __int16 v30 = 2048;
    id v31 = [v10 count];
    __int16 v32 = 2112;
    id v33 = v10;
    __int16 v34 = 2048;
    double v35 = a5;
    __int16 v36 = 2112;
    id v37 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "#%08x [%s] locateLocalCachingServers callback(dnsPublicAddressRanges=[%ld]%{private}@ dnsFavoredServerRanges=[%ld]%@ dnsValidityInterval=%.3f dnsError=%@)", (uint8_t *)&v22, 0x4Eu);
  }
  if (([*(id *)(a1 + 32) amRunningOnMyQueue] & 1) == 0) {
    sub_100024B74();
  }
  if (v11)
  {
    id v13 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      int v14 = *(_DWORD *)(a1 + 88);
      unint64_t v15 = v13;
      id v16 = currentQueueName();
      int v22 = 67109634;
      int v23 = v14;
      __int16 v24 = 2080;
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      id v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "#%08x [%s] ignoring DNS error: %@", (uint8_t *)&v22, 0x1Cu);
    }
  }
  if (a5 == 0.0)
  {
    a5 = 3600.0;
  }
  else if (a5 < 300.0 && ((unint64_t)[*(id *)(a1 + 32) testFlags] & 2) == 0)
  {
    a5 = 300.0;
  }
  if (!v9) {
    id v9 = &__NSArray0__struct;
  }
  if (!v10) {
    id v10 = &__NSArray0__struct;
  }
  [*(id *)(a1 + 32) uncacheDNSPublicAddressRangesAndFavoredServerRangesForNetworkIdentifiers:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 88)];
  [*(id *)(a1 + 32) cacheDNSPublicAddressRanges:v9 andFavoredServerRanges:v10 forNetworkIdentifiers:*(void *)(a1 + 40) validityInterval:*(unsigned int *)(a1 + 88) tag:a5];
  [*(id *)(a1 + 32) saveDiskCacheWithTag:*(unsigned int *)(a1 + 88)];
  if ([v9 count]) {
    [*(id *)(a1 + 48) addObject:v9];
  }
  if ([v10 count]) {
    [*(id *)(a1 + 56) addObject:v10];
  }
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v17 = *(void *)(a1 + 72);
  id v19 = (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  (*(void (**)(uint64_t, uint64_t, void *))(v17 + 16))(v17, v18, v19);
}

void sub_1000198D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100019900(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  if (([v11 isEqualToString:@"query-parameters"] & 1) != 0
    || [v11 isEqualToString:@"sc"])
  {
    id v8 = [*(id *)(a1 + 32) objectForKey:v11];
    if (!v8) {
      goto LABEL_6;
    }
LABEL_4:
    if ([v7 isEqual:v8]) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (![v11 isEqualToString:@"sizeHint"])
  {
    id v8 = [*(id *)(a1 + 32) objectForKey:v11];
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_6;
  }
  uint64_t v9 = (uint64_t)[v7 longLongValue];
  id v8 = [*(id *)(a1 + 40) objectForKey:@"cache-size"];
  if (v8)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = (uint64_t)[v8 longLongValue];
      if (v9 >= 1 && v10 >= 1 && v9 > v10) {
        goto LABEL_5;
      }
    }
  }
LABEL_6:
}

int64_t sub_10001A054(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4 = a3;
  id v5 = [(NSDictionary *)a2 objectForKey:@"rank"];
  id v6 = [(NSDictionary *)v4 objectForKey:@"rank"];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

uint64_t sub_10001B1DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001B1F4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  _DWORD v13[2] = sub_10001B3B4;
  v13[3] = &unk_1000351C8;
  id v14 = a4;
  int v28 = *(_DWORD *)(a1 + 128);
  uint64_t v9 = *(NSObject **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v16 = v8;
  id v17 = *(id *)(a1 + 48);
  id v18 = v7;
  long long v19 = *(_OWORD *)(a1 + 56);
  id v20 = *(id *)(a1 + 72);
  id v21 = *(id *)(a1 + 80);
  id v22 = *(id *)(a1 + 88);
  id v23 = *(id *)(a1 + 96);
  id v27 = *(id *)(a1 + 120);
  id v24 = *(id *)(a1 + 104);
  id v25 = *(id *)(a1 + 32);
  id v26 = *(id *)(a1 + 112);
  id v10 = v7;
  id v11 = v8;
  id v12 = v14;
  dispatch_async(v9, v13);
}

void sub_10001B3B4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    NSErrorDomain v2 = gLogHandle;
    uint64_t v3 = 0;
    if (!os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    int v4 = *(_DWORD *)(a1 + 152);
    id v5 = v2;
    id v6 = currentQueueName();
    id v7 = [*(id *)(a1 + 40) absoluteString];
    id v8 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 67109890;
    int v77 = v4;
    __int16 v78 = 2080;
    uint64_t v79 = v6;
    __int16 v80 = 2112;
    long long v81 = v7;
    __int16 v82 = 2112;
    id v83 = v8;
    uint64_t v9 = "#%08x [%s] Error sending %@: %@";
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*(void *)(a1 + 88)) {
      goto LABEL_18;
    }
    id v31 = gLogHandle;
    uint64_t v3 = 0;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = *(_DWORD *)(a1 + 152);
      id v5 = v31;
      id v33 = currentQueueName();
      id v7 = [*(id *)(a1 + 40) absoluteString];
      __int16 v34 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 67109890;
      int v77 = v32;
      __int16 v78 = 2080;
      uint64_t v79 = v33;
      __int16 v80 = 2112;
      long long v81 = v7;
      __int16 v82 = 2112;
      id v83 = v34;
      uint64_t v9 = "#%08x [%s] Invalid response from %@: %@";
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v9, buf, 0x26u);

LABEL_18:
      uint64_t v3 = 0;
    }
LABEL_32:
    __int16 v47 = *(void **)(a1 + 72);
    if ((v3 & 1) != 0 || *(void *)(a1 + 88))
    {
      id v48 = v47;
    }
    else
    {
      id v48 = [v47 mutableCopy];
      [v48 setObject:&off_100037628 forKeyedSubscript:@"failureCount"];
    }
    v74[0] = @"server";
    v74[1] = @"lastSaved";
    v75[0] = v48;
    __int16 v49 = +[NSDate distantPast];
    v75[1] = v49;
    id v23 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];

    goto LABEL_37;
  }
  id v10 = *(id *)(a1 + 48);
  if ([v10 statusCode] != (id)200)
  {
    id v24 = [v10 statusCode];
    id v25 = gLogHandle;
    BOOL v26 = os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO);
    if (v24 != (id)404)
    {
      if (!v26)
      {
LABEL_30:
        uint64_t v3 = 0;
        goto LABEL_31;
      }
      int v35 = *(_DWORD *)(a1 + 152);
      __int16 v36 = v25;
      id v37 = currentQueueName();
      __int16 v38 = [*(id *)(a1 + 40) absoluteString];
      *(_DWORD *)buf = 67109890;
      int v77 = v35;
      __int16 v78 = 2080;
      uint64_t v79 = v37;
      __int16 v80 = 2112;
      long long v81 = v38;
      __int16 v82 = 1024;
      LODWORD(v83) = [v10 statusCode];
      int v39 = "#%08x [%s] Error response from %@: %d";
      __int16 v40 = v36;
      os_log_type_t v41 = OS_LOG_TYPE_INFO;
      uint32_t v42 = 34;
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v40, v41, v39, buf, v42);

      goto LABEL_30;
    }
    if (v26)
    {
      int v27 = *(_DWORD *)(a1 + 152);
      int v28 = v25;
      id v29 = currentQueueName();
      __int16 v30 = [*(id *)(a1 + 40) absoluteString];
      *(_DWORD *)buf = 67109634;
      int v77 = v27;
      __int16 v78 = 2080;
      uint64_t v79 = v29;
      __int16 v80 = 2112;
      long long v81 = v30;
      uint64_t v3 = 1;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "#%08x [%s] No affinity from %@", buf, 0x1Cu);

      goto LABEL_31;
    }
LABEL_24:
    uint64_t v3 = 1;
    goto LABEL_31;
  }
  if (!*(void *)(a1 + 56)) {
    goto LABEL_24;
  }
  id v11 = *(void **)(a1 + 64);
  if (!v11 || (unint64_t)[v11 length] > 0x400)
  {
    double v43 = gLogHandle;
    uint64_t v3 = 0;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      int v44 = *(_DWORD *)(a1 + 152);
      __int16 v36 = v43;
      id v45 = currentQueueName();
      __int16 v38 = [*(id *)(a1 + 40) absoluteString];
      id v46 = [*(id *)(a1 + 64) length];
      *(_DWORD *)buf = 67109890;
      int v77 = v44;
      __int16 v78 = 2080;
      uint64_t v79 = v45;
      __int16 v80 = 2112;
      long long v81 = v38;
      __int16 v82 = 2048;
      id v83 = v46;
      int v39 = "#%08x [%s] Invalid response from %@: %ld bytes";
      __int16 v40 = v36;
      os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
      uint32_t v42 = 38;
      goto LABEL_29;
    }
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v12 = *(void *)(a1 + 64);
  id v73 = 0;
  id v13 = +[NSPropertyListSerialization propertyListWithData:v12 options:0 format:0 error:&v73];
  id v14 = v73;
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v15 = [v13 objectForKey:@"lastSaved"];
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = gLogHandle;
        if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
        {
          double v66 = v13;
          id v17 = v14;
          int v18 = *(_DWORD *)(a1 + 152);
          v64 = v16;
          long long v19 = v15;
          id v20 = currentQueueName();
          id v21 = [*(id *)(a1 + 40) absoluteString];
          *(_DWORD *)buf = 67109890;
          int v77 = v18;
          id v14 = v17;
          __int16 v78 = 2080;
          uint64_t v79 = v20;
          id v15 = v19;
          __int16 v80 = 2112;
          long long v81 = v21;
          __int16 v82 = 2112;
          id v83 = v19;
          id v13 = v66;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "#%08x [%s] %@ lastSaved %@", buf, 0x26u);
        }
        uint64_t v22 = *(void *)(a1 + 72);
        v86[0] = @"server";
        v86[1] = @"lastSaved";
        v87[0] = v22;
        v87[1] = v15;
        id v23 = +[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:2];
        uint64_t v3 = 1;
        goto LABEL_48;
      }
    }
  }
  else
  {
    id v15 = 0;
  }
  id v53 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v63 = *(_DWORD *)(a1 + 152);
    v65 = v53;
    double v67 = v13;
    id v54 = v14;
    char v55 = currentQueueName();
    id v56 = [*(id *)(a1 + 40) absoluteString];
    id v57 = *(void **)(a1 + 80);
    id v58 = v15;
    id v59 = [*(id *)(a1 + 64) bytes];
    id v60 = [*(id *)(a1 + 64) length];
    id v61 = v59;
    id v15 = v58;
    v62 = [v57 safeString:v61 length:v60 forceHex:0];
    *(_DWORD *)buf = 67110146;
    int v77 = v63;
    __int16 v78 = 2080;
    uint64_t v79 = v55;
    id v14 = v54;
    id v13 = v67;
    __int16 v80 = 2112;
    long long v81 = v56;
    __int16 v82 = 2112;
    id v83 = v62;
    __int16 v84 = 2112;
    id v85 = v14;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "#%08x [%s] Invalid response from %@: %@ (%@)", buf, 0x30u);
  }
  uint64_t v3 = 0;
  id v23 = 0;
LABEL_48:

  if (!v23) {
    goto LABEL_32;
  }
  if ((v3 & 1) == 0) {
    sub_100024BF8();
  }
  uint64_t v3 = 1;
LABEL_37:
  [*(id *)(a1 + 96) addObject:v23];
  id v50 = [*(id *)(a1 + 96) count];
  if (v50 != [*(id *)(a1 + 104) count])
  {
    id v52 = 0;
    id v51 = 0;
    if (*(void *)(a1 + 88)) {
      goto LABEL_43;
    }
LABEL_42:
    [*(id *)(a1 + 80) updateHealthOfCachingServerWithHostport:*(void *)(a1 + 136) healthy:v3 override:1 callback:v51 callbackQueue:v52 tag:*(unsigned int *)(a1 + 152)];
    goto LABEL_43;
  }
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10001BC24;
  v68[3] = &unk_1000351A0;
  id v69 = *(id *)(a1 + 96);
  id v70 = *(id *)(a1 + 112);
  id v72 = *(id *)(a1 + 144);
  id v71 = *(id *)(a1 + 120);
  id v51 = objc_retainBlock(v68);
  id v52 = *(id *)(a1 + 128);

  if (!*(void *)(a1 + 88)) {
    goto LABEL_42;
  }
  if (v51) {
    dispatch_async(v52, v51);
  }
LABEL_43:
}

void sub_10001BC24(uint64_t a1)
{
  [*(id *)(a1 + 32) sortUsingComparator:&stru_100035178];
  NSErrorDomain v2 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v7) objectForKey:@"server"];
        [v2 addObject:v8];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  uint64_t v9 = *(NSObject **)(a1 + 40);
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10001BF1C;
  id v15 = &unk_100035000;
  id v10 = *(id *)(a1 + 56);
  id v16 = v2;
  id v17 = v10;
  id v11 = v2;
  dispatch_async(v9, &v12);
  objc_msgSend(*(id *)(a1 + 48), "invalidateAndCancel", v12, v13, v14, v15);
}

int64_t sub_10001BDF0(id a1, NSDictionary *a2, NSDictionary *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [(NSDictionary *)v4 objectForKey:@"lastSaved"];
  id v7 = [(NSDictionary *)v5 objectForKey:@"lastSaved"];
  int64_t v8 = (int64_t)[v7 compare:v6];
  if (!v8)
  {
    uint64_t v9 = [(NSDictionary *)v4 objectForKeyedSubscript:@"server"];
    id v10 = [v9 objectForKeyedSubscript:@"favored"];
    unsigned int v11 = [v10 BOOLValue];

    uint64_t v12 = [(NSDictionary *)v5 objectForKeyedSubscript:@"server"];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"favored"];
    unsigned int v14 = [v13 BOOLValue];

    if (v11) {
      int64_t v8 = v14 - 1;
    }
    else {
      int64_t v8 = v14;
    }
  }

  return v8;
}

uint64_t sub_10001BF1C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
}

uint64_t sub_10001BF34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001BF50(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 68))
  {
    NSErrorDomain v2 = NSURLErrorDomain;
    uint64_t v3 = *(unsigned int *)(a1 + 64);
    id v4 = @"simulated timeout";
    uint64_t v5 = -1001;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 69))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9)
      {
        id v13 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:100 options:0 error:0];
      }
      else
      {
        id v13 = 0;
      }
      id v10 = objc_alloc((Class)NSHTTPURLResponse);
      if (*(void *)(a1 + 56)) {
        uint64_t v11 = *(void *)(a1 + 56);
      }
      else {
        uint64_t v11 = 404;
      }
      id v8 = [v10 initWithURL:*(void *)(a1 + 40) statusCode:v11 HTTPVersion:@"HTTP/1.1" headerFields:0];
      uint64_t v6 = 0;
      id v7 = v13;
      goto LABEL_6;
    }
    NSErrorDomain v2 = NSURLErrorDomain;
    uint64_t v3 = *(unsigned int *)(a1 + 64);
    id v4 = @"simulated error";
    uint64_t v5 = -1011;
  }
  uint64_t v6 = createTaggedError(v2, v5, v4, v3);
  id v7 = 0;
  id v8 = 0;
LABEL_6:
  id v12 = v7;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10001CE0C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 84))
  {
    uint64_t v2 = [*(id *)(a1 + 32) lastLocateDate];
    if (!v2
      || (uint64_t v3 = (void *)v2,
          [*(id *)(a1 + 32) lastLocateDate],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v4 timeIntervalSinceNow],
          double v6 = v5,
          v4,
          v3,
          v6 <= -10.0))
    {
      char v21 = 1;
      uint64_t v20 = 1;
      goto LABEL_14;
    }
    id v7 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      int v8 = *(_DWORD *)(a1 + 80);
      uint64_t v9 = v7;
      id v10 = currentQueueName();
      uint64_t v11 = [*(id *)(a1 + 32) lastLocateDate];
      id v12 = +[NSDate dateWithTimeInterval:v11 sinceDate:10.0];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v8;
      __int16 v56 = 2080;
      id v57 = v10;
      __int16 v58 = 2112;
      id v59 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#%08x [%s] ignoring forceMiss so soon after locate; next allowed %@",
        buf,
        0x1Cu);
    }
  }
  char v54 = 0;
  *(void *)buf = 0;
  id v13 = *(void **)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  long long v53 = 0uLL;
  LODWORD(v35) = *(_DWORD *)(a1 + 80);
  unsigned int v16 = [v13 probeCacheWithLabel:@"early" capabilities:v14 affinityID:v15 hitServers:(char *)&v53 + 8 hitServersAreSorted:&v54 hitOtherServers:&v53 hitValidityInterval:buf tag:v35];
  id v17 = *((id *)&v53 + 1);
  id v18 = (id)v53;
  long long v19 = v18;
  if (v16 == 2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D288;
    block[3] = &unk_100035240;
    uint64_t v22 = *(NSObject **)(a1 + 56);
    id v23 = *(id *)(a1 + 64);
    id v49 = v19;
    id v50 = v23;
    char v52 = v54;
    id v48 = v17;
    uint64_t v51 = *(void *)buf;
    id v24 = v19;
    id v25 = v17;
    dispatch_async(v22, block);

    return;
  }
  if (v16 == 1)
  {
    if (!*(void *)(a1 + 48)) {
      sub_100024DB0();
    }
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = 1;
  }

  char v21 = 0;
LABEL_14:
  if (*(unsigned char *)(a1 + 85))
  {
    BOOL v26 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = *(_DWORD *)(a1 + 80);
      int v28 = v26;
      id v29 = currentQueueName();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v27;
      __int16 v56 = 2080;
      id v57 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#%08x [%s] quick miss", buf, 0x12u);
    }
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10001D2AC;
    v44[3] = &unk_100035268;
    __int16 v30 = *(NSObject **)(a1 + 56);
    id v45 = *(id *)(a1 + 64);
    int v46 = *(_DWORD *)(a1 + 80);
    dispatch_async(v30, v44);
    if (*(unsigned char *)(a1 + 86))
    {
      id v31 = *(void **)(a1 + 32);
      [v31 locateTimeout];
      objc_msgSend(v31, "relocateCachingServersWithTimeout:capabilities:affinityID:forceRefresh:tag:", *(void *)(a1 + 40), *(void *)(a1 + 48), v20, *(unsigned int *)(a1 + 80));
    }
    int v32 = v45;
  }
  else
  {
    id v33 = dispatch_get_global_queue(0, 0);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10001D33C;
    v36[3] = &unk_100035290;
    __int16 v34 = *(void **)(a1 + 40);
    v36[4] = *(void *)(a1 + 32);
    uint64_t v40 = *(void *)(a1 + 72);
    id v37 = v34;
    id v38 = *(id *)(a1 + 48);
    char v42 = v21;
    char v43 = v21;
    id v39 = *(id *)(a1 + 64);
    int v41 = *(_DWORD *)(a1 + 80);
    dispatch_async(v33, v36);

    int v32 = v37;
  }
}

uint64_t sub_10001D288(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, double))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 40), 0, *(double *)(a1 + 56));
}

void sub_10001D2AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  createTaggedError(NSPOSIXErrorDomain, 60, @"quick miss requested", *(unsigned int *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, void, id, double))(v1 + 16))(v1, 0, 0, 0, v2, 300.0);
}

id sub_10001D33C(uint64_t a1)
{
  return [*(id *)(a1 + 32) slowcateCachingServerWithTimeout:*(void *)(a1 + 40) capabilities:*(void *)(a1 + 48) affinityID:*(unsigned __int8 *)(a1 + 76) forceRefresh:*(unsigned __int8 *)(a1 + 77) forceDNSRefresh:*(void *)(a1 + 56) callback:*(unsigned int *)(a1 + 72) tag:*(double *)(a1 + 64)];
}

void sub_10001D5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001D5DC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) cacheRefreshInProgress];
  if ((result & 1) == 0)
  {
    id result = [*(id *)(a1 + 32) setCacheRefreshInProgress:1];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

id sub_10001D624(uint64_t a1)
{
  id v2 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 56);
    id v4 = v2;
    *(_DWORD *)buf = 67109378;
    int v13 = v3;
    __int16 v14 = 2080;
    uint64_t v15 = currentQueueName();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#%08x [%s] starting proactive cache refresh", buf, 0x12u);
  }
  double v5 = *(void **)(a1 + 32);
  [v5 locateTimeout];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 60);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001D768;
  v10[3] = &unk_100035308;
  int v11 = *(_DWORD *)(a1 + 56);
  v10[4] = *(void *)(a1 + 32);
  return objc_msgSend(v5, "slowcateCachingServerWithTimeout:capabilities:affinityID:forceRefresh:forceDNSRefresh:callback:tag:", v6, v7, v8, 0, v10);
}

void sub_10001D768(uint64_t a1, void *a2, int a3, void *a4, void *a5, double a6)
{
  id v11 = a5;
  id v12 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
  {
    int v13 = *(_DWORD *)(a1 + 40);
    __int16 v14 = v12;
    id v15 = a4;
    id v16 = a2;
    id v17 = currentQueueName();
    id v18 = [*(id *)(a1 + 32) redactObject:v16];

    long long v19 = [*(id *)(a1 + 32) redactObject:v15];

    *(_DWORD *)buf = 67110658;
    int v23 = v13;
    __int16 v24 = 2080;
    id v25 = v17;
    __int16 v26 = 2112;
    int v27 = v18;
    __int16 v28 = 1024;
    int v29 = a3;
    __int16 v30 = 2112;
    id v31 = v19;
    __int16 v32 = 2048;
    double v33 = a6;
    __int16 v34 = 2112;
    id v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#%08x [%s] cache refresh finished (servers=%@, sorted=%{BOOL}d, other=%@, validityInterval=%.3f, error=%@)", buf, 0x40u);
  }
  uint64_t v20 = [*(id *)(a1 + 32) cacheRefreshQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D958;
  block[3] = &unk_100034B60;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v20, block);
}

id sub_10001D958(uint64_t a1)
{
  if (([*(id *)(a1 + 32) cacheRefreshInProgress] & 1) == 0) {
    sub_100024DDC();
  }
  id v2 = *(void **)(a1 + 32);

  return [v2 setCacheRefreshInProgress:0];
}

void sub_10001DD88(uint64_t a1, void *a2, int a3, void *a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  __int16 v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v16 = *(_DWORD *)(a1 + 48);
    id v17 = v14;
    id v18 = currentQueueName();
    long long v19 = [*(id *)(a1 + 32) redactObject:v11];
    uint64_t v20 = [*(id *)(a1 + 32) redactObject:v12];
    v21[0] = 67110658;
    v21[1] = v16;
    __int16 v22 = 2080;
    int v23 = v18;
    __int16 v24 = 2112;
    id v25 = v19;
    __int16 v26 = 1024;
    int v27 = a3;
    __int16 v28 = 2112;
    int v29 = v20;
    __int16 v30 = 2048;
    double v31 = a6;
    __int16 v32 = 2112;
    id v33 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "#%08x [%s] slowcateCachingServer finishSingleLocateAndCallBackWithServers(servers=%@, sorted=%{BOOL}d, other=%@, validityInterval=%.3f, error=%@)", (uint8_t *)v21, 0x40u);
  }
  if ([*(id *)(a1 + 32) singleLocateTag] != *(_DWORD *)(a1 + 48)) {
    sub_100024E34();
  }
  [*(id *)(a1 + 32) setSingleLocateTag:0];
  id v15 = [*(id *)(a1 + 32) singleLocate];
  dispatch_semaphore_signal(v15);

  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(a6);
}

void sub_10001DF74(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 76)) {
    goto LABEL_2;
  }
  char v44 = 0;
  id v42 = 0;
  double v43 = 0.0;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v41 = 0;
  LODWORD(v22) = *(_DWORD *)(a1 + 72);
  unsigned int v10 = [v7 probeCacheWithLabel:@"standard" capabilities:v8 affinityID:v9 hitServers:&v42 hitServersAreSorted:&v44 hitOtherServers:&v41 hitValidityInterval:&v43 tag:v22];
  id v11 = v42;
  id v12 = v41;
  id v13 = v12;
  if (v10 == 2)
  {
    (*(void (**)(double))(*(void *)(a1 + 64) + 16))(v43);
LABEL_13:

    goto LABEL_17;
  }
  if (v10 == 1)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if (!v14) {
      sub_100024E8C();
    }
    id v15 = *(void **)(a1 + 32);
    [*(id *)(a1 + 56) timeIntervalSinceNow];
    double v17 = v16;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10001E304;
    v35[3] = &unk_100035358;
    v35[4] = *(void *)(a1 + 32);
    id v36 = *(id *)(a1 + 48);
    int v40 = *(_DWORD *)(a1 + 72);
    id v38 = *(id *)(a1 + 64);
    id v37 = v13;
    double v39 = v43;
    id v18 = [*(id *)(a1 + 32) queue];
    [v15 queryServersFromArray:v11 forReachabilityOrAffinityID:v14 withTimeout:v35 callbackWithServers:v18 callbackQueue:*(unsigned int *)(a1 + 72) tag:v17];

    goto LABEL_13;
  }

LABEL_2:
  if (([*(id *)(a1 + 32) amRunningOnMyQueue] & 1) == 0) {
    sub_100024E60();
  }
  id v2 = [*(id *)(a1 + 32) localAddresses];
  int v3 = [*(id *)(a1 + 32) gatewayIdentifiers];
  if (!v2)
  {
    if (*(unsigned char *)(a1 + 76))
    {
      id v4 = *(void **)(a1 + 32);
      id v33 = v3;
      id v34 = 0;
      unsigned __int8 v5 = [v4 makeLocalAddresses:&v34 andGatewayIdentifiers:&v33 tag:*(unsigned int *)(a1 + 72)];
      id v2 = v34;
      id v6 = v33;

      if ((v5 & 1) == 0)
      {

        id v2 = 0;
        id v6 = 0;
      }
      [*(id *)(a1 + 32) setLocalAddresses:v2];
      [*(id *)(a1 + 32) setGatewayIdentifiers:v6];
      int v3 = v6;
    }
    else
    {
      id v2 = 0;
    }
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001E384;
  void v23[3] = &unk_1000353D0;
  int v31 = *(_DWORD *)(a1 + 72);
  long long v19 = *(void **)(a1 + 40);
  v23[4] = *(void *)(a1 + 32);
  id v24 = v19;
  id v30 = *(id *)(a1 + 64);
  id v25 = v2;
  id v26 = v3;
  id v27 = *(id *)(a1 + 48);
  id v28 = *(id *)(a1 + 56);
  id v29 = 0;
  char v32 = *(unsigned char *)(a1 + 77);
  id v20 = v3;
  id v11 = v2;
  char v21 = objc_retainBlock(v23);
  ((void (*)(void *, void, void, void, void, double))v21[2])(v21, 0, 0, 0, 0, 0.0);

LABEL_17:
}

void sub_10001E304(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    [*(id *)(a1 + 32) cacheServers:v3 forAffinityID:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 72)];
  }
  (*(void (**)(double))(*(void *)(a1 + 56) + 16))(*(double *)(a1 + 64));
}

void sub_10001E384(uint64_t a1, void *a2, int a3, void *a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v53 = *(_DWORD *)(a1 + 96);
    char v54 = v14;
    char v55 = currentQueueName();
    [*(id *)(a1 + 32) redactObject:v11];
    v57 = id v56 = v13;
    [*(id *)(a1 + 32) redactObject:v12];
    __int16 v58 = v62 = v12;
    *(_DWORD *)buf = 67110658;
    int v71 = v53;
    __int16 v72 = 2080;
    id v73 = v55;
    __int16 v74 = 2112;
    id v75 = v57;
    __int16 v76 = 1024;
    int v77 = a3;
    __int16 v78 = 2112;
    uint64_t v79 = v58;
    __int16 v80 = 2048;
    double v81 = a6;
    __int16 v82 = 2112;
    id v83 = v56;
    _os_log_debug_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "#%08x [%s] slowcateCachingServer callback(localhostServers=%@, sorted=%{BOOL}d, other=%@, localhostValidityInterval=%.3f, localhostError=%@)", buf, 0x40u);

    id v12 = v62;
    id v13 = v56;
  }
  if (([*(id *)(a1 + 32) amRunningOnMyQueue] & 1) == 0) {
    sub_100024EB8();
  }
  if ([v11 count])
  {
    if (a6 == 0.0)
    {
      a6 = 1200.0;
    }
    else if (a6 < 300.0 && ((unint64_t)[*(id *)(a1 + 32) testFlags] & 4) == 0)
    {
      a6 = 300.0;
    }
    [*(id *)(a1 + 32) uncacheAllServersWithTag:*(unsigned int *)(a1 + 96)];
    long long v19 = *(void **)(a1 + 32);
    id v20 = [v19 servers:v11 byAppendingServers:v12];
    char v21 = [*(id *)(a1 + 32) localhostAddresses];
    [v19 cacheServers:v20 forNetworkIdentifiers:v21 validityInterval:*(unsigned int *)(a1 + 96) tag:a6];

    [*(id *)(a1 + 32) uncacheAllRecentlySeenWithTag:*(unsigned int *)(a1 + 96)];
    uint64_t v22 = *(void **)(a1 + 32);
    int v23 = [v22 localhostAddresses];
    [v22 cacheRecentlySeen:1 forNetworkIdentifiers:v23 validityInterval:*(unsigned int *)(a1 + 96) tag:604800.0];

    [*(id *)(a1 + 32) saveDiskCacheWithTag:*(unsigned int *)(a1 + 96)];
    [*(id *)(a1 + 32) uncacheAllAffinitiesWithTag:*(unsigned int *)(a1 + 96)];
    id v18 = [*(id *)(a1 + 32) serversFromArray:v11 withCapabilities:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 96)];
    if ([v18 count])
    {
      id v24 = gLogHandle;
      if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = *(_DWORD *)(a1 + 96);
        id v26 = v24;
        id v27 = currentQueueName();
        [*(id *)(a1 + 32) describeCapableServers:v18 fromAvailableServers:v11 withOtherServers:v12];
        id v29 = v28 = v13;
        *(_DWORD *)buf = 67109634;
        int v71 = v25;
        __int16 v72 = 2080;
        id v73 = v27;
        __int16 v74 = 2112;
        id v75 = v29;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#%08x [%s] found %@", buf, 0x1Cu);

        id v13 = v28;
      }
      (*(void (**)(double))(*(void *)(a1 + 88) + 16))(a6);

      goto LABEL_25;
    }
  }
  else
  {
    id v15 = *(void **)(a1 + 32);
    double v16 = [v15 localhostAddresses];
    [v15 uncacheServersForNetworkIdentifiers:v16 tag:*(unsigned int *)(a1 + 96)];

    double v17 = *(void **)(a1 + 32);
    id v18 = [v17 localhostAddresses];
    [v17 cacheNotRecentlySeenForNetworkIdentifiers:v18 tag:*(unsigned int *)(a1 + 96)];
  }

  if (*(void *)(a1 + 48))
  {
    id v30 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
    {
      int v31 = *(_DWORD *)(a1 + 96);
      char v32 = v30;
      id v33 = currentQueueName();
      *(_DWORD *)buf = 67109378;
      int v71 = v31;
      __int16 v72 = 2080;
      id v73 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "#%08x [%s] checking for caching servers on local network", buf, 0x12u);
    }
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_10001EA38;
    v63[3] = &unk_1000353A8;
    int v69 = *(_DWORD *)(a1 + 96);
    v63[4] = *(void *)(a1 + 32);
    id v64 = *(id *)(a1 + 56);
    id v65 = *(id *)(a1 + 40);
    id v66 = *(id *)(a1 + 64);
    id v68 = *(id *)(a1 + 88);
    id v67 = *(id *)(a1 + 72);
    id v34 = objc_retainBlock(v63);
    id v35 = [*(id *)(a1 + 32) locateTetheredCachingServersWithTag:*(unsigned int *)(a1 + 96)];
    if ([v35 count])
    {
      ((void (*)(void *, void *, void, void, void, double))v34[2])(v34, v35, 0, 0, 0, 3600.0);
    }
    else
    {
      id v60 = *(void **)(a1 + 32);
      [*(id *)(a1 + 72) timeIntervalSinceNow];
      double v43 = v42;
      id v44 = v13;
      id v61 = v11;
      id v45 = v12;
      uint64_t v46 = *(void *)(a1 + 48);
      uint64_t v47 = *(void *)(a1 + 56);
      uint64_t v48 = *(void *)(a1 + 80);
      uint64_t v49 = *(unsigned __int8 *)(a1 + 100);
      id v50 = [*(id *)(a1 + 32) queue];
      LODWORD(v59) = *(_DWORD *)(a1 + 96);
      uint64_t v51 = v46;
      id v13 = v44;
      uint64_t v52 = v47;
      id v12 = v45;
      id v11 = v61;
      [v60 locateLocalCachingServersWithTimeout:v51 localAddresses:v52 gatewayIdentifiers:v48 configurationProfiles:v49 forceDNSRefresh:v34 callback:v50 callbackQueue:v43 tag:v59];
    }
  }
  else
  {
    id v36 = *(void **)(a1 + 32);
    id v37 = [v36 localhostAddresses];
    [v36 cacheServers:&__NSArray0__struct forNetworkIdentifiers:v37 validityInterval:*(unsigned int *)(a1 + 96) tag:5.0];

    [*(id *)(a1 + 32) saveDiskCacheWithTag:*(unsigned int *)(a1 + 96)];
    [*(id *)(a1 + 32) uncacheAllAffinitiesWithTag:*(unsigned int *)(a1 + 96)];
    id v38 = gLogHandle;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = *(_DWORD *)(a1 + 96);
      int v40 = v38;
      id v41 = currentQueueName();
      *(_DWORD *)buf = 67109378;
      int v71 = v39;
      __int16 v72 = 2080;
      id v73 = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#%08x [%s] no local network", buf, 0x12u);
    }
    (*(void (**)(double))(*(void *)(a1 + 88) + 16))(3600.0);
  }
LABEL_25:
}

void sub_10001EA38(uint64_t a1, void *a2, int a3, void *a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v35 = *(_DWORD *)(a1 + 80);
    int v31 = v14;
    char v32 = currentQueueName();
    id v33 = [*(id *)(a1 + 32) redactObject:v11];
    id v34 = [*(id *)(a1 + 32) redactObject:v12];
    *(_DWORD *)buf = 67110658;
    int v45 = v35;
    __int16 v46 = 2080;
    uint64_t v47 = v32;
    __int16 v48 = 2112;
    uint64_t v49 = v33;
    __int16 v50 = 1024;
    int v51 = a3;
    __int16 v52 = 2112;
    int v53 = v34;
    __int16 v54 = 2048;
    double v55 = a6;
    __int16 v56 = 2112;
    id v57 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "#%08x [%s] slowcateCachingServer callback(localServers=%@, sorted=%{BOOL}d, other=%@, localValidityInterval=%.3f, localError=%@)", buf, 0x40u);
  }
  if (([*(id *)(a1 + 32) amRunningOnMyQueue] & 1) == 0) {
    sub_100024EE4();
  }
  if (a6 == 0.0)
  {
    a6 = 3600.0;
  }
  else if (a6 < 300.0 && ((unint64_t)[*(id *)(a1 + 32) testFlags] & 4) == 0)
  {
    a6 = 300.0;
  }
  if (v11 && !v13)
  {
    if ([v11 count])
    {
      [*(id *)(a1 + 32) uncacheServersForNetworkIdentifiers:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 80)];
      id v15 = *(void **)(a1 + 32);
      double v16 = [v15 servers:v11 byAppendingServers:v12];
      [v15 cacheServers:v16 forNetworkIdentifiers:*(void *)(a1 + 40) validityInterval:*(unsigned int *)(a1 + 80) tag:a6];

      [*(id *)(a1 + 32) uncacheRecentlySeenForNetworkIdentifiers:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 80)];
      [*(id *)(a1 + 32) cacheRecentlySeen:1 forNetworkIdentifiers:*(void *)(a1 + 40) validityInterval:*(unsigned int *)(a1 + 80) tag:604800.0];
      [*(id *)(a1 + 32) saveDiskCacheWithTag:*(unsigned int *)(a1 + 80)];
      double v17 = [*(id *)(a1 + 32) serversFromArray:v11 withCapabilities:*(void *)(a1 + 48) tag:*(unsigned int *)(a1 + 80)];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10001EF04;
      v37[3] = &unk_100035380;
      int v43 = *(_DWORD *)(a1 + 80);
      v37[4] = *(void *)(a1 + 32);
      id v38 = v17;
      id v39 = v12;
      id v40 = *(id *)(a1 + 56);
      id v41 = *(id *)(a1 + 72);
      double v42 = a6;
      id v18 = v17;
      long long v19 = objc_retainBlock(v37);
      id v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 56);
      [*(id *)(a1 + 64) timeIntervalSinceNow];
      double v23 = v22;
      id v24 = [*(id *)(a1 + 32) queue];
      [v20 queryServersFromArray:v18 forReachabilityOrAffinityID:v21 withTimeout:v19 callbackWithServers:v24 callbackQueue:*(unsigned int *)(a1 + 80) tag:v23];

      goto LABEL_21;
    }
    goto LABEL_15;
  }
  if (!v13)
  {
LABEL_15:
    id v36 = 0;
    [*(id *)(a1 + 32) cachedRecentlySeen:&v36 forNetworkIdentifiers:*(void *)(a1 + 40) validityInterval:0 tag:*(unsigned int *)(a1 + 80)];
    id v25 = v36;
    if (((a6 > 3600.0) & [v25 BOOLValue]) != 0) {
      a6 = 3600.0;
    }

    goto LABEL_18;
  }
  a6 = 3600.0;
LABEL_18:
  [*(id *)(a1 + 32) uncacheServersForNetworkIdentifiers:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 80)];
  [*(id *)(a1 + 32) cacheServers:&__NSArray0__struct forNetworkIdentifiers:*(void *)(a1 + 40) validityInterval:*(unsigned int *)(a1 + 80) tag:a6];
  [*(id *)(a1 + 32) cacheNotRecentlySeenForNetworkIdentifiers:*(void *)(a1 + 40) tag:*(unsigned int *)(a1 + 80)];
  [*(id *)(a1 + 32) saveDiskCacheWithTag:*(unsigned int *)(a1 + 80)];
  [*(id *)(a1 + 32) uncacheAllAffinitiesWithTag:*(unsigned int *)(a1 + 80)];
  id v26 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = *(_DWORD *)(a1 + 80);
    id v28 = v26;
    id v29 = currentQueueName();
    id v30 = [*(id *)(a1 + 32) describeCapableServers:0 fromAvailableServers:0 withOtherServers:0];
    *(_DWORD *)buf = 67109634;
    int v45 = v27;
    __int16 v46 = 2080;
    uint64_t v47 = v29;
    __int16 v48 = 2112;
    uint64_t v49 = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#%08x [%s] found %@", buf, 0x1Cu);
  }
  (*(void (**)(double))(*(void *)(a1 + 72) + 16))(a6);
LABEL_21:
}

void sub_10001EF04(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(_DWORD *)(a1 + 80);
    uint64_t v8 = v6;
    uint64_t v9 = currentQueueName();
    unsigned int v10 = [*(id *)(a1 + 32) describeCapableServers:*(void *)(a1 + 40) fromAvailableServers:v5 withOtherServers:*(void *)(a1 + 48)];
    v11[0] = 67109890;
    v11[1] = v7;
    __int16 v12 = 2080;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v10;
    __int16 v16 = 1024;
    int v17 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#%08x [%s] found %@, sorted=%{BOOL}d", (uint8_t *)v11, 0x22u);
  }
  if (*(void *)(a1 + 56) && [v5 count]) {
    [*(id *)(a1 + 32) cacheServers:v5 forAffinityID:*(void *)(a1 + 56) tag:*(unsigned int *)(a1 + 80)];
  }
  (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(a1 + 72));
}

void sub_10001F2FC(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if (a3 && ([*(id *)(a1 + 32) appendString:@", "], a3 > 0x13))
  {
    [*(id *)(a1 + 32) appendString:@"..."];
    *a4 = 1;
  }
  else
  {
    int v7 = [v10 objectForKeyedSubscript:@"localAddressAndPort"];
    [*(id *)(a1 + 32) appendString:v7];
    uint64_t v8 = [v10 objectForKeyedSubscript:@"failureCount"];
    id v9 = [v8 unsignedIntegerValue];

    if ((unint64_t)v9 >= 3) {
      [*(id *)(a1 + 32) appendString:@" unhealthy"];
    }
    if (([*(id *)(a1 + 40) containsObject:v7] & 1) == 0) {
      [*(id *)(a1 + 32) appendString:@" incapable"];
    }
  }
}

void sub_10001FCCC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v25 = 0;
  id v3 = [v2 localhostAddresses];
  [v2 cachedRecentlySeen:&v25 forNetworkIdentifiers:v3 validityInterval:0 tag:*(unsigned int *)(a1 + 56)];
  id v4 = v25;

  if (v4 && ([v4 BOOLValue] & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) localAddresses];
    uint64_t v7 = [*(id *)(a1 + 32) gatewayIdentifiers];
    uint64_t v8 = (void *)v7;
    if (v6)
    {
      if (!v7) {
        goto LABEL_12;
      }
    }
    else
    {
      id v9 = *(void **)(a1 + 32);
      id v23 = v8;
      id v24 = 0;
      unsigned __int8 v10 = [v9 makeLocalAddresses:&v24 andGatewayIdentifiers:&v23 tag:*(unsigned int *)(a1 + 56)];
      id v6 = v24;
      id v11 = v23;

      if ((v10 & 1) == 0)
      {

        id v6 = 0;
        id v11 = 0;
      }
      [*(id *)(a1 + 32) setLocalAddresses:v6];
      [*(id *)(a1 + 32) setGatewayIdentifiers:v11];
      uint64_t v8 = v11;
      if (!v11) {
        goto LABEL_12;
      }
    }

    __int16 v12 = *(void **)(a1 + 32);
    id v22 = 0;
    [v12 cachedRecentlySeen:&v22 forNetworkIdentifiers:v8 validityInterval:0 tag:*(unsigned int *)(a1 + 56)];
    id v13 = v22;
    id v4 = v13;
    if (v13)
    {
      unsigned __int8 v5 = [v13 BOOLValue];
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    unsigned __int8 v5 = 1;
    goto LABEL_13;
  }
  unsigned __int8 v5 = 1;
LABEL_14:
  __int16 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_10001FEDC;
  long long v19 = &unk_100035420;
  __int16 v14 = *(NSObject **)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  unsigned __int8 v21 = v5;
  dispatch_async(v14, &v16);
  if (!v4 && *(unsigned char *)(a1 + 60))
  {
    id v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "locateTimeout", v16, v17, v18, v19);
    objc_msgSend(v15, "relocateCachingServersWithTimeout:capabilities:affinityID:forceRefresh:tag:", 0, 0, 1, *(unsigned int *)(a1 + 56));
  }
}

uint64_t sub_10001FEDC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void sub_1000201BC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) localhostAddresses];
  unsigned int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    unsigned __int8 v5 = [*(id *)(a1 + 32) localhostAddresses];
    id v44 = 0;
    unsigned __int8 v6 = [v4 probeCacheForType:@"localhost" withLabel:@"health-update" networkIdentifiers:v5 hitServers:&v44 hitValidityInterval:0 tag:*(unsigned int *)(a1 + 72)];
    id v7 = v44;

    if ((v6 & 1) == 0) {
      goto LABEL_33;
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) localAddresses];
    id v9 = [*(id *)(a1 + 32) gatewayIdentifiers];
    if (!v8)
    {
      unsigned __int8 v10 = *(void **)(a1 + 32);
      id v42 = v9;
      id v43 = 0;
      unsigned __int8 v11 = [v10 makeLocalAddresses:&v43 andGatewayIdentifiers:&v42 tag:*(unsigned int *)(a1 + 72)];
      id v8 = v43;
      id v12 = v42;

      if ((v11 & 1) == 0)
      {

        id v12 = 0;
        id v8 = 0;
      }
      [*(id *)(a1 + 32) setLocalAddresses:v8];
      [*(id *)(a1 + 32) setGatewayIdentifiers:v12];
      id v9 = v12;
    }
    id v13 = *(void **)(a1 + 32);
    id v41 = 0;
    unsigned int v14 = [v13 probeCacheForType:@"local" withLabel:@"health-update" networkIdentifiers:v9 hitServers:&v41 hitValidityInterval:0 tag:*(unsigned int *)(a1 + 72)];
    id v7 = v41;

    if (!v14) {
      goto LABEL_33;
    }
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = v7;
  id v15 = [v7 countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v38;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v7);
        }
        long long v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v20 = objc_msgSend(v19, "objectForKeyedSubscript:", @"localAddressAndPort", (void)v37);
        unsigned int v21 = [v20 isEqualToString:*(void *)(a1 + 48)];

        if (v21)
        {
          id v22 = [v19 objectForKeyedSubscript:@"failureCount"];
          id v23 = [v22 unsignedIntegerValue];

          if (*(unsigned char *)(a1 + 76))
          {
            if (v23)
            {
              if ((unint64_t)v23 >= 3)
              {
                id v24 = gLogHandle;
                if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
                {
                  int v25 = *(_DWORD *)(a1 + 72);
                  id v26 = v24;
                  int v27 = currentQueueName();
                  uint64_t v28 = *(void *)(a1 + 48);
                  *(_DWORD *)buf = 67109634;
                  int v46 = v25;
                  __int16 v47 = 2080;
                  __int16 v48 = v27;
                  __int16 v49 = 2112;
                  uint64_t v50 = v28;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#%08x [%s] caching server %@ is healthy again", buf, 0x1Cu);
                }
              }
              [v19 removeObjectForKey:@"failureCount"];
            }
          }
          else if ((unint64_t)v23 <= 2)
          {
            if (*(unsigned char *)(a1 + 77)) {
              unint64_t v29 = 3;
            }
            else {
              unint64_t v29 = (unint64_t)v23 + 1;
            }
            if (v29 >= 3)
            {
              id v30 = gLogHandle;
              if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
              {
                int v31 = *(_DWORD *)(a1 + 72);
                char v32 = v30;
                id v33 = currentQueueName();
                uint64_t v34 = *(void *)(a1 + 48);
                *(_DWORD *)buf = 67109634;
                int v46 = v31;
                __int16 v47 = 2080;
                __int16 v48 = v33;
                __int16 v49 = 2112;
                uint64_t v50 = v34;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#%08x [%s] caching server %@ is now unhealthy", buf, 0x1Cu);
              }
            }
            int v35 = +[NSNumber numberWithUnsignedInteger:v29];
            [v19 setObject:v35 forKeyedSubscript:@"failureCount"];
          }
          goto LABEL_32;
        }
      }
      id v16 = [v7 countByEnumeratingWithState:&v37 objects:v51 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_32:

LABEL_33:
  id v36 = *(void **)(a1 + 64);
  if (v36) {
    dispatch_async(*(dispatch_queue_t *)(a1 + 56), v36);
  }
}

id sub_10002097C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

id sub_100021408(id *a1)
{
  id v2 = [a1[4] locateTag];
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_1000250BC();
  }
  id v3 = a1[5];
  id v4 = [a1[4] locateSession];

  if (v3 == v4)
  {
    if (([a1[4] amRunningInMySingleLocate:v2] & 1) == 0) {
      sub_100025090();
    }
    [a1[4] setLocateTag:0];
    unsigned __int8 v5 = [a1[4] locateCallback];
    [a1[4] setLocateCallback:0];
    unsigned __int8 v6 = [a1[4] locateCallbackQueue];
    [a1[4] setLocateCallbackQueue:0];
    id v7 = [a1[4] locateFavoredServerRanges];
    [a1[4] setLocateFavoredServerRanges:0];
    [a1[4] setLocateSession:0];
    unsigned __int8 v8 = [a1[4] locateServerValidated];
    id v9 = [a1[4] locateResponseCode];
    [a1[4] setLocateResponseCode:0];
    unsigned __int8 v10 = [a1[4] locateResponseData];
    [a1[4] setLocateResponseData:0];
    unsigned __int8 v11 = +[NSDate date];
    [a1[4] setLastLocateDate:v11];

    if (a1[7])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100021AAC;
      block[3] = &unk_100035000;
      id v20 = v5;
      id v19 = a1[7];
      id v12 = v5;
      dispatch_async(v6, block);

      id v13 = v20;
    }
    else
    {
      unsigned int v14 = dispatch_get_global_queue(0, 0);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      _DWORD v21[2] = sub_1000216D8;
      v21[3] = &unk_1000354C0;
      unsigned __int8 v28 = v8;
      id v15 = a1[4];
      int v27 = (int)v2;
      v21[4] = v15;
      id v26 = v9;
      id v22 = v10;
      id v23 = v7;
      id v24 = v6;
      id v25 = v5;
      id v16 = v5;
      dispatch_async(v14, v21);

      id v13 = v22;
    }
  }
  return [a1[5] finishTasksAndInvalidate];
}

void sub_1000216D8(uint64_t a1)
{
  uint64_t v37 = 0;
  if (!*(unsigned char *)(a1 + 84))
  {
    id v9 = [*(id *)(a1 + 32) locateURL];
    unsigned __int8 v10 = [v9 absoluteString];
    unsigned __int8 v11 = +[NSString stringWithFormat:@"unable to validate server for %@", v10];
    createTaggedError(NSURLErrorDomain, -1202, v11, *(unsigned int *)(a1 + 80));
    id v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
    id v7 = 0;
    goto LABEL_20;
  }
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 != 200)
  {
    if (v3)
    {
      id v12 = [objc_alloc((Class)NSString) initWithData:*(void *)(a1 + 40) encoding:4];
      uint64_t v2 = *(void *)(a1 + 72);
    }
    else
    {
      id v12 = 0;
    }
    if (v2 == 404)
    {
      if ([v12 isEqualToString:@"NO_LOCAL_SERVER"])
      {
        id v13 = gLogHandle;
        if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_INFO))
        {
          int v14 = *(_DWORD *)(a1 + 80);
          id v15 = v13;
          *(_DWORD *)buf = 67109378;
          int v39 = v14;
          __int16 v40 = 2080;
          id v41 = currentQueueName();
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "#%08x [%s] NO_LOCAL_SERVER", buf, 0x12u);
        }
        id v8 = 0;
        uint64_t v37 = 0x40F5180000000000;
        goto LABEL_18;
      }
      uint64_t v2 = *(void *)(a1 + 72);
    }
    id v16 = [*(id *)(a1 + 32) locateURL];
    uint64_t v17 = [v16 absoluteString];
    id v18 = +[NSString stringWithFormat:@"HTTP error %u from %@, body: %@", v2, v17, v12];
    createTaggedError(NSURLErrorDomain, -1011, v18, *(unsigned int *)(a1 + 80));
    id v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
    goto LABEL_19;
  }
  if (!v3)
  {
    createTaggedError(NSURLErrorDomain, -1014, @"no data from server", *(unsigned int *)(a1 + 80));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v36 = 0;
  id v35 = 0;
  unsigned __int8 v6 = [v4 parseLocateResponse:v3 withFavoredServerRanges:v5 intoServers:&v36 validityInterval:&v37 error:&v35 tag:*(unsigned int *)(a1 + 80)];
  id v7 = v36;
  id v8 = v35;
  if ((v6 & 1) == 0)
  {

    id v7 = 0;
    uint64_t v37 = 0;
  }
LABEL_20:
  id v19 = *(void **)(a1 + 32);
  id v33 = 0;
  id v34 = 0;
  [v19 refineServers:v7 intoBest:&v34 andOther:&v33 tag:*(unsigned int *)(a1 + 80)];
  id v20 = v34;
  id v21 = v33;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021A8C;
  block[3] = &unk_100035498;
  id v22 = *(NSObject **)(a1 + 56);
  id v23 = *(id *)(a1 + 64);
  id v28 = v20;
  id v29 = v21;
  uint64_t v32 = v37;
  id v30 = v8;
  id v31 = v23;
  id v24 = v8;
  id v25 = v21;
  id v26 = v20;
  dispatch_async(v22, block);
}

uint64_t sub_100021A8C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, double))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32), 0, *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 64));
}

uint64_t sub_100021AAC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32), 0.0);
}

void sub_100021BF4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) locateTag];
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_10002517C();
  }
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) locateSession];

  if (v3 != v4) {
    goto LABEL_7;
  }
  if (([*(id *)(a1 + 32) amRunningInMySingleLocate:v2] & 1) == 0) {
    sub_100025150();
  }
  [*(id *)(a1 + 32) setLocateResponseData:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = *(id *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "setLocateResponseCode:", objc_msgSend(v5, "statusCode"));
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_100021E00(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) locateTag];
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_10002523C();
  }
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) locateSession];

  if (v3 == v4)
  {
    if (([*(id *)(a1 + 32) amRunningInMySingleLocate:v2] & 1) == 0) {
      sub_100025210();
    }
    id v5 = [*(id *)(a1 + 32) locateResponseData];

    if (v5)
    {
      unsigned __int8 v6 = [*(id *)(a1 + 32) locateResponseData];
      id v7 = (char *)[v6 length];
      id v8 = &v7[(void)[*(id *)(a1 + 56) length]];

      id v9 = *(void **)(a1 + 32);
      if ((unint64_t)v8 > 0xA00000)
      {
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        id v10 = [v9 locateURL];
        id v13 = [v10 absoluteString];
        int v14 = +[NSString stringWithFormat:@"too much data in response from %@ (max %lu)", v13, 10485760];
        id v15 = createTaggedError(NSURLErrorDomain, -1103, v14, (uint64_t)v2);
        [v9 URLSession:v12 task:v11 didCompleteWithError:v15];
      }
      else
      {
        id v10 = [*(id *)(a1 + 32) locateResponseData];
        [v10 appendData:*(void *)(a1 + 56)];
      }
    }
    else
    {
      id v10 = [*(id *)(a1 + 56) mutableCopy];
      [*(id *)(a1 + 32) setLocateResponseData:v10];
    }
  }
}

NSString *__cdecl sub_10002225C(id a1, NSString *a2)
{
  return (NSString *)@"[redacted]";
}

NSString *__cdecl sub_100022268(id a1, NSString *a2)
{
  return (NSString *)@"[redacted]";
}

void sub_100022274(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([v11 rangeOfString:@"guid" options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = *(void **)(a1 + 32);
    unsigned __int8 v6 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    goto LABEL_6;
  }
  if (([v11 isEqualToString:@"first"] & 1) != 0
    || [v11 isEqualToString:@"last"])
  {
    id v7 = *(void **)(a1 + 32);
    unsigned __int8 v6 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
LABEL_6:
    uint64_t v9 = [v6 redactStringsFromObject:v5 usingBlock:v8];
    goto LABEL_7;
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) redactObject:v5];
LABEL_7:
  id v10 = (void *)v9;
  [v7 setObject:v9 forKey:v11];
}

void sub_100022AB0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_100022B00(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void sub_100022B74(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

uint64_t sub_100022BA0()
{
  return v0;
}

void sub_100022BBC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_100022BDC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x30u);
}

void sub_100022BFC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x26u);
}

void sub_100022C58(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

id createTaggedError(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  v14[0] = a3;
  id v7 = a3;
  id v8 = a1;
  uint64_t v9 = +[NSString stringWithFormat:@"#%08x", a4, NSLocalizedDescriptionKey, @"com.apple.AssetCacheLocatorService.tag", v14[0]];
  v14[1] = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:2];
  id v11 = +[NSError errorWithDomain:v8 code:a2 userInfo:v10];

  return v11;
}

uint64_t acls_nsearch_notld(__res_9_state *a1, const char *a2, int a3, int a4, u_char *a5, int a6)
{
  *__error() = 0;
  _res_9_h_errno_set(a1, 1);
  uint64_t v12 = a1->dnsrch[0];
  if (v12)
  {
    int v13 = 0;
    uint64_t v14 = 80;
    while (1)
    {
      uint64_t result = res_9_nquerydomain(a1, a2, v12, a3, a4, a5, a6);
      if ((int)result > 0) {
        return result;
      }
      if (*__error() == 61) {
        break;
      }
      int res_h_errno = a1->res_h_errno;
      if (res_h_errno != 1)
      {
        if (res_h_errno != 4) {
          goto LABEL_9;
        }
        ++v13;
      }
      uint64_t v12 = *(const char **)((char *)&a1->retrans + v14);
      v14 += 8;
      if (!v12)
      {
LABEL_9:
        if (!v13) {
          return 0xFFFFFFFFLL;
        }
        uint64_t v17 = a1;
        int v18 = 4;
        goto LABEL_12;
      }
    }
    uint64_t v17 = a1;
    int v18 = 2;
LABEL_12:
    _res_9_h_errno_set(v17, v18);
  }
  return 0xFFFFFFFFLL;
}

BOOL isXPCError(void *a1)
{
  return a1 == &_xpc_error_connection_interrupted
      || a1 == &_xpc_error_connection_invalid
      || a1 == &_xpc_error_termination_imminent;
}

__CFString *xpcEventDescription(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1 == &_xpc_error_connection_interrupted)
  {
    uint64_t v3 = @"XPC_ERROR_CONNECTION_INTERRUPTED";
  }
  else if (v1 == &_xpc_error_connection_invalid)
  {
    uint64_t v3 = @"XPC_ERROR_CONNECTION_INVALID";
  }
  else if (v1 == &_xpc_error_termination_imminent)
  {
    uint64_t v3 = @"XPC_ERROR_TERMINATION_IMMINENT";
  }
  else
  {
    uint64_t v3 = [v1 description];
  }

  return v3;
}

void sub_100022F5C()
{
  __assert_rtn("-[ACLSTypeVerifier verify:name:withTemplate:tag:]", "ACLSTypeVerifier.m", 55, "template != nil && [template isKindOfClass:[NSDictionary class]]");
}

void sub_100022F88()
{
  __assert_rtn("-[ACLSTypeVerifier verify:name:withTemplate:tag:]", "ACLSTypeVerifier.m", 65, "class != nil");
}

void sub_100022FB4(void *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  v6[0] = 67109634;
  v6[1] = a3;
  __int16 v7 = 2080;
  id v8 = currentQueueName();
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#%08x [%s] verify %@", (uint8_t *)v6, 0x1Cu);
}

void sub_100023074(int a1, NSObject *a2)
{
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2080;
  id v5 = currentQueueName();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#%08x [%s] makeLocalAddresses", (uint8_t *)v3, 0x12u);
}

void sub_100023110(void *a1, char a2, int a3)
{
  id v5 = a1;
  v6[0] = 67109634;
  v6[1] = a3;
  __int16 v7 = 2080;
  id v8 = currentQueueName();
  __int16 v9 = 1024;
  int v10 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#%08x [%s] areDigestedIdentifiers:equalToCleartextIdentifiers: -> %{BOOL}d", (uint8_t *)v6, 0x18u);
}

void sub_1000231D0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  currentQueueName();
  unsigned __int8 v6 = [a2 cacheDirPath];
  __int16 v7 = [a3 localizedDescription];
  v10[0] = 67109890;
  v10[1] = 0;
  sub_100022C1C();
  id v11 = v6;
  __int16 v12 = v8;
  uint64_t v13 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#%08x [%s] unable to create directory %@: %@", (uint8_t *)v10, 0x26u);
}

void sub_1000232B0(void *a1, void *a2)
{
  id v3 = a1;
  currentQueueName();
  __int16 v4 = [a2 cacheDirPath];
  sub_100022B94();
  sub_100022C58((void *)&_mh_execute_header, v5, v6, "#%08x [%s] cache directory = %@", v7, v8, v9, v10, 2u);
}

void sub_10002336C()
{
  __assert_rtn("-[AssetCacheLocatorService init]_block_invoke", "AssetCacheLocatorService.m", 567, "self.singleLocateTag == 0");
}

void sub_100023398(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = currentQueueName();
  uint64_t v7 = *a3;
  v8[0] = 67109890;
  v8[1] = 0;
  __int16 v9 = 2080;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  __int16 v13 = 2048;
  uint64_t v14 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#%08x [%s] Error getting system group container for identifier %@: %llu", (uint8_t *)v8, 0x26u);
}

void sub_100023464()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  sub_100022AD0();
  sub_100022BBC((void *)&_mh_execute_header, v2, v3, "#%08x [%s] NSObjectFromXPCObject: unhandled XPC object %@", v4, v5, v6, v7, v8);
}

void sub_1000234F0()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  sub_100022AD0();
  sub_100022BBC((void *)&_mh_execute_header, v2, v3, "#%08x [%s] XPCObjectFromNSObject: unhandled NS object %@", v4, v5, v6, v7, v8);
}

void sub_10002357C()
{
}

void sub_1000235A8(void *a1)
{
  id v1 = a1;
  currentQueueName();
  sub_100022C34();
  __int16 v4 = v2;
  uint64_t v5 = "com.apple.AssetCacheLocatorService";
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "#%08x [%s] xpc_connection_create(%s) failed", v3, 0x1Cu);
}

void sub_100023648(void *a1, void *a2)
{
  id v3 = a1;
  currentQueueName();
  __int16 v4 = xpcEventDescription(a2);
  sub_100022B94();
  sub_100022C58((void *)&_mh_execute_header, v5, v6, "#%08x [%s] XPC listener received event %@", v7, v8, v9, v10, 2u);
}

void sub_100023704(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = currentQueueName();
  pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a2 + 32));
  LODWORD(a2) = xpc_connection_get_euid(*(xpc_connection_t *)(a2 + 32));
  uint64_t v8 = xpcEventDescription(a3);
  v9[0] = 67110146;
  v9[1] = 0;
  __int16 v10 = 2080;
  __int16 v11 = v6;
  __int16 v12 = 1024;
  pid_t v13 = pid;
  __int16 v14 = 1024;
  int v15 = a2;
  __int16 v16 = 2112;
  uint64_t v17 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#%08x [%s] XPC connection from pid %d uid %d received event %@", (uint8_t *)v9, 0x28u);
}

void sub_10002380C(void *a1, _xpc_connection_s *a2)
{
  id v3 = a1;
  v4[0] = 67110402;
  v4[1] = 0;
  __int16 v5 = 2080;
  uint64_t v6 = currentQueueName();
  __int16 v7 = 1024;
  pid_t pid = xpc_connection_get_pid(a2);
  __int16 v9 = 1024;
  uid_t euid = xpc_connection_get_euid(a2);
  __int16 v11 = 2080;
  __int16 v12 = "tag";
  __int16 v13 = 1024;
  int v14 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#%08x [%s] XPC connection from pid %d uid %d received invalid %s: #%08x", (uint8_t *)v4, 0x2Eu);
}

void sub_1000238FC(void *a1)
{
  id v1 = a1;
  currentQueueName();
  __int16 v2 = (void *)sub_100022BA0();
  id v3 = xpcEventDescription(v2);
  sub_100022B94();
  sub_100022BFC((void *)&_mh_execute_header, v4, v5, "#%08x [%s] handleEvent:%@ forConnection:%@", v6, v7, v8, v9, 2u);
}

void sub_1000239C0()
{
}

void sub_1000239EC(void *a1)
{
  id v1 = a1;
  currentQueueName();
  sub_100022C34();
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "#%08x [%s] watchForNetworkChanges", v2, 0x12u);
}

void sub_100023A7C()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  sub_100022AD0();
  sub_100022B00((void *)&_mh_execute_header, v2, v3, "#%08x [%s] resolveDNSRecordNamed:%@", v4, v5, v6, v7, v8);
}

void sub_100023B08()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  [(id)sub_100022BA0() count];
  sub_100022B94();
  sub_100022BFC((void *)&_mh_execute_header, v2, v3, "#%08x [%s] sanitizeRanges -> [%ld]%{private}@", v4, v5, v6, v7, 3u);
}

void sub_100023BC0()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  sub_100022A74();
  sub_100022B00((void *)&_mh_execute_header, v2, v3, "#%08x [%s] makeBootTime -> %{private}@", v4, v5, v6, v7, v8);
}

void sub_100023C58(void *a1)
{
  id v1 = a1;
  currentQueueName();
  sub_100022A74();
  sub_100022AB0((void *)&_mh_execute_header, v2, v3, "#%08x [%s] makeBootTime", v4, v5, v6, v7, v8);
}

void sub_100023CDC()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  uint64_t v2 = [(id)sub_100022BA0() diskCache];
  sub_100022A8C();
  sub_100022B00((void *)&_mh_execute_header, v3, v4, "#%08x [%s] loadDiskCache -> %{private}@", v5, v6, v7, v8, v9);
}

void sub_100023D7C()
{
}

void sub_100023DA8(void *a1)
{
  id v1 = a1;
  currentQueueName();
  sub_100022A74();
  sub_100022AB0((void *)&_mh_execute_header, v2, v3, "#%08x [%s] loadDiskCache", v4, v5, v6, v7, v8);
}

void sub_100023E2C(void *a1)
{
  id v1 = a1;
  currentQueueName();
  sub_100022A74();
  sub_100022AB0((void *)&_mh_execute_header, v2, v3, "#%08x [%s] transferVolatileState", v4, v5, v6, v7, v8);
}

void sub_100023EB0()
{
  sub_100022AF4();
  uint64_t v3 = v2;
  currentQueueName();
  uint64_t v4 = [(id)sub_100022BA0() diskCachePlistPath];
  int v5 = *__error();
  int v6 = 67109890;
  int v7 = v0;
  __int16 v8 = 2080;
  uint64_t v9 = v1;
  __int16 v10 = 2112;
  __int16 v11 = v4;
  __int16 v12 = 1024;
  int v13 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#%08x [%s] unable to write disk cache to %@: %{darwin.errno}d", (uint8_t *)&v6, 0x22u);
}

void sub_100023F90()
{
}

void sub_100023FBC()
{
}

void sub_100023FE8()
{
}

void sub_100024014()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  id v2 = [(id)sub_100022BA0() diskCache];
  sub_100022A8C();
  sub_100022B00((void *)&_mh_execute_header, v3, v4, "#%08x [%s] saveDiskCache diskCache=%{private}@", v5, v6, v7, v8, v9);
}

void sub_1000240B4()
{
}

void sub_1000240E0(void *a1)
{
  id v1 = a1;
  currentQueueName();
  sub_100022A74();
  sub_100022AB0((void *)&_mh_execute_header, v2, v3, "#%08x [%s] updateDiskCacheRefreshTimer", v4, v5, v6, v7, v8);
}

void sub_100024164()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  sub_100022AD0();
  sub_100022BFC((void *)&_mh_execute_header, v2, v3, "#%08x [%s] cached%@ForNetworkIdentifiers -> %@", v4, v5, v6, v7, v8);
}

void sub_1000241F8()
{
}

void sub_100024224()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  uint64_t v2 = [(id)sub_100022BA0() diskCache];
  sub_100022A8C();
  sub_100022B00((void *)&_mh_execute_header, v3, v4, "#%08x [%s] after cacheServers diskCache=%{private}@", v5, v6, v7, v8, v9);
}

void sub_1000242C4()
{
}

void sub_1000242F0()
{
}

void sub_10002431C()
{
}

void sub_100024348()
{
}

void sub_100024374()
{
}

void sub_1000243A0()
{
}

void sub_1000243CC()
{
}

void sub_1000243F8(void *a1)
{
  id v1 = a1;
  currentQueueName();
  sub_100022A74();
  sub_100022AB0((void *)&_mh_execute_header, v2, v3, "#%08x [%s] uncacheAllServers", v4, v5, v6, v7, v8);
}

void sub_10002447C()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  uint64_t v2 = [(id)sub_100022BA0() diskCache];
  sub_100022A8C();
  sub_100022B00((void *)&_mh_execute_header, v3, v4, "#%08x [%s] after cacheDNSPublicAddressRanges diskCache=%{private}@", v5, v6, v7, v8, v9);
}

void sub_10002451C()
{
}

void sub_100024548()
{
}

void sub_100024574()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  uint64_t v2 = [(id)sub_100022BA0() diskCache];
  sub_100022A8C();
  sub_100022B00((void *)&_mh_execute_header, v3, v4, "#%08x [%s] after cacheRecentlySeen diskCache=%{private}@", v5, v6, v7, v8, v9);
}

void sub_100024614()
{
}

void sub_100024640()
{
}

void sub_10002466C()
{
}

void sub_100024698()
{
}

void sub_1000246C4(void *a1)
{
  id v1 = a1;
  currentQueueName();
  sub_100022A74();
  sub_100022AB0((void *)&_mh_execute_header, v2, v3, "#%08x [%s] uncacheAllRecentlySeen", v4, v5, v6, v7, v8);
}

void sub_100024748()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  sub_100022B20();
  sub_100022C4C();
  sub_100022BAC();
  sub_100022B74((void *)&_mh_execute_header, v2, v3, "#%08x [%s] locateTetheredCachingServers: CFPreferencesCopyValue(%@, %@) returned unexpected value %@", v4, v5, v6, v7, v8);
}

void sub_1000247EC()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  sub_100022B20();
  sub_100022C4C();
  sub_100022BAC();
  sub_100022B74((void *)&_mh_execute_header, v2, v3, "#%08x [%s] locateTetheredCachingServers: CFPreferencesCopyValue(%@, %@) returned unexpected value %@", v4, v5, v6, v7, v8);
}

void sub_100024890()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  sub_100022B20();
  sub_100022C4C();
  sub_100022BAC();
  sub_100022B74((void *)&_mh_execute_header, v2, v3, "#%08x [%s] locateTetheredCachingServers: CFPreferencesCopyValue(%@, %@) returned unexpected value %@", v4, v5, v6, v7, v8);
}

void sub_100024934()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  sub_100022B20();
  sub_100022C4C();
  sub_100022BAC();
  sub_100022B74((void *)&_mh_execute_header, v2, v3, "#%08x [%s] locateTetheredCachingServers: CFPreferencesCopyValue(%@, %@) returned unexpected value %@", v4, v5, v6, v7, v8);
}

void sub_1000249D8(void *a1)
{
  id v1 = a1;
  currentQueueName();
  sub_100022A74();
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "#%08x [%s] locateTetheredCachingServers failed to synchronize user preferences", v2, 0x12u);
}

void sub_100024A6C()
{
  __assert_rtn("-[AssetCacheLocatorService locateLocalCachingServersWithHeaders:body:timeout:favoredServerRanges:callback:callbackQueue:tag:]", "AssetCacheLocatorService.m", 3198, "self.locateSession == nil");
}

void sub_100024A98()
{
  __assert_rtn("-[AssetCacheLocatorService locateLocalCachingServersWithHeaders:body:timeout:favoredServerRanges:callback:callbackQueue:tag:]", "AssetCacheLocatorService.m", 3197, "self.locateCallback == nil");
}

void sub_100024AC4()
{
}

void sub_100024AF0()
{
}

void sub_100024B1C()
{
  __assert_rtn("-[AssetCacheLocatorService locateLocalCachingServersWithHeaders:body:timeout:favoredServerRanges:callback:callbackQueue:tag:]_block_invoke_3", "AssetCacheLocatorService.m", 3244, "disposition == ACSURLSessionResponseAllow");
}

void sub_100024B48()
{
}

void sub_100024B74()
{
}

void sub_100024BA0()
{
}

void sub_100024BCC()
{
}

void sub_100024BF8()
{
}

void sub_100024C24()
{
}

void sub_100024C50(void *a1)
{
  id v1 = a1;
  currentQueueName();
  sub_100022A74();
  sub_100022AB0((void *)&_mh_execute_header, v2, v3, "#%08x [%s] uncacheAllAffinities", v4, v5, v6, v7, v8);
}

void sub_100024CD4(void *a1)
{
  id v1 = a1;
  currentQueueName();
  sub_100022A74();
  sub_100022AB0((void *)&_mh_execute_header, v2, v3, "#%08x [%s] probeCacheForType -> miss", v4, v5, v6, v7, v8);
}

void sub_100024D58()
{
}

void sub_100024D84()
{
}

void sub_100024DB0()
{
  __assert_rtn("-[AssetCacheLocatorService locateCachingServersWithTimeout:capabilities:affinityID:autoRefresh:quickMiss:forceMiss:callback:callbackQueue:tag:]_block_invoke", "AssetCacheLocatorService.m", 4067, "affinityID != nil");
}

void sub_100024DDC()
{
}

void sub_100024E08()
{
  __assert_rtn("-[AssetCacheLocatorService slowcateCachingServerWithTimeout:capabilities:affinityID:forceRefresh:forceDNSRefresh:callback:tag:]", "AssetCacheLocatorService.m", 4164, "self.singleLocateTag == 0");
}

void sub_100024E34()
{
  __assert_rtn("-[AssetCacheLocatorService slowcateCachingServerWithTimeout:capabilities:affinityID:forceRefresh:forceDNSRefresh:callback:tag:]_block_invoke", "AssetCacheLocatorService.m", 4171, "self.singleLocateTag == tag");
}

void sub_100024E60()
{
}

void sub_100024E8C()
{
  __assert_rtn("-[AssetCacheLocatorService slowcateCachingServerWithTimeout:capabilities:affinityID:forceRefresh:forceDNSRefresh:callback:tag:]_block_invoke_2", "AssetCacheLocatorService.m", 4228, "affinityID != nil");
}

void sub_100024EB8()
{
}

void sub_100024EE4()
{
}

void sub_100024F10(void *a1)
{
  id v1 = a1;
  currentQueueName();
  sub_100022A74();
  sub_100022AB0((void *)&_mh_execute_header, v2, v3, "#%08x [%s] health update invalid", v4, v5, v6, v7, v8);
}

void sub_100024F94()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  uint64_t v2 = [(id)sub_100022BA0() locateURL];
  uint64_t v3 = [v2 absoluteString];
  sub_100022B94();
  sub_100022BBC((void *)&_mh_execute_header, v4, v5, "#%08x [%s] LocateURL %@ untrusted: no EV result", v6, v7, v8, v9, 2u);
}

void sub_100025064()
{
}

void sub_100025090()
{
}

void sub_1000250BC()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  sub_100022B40();
  sub_100022BDC((void *)&_mh_execute_header, v2, v3, "#%08x [%s] URLSession:%@ task:%@ didCompleteWithError:%@", v4, v5, v6, v7, v8);
}

void sub_100025150()
{
}

void sub_10002517C()
{
  sub_100022AF4();
  id v1 = v0;
  currentQueueName();
  sub_100022B40();
  sub_100022BDC((void *)&_mh_execute_header, v2, v3, "#%08x [%s] URLSession:%@ dataTask:%@ didReceiveResponse:%@", v4, v5, v6, v7, v8);
}

void sub_100025210()
{
}

void sub_10002523C()
{
  sub_100022AF4();
  id v2 = v1;
  currentQueueName();
  [*(id *)(v0 + 56) length];
  sub_100022C1C();
  sub_100022BDC((void *)&_mh_execute_header, v3, v4, "#%08x [%s] URLSession:%@ dataTask:%@ didReceiveData:[%ld bytes]", v5, v6, v7, v8, 2u);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return _CFNumberIsFloatType(number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

CFArrayRef SCDynamicStoreCopyKeyList(SCDynamicStoreRef store, CFStringRef pattern)
{
  return _SCDynamicStoreCopyKeyList(store, pattern);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return _SCDynamicStoreCreateRunLoopSource(allocator, store, order);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkGlobalEntity(allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkInterfaceEntity(allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkServiceEntity(allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return _SCDynamicStoreSetDispatchQueue(store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

Boolean SCNetworkInterfaceCopyMediaOptions(SCNetworkInterfaceRef interface, CFDictionaryRef *current, CFDictionaryRef *active, CFArrayRef *available, Boolean filter)
{
  return _SCNetworkInterfaceCopyMediaOptions(interface, current, active, available, filter);
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetBSDName(interface);
}

SCNetworkInterfaceRef SCNetworkInterfaceGetInterface(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetInterface(interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetInterfaceType(interface);
}

CFStringRef SCNetworkInterfaceGetLocalizedDisplayName(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetLocalizedDisplayName(interface);
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return _SCNetworkProtocolGetConfiguration(protocol);
}

Boolean SCNetworkProtocolGetEnabled(SCNetworkProtocolRef protocol)
{
  return _SCNetworkProtocolGetEnabled(protocol);
}

CFArrayRef SCNetworkServiceCopyAll(SCPreferencesRef prefs)
{
  return _SCNetworkServiceCopyAll(prefs);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return _SCNetworkServiceCopyProtocol(service, protocolType);
}

Boolean SCNetworkServiceGetEnabled(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetEnabled(service);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetInterface(service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetServiceID(service);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFDictionaryRef SecTrustCopyResult(SecTrustRef trust)
{
  return _SecTrustCopyResult(trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

uint64_t _SCNetworkInterfaceGetIORegistryEntryID()
{
  return __SCNetworkInterfaceGetIORegistryEntryID();
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

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
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

void _res_9_h_errno_set(__res_9_state *res, int err)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_cmp_safe()
{
  return _cc_cmp_safe();
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return _dispatch_get_current_queue();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

const char *__cdecl hstrerror(int a1)
{
  return _hstrerror(a1);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return _if_indextoname(a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

void res_9_ndestroy(res_9_state a1)
{
}

int res_9_ninit(res_9_state a1)
{
  return _res_9_ninit(a1);
}

int res_9_nquerydomain(res_9_state a1, const char *a2, const char *a3, int a4, int a5, u_char *a6, int a7)
{
  return _res_9_nquerydomain(a1, a2, a3, a4, a5, a6, a7);
}

int res_9_ns_initparse(const u_char *a1, int a2, res_9_ns_msg *a3)
{
  return _res_9_ns_initparse(a1, a2, a3);
}

int res_9_ns_parserr(res_9_ns_msg *a1, res_9_ns_sect a2, int a3, res_9_ns_rr *a4)
{
  return _res_9_ns_parserr(a1, a2, a3, a4);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return _strsep(__stringp, __delim);
}

double strtod(const char *a1, char **a2)
{
  return _strtod(a1, a2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
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

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return _xpc_connection_get_euid(connection);
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

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
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

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
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

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
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

xpc_object_t xpc_double_create(double value)
{
  return _xpc_double_create(value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

uint64_t xpc_set_idle_handler()
{
  return _xpc_set_idle_handler();
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return _xpc_uint64_create(value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_affinityCache(void *a1, const char *a2, ...)
{
  return [a1 affinityCache];
}

id objc_msgSend_affinityQueryTimeout(void *a1, const char *a2, ...)
{
  return [a1 affinityQueryTimeout];
}

id objc_msgSend_allActiveNetworkInterfaces(void *a1, const char *a2, ...)
{
  return [a1 allActiveNetworkInterfaces];
}

id objc_msgSend_amRunningOnMyQueue(void *a1, const char *a2, ...)
{
  return [a1 amRunningOnMyQueue];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bootTime(void *a1, const char *a2, ...)
{
  return [a1 bootTime];
}

id objc_msgSend_bsdName(void *a1, const char *a2, ...)
{
  return [a1 bsdName];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheDirPath(void *a1, const char *a2, ...)
{
  return [a1 cacheDirPath];
}

id objc_msgSend_cacheRefreshInProgress(void *a1, const char *a2, ...)
{
  return [a1 cacheRefreshInProgress];
}

id objc_msgSend_cacheRefreshQueue(void *a1, const char *a2, ...)
{
  return [a1 cacheRefreshQueue];
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return [a1 callback];
}

id objc_msgSend_callbackQueue(void *a1, const char *a2, ...)
{
  return [a1 callbackQueue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_concurrentDNSResolutions(void *a1, const char *a2, ...)
{
  return [a1 concurrentDNSResolutions];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return [a1 deviceID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_diskCache(void *a1, const char *a2, ...)
{
  return [a1 diskCache];
}

id objc_msgSend_diskCachePlistPath(void *a1, const char *a2, ...)
{
  return [a1 diskCachePlistPath];
}

id objc_msgSend_diskCacheRefreshTimer(void *a1, const char *a2, ...)
{
  return [a1 diskCacheRefreshTimer];
}

id objc_msgSend_diskCacheRefreshTimerResumed(void *a1, const char *a2, ...)
{
  return [a1 diskCacheRefreshTimerResumed];
}

id objc_msgSend_diskCacheTemplate(void *a1, const char *a2, ...)
{
  return [a1 diskCacheTemplate];
}

id objc_msgSend_diskCacheVerifier(void *a1, const char *a2, ...)
{
  return [a1 diskCacheVerifier];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_dnsResolutionTimeout(void *a1, const char *a2, ...)
{
  return [a1 dnsResolutionTimeout];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_executablePath(void *a1, const char *a2, ...)
{
  return [a1 executablePath];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileHandle(void *a1, const char *a2, ...)
{
  return [a1 fileHandle];
}

id objc_msgSend_fileOffset(void *a1, const char *a2, ...)
{
  return [a1 fileOffset];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return [a1 finishTasksAndInvalidate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_gatewayIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 gatewayIdentifiers];
}

id objc_msgSend_hasBytesAvailable(void *a1, const char *a2, ...)
{
  return [a1 hasBytesAvailable];
}

id objc_msgSend_hasUsefulUSBEthernetInterface(void *a1, const char *a2, ...)
{
  return [a1 hasUsefulUSBEthernetInterface];
}

id objc_msgSend_importSessionConfig(void *a1, const char *a2, ...)
{
  return [a1 importSessionConfig];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interfaceType(void *a1, const char *a2, ...)
{
  return [a1 interfaceType];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_ipAddress(void *a1, const char *a2, ...)
{
  return [a1 ipAddress];
}

id objc_msgSend_isNCM(void *a1, const char *a2, ...)
{
  return [a1 isNCM];
}

id objc_msgSend_lastLocateDate(void *a1, const char *a2, ...)
{
  return [a1 lastLocateDate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listenerConnection(void *a1, const char *a2, ...)
{
  return [a1 listenerConnection];
}

id objc_msgSend_localAddresses(void *a1, const char *a2, ...)
{
  return [a1 localAddresses];
}

id objc_msgSend_localhostAddresses(void *a1, const char *a2, ...)
{
  return [a1 localhostAddresses];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_locateCallback(void *a1, const char *a2, ...)
{
  return [a1 locateCallback];
}

id objc_msgSend_locateCallbackQueue(void *a1, const char *a2, ...)
{
  return [a1 locateCallbackQueue];
}

id objc_msgSend_locateFavoredServerRanges(void *a1, const char *a2, ...)
{
  return [a1 locateFavoredServerRanges];
}

id objc_msgSend_locateOpQueue(void *a1, const char *a2, ...)
{
  return [a1 locateOpQueue];
}

id objc_msgSend_locateResponseCode(void *a1, const char *a2, ...)
{
  return [a1 locateResponseCode];
}

id objc_msgSend_locateResponseData(void *a1, const char *a2, ...)
{
  return [a1 locateResponseData];
}

id objc_msgSend_locateServerValidated(void *a1, const char *a2, ...)
{
  return [a1 locateServerValidated];
}

id objc_msgSend_locateSession(void *a1, const char *a2, ...)
{
  return [a1 locateSession];
}

id objc_msgSend_locateSessionConfig(void *a1, const char *a2, ...)
{
  return [a1 locateSessionConfig];
}

id objc_msgSend_locateTag(void *a1, const char *a2, ...)
{
  return [a1 locateTag];
}

id objc_msgSend_locateTimeout(void *a1, const char *a2, ...)
{
  return [a1 locateTimeout];
}

id objc_msgSend_locateURL(void *a1, const char *a2, ...)
{
  return [a1 locateURL];
}

id objc_msgSend_locationID(void *a1, const char *a2, ...)
{
  return [a1 locationID];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_makeSoftwareVersions(void *a1, const char *a2, ...)
{
  return [a1 makeSoftwareVersions];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return [a1 offsetInFile];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_querySessionConfig(void *a1, const char *a2, ...)
{
  return [a1 querySessionConfig];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_redactLogs(void *a1, const char *a2, ...)
{
  return [a1 redactLogs];
}

id objc_msgSend_refreshValidityInterval(void *a1, const char *a2, ...)
{
  return [a1 refreshValidityInterval];
}

id objc_msgSend_removeAllCachedResponses(void *a1, const char *a2, ...)
{
  return [a1 removeAllCachedResponses];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_responseCode(void *a1, const char *a2, ...)
{
  return [a1 responseCode];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 seekToEndOfFile];
}

id objc_msgSend_serverCapabilitiesTemplate(void *a1, const char *a2, ...)
{
  return [a1 serverCapabilitiesTemplate];
}

id objc_msgSend_serverCapabilitiesVerifier(void *a1, const char *a2, ...)
{
  return [a1 serverCapabilitiesVerifier];
}

id objc_msgSend_serverDetailsTemplate(void *a1, const char *a2, ...)
{
  return [a1 serverDetailsTemplate];
}

id objc_msgSend_serverDetailsVerifier(void *a1, const char *a2, ...)
{
  return [a1 serverDetailsVerifier];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return [a1 serverTrust];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_singleLocate(void *a1, const char *a2, ...)
{
  return [a1 singleLocate];
}

id objc_msgSend_singleLocateTag(void *a1, const char *a2, ...)
{
  return [a1 singleLocateTag];
}

id objc_msgSend_skipEVCheck(void *a1, const char *a2, ...)
{
  return [a1 skipEVCheck];
}

id objc_msgSend_softwareVersions(void *a1, const char *a2, ...)
{
  return [a1 softwareVersions];
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return [a1 speed];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByResolvingSymlinksInPath];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_template(void *a1, const char *a2, ...)
{
  return [a1 template];
}

id objc_msgSend_testFlags(void *a1, const char *a2, ...)
{
  return [a1 testFlags];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_useful(void *a1, const char *a2, ...)
{
  return [a1 useful];
}

id objc_msgSend_userReadable(void *a1, const char *a2, ...)
{
  return [a1 userReadable];
}

id objc_msgSend_watchForNetworkChanges(void *a1, const char *a2, ...)
{
  return [a1 watchForNetworkChanges];
}

id objc_msgSend_wired(void *a1, const char *a2, ...)
{
  return [a1 wired];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   - (void)setGatewayIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (OS_dispatch_queue)cacheRefreshQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 248, 1);
}

- (void)setCacheRefreshQueue:(id)a3
{
}

- (BOOL)cacheRefreshInProgress
{
  return self->_cacheRefreshInProgress;
}

- (void)setCacheRefreshInProgress:(BOOL)a3
{
  self->_cacheRefreshInProgress = a3;
}

- (NSMutableDictionary)affinityCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setAffinityCache:(id)a3
{
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (void)setTestFlags:(unint64_t)a3
{
  self->_testFlags = a3;
}

- (__SCDynamicStore)store
{
  return (__SCDynamicStore *)objc_getProperty(self, a2, 272, 1);
}

- (void)setStore:(__SCDynamicStore *)a3
{
}

- (unsigned)locateTag
{
  return self->_locateTag;
}

- (void)setLocateTag:(unsigned int)a3
{
  self->_locateTag = a3;
}

- (id)locateCallback
{
  return objc_getProperty(self, a2, 280, 1);
}

- (void)setLocateCallback:(id)a3
{
}

- (OS_dispatch_queue)locateCallbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 288, 1);
}

- (void)setLocateCallbackQueue:(id)a3
{
}

- (NSArray)locateFavoredServerRanges
{
  return (NSArray *)objc_getProperty(self, a2, 296, 1);
}

- (void)setLocateFavoredServerRanges:(id)a3
{
}

- (ACSURLSession)locateSession
{
  return (ACSURLSession *)objc_getProperty(self, a2, 304, 1);
}

- (void)setLocateSession:(id)a3
{
}

- (BOOL)locateServerValidated
{
  return self->_locateServerValidated;
}

- (void)setLocateServerValidated:(BOOL)a3
{
  self->_locateServerValidated = a3;
}

- (unint64_t)locateResponseCode
{
  return self->_locateResponseCode;
}

- (void)setLocateResponseCode:(unint64_t)a3
{
  self->_locateResponseCode = a3;
}

- (NSMutableData)locateResponseData
{
  return (NSMutableData *)objc_getProperty(self, a2, 320, 1);
}

- (void)setLocateResponseData:(id)a3
{
}

- (NSDate)lastLocateDate
{
  return (NSDate *)objc_getProperty(self, a2, 328, 1);
}

- (void)setLastLocateDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocateDate, 0);
  objc_storeStrong((id *)&self->_locateResponseData, 0);
  objc_storeStrong((id *)&self->_locateSession, 0);
  objc_storeStrong((id *)&self->_locateFavoredServerRanges, 0);
  objc_storeStrong((id *)&self->_locateCallbackQueue, 0);
  objc_storeStrong(&self->_locateCallback, 0);
  objc_storeStrong((id *)&self->_affinityCache, 0);
  objc_storeStrong((id *)&self->_cacheRefreshQueue, 0);
  objc_storeStrong((id *)&self->_gatewayIdentifiers, 0);
  objc_storeStrong((id *)&self->_localAddresses, 0);
  objc_storeStrong((id *)&self->_locateOpQueue, 0);
  objc_storeStrong((id *)&self->_singleLocate, 0);
  objc_storeStrong((id *)&self->_diskCacheRefreshTimer, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_listenerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_querySessionConfig, 0);
  objc_storeStrong((id *)&self->_importSessionConfig, 0);
  objc_storeStrong((id *)&self->_locateSessionConfig, 0);
  objc_storeStrong((id *)&self->_bootTime, 0);
  objc_storeStrong((id *)&self->_softwareVersions, 0);
  objc_storeStrong((id *)&self->_diskCacheVerifier, 0);
  objc_storeStrong((id *)&self->_diskCacheTemplate, 0);
  objc_storeStrong((id *)&self->_serverDetailsVerifier, 0);
  objc_storeStrong((id *)&self->_serverDetailsTemplate, 0);
  objc_storeStrong((id *)&self->_serverCapabilitiesVerifier, 0);
  objc_storeStrong((id *)&self->_serverCapabilitiesTemplate, 0);
  objc_storeStrong((id *)&self->_localhostAddresses, 0);
  objc_storeStrong((id *)&self->_diskCachePlistPath, 0);
  objc_storeStrong((id *)&self->_cacheDirPath, 0);

  objc_storeStrong((id *)&self->_locateURL, 0);
}

@end