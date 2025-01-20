void sub_100004708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004720(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004730(uint64_t a1)
{
}

void sub_100004738(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  v7 = a3;
  if (!*(unsigned char *)(a1 + 56)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  v8 = +[NSRegularExpression regularExpressionWithPattern:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) options:0 error:0];
  v9 = +[NSRegularExpression regularExpressionWithPattern:@"(shm)" options:0 error:0];
  v10 = [*(id *)(a1 + 32) filesInDir:v7 matchingPattern:v8 excludingPattern:v9];
  if ([v10 count])
  {
    v40 = v9;
    v42 = v7;
    v11 = +[NSFileManager defaultManager];
    v12 = NSTemporaryDirectory();
    v13 = [*(id *)(a1 + 32) _fileDateSuffix];
    id v43 = v6;
    v14 = [v6 stringByAppendingString:v13];
    uint64_t v15 = [v12 stringByAppendingPathComponent:v14];

    char v53 = 1;
    if ([v11 fileExistsAtPath:v15 isDirectory:&v53]) {
      [v11 removeItemAtPath:v15 error:0];
    }
    id v52 = 0;
    unsigned __int8 v16 = [v11 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v52];
    v17 = v52;
    if ((v16 & 1) == 0)
    {
      v18 = BLBooksDiagnosticExtensionLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v56 = v15;
        __int16 v57 = 2112;
        v58 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Could not create temporary directory at path: %@ %@", buf, 0x16u);
      }
    }
    v37 = v17;
    v41 = v8;
    v38 = (void *)v15;
    v46 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v15, a1);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v39 = v10;
    id obj = v10;
    id v19 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v45 = *(void *)v49;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v49 != v45) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v23 = [v22 path];
          v24 = [v22 path];
          v25 = [v24 lastPathComponent];
          v26 = [v46 URLByAppendingPathComponent:v25];
          id v47 = 0;
          v27 = v11;
          unsigned __int8 v28 = [v11 copyItemAtURL:v23 toURL:v26 error:&v47];
          v29 = v47;

          if ((v28 & 1) == 0)
          {
            v30 = BLBooksDiagnosticExtensionLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v56 = (uint64_t)v22;
              __int16 v57 = 2112;
              v58 = v29;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Error zipping item: %@ %@", buf, 0x16u);
            }
          }
          v11 = v27;
        }
        id v20 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v20);
    }

    v31 = +[DEArchiver archiveDirectoryAt:v46 deleteOriginal:1];
    if (v31)
    {
      v32 = *(void **)(v36 + 40);
      v33 = +[DEAttachmentItem attachmentWithPathURL:v31];
      [v32 addObject:v33];
      id v6 = v43;
      v8 = v41;
      v34 = v38;
      v10 = v39;
      v35 = v37;
    }
    else
    {
      v33 = BLBooksDiagnosticExtensionLog();
      v8 = v41;
      v34 = v38;
      v10 = v39;
      v35 = v37;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v56 = (uint64_t)v46;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Could not create archive directory %@", buf, 0xCu);
      }
      id v6 = v43;
    }

    v7 = v42;
    v9 = v40;
  }
  else
  {
    v35 = BLBooksDiagnosticExtensionLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v56 = (uint64_t)v6;
      __int16 v57 = 2112;
      v58 = v7;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Cannot find %@ in directory %@", buf, 0x16u);
    }
  }
}

id BLBooksDiagnosticExtensionLog()
{
  if (qword_10000C3F8 != -1) {
    dispatch_once(&qword_10000C3F8, &stru_100008238);
  }
  v0 = (void *)qword_10000C3F0;
  return v0;
}

void sub_10000524C(id a1)
{
  qword_10000C3F0 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLBooksDiagnosticExtensionLog");
  _objc_release_x1();
}

uint64_t MSVMobileHomeDirectory()
{
  return _MSVMobileHomeDirectory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

int *__error(void)
{
  return ___error();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__fileDateSuffix(void *a1, const char *a2, ...)
{
  return [a1 _fileDateSuffix];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_consumeSandboxToken(void *a1, const char *a2, ...)
{
  return [a1 consumeSandboxToken];
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

id objc_msgSend_getAppDataContainer(void *a1, const char *a2, ...)
{
  return [a1 getAppDataContainer];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_managedRepositoryPath(void *a1, const char *a2, ...)
{
  return [a1 managedRepositoryPath];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_purchasesRepositoryPath(void *a1, const char *a2, ...)
{
  return [a1 purchasesRepositoryPath];
}

id objc_msgSend_sharedContainerURL(void *a1, const char *a2, ...)
{
  return [a1 sharedContainerURL];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           uint64_t v15 = };

  unsigned __int8 v16 = +[NSURL bu_booksRepositoryURL];
  v17 = [v16 URLByAppendingPathComponent:v11];

  [(BLBooksDEExtensionProvider *)self addAttachmentFromURL:v17 withName:v11 archiveFile:0 toArray:v12];
  v18 = [v20 URLByAppendingPathComponent:v10];
  [(BLBooksDEExtensionProvider *)self addAttachmentFromURL:v18 withName:v10 archiveFile:0 toArray:v12];

  id v19 = [v15 URLByAppendingPathComponent:v9];
  [(BLBooksDEExtensionProvider *)self addAttachmentFromURL:v19 withName:v9 archiveFile:0 toArray:v12];
}

- (void)_downloadsDatabaseAttachmentToArray:(id)a3
{
  id v4 = a3;
  v5 = +[IMLibraryPlist sharedContainerURL];
  id v6 = [v5 URLByAppendingPathComponent:@"Documents/BLDatabaseManager"];

  CFStringRef v8 = @"BLDownloads database";
  v9 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [(BLBooksDEExtensionProvider *)self appendDatabaseAttachmentsFromURLs:v7 hasSqliteSuffix:1 toArray:v4];
}

@end