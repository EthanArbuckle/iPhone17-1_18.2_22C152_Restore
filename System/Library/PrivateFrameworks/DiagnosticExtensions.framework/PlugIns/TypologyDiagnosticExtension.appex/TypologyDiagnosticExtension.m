id TITypologyDiagnosticExtensionOSLogFacility()
{
  void *v0;
  uint64_t vars8;

  if (qword_1000081C8 != -1) {
    dispatch_once(&qword_1000081C8, &stru_100004148);
  }
  v0 = (void *)qword_1000081C0;
  return v0;
}

void sub_1000028FC(id a1)
{
  qword_1000081C0 = (uint64_t)os_log_create("com.apple.TextInput", "TITypologyDiagnosticExtension");
  _objc_release_x1();
}

void sub_1000029F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 url];
  id v8 = 0;
  [v4 removeItemAtURL:v5 error:&v8];
  id v6 = v8;

  if (v6)
  {
    v7 = TITypologyDiagnosticExtensionOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100002F64(v3);
    }
  }
}

void sub_100002C3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 url];
  v5 = [v4 pathExtension];
  unsigned int v6 = [v5 isEqualToString:@"log"];

  if (v6)
  {
    v7 = [v3 url];
    id v21 = 0;
    id v8 = +[NSString stringWithContentsOfURL:v7 encoding:4 error:&v21];
    id v9 = v21;

    v10 = TITypologyDiagnosticExtensionOSLogFacility();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v11) {
        sub_100003354(v3);
      }

      v12 = *(void **)(a1 + 32);
      v13 = [v3 url];
      v14 = [v13 lastPathComponent];
      v10 = [v12 URLByAppendingPathComponent:v14];

      v15 = *(void **)(a1 + 40);
      v16 = [v3 url];
      id v20 = v9;
      [v15 copyItemAtURL:v16 toURL:v10 error:&v20];
      id v17 = v20;

      v18 = +[DEAttachmentItem attachmentWithPathURL:v10];
      [v18 setDeleteOnAttach:&off_100004308];
      v19 = TITypologyDiagnosticExtensionOSLogFacility();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10000324C(v18, v19);
      }

      [*(id *)(a1 + 48) addObject:v18];
      id v9 = v17;
    }
    else if (v11)
    {
      sub_100003180(v3);
    }
  }
}

void sub_100002F38(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0xCu);
}

void sub_100002F64(void *a1)
{
  v1 = [a1 url];
  v2 = [v1 lastPathComponent];
  id v3 = +[NSString stringWithFormat:@"%s failed to delete %@ from datavault"];
  sub_100002F58();
  sub_100002F38((void *)&_mh_execute_header, v4, v5, "%@", v6, v7, v8, v9, (uint64_t)"-[TypologyDiagnosticExtension cleanupDatavault]_block_invoke", (uint64_t)v2, v10);
}

void sub_100003030(void *a1)
{
  id v8 = [a1 count];
  v1 = +[NSString stringWithFormat:@"%s total attachments: %lu"];
  sub_100002F58();
  sub_100002F38((void *)&_mh_execute_header, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[TypologyDiagnosticExtension attachmentsForParameters:]", (uint64_t)v8, v9);
}

void sub_1000030D8()
{
  v0 = +[NSString stringWithFormat:@"%s %@"];
  sub_100002F58();
  sub_100002F38((void *)&_mh_execute_header, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[TypologyDiagnosticExtension attachmentsForParameters:]", @"attachmentsForParameters called", v7);
}

void sub_100003180(void *a1)
{
  int v1 = [a1 url];
  int v2 = [v1 lastPathComponent];
  int v3 = +[NSString stringWithFormat:@"%s unable to access %@ from datavault"];
  sub_100002F58();
  sub_100002F38((void *)&_mh_execute_header, v4, v5, "%@", v6, v7, v8, v9, (uint64_t)"-[TypologyDiagnosticExtension attachmentsForParameters:]_block_invoke", (uint64_t)v2, v10);
}

void sub_10000324C(void *a1, NSObject *a2)
{
  int v4 = [a1 path];
  int v5 = [a1 modificationDate];
  int v6 = [a1 deleteOnAttach];
  int v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s adding attachment with path %@ and date %@ and deleteOnAttach %@", "-[TypologyDiagnosticExtension attachmentsForParameters:]_block_invoke", v4, v5, v6);
  *(_DWORD *)buf = 138412290;
  int v9 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

void sub_100003354(void *a1)
{
  int v1 = [a1 url];
  int v2 = [v1 lastPathComponent];
  int v3 = +[NSString stringWithFormat:@"%s accessing %@ from datavault"];
  sub_100002F58();
  sub_100002F38((void *)&_mh_execute_header, v4, v5, "%@", v6, v7, v8, v9, (uint64_t)"-[TypologyDiagnosticExtension attachmentsForParameters:]_block_invoke", (uint64_t)v2, v10);
}

void sub_100003420()
{
  v0 = +[NSString stringWithFormat:@"%s %@"];
  sub_100002F58();
  sub_100002F38((void *)&_mh_execute_header, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[TypologyDiagnosticExtension setupWithParameters:]", @"setupWithParameters called", v7);
}

void sub_1000034C8()
{
  v0 = +[NSString stringWithFormat:@"%s %@"];
  sub_100002F58();
  sub_100002F38((void *)&_mh_execute_header, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[TypologyDiagnosticExtension teardownWithParameters:]", @"teardownWithParameters called", v7);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_cleanupDatavault(void *a1, const char *a2, ...)
{
  return [a1 cleanupDatavault];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deleteOnAttach(void *a1, const char *a2, ...)
{
  return [a1 deleteOnAttach];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_sharedPreferencesController(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferencesController];
}

id objc_msgSend_synchronizePreferences(void *a1, const char *a2, ...)
{
  return [a1 synchronizePreferences];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}