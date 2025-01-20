void sub_100003128(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t (**v6)(id, FILE *);
  void *v7;
  void *v8;
  unsigned int v9;
  BOOL v10;
  NSObject *v11;
  id v12;
  FILE *v13;
  FILE *v14;
  int v15;
  void *v16;
  char v17;

  v5 = a2;
  v6 = a3;
  v7 = +[NSFileManager defaultManager];
  if (([v7 fileExistsAtPath:v5] & 1) == 0)
  {
    v8 = [v5 stringByDeletingLastPathComponent];
    v17 = 0;
    v9 = [v7 fileExistsAtPath:v5 isDirectory:&v17];
    if (v9) {
      v10 = v17 == 0;
    }
    else {
      v10 = 1;
    }
    if (v10)
    {
      if (v9) {
        goto LABEL_10;
      }
      [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];
    }
    if ([v7 createFileAtPath:v5 contents:0 attributes:0])
    {
LABEL_13:

      goto LABEL_14;
    }
LABEL_10:
    v11 = OSLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000359C(v11);
    }

    goto LABEL_13;
  }
LABEL_14:
  v12 = v5;
  v13 = fopen((const char *)[v12 fileSystemRepresentation], "w");
  if (v13)
  {
    v14 = v13;
    v15 = v6[2](v6, v13);
    fclose(v14);
    if (v15)
    {
      v16 = +[DEAttachmentItem attachmentWithPath:v12];
      [v16 setDeleteOnAttach:&__kCFBooleanFalse];
      [*(id *)(a1 + 32) addObject:v16];
    }
    else
    {
      unlink((const char *)[v12 fileSystemRepresentation]);
    }
  }
}

uint64_t sub_1000032D0(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000335C;
  v5[3] = &unk_100004188;
  id v6 = v3;
  uint64_t v7 = a2;
  [v6 performBlockAndWait:v5];

  return 1;
}

void sub_10000335C(uint64_t a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [*(id *)(a1 + 32) allRecordings];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v8 willAccessValueForKey:0];
        v9 = *(FILE **)(a1 + 40);
        id v10 = [v8 description];
        fprintf(v9, "recording[%d] = %s\n", v5 + i, (const char *)[v10 UTF8String]);
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      v5 += (int)i;
    }
    while (v4);
  }
}

uint64_t sub_1000034AC(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003530;
  v5[3] = &unk_1000041D0;
  void v5[4] = a2;
  id v3 = [v2 enumerateChangeHistorySinceToken:0 forStore:0 usingBlock:v5];
  return 1;
}

void sub_100003530(uint64_t a1, void *a2)
{
  v2 = *(FILE **)(a1 + 32);
  id v3 = [a2 description];
  fprintf(v2, "%s\n", (const char *)[v3 UTF8String]);
}

void sub_10000359C(os_log_t log)
{
  int v1 = 136315138;
  v2 = "-[VoiceMemosDiagnosticsExtension _generateAttachments]_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s -- VoiceMemosDiagnosticsExtension failed to create log", (uint8_t *)&v1, 0xCu);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t OSLogForCategory()
{
  return _OSLogForCategory();
}

uint64_t RCCloudRecordingsStoreURL()
{
  return _RCCloudRecordingsStoreURL();
}

uint64_t RCLogsDirectoryURL()
{
  return _RCLogsDirectoryURL();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

id objc_msgSend_allRecordings(void *a1, const char *a2, ...)
{
  return [a1 allRecordings];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_newBackgroundModel(void *a1, const char *a2, ...)
{
  return [a1 newBackgroundModel];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_willAccessValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willAccessValueForKey:");
}