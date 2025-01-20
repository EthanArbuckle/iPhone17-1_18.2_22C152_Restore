int main(int argc, const char **argv, const char **envp)
{
  NSObject *v3;
  dispatch_time_t v4;
  uint8_t v5[16];

  v3 = sub_100001E8C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "service starting", v5, 2u);
  }

  v4 = dispatch_time(0, 10000000000);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, &stru_100004280);
  xpc_main((xpc_connection_handler_t)sub_100001EE4);
}

id sub_100001E8C()
{
  if (qword_1000080A8 != -1) {
    dispatch_once(&qword_1000080A8, &stru_1000042A0);
  }
  v0 = (void *)qword_1000080A0;

  return v0;
}

void sub_100001EE4(void *a1)
{
  v1 = a1;
  v2 = sub_100001E8C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "adding connection %@", buf, 0xCu);
  }

  if (qword_1000080B8 != -1) {
    dispatch_once(&qword_1000080B8, &stru_1000042C0);
  }
  xpc_connection_set_target_queue(v1, (dispatch_queue_t)qword_1000080B0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100002108;
  handler[3] = &unk_1000042E8;
  v3 = v1;
  v6 = v3;
  xpc_connection_set_event_handler(v3, handler);
  xpc_connection_resume(v3);
  v4 = sub_100001E8C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "did resume connection %@", buf, 0xCu);
  }
}

void sub_100002084(id a1)
{
  qword_1000080A0 = (uint64_t)os_log_create("com.apple.migration", "helper");

  _objc_release_x1();
}

void sub_1000020C8(id a1)
{
  qword_1000080B0 = (uint64_t)dispatch_queue_create("com.apple.datamigratorhelper.connection", 0);

  _objc_release_x1();
}

void sub_100002108(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t v4 = (xpc_type_t)&_xpc_type_dictionary;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_16;
  }
  v5 = (_xpc_connection_s *)*(id *)(a1 + 32);
  id v6 = v3;
  uint64_t pid = xpc_connection_get_pid(v5);
  v8 = v5;
  [@"com.apple.datamigratorhelper.core" UTF8String];
  v9 = (void *)xpc_connection_copy_entitlement_value();

  if (!v9 || (BOOL value = xpc_BOOL_get_value(v9), v9, !value))
  {
    v17 = sub_100001E8C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100002D94(pid);
    }

    goto LABEL_15;
  }
  int64_t int64 = xpc_dictionary_get_int64(v6, "eventID");
  v12 = sub_100001E8C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = +[NSNumber numberWithLongLong:int64];
    v14 = +[NSNumber numberWithInt:pid];
    *(_DWORD *)buf = 134218498;
    *(void *)v98 = v6;
    *(_WORD *)&v98[8] = 2112;
    v99 = v13;
    __int16 v100 = 2112;
    v101 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "handling event %p eventID %@ from client pid %@", buf, 0x20u);
  }
  if (int64 != 3)
  {
    if (int64 == 2)
    {
      v71 = sub_100001E8C();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
        sub_100002EF0();
      }

      reboot(0);
    }
    else if (int64 == 1)
    {
      string = xpc_dictionary_get_string(v6, "message");
      v16 = sub_100001E8C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100002EBC();
      }

      reboot_np(3072, string);
    }
    else
    {
      v72 = sub_100001E8C();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
        sub_100002E28(int64);
      }
    }
    goto LABEL_15;
  }
  v19 = sub_100001E8C();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10000305C();
  }

  uint64_t v20 = 0;
  while (1)
  {
    v21 = sub_100001E8C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v98 = v20;
      *(_WORD *)&v98[4] = 1024;
      *(_DWORD *)&v98[6] = 10;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Attempt %d/%d: requesting purge from logd", buf, 0xEu);
    }

    sub_100002758((uint64_t)"Attempt %d/%d: requesting purge from logd", v22, v23, v24, v25, v26, v27, v28, v20);
    mach_service = xpc_connection_create_mach_service("com.apple.logd.admin", 0, 2uLL);
    if (!mach_service)
    {
      v45 = sub_100001E8C();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_100002F64(&v95, v96, v45);
      }

      sub_100002758((uint64_t)"Failed to create connection to logd", v46, v47, v48, v49, v50, v51, v52, v88);
      goto LABEL_35;
    }
    v30 = mach_service;
    id v31 = v6;
    xpc_connection_set_event_handler(mach_service, &stru_100004328);
    xpc_connection_activate(v30);
    xpc_object_t v32 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v32, "operation", 5uLL);
    xpc_dictionary_set_uint64(v32, "purge", 0xFFFFFFFFFFFFFFFFLL);
    xpc_object_t v33 = xpc_connection_send_message_with_reply_sync(v30, v32);
    xpc_type_t type = xpc_get_type(v33);
    xpc_type_t v35 = v4;
    if (type == v4) {
      break;
    }
    v36 = type;
    v37 = sub_100001E8C();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_100003000(&v102, v36, &v103);
    }

    name = xpc_type_get_name(v36);
    sub_100002758((uint64_t)"Non dictionary response from logd: '%s'", v38, v39, v40, v41, v42, v43, v44, (uint64_t)name);
LABEL_34:

    xpc_type_t v4 = v35;
    id v6 = v31;
LABEL_35:
    v63 = sub_100001E8C();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      sub_100002F24(&v93, v94, v63);
    }

    sub_100002758((uint64_t)"Failed to purge logs via logd. Retrying after 1s", v64, v65, v66, v67, v68, v69, v70, v90);
    sleep(1u);
    uint64_t v20 = (v20 + 1);
    if (v20 == 10) {
      goto LABEL_50;
    }
  }
  int v53 = xpc_dictionary_get_int64(v33, "st");
  v54 = sub_100001E8C();
  v55 = v54;
  if (v53)
  {
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      sub_100002FA4(&v104, v53, &v105);
    }

    v91 = strerror(v53);
    sub_100002758((uint64_t)"Error from logd: %s", v56, v57, v58, v59, v60, v61, v62, (uint64_t)v91);
    goto LABEL_34;
  }
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Success from logd: deleted all logs", buf, 2u);
  }

  sub_100002758((uint64_t)"Success from logd: deleted all logs", v73, v74, v75, v76, v77, v78, v79, v88);
  v80 = sub_100001E8C();
  id v6 = v31;
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "logd purge success", buf, 2u);
  }

  sub_100002758((uint64_t)"logd purge success", v81, v82, v83, v84, v85, v86, v87, v92);
LABEL_50:
  sub_100002874(@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/sysdiagnose");
  sub_100002874(@"/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.osanalytics/Library/Logs/DiagnosticReports/DiagnosticLogs/sysdiagnose/");
  if (dword_100008098 != -1)
  {
    close(dword_100008098);
    dword_100008098 = -1;
  }
LABEL_15:
  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  xpc_connection_send_message(v8, reply);

LABEL_16:
}

void sub_100002758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (dword_100008098 == -1
    && (dword_100008098 = open("/private/var/db/logd_cleanup_migrator.txt", 513, 438), dword_100008098 == -1))
  {
    v14 = sub_100001E8C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100003090();
    }
  }
  else
  {
    id v10 = objc_alloc((Class)NSString);
    v11 = +[NSString stringWithUTF8String:a1];
    id v12 = [v10 initWithFormat:v11 arguments:&a9];

    v13 = [v12 stringByAppendingString:@"\n"];

    LODWORD(v12) = dword_100008098;
    v14 = v13;
    write((int)v12, [v14 UTF8String], (size_t)[v14 length]);
  }
}

void sub_100002874(void *a1)
{
  id v1 = a1;
  v2 = +[NSFileManager defaultManager];
  v45 = v1;
  uint64_t v3 = +[NSURL fileURLWithPath:v1 isDirectory:1];
  xpc_type_t v4 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLIsDirectoryKey, NSURLNameKey, NSURLPathKey, 0);
  uint64_t v44 = (void *)v3;
  v5 = [v2 enumeratorAtURL:v3 includingPropertiesForKeys:v4 options:5 errorHandler:&stru_100004368];

  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    v7 = (void *)v6;
    CFStringRef v8 = @"sysdiagnose";
    uint64_t v46 = v5;
    do
    {
      id v10 = [v7 lastPathComponent];
      if ([v10 rangeOfString:v8 options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        CFStringRef v11 = v8;
        id v12 = v10;
        v13 = +[NSSet setWithObjects:@"21N5165G", @"21N5207G", @"21N5233F", @"21N5259K", 0];
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v14 = v13;
        id v15 = [v14 countByEnumeratingWithState:&v48 objects:buf count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v49;
          while (2)
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v49 != v17) {
                objc_enumerationMutation(v14);
              }
              if ([v12 rangeOfString:*(void *)(*((void *)&v48 + 1) + 8 * i) options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
              {

                v19 = sub_100001E8C();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  id v20 = [v7 fileSystemRepresentation];
                  *(_DWORD *)buf = 136315138;
                  id v53 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found problematic sysdiagnose. Deleting: %s", buf, 0xCu);
                }

                id v21 = v7;
                id v22 = [v21 fileSystemRepresentation];
                sub_100002758((uint64_t)"Found problematic sysdiagnose. Deleting: %s", v23, v24, v25, v26, v27, v28, v29, (uint64_t)v22);
                id v47 = 0;
                [v2 removeItemAtURL:v21 error:&v47];
                id v12 = v47;
                if (v12)
                {
                  v30 = sub_100001E8C();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    id v41 = [v21 fileSystemRepresentation];
                    id v42 = [v12 localizedDescription];
                    id v43 = [v42 UTF8String];
                    *(_DWORD *)buf = 136315394;
                    id v53 = v41;
                    __int16 v54 = 2080;
                    id v55 = v43;
                    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to delete sysdiagnose at %s: %s", buf, 0x16u);
                  }
                  id v31 = [v21 fileSystemRepresentation];
                  id v32 = [v12 localizedDescription];
                  [v32 UTF8String];
                  sub_100002758((uint64_t)"Failed to delete sysdiagnose at %s: %s", v33, v34, v35, v36, v37, v38, v39, (uint64_t)v31);
                }
                goto LABEL_19;
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v48 objects:buf count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

LABEL_19:
        CFStringRef v8 = v11;
        v5 = v46;
      }

      uint64_t v40 = [v5 nextObject];

      v7 = (void *)v40;
    }
    while (v40);
  }
}

BOOL sub_100002CA0(id a1, NSURL *a2, NSError *a3)
{
  uint64_t v3 = a3;
  xpc_type_t v4 = sub_100001E8C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000030D0(v3);
  }

  id v5 = [(NSError *)v3 localizedDescription];
  id v6 = [v5 UTF8String];
  sub_100002758((uint64_t)"Failed to enumerate sysdiagnose files: %s", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);

  return 1;
}

void sub_100002D2C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002D4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100002D68(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

void sub_100002D94(uint64_t a1)
{
  id v1 = +[NSNumber numberWithInt:a1];
  sub_100002D2C((void *)&_mh_execute_header, v2, v3, "pid %@ lacks necessary entitlement", v4, v5, v6, v7, 2u);
}

void sub_100002E28(uint64_t a1)
{
  id v1 = +[NSNumber numberWithLongLong:a1];
  sub_100002D2C((void *)&_mh_execute_header, v2, v3, "unknown eventID %@", v4, v5, v6, v7, 2u);
}

void sub_100002EBC()
{
  sub_100002D88();
  sub_100002D4C((void *)&_mh_execute_header, v0, v1, "panicking", v2, v3, v4, v5, v6);
}

void sub_100002EF0()
{
  sub_100002D88();
  sub_100002D4C((void *)&_mh_execute_header, v0, v1, "rebooting", v2, v3, v4, v5, v6);
}

void sub_100002F24(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to purge logs via logd. Retrying after 1s", buf, 2u);
}

void sub_100002F64(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create connection to logd", buf, 2u);
}

void sub_100002FA4(_DWORD *a1, int __errnum, char **a3)
{
  uint64_t v5 = strerror(__errnum);
  *a1 = 136315138;
  *a3 = v5;
  sub_100002D68((void *)&_mh_execute_header, v6, v7, "Error from logd: %s");
}

void sub_100003000(_DWORD *a1, xpc_type_t type, const char **a3)
{
  name = xpc_type_get_name(type);
  *a1 = 136315138;
  *a3 = name;
  sub_100002D68((void *)&_mh_execute_header, v6, v7, "Non dictionary response from logd: '%s'");
}

void sub_10000305C()
{
  sub_100002D88();
  sub_100002D4C((void *)&_mh_execute_header, v0, v1, "performing logging work", v2, v3, v4, v5, v6);
}

void sub_100003090()
{
  sub_100002D88();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to create logging file", v1, 2u);
}

void sub_1000030D0(void *a1)
{
  id v1 = [a1 localizedDescription];
  [v1 UTF8String];
  sub_100002D2C((void *)&_mh_execute_header, v2, v3, "Failed to enumerate sysdiagnose files: %s", v4, v5, v6, v7, 2u);
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

int close(int a1)
{
  return _close(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
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

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int reboot(int a1)
{
  return _reboot(a1);
}

int reboot_np(int howto, const char *message)
{
  return _reboot_np(howto, message);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
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

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return _xpc_type_get_name(type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}