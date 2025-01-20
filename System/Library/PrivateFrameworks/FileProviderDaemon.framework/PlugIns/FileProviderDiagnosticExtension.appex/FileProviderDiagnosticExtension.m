void sub_100004FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005050(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005060(uint64_t a1)
{
}

void sub_100005068(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100005E50(v6, v7);
    }
  }
  else
  {
    id v8 = [objc_alloc((Class)OSLogEventStream) initWithSource:v5];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void sub_100005108(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 date];
  id v5 = [v3 threadIdentifier];
  uint64_t v16 = a1;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "_displayStringForLogType:", objc_msgSend(v3, "logType"));
  id v7 = [v3 processIdentifier];
  id v8 = [v3 process];
  uint64_t v9 = [v3 sender];
  v10 = [v3 subsystem];
  v11 = [v3 category];
  v12 = [v3 composedMessage];

  id v17 = +[NSString stringWithFormat:@"%@ 0x%05llx %@ %d %@(%@):%@ [%@] %@\n", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  v13 = v17;
  if (v17)
  {
    v14 = *(void **)(v16 + 40);
    v15 = [v17 dataUsingEncoding:4];
    [v14 writeData:v15];

    v13 = v17;
  }
}

void sub_10000528C(uint64_t a1, uint64_t a2)
{
  if (a2 != 5)
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100005EE4();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100005A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  __fp_leave_section_Debug();
  _Unwind_Resume(a1);
}

void sub_100005AD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100006384(v3, v4);
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) path];
    id v6 = +[DEAttachmentItem attachmentWithPath:v5];

    [v6 setShouldCompress:&__kCFBooleanTrue];
    [v6 setDeleteOnAttach:&__kCFBooleanTrue];
    [v6 setDisplayName:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [*(id *)(a1 + 40) addObject:v6];
  }
}

void sub_100005C68(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100005C80(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_100005C9C(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_100005CC0()
{
  sub_100005CB4();
  sub_100005C80((void *)&_mh_execute_header, v0, v1, "[ERROR] [FileProviderDiagnosticExtension attachmentsForParameters:ABC] Failed to prepare oslog stream", v2, v3, v4, v5, v6);
}

void sub_100005CF4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_100005C68((void *)&_mh_execute_header, a3, (uint64_t)a3, "[ERROR] [FileProviderDiagnosticExtension attachmentsForParameters:ABC] Failed to create file: %s", (uint8_t *)a2);
}

void sub_100005D34()
{
  sub_100005CB4();
  sub_100005C80((void *)&_mh_execute_header, v0, v1, "[ERROR] [FileProviderDiagnosticExtension attachmentsForParameters:ABC] Timeout on getting oslog stream", v2, v3, v4, v5, v6);
}

void sub_100005D68(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_100005C68((void *)&_mh_execute_header, a3, (uint64_t)a3, "[ERROR] [FileProviderDiagnosticExtension attachmentsForParameters:ABC] Writing to file: %s", (uint8_t *)a2);
}

void sub_100005DA8(uint64_t a1, void *a2, uint64_t a3)
{
  sub_100005C9C(a1, (uint64_t)a2, a3, 4.8151e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[ERROR] [FileProviderDiagnosticExtension attachmentsForParameters:ABC] Failed to truncate file: %s : %@", v4, 0x16u);
}

void sub_100005E00(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100005C68((void *)&_mh_execute_header, a3, (uint64_t)a3, "[ERROR] [FileProviderDiagnosticExtension attachmentsForParameters:ABC] Failed to create empty file: %@", (uint8_t *)a2);
}

void sub_100005E50(void *a1, NSObject *a2)
{
  id v3 = [a1 localizedDescription];
  [v3 UTF8String];
  sub_100005C5C();
  sub_100005C68((void *)&_mh_execute_header, a2, v4, "[ERROR] [FileProviderDiagnosticExtension attachmentsForParameters:ABC] Could not open: %s", v5);
}

void sub_100005EE4()
{
  sub_100005C5C();
  sub_100005C68((void *)&_mh_execute_header, v0, v1, "[ERROR] [FileProviderDiagnosticExtension attachmentsForParameters:ABC] Invalid oslog stream: reason = %lu", v2);
}

void sub_100005F50()
{
  sub_100005CB4();
  sub_100005C80((void *)&_mh_execute_header, v0, v1, "[ERROR] Parameters of unknown type", v2, v3, v4, v5, v6);
}

void sub_100005F84()
{
  sub_100005C5C();
  sub_100005C68((void *)&_mh_execute_header, v0, v1, "[ERROR] Creating raw JSON failed: %@", v2);
}

void sub_100005FF0()
{
  sub_100005C5C();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "[ERROR] Decoding JSON %@ failed: %@", v2, 0x16u);
}

void sub_100006074()
{
  sub_100005C5C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Feedback parameters: %@", v1, 0xCu);
}

void sub_1000060E8(void *a1, NSObject *a2)
{
  __int16 v3 = [a1 objectForKeyedSubscript:@":de_parameter"];
  sub_100005C5C();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Feedback parameter: %@", v4, 0xCu);
}

void sub_100006184(void *a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v5 = *a2;
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] Unable to open file at %@: %{errno}d", buf, 0x12u);
}

void sub_1000061F0(void *a1, void *a2, uint64_t a3)
{
  sub_100005C9C((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Will filter with %@ for %@", v5, 0x16u);
}

void sub_100006250()
{
  sub_100005C5C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] called with parameters: %@", v1, 0xCu);
}

void sub_1000062C4(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx dumping FP domains for %@", (uint8_t *)&v4, 0x16u);
}

void sub_100006350()
{
  sub_100005CB4();
  sub_100005C80((void *)&_mh_execute_header, v0, v1, "[ERROR] [FileProviderDiagnosticExtension attachmentsForParameters:ABC] Error could not capture logs", v2, v3, v4, v5, v6);
}

void sub_100006384(void *a1, NSObject *a2)
{
  uint64_t v3 = objc_msgSend(a1, "fp_prettyDescription");
  sub_100005C5C();
  sub_100005C68((void *)&_mh_execute_header, a2, v4, "[ERROR] Unable to capture FP dump: %@", v5);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __fp_create_section()
{
  return ___fp_create_section();
}

uint64_t __fp_leave_section_Debug()
{
  return ___fp_leave_section_Debug();
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

uint64_t fp_current_or_default_log()
{
  return _fp_current_or_default_log();
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

int unlink(const char *a1)
{
  return _unlink(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_composedMessage(void *a1, const char *a2, ...)
{
  return [a1 composedMessage];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_localStore(void *a1, const char *a2, ...)
{
  return [a1 localStore];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logType(void *a1, const char *a2, ...)
{
  return [a1 logType];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_subsystem(void *a1, const char *a2, ...)
{
  return [a1 subsystem];
}

id objc_msgSend_synchronousSharedConnectionProxy(void *a1, const char *a2, ...)
{
  return [a1 synchronousSharedConnectionProxy];
}

id objc_msgSend_threadIdentifier(void *a1, const char *a2, ...)
{
  return [a1 threadIdentifier];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}
  v40 = v35;
    [v34 dumpStateTo:v16 providerFilter:v24 options:0 completionHandler:v38];
    v32 = v35;

    _Block_object_dispose(buf, 8);
  }

  __fp_leave_section_Debug();
  return v32;
}

- (id)annotatedAttachmentsForParameters:(id)a3
{
  uint64_t v3 = [(FileProviderDiagnosticExtension *)self attachmentsForParameters:a3];
  uint64_t v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Diagnostics with %lu items", [v3 count]);
  id v5 = [objc_alloc((Class)DEAnnotatedGroup) initWithDisplayName:@"File Sync Diagnostics" localizedDescription:v4 iconType:0 additionalInfo:0 attachmentItems:v3];

  return v5;
}

@end