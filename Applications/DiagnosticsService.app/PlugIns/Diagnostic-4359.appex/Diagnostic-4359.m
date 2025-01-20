id archiveFiles(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v23;
  id v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  unsigned char v29[128];
  uint64_t vars8;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = +[DSMutableArchive archive];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v5;
  v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    v11 = v10;
    v12 = *(void *)v26;
    while (2)
    {
      v13 = 0;
      v14 = v7;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v13);
        v24 = v14;
        v16 = [v8 addURL:v15 error:&v24];
        v7 = v24;

        if ((v16 & 1) == 0)
        {
          v21 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_10000325C((uint64_t)v7, v21);
          }

          v20 = v9;
          goto LABEL_15;
        }
        v13 = (char *)v13 + 1;
        v14 = v7;
      }
      while (v11 != v13);
      v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  v17 = v7;

  v18 = DKTemporaryDirectoryURL();
  v23 = v7;
  v19 = [v8 archiveAsTempFileWithTemplate:v6 directory:v18 suffix:@".tar.gz" error:&v23];
  v7 = v23;

  if (!v19)
  {
    v20 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000031E4((uint64_t)v7, v20);
    }
LABEL_15:

    v19 = 0;
  }

  return v19;
}

void sub_100002A30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (v6)
    {
      v7 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WIS result: %@", buf, 0xCu);
      }

      v8 = [*(id *)(a1 + 32) _extractFilePaths:v6];
      v9 = v8;
      if (!v8)
      {
        v11 = 0;
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v10 = archiveFiles(v8, @"com.apple.Diagnostics.4359.XXXXXXXX", 0);
      v11 = (void *)v10;
      if (!v10) {
        goto LABEL_24;
      }
      uint64_t v47 = v10;
      v12 = +[NSArray arrayWithObjects:&v47 count:1];
      v13 = [*(id *)(a1 + 32) result];
      [v13 setFiles:v12];

      v14 = [*(id *)(a1 + 32) result];
      [v14 setStatusCode:&off_100004270];

      if (![*(id *)(a1 + 32) copyForSyncing]) {
        goto LABEL_24;
      }
      v15 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Copying archive for syncing.", buf, 2u);
      }

      v16 = +[NSFileManager defaultManager];
      id v46 = 0;
      unsigned int v17 = [v16 createDirectoryAtPath:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs" withIntermediateDirectories:1 attributes:0 error:&v46];
      v18 = v46;

      if (v17)
      {
        v19 = [v11 lastPathComponent];
        v20 = [@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs" stringByAppendingPathComponent:v19];
        v21 = +[NSURL fileURLWithPath:v20];

        v22 = +[NSFileManager defaultManager];
        v45 = v18;
        unsigned __int8 v23 = [v22 copyItemAtURL:v11 toURL:v21 error:&v45];
        v24 = v45;

        if ((v23 & 1) == 0)
        {
          v25 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_100003340((uint64_t)v24, v25, v26, v27, v28, v29, v30, v31);
          }
        }
      }
      else
      {
        v21 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000033AC((uint64_t)v18, v21, v39, v40, v41, v42, v43, v44);
        }
        v24 = v18;
      }
    }
    else
    {
      v32 = [*(id *)(a1 + 32) result];
      [v32 setStatusCode:&off_100004258];

      v24 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1000032D4((uint64_t)v5, v24, v33, v34, v35, v36, v37, v38);
      }
      v11 = 0;
      v9 = 0;
    }

    goto LABEL_24;
  }
LABEL_25:
  [*(id *)(a1 + 32) setFinished:1];
}

void sub_100003138(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003154(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000031E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ERROR archiving logs: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000325C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ERROR finding log(s): %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000032D4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003340(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000033AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003418(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003450(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003488(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t DKTemporaryDirectoryURL()
{
  return _DKTemporaryDirectoryURL();
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t WISServerConsolidateDeviceDiagnostics()
{
  return _WISServerConsolidateDeviceDiagnostics();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_archive(void *a1, const char *a2, ...)
{
  return [a1 archive];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copyForSyncing(void *a1, const char *a2, ...)
{
  return [a1 copyForSyncing];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}