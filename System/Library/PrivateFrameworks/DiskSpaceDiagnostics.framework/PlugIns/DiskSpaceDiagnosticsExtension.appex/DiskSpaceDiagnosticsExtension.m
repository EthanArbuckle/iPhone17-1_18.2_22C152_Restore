id shared_diagnostics_extension_log_handle()
{
  void *v0;
  uint64_t vars8;

  if (shared_diagnostics_extension_log_handle_onceToken != -1) {
    dispatch_once(&shared_diagnostics_extension_log_handle_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)shared_diagnostics_extension_log_handle___log_handle;

  return v0;
}

void __shared_diagnostics_extension_log_handle_block_invoke(id a1)
{
  shared_diagnostics_extension_log_handle___log_handle = (uint64_t)os_log_create("com.apple.diskspacediagnostics", "DiskSpaceDiagnosticsExtension");

  _objc_release_x1();
}

void sub_100002EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return [a1 fractionCompleted];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}
ars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
    __break(0xC471u);
  return v24;
}

void __76__DiskSpaceDiagnosticsExtension_snapshotFilesystemMetadata_progressHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = shared_diagnostics_extension_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__DiskSpaceDiagnosticsExtension_snapshotFilesystemMetadata_progressHandler___block_invoke_cold_2((uint64_t)v6, v7);
    }

    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
  }
  else if (v5)
  {
    uint64_t v8 = +[NSURL fileURLWithPath:v5];
    uint64_t v9 = *(void *)(a1[5] + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    v11 = shared_diagnostics_extension_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __76__DiskSpaceDiagnosticsExtension_snapshotFilesystemMetadata_progressHandler___block_invoke_cold_1(v11);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v12 = a4;
  id v8 = a3;
  uint64_t v9 = NSStringFromSelector("fractionCompleted");
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    [v12 fractionCompleted];
    objc_msgSend(*((id *)a6 + 1), "setPercentComplete:", fmin(v11 * 100.0, 100.0));
    (*(void (**)(void))(*(void *)a6 + 16))();
  }
}

- (id)attachmentsForParameters:(id)a3 withProgressHandler:(id)a4
{
  id v9 = 0;
  v4 = [(DiskSpaceDiagnosticsExtension *)self snapshotFilesystemMetadata:&v9 progressHandler:a4];
  id v5 = shared_diagnostics_extension_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Path to filesystem metadata snapshot archive: %@, error: %@", buf, 0x16u);
  }

  id v6 = 0;
  if (v4 && !v9)
  {
    v7 = +[DEAttachmentItem attachmentWithPathURL:v4];
    unsigned int v10 = v7;
    id v6 = +[NSArray arrayWithObjects:&v10 count:1];
  }

  return v6;
}

void __76__DiskSpaceDiagnosticsExtension_snapshotFilesystemMetadata_progressHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Snapshot archive path unexpectedly nil with no snapshot error", v1, 2u);
}

void __76__DiskSpaceDiagnosticsExtension_snapshotFilesystemMetadata_progressHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to snapshot filesystem metadata: %@", (uint8_t *)&v2, 0xCu);
}

@end