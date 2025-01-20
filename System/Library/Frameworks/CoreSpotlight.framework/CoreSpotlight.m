void sub_100003D2C(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  uint64_t v32;
  NSFileAttributeType v33;
  void *v34;

  v1 = a1;
  v2 = +[NSURL fileURLWithPath:v1];
  v3 = +[NSFileManager defaultManager];
  if ([v3 fileExistsAtPath:v1])
  {
    v4 = 0;
    goto LABEL_10;
  }
  v33 = NSFileTypeDirectory;
  v34 = &__kCFBooleanTrue;
  v5 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v12 = 0;
  v6 = [v3 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:v5 error:&v12];
  v4 = v12;

  if (v6)
  {
    if (sub_100005484(v2, v4)) {
      goto LABEL_10;
    }
    v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000590C();
    }
  }
  else
  {
    v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100005974();
    }
  }

LABEL_10:
  v32 = 0;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v15 = 0x100000003;
  v8 = v1;
  v9 = (const char *)[v8 UTF8String];
  if (fsctl(v9, 0xC1104A71uLL, &v15, 0))
  {
    v10 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000586C((uint64_t)v9, v10);
    }
  }
  else
  {
    v10 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "successfully set dir stats %s", buf, 0xCu);
    }
  }

  v11 = +[NSString stringWithFormat:@"%@/tmp", v8];
  setenv("TMPDIR", (const char *)[v11 UTF8String], 1);
}

void sub_100004038(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    if (byte_10000CE58 == 1)
    {
      byte_10000CE58 = 0;
      dispatch_suspend((dispatch_object_t)qword_10000CE50);
    }
    id v3 = [objc_alloc((Class)SDConnectionConfiguration) initWithConnection:v2 isPrivate:1];
    pid_t pid = xpc_connection_get_pid(v2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v2;
      __int16 v10 = 1024;
      pid_t v11 = pid;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "new connection(%p) process: %d", buf, 0x12u);
    }
    v5 = [v3 bundleID];
    if (v5
      || ([v3 searchInternal] & 1) != 0
      || ![(id)qword_10000CE10 isEqualToString:0])
    {
      *(void *)buf = 0;
      objc_initWeak((id *)buf, v2);
      xpc_connection_set_target_queue(v2, (dispatch_queue_t)qword_10000CE48);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000043D0;
      v6[3] = &unk_100008400;
      objc_copyWeak(&v8, (id *)buf);
      id v7 = v3;
      xpc_connection_set_event_handler(v2, v6);
      xpc_connection_resume(v2);

      objc_destroyWeak(&v8);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      xpc_connection_cancel(v2);
    }
  }
}

void sub_100004240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000427C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  string = xpc_dictionary_get_string(v5, "command-type");
  v9 = (char *)string;
  if (!string) {
    goto LABEL_14;
  }
  if (!strncmp(string, "index-type", 0xBuLL))
  {
    __int16 v10 = &qword_10000CE30;
  }
  else
  {
    if (strncmp(v9, "search-type", 0xCuLL))
    {
      v9 = 0;
      goto LABEL_8;
    }
    __int16 v10 = &qword_10000CE38;
  }
  v9 = (char *)(id)*v10;
LABEL_8:
  if ([v9 addClientConnectionIfAllowedForConfiguration:v7])
  {
    pid_t v11 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100005CA8((uint64_t)v6, (uint64_t)v5, v11);
    }

    [v9 handleMessage:v5 type:xpc_get_type(v5) connection:v6];
    v12 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100005C30((uint64_t)v6, v12);
    }
  }
LABEL_14:
}

void sub_1000043D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v3, "command");
    if (!strncmp(string, "test", 4uLL))
    {
      xpc_dictionary_get_remote_connection(v3);
      pid_t v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_object_t reply = xpc_dictionary_create_reply(v3);
    }
    else
    {
      int v9 = sub_1000045E0(WeakRetained, v3, *(void **)(a1 + 32));
      if (!v9)
      {
        sub_10000427C(v3, WeakRetained, *(void **)(a1 + 32));
        goto LABEL_15;
      }
      int v10 = v9;
      xpc_dictionary_get_remote_connection(v3);
      pid_t v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_object_t v12 = xpc_dictionary_create_reply(v3);
      xpc_object_t reply = v12;
      if (!v11 || !v12) {
        goto LABEL_13;
      }
      xpc_dictionary_set_int64(v12, "status", v10);
    }
    xpc_connection_send_message(v11, reply);
LABEL_13:

    goto LABEL_15;
  }
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218242;
      id v15 = WeakRetained;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got error from client connection %p: %@", (uint8_t *)&v14, 0x16u);
    }
    id v6 = +[CSIndexAgent indexAgent];
    [v6 lostClientConnection:WeakRetained error:v3];

    id v7 = +[CSSearchAgent searchAgent];
    [v7 lostClientConnection:WeakRetained error:v3];

    sub_100005500(*(void *)(a1 + 32));
  }
LABEL_15:
}

uint64_t sub_1000045E0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = &OBJC_INSTANCE_METHODS_NSObject;
  if (([(id)qword_10000CE08 containsObject:v7] & 1) == 0)
  {
    uint64_t v10 = [v7 bundleID];
    pid_t v11 = (void *)qword_10000CE10;
    qword_10000CE10 = v10;

    unsigned int v12 = [v7 internal];
    unsigned int v13 = [v7 privateIndexNonSandboxAllowed];
    unsigned int v14 = v13;
    if (v12)
    {
      string = xpc_dictionary_get_string(v6, "private-bundle-override");
      if (string)
      {
        uint64_t v16 = +[NSString stringWithCString:string encoding:1];
        id v17 = (void *)qword_10000CE10;
        qword_10000CE10 = v16;
      }
    }
    else if (!v13)
    {
      goto LABEL_19;
    }
    v18 = xpc_dictionary_get_string(v6, "p");
    if (v18)
    {
      v19 = +[NSString stringWithCString:v18 encoding:4];
    }
    else
    {
      v19 = 0;
    }
    if (v19) {
      unsigned int v20 = 0;
    }
    else {
      unsigned int v20 = v12;
    }
    if (v20 == 1)
    {
      v21 = +[LSApplicationProxy applicationProxyForIdentifier:qword_10000CE10];
      v22 = [v21 dataContainerURL];
      v23 = [v22 path];

      if (v23)
      {
        v19 = [v23 stringByAppendingPathComponent:@"Library/com.apple.corespotlightservice"];
      }
      else
      {
        v19 = 0;
      }
    }
    if (v19)
    {
LABEL_22:
      v27 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_100005BA4((uint64_t)v19, v27);
      }

      if (!xpc_dictionary_get_string(v6, "ext"))
      {
        if ((v12 | v14) == 1 && xpc_dictionary_get_string(v6, "ee"))
        {
          v29 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_100005A20(v29);
          }
        }
        else
        {
          v29 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
            sub_1000059DC(v29);
          }
        }
        LOWORD(v9) = -1;
        goto LABEL_55;
      }
      v28 = xpc_dictionary_get_string(v6, "p");
      if (v28)
      {
        v29 = +[NSString stringWithUTF8String:v28];
        v30 = [(id)qword_10000CE18 objectForKey:v29];
        uint64_t v31 = (uint64_t)[v30 longLongValue];

        if (v31 >= 1)
        {
          v32 = logForCSLogCategoryDefault();
          id v8 = &OBJC_INSTANCE_METHODS_NSObject;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            sub_100005B3C();
          }
          goto LABEL_29;
        }
        uint64_t v9 = sandbox_extension_consume();
        if ((v9 & 0x8000000000000000) == 0)
        {
          if (v29)
          {
            v44 = (void *)qword_10000CE18;
            v32 = +[NSNumber numberWithLongLong:v9];
            [v44 setObject:v32 forKey:v29];
            id v8 = &OBJC_INSTANCE_METHODS_NSObject;
LABEL_29:

            goto LABEL_38;
          }
          id v8 = &OBJC_INSTANCE_METHODS_NSObject;
LABEL_38:
          sub_100003D2C(v19);
          if (qword_10000CE20)
          {
            if (v7)
            {
LABEL_40:
              [*(id *)&v8[449] addObject:v7];
LABEL_47:
              LOWORD(v9) = 0;
LABEL_55:

              goto LABEL_56;
            }
          }
          else
          {
            os_unfair_lock_lock((os_unfair_lock_t)&unk_10000CE28);
            if (!qword_10000CE20)
            {
              v34 = [CSPrivateIndexController alloc];
              v35 = [(CSPrivateIndexController *)v34 initWithBundle:qword_10000CE10 directory:v19];
              uint64_t v36 = +[CSIndexAgent indexAgent:1 serviceName:0];
              v37 = (void *)qword_10000CE30;
              qword_10000CE30 = v36;

              v38 = [(CSPrivateIndexController *)v35 indexer];
              [(id)qword_10000CE30 setIndexer:v38];

              uint64_t v39 = +[CSSearchAgent searchAgent:1 serviceName:0];
              v40 = (void *)qword_10000CE38;
              qword_10000CE38 = v39;

              v41 = [(CSPrivateIndexController *)v35 indexer];
              [(id)qword_10000CE38 setIndexer:v41];

              +[SDSignalHandler setDelegate:v35 memoryStatusFlags:55];
              +[SDSignalHandler setupHandlers];
              __dmb(0xBu);
              v42 = (void *)qword_10000CE20;
              qword_10000CE20 = (uint64_t)v35;
            }
            os_unfair_lock_unlock((os_unfair_lock_t)&unk_10000CE28);
            if (v7) {
              goto LABEL_40;
            }
          }
          v43 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            sub_100005AF8(v43);
          }

          goto LABEL_47;
        }
      }
      else
      {
        uint64_t v33 = sandbox_extension_consume();
        v29 = 0;
        if ((v33 & 0x8000000000000000) == 0) {
          goto LABEL_38;
        }
        LOWORD(v9) = v33;
      }
      v45 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
        sub_100005A64(v45);
      }

      goto LABEL_55;
    }
LABEL_19:
    bzero(v47, 0x400uLL);
    xpc_connection_get_audit_token();
    if (!sandbox_container_path_for_audit_token()
      || (+[NSString stringWithCString:v47 encoding:4],
          v24 = objc_claimAutoreleasedReturnValue(),
          [v24 stringByAppendingPathComponent:@"Library/com.apple.corespotlightservice"],
          v19 = objc_claimAutoreleasedReturnValue(),
          v24,
          !v19))
    {
      v25 = NSHomeDirectory();
      v26 = +[NSString stringWithFormat:@"Library/Caches/%@/com.apple.corespotlightservice", qword_10000CE10];
      v19 = [v25 stringByAppendingPathComponent:v26];
    }
    goto LABEL_22;
  }
  LOWORD(v9) = 0;
LABEL_56:

  return (__int16)v9;
}

uint64_t sub_1000053F8(uint64_t result)
{
  if (result)
  {
    unsigned __int8 v1 = atomic_load((unsigned __int8 *)(result + 8));
    return v1 & 1;
  }
  return result;
}

uint64_t sub_10000540C(uint64_t result, unsigned __int8 a2)
{
  if (result) {
    atomic_store(a2, (unsigned __int8 *)(result + 8));
  }
  return result;
}

id sub_100005484(void *a1, void *a2)
{
  id v7 = a2;
  id v3 = a2;
  id v4 = [a1 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v7];
  id v5 = v7;

  return v4;
}

void sub_100005500(uint64_t a1)
{
  [(id)qword_10000CE08 removeObject:a1];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    uint64_t v4 = qword_10000CE08;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sConfigurations: %@", (uint8_t *)&v3, 0xCu);
  }
  if (![(id)qword_10000CE08 count])
  {
    if (qword_10000CE40 != -1) {
      dispatch_once(&qword_10000CE40, &stru_100008378);
    }
    if ((byte_10000CE58 & 1) == 0)
    {
      byte_10000CE58 = 1;
      unsigned __int8 v1 = qword_10000CE50;
      dispatch_time_t v2 = dispatch_time(0, 30000000000);
      dispatch_source_set_timer(v1, v2, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
      dispatch_resume((dispatch_object_t)qword_10000CE50);
    }
  }
}

void sub_100005638(id a1)
{
  dispatch_source_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10000CE48);
  dispatch_time_t v2 = (void *)qword_10000CE50;
  qword_10000CE50 = (uint64_t)v1;

  int v3 = qword_10000CE50;

  dispatch_source_set_event_handler(v3, &stru_100008398);
}

void sub_10000569C(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_source_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No communication for 30seconds. Go clean.", v1, 2u);
  }
  raise(1);
}

void start()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CoreSpotlightServices starting", v7, 2u);
  }
  unsetenv("CFFIXED_USER_HOME");
  uint64_t v0 = objc_opt_new();
  dispatch_source_t v1 = (void *)qword_10000CE08;
  qword_10000CE08 = v0;

  uint64_t v2 = objc_opt_new();
  int v3 = (void *)qword_10000CE18;
  qword_10000CE18 = v2;

  dispatch_queue_t v4 = dispatch_queue_create("com.apple.corespotlightservice", 0);
  id v5 = (void *)qword_10000CE48;
  qword_10000CE48 = (uint64_t)v4;

  mach_service = xpc_connection_create_mach_service("com.apple.corespotlightservice", (dispatch_queue_t)qword_10000CE48, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_1000083D8);
  xpc_connection_activate(mach_service);
  xpc_activity_register("com.apple.spotlight.textstore.Analytics", XPC_ACTIVITY_CHECK_IN, &stru_100008420);
  dispatch_main();
}

void sub_100005808(id a1, OS_xpc_object *a2)
{
}

void sub_10000582C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000584C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_10000586C(uint64_t a1, NSObject *a2)
{
  int v4 = *__error();
  int v5 = 136315394;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to set dir stats %s err %d", (uint8_t *)&v5, 0x12u);
}

void sub_10000590C()
{
  sub_100005814();
  sub_10000582C((void *)&_mh_execute_header, v0, v1, "failed to mark new index dir as backup-excluded %@ err %@");
}

void sub_100005974()
{
  sub_100005814();
  sub_10000582C((void *)&_mh_execute_header, v0, v1, "failed to create new index dir %@ err %@");
}

void sub_1000059DC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "No extensionToken in xpc message, no value for cs_unhoused_index_extension.", v1, 2u);
}

void sub_100005A20(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No extensionToken in xpc message, no value for cs_unhoused_index_extension.", v1, 2u);
}

void sub_100005A64(NSObject *a1)
{
  uint64_t v2 = __error();
  int v3 = strerror(*v2);
  int v4 = 136315138;
  int v5 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_FAULT, "sandbox_extension_consume error: %s", (uint8_t *)&v4, 0xCu);
}

void sub_100005AF8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No configuraton to add!", v1, 2u);
}

void sub_100005B3C()
{
  sub_100005814();
  sub_10000584C((void *)&_mh_execute_header, v0, v1, "~~~ Already consumed extension token %s for index path %@");
}

void sub_100005BA4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = qword_10000CE10;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "initializing index controller for bundle %@ at %@", (uint8_t *)&v2, 0x16u);
}

void sub_100005C30(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "exit connection: %p", (uint8_t *)&v2, 0xCu);
}

void sub_100005CA8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134218240;
  *(void *)((char *)&v3 + 4) = a1;
  WORD6(v3) = 2048;
  HIWORD(v3) = a2;
  sub_10000584C((void *)&_mh_execute_header, a2, a3, "enter connection: %p message: %p", (const void *)v3, *((const void **)&v3 + 1));
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return _dispatch_queue_attr_make_initially_inactive(attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return _dispatch_queue_attr_make_with_overcommit();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

uint64_t logForCSLogCategoryDefault()
{
  return _logForCSLogCategoryDefault();
}

uint64_t logForCSLogCategoryIndex()
{
  return _logForCSLogCategoryIndex();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int raise(int a1)
{
  return _raise(a1);
}

uint64_t sandbox_container_path_for_audit_token()
{
  return _sandbox_container_path_for_audit_token();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
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

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_firstUnlockedInSB(void *a1, const char *a2, ...)
{
  return [a1 firstUnlockedInSB];
}

id objc_msgSend_indexAgent(void *a1, const char *a2, ...)
{
  return [a1 indexAgent];
}

id objc_msgSend_indexer(void *a1, const char *a2, ...)
{
  return [a1 indexer];
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return [a1 internal];
}

id objc_msgSend_locked(void *a1, const char *a2, ...)
{
  return [a1 locked];
}

id objc_msgSend_lockedCx(void *a1, const char *a2, ...)
{
  return [a1 lockedCx];
}

id objc_msgSend_locking(void *a1, const char *a2, ...)
{
  return [a1 locking];
}

id objc_msgSend_lockingCx(void *a1, const char *a2, ...)
{
  return [a1 lockingCx];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_privateIndexNonSandboxAllowed(void *a1, const char *a2, ...)
{
  return [a1 privateIndexNonSandboxAllowed];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_searchAgent(void *a1, const char *a2, ...)
{
  return [a1 searchAgent];
}

id objc_msgSend_searchInternal(void *a1, const char *a2, ...)
{
  return [a1 searchInternal];
}

id objc_msgSend_setupHandlers(void *a1, const char *a2, ...)
{
  return [a1 setupHandlers];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLockHandler(void *a1, const char *a2, ...)
{
  return [a1 sharedLockHandler];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startIndexer(void *a1, const char *a2, ...)
{
  return [a1 startIndexer];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unlocked(void *a1, const char *a2, ...)
{
  return [a1 unlocked];
}

id objc_msgSend_unlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 unlockedSinceBoot];
}