void sub_100001DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100001E38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100001E48(uint64_t a1)
{
}

void sub_100001E50(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    v38 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    __brc_create_section();
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v34 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      v42 = v38;
      __int16 v43 = 2112;
      id v44 = v34;
      __int16 v45 = 2112;
      v46 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx dumping account %@%@", buf, 0x20u);
    }

    v8 = [*(id *)(a1 + 40) computeHomeDirPathForAccount:*(void *)(a1 + 32)];
    v9 = [v8 stringByAppendingPathComponent:@"Library/Application Support/CloudDocs/session/db"];
    v36 = +[NSURL fileURLWithPath:v9];

    v10 = +[NSFileManager defaultManager];
    v11 = *(void **)(a1 + 48);
    v12 = [*(id *)(a1 + 32) accountIdentifier];
    v13 = +[NSString stringWithFormat:@"db-%@", v12];
    v14 = [v11 stringByAppendingPathComponent:v13];

    id v37 = 0;
    LODWORD(v11) = [v10 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:&v37];
    id v35 = v37;
    if (v11)
    {
      v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[INFO] Backing up databases%@", buf, 0xCu);
      }

      v17 = +[BRCAccountSession sessionForBackingUpDatabasesAtURL:v36];
      if (![*(id *)(a1 + 40) _backupDatabaseWithSession:v17 toOutputPath:v14])
      {
LABEL_15:

        v19 = *(void **)(a1 + 48);
        v20 = [*(id *)(a1 + 32) accountIdentifier];
        v21 = +[NSString stringWithFormat:@"brctl-dump-%@.txt", v20];
        v22 = [v19 stringByAppendingPathComponent:v21];

        v23 = brc_bread_crumbs();
        v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[INFO] Dumping databases%@", buf, 0xCu);
        }

        if ([*(id *)(a1 + 40) _dumpDatabaseToOutputPath:v22])
        {
          v25 = +[DEAttachmentItem attachmentWithPath:v22];
          [v25 setShouldCompress:&__kCFBooleanTrue];
          [v25 setDeleteOnAttach:&__kCFBooleanTrue];
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v25];
        }
        if (*(unsigned char *)(a1 + 64))
        {
          v26 = brc_bread_crumbs();
          v27 = brc_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            sub_100002B20((uint64_t)v26, v27);
          }
        }
        else
        {
          v28 = *(void **)(a1 + 48);
          v29 = [*(id *)(a1 + 32) accountIdentifier];
          v30 = +[NSString stringWithFormat:@"spotlight-dump-%@.txt", v29];
          v26 = [v28 stringByAppendingPathComponent:v30];

          v31 = brc_bread_crumbs();
          v32 = brc_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v31;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[INFO] Dumping spotlight%@", buf, 0xCu);
          }

          if (![*(id *)(a1 + 40) _dumpSpotlightJournalToOutputPath:v26]) {
            goto LABEL_27;
          }
          v27 = +[DEAttachmentItem attachmentWithPath:v26];
          [v27 setShouldCompress:&__kCFBooleanTrue];
          [v27 setDeleteOnAttach:&__kCFBooleanTrue];
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v27];
        }

LABEL_27:
        __brc_leave_section();
        goto LABEL_28;
      }
      v18 = +[DEAttachmentItem attachmentWithPath:v14];
      [v18 setShouldCompress:&__kCFBooleanTrue];
      [v18 setDeleteOnAttach:&__kCFBooleanTrue];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v18];
    }
    else
    {
      v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
        sub_100002B98();
      }
    }

    goto LABEL_15;
  }
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    v33 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v42 = v33;
    __int16 v43 = 2112;
    id v44 = v3;
    __int16 v45 = 2112;
    v46 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, (os_log_type_t)0x90u, "[ERROR] couldn't adopt persona - skipping account %@: %@%@", buf, 0x20u);
  }

LABEL_28:
}

void sub_1000024D8(_Unwind_Exception *a1)
{
}

void sub_100002794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000027AC(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    id v5 = [a3 description];
    syslog(3, "unable to dump database; %s", (const char *)[v5 UTF8String]);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

void sub_100002928(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100002948()
{
  sub_100002910();
  sub_100002928((void *)&_mh_execute_header, v0, v1, "[DEBUG] Parameter missing or invalid: %@%@");
}

void sub_1000029B0(char a1, uint64_t a2, NSObject *a3)
{
  id v3 = "YES";
  if ((a1 & 1) == 0) {
    id v3 = "NO";
  }
  *(_DWORD *)uint64_t v4 = 136315394;
  *(void *)&v4[4] = v3;
  *(_WORD *)&v4[12] = 2112;
  *(void *)&v4[14] = a2;
  sub_100002928((void *)&_mh_execute_header, a2, a3, "[DEBUG] Enable com.apple.fileprovider.log-sensitive-data [%s]%@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16]);
}

void sub_100002A40(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Only setup parameters at this step. Return 0 attachments%@", (uint8_t *)&v2, 0xCu);
}

void sub_100002AB8()
{
  sub_100002910();
  sub_100002928((void *)&_mh_execute_header, v0, v1, "[DEBUG] Running attachmentsForParameters %@%@");
}

void sub_100002B20(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Don't dump the spotlight index from TimberLorry%@", (uint8_t *)&v2, 0xCu);
}

void sub_100002B98()
{
  sub_100002910();
  _os_log_error_impl((void *)&_mh_execute_header, v0, (os_log_type_t)0x90u, "[ERROR] unable to create database backup directory; %@%@",
    v1,
    0x16u);
}

uint64_t BRActivityDump()
{
  return _BRActivityDump();
}

uint64_t BRDumpDatabaseToFileHandle()
{
  return _BRDumpDatabaseToFileHandle();
}

uint64_t BRPerformWithAccountDescriptorAndError()
{
  return _BRPerformWithAccountDescriptorAndError();
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return _NSHomeDirectoryForUser(userName);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __brc_create_section()
{
  return ___brc_create_section();
}

uint64_t __brc_leave_section()
{
  return ___brc_leave_section();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t brc_bread_crumbs()
{
  return _brc_bread_crumbs();
}

uint64_t brc_default_log()
{
  return _brc_default_log();
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

uid_t geteuid(void)
{
  return _geteuid();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

void syslog(int a1, const char *a2, ...)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_allLoggedInAccountDescriptors(void *a1, const char *a2, ...)
{
  return [a1 allLoggedInAccountDescriptors];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_isDataSeparated(void *a1, const char *a2, ...)
{
  return [a1 isDataSeparated];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}