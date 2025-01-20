void sub_1000036A0(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error Exporting Poster store: %@", (uint8_t *)&v1, 0xCu);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_posterDiagnosticsLogsPath(void *a1, const char *a2, ...)
{
  return [a1 posterDiagnosticsLogsPath];
}

id objc_msgSend_setStripScreenshots_(void *a1, const char *a2, ...)
{
  return [a1 setStripScreenshots:];
}
  v13 = ParamConsentProvidedKey""];

  v26 = (void *)v8;
  if (v13 && ([v13 BOOLValue] & 1) != 0)
  {
    v14 = 0;
    v15 = @"Full Wallpaper Archive";
  }
  else
  {
    v15 = @"Basic Wallpaper Archive";
    v14 = 1;
  }
  [v12 setStripDescriptors:v14];
  [v12 setStripScreenshots:v14];
  [v12 setStripContentsOfConfigurations:v14];
  v16 = [(WallpaperDiagnosticExtension *)self posterDiagnosticsLogsPath];
  v17 = +[NSURL fileURLWithPath:v16 isDirectory:1];
  v18 = +[NSURL fileURLWithPath:@"PBArchive" relativeToURL:v17];

  v19 = [(WallpaperDiagnosticExtension *)self exportDataStoreWithOptions:v12 storingAt:v18];
  if (v19)
  {
    v20 = v26;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000036A0((uint64_t)v19);
    }
  }
  else
  {
    v21 = [v18 path];
    v22 = +[DEAttachmentItem attachmentWithPath:v21];

    [v22 setDisplayName:v15];
    v23 = +[NSNumber numberWithBool:1];
    [v22 setDeleteOnAttach:v23];

    v20 = v26;
    [v26 addObject:v22];
  }
  v24 = [objc_alloc((Class)DECollectionProgress) initWithPercentComplete:100.0];
  v6[2](v6, v24);

  return v20;
}

@end