void sub_100003008(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100003028(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id _HGObjCLoggingFacility(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000030E8;
  block[3] = &unk_1000041A0;
  block[4] = a1;
  if (qword_1000081E8 != -1) {
    dispatch_once(&qword_1000081E8, block);
  }
  v1 = (void *)qword_1000081E0;
  return v1;
}

uint64_t sub_1000030E8(uint64_t a1)
{
  qword_1000081E0 = (uint64_t)os_log_create("com.apple.HeadGestures", *(const char **)(a1 + 32));
  return _objc_release_x1();
}

void sub_100003128(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't create BomCopier for zipping", v1, 2u);
}

void sub_10000316C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error copying and zipping", v1, 2u);
}

void sub_1000031B0(void *a1, void *a2)
{
  id v3 = [a1 localizedDescription];
  [v3 UTF8String];
  [a2 UTF8String];
  sub_100002FF0();
  sub_100003008((void *)&_mh_execute_header, v4, v5, "failed to removeItem error: %s at %s", v6, v7, v8, v9, v10);
}

void sub_100003258(void *a1)
{
  [a1 UTF8String];
  sub_100003028((void *)&_mh_execute_header, v1, v2, "failed to create zip: %s", v3, v4, v5, v6, 2u);
}

void sub_1000032D8(void *a1, void *a2)
{
  id v3 = [a1 localizedDescription];
  [v3 UTF8String];
  [a2 UTF8String];
  sub_100002FF0();
  sub_100003008((void *)&_mh_execute_header, v4, v5, "failed to removeItem error: %s at: %s", v6, v7, v8, v9, v10);
}

uint64_t BOMCopierCopyWithOptions()
{
  return _BOMCopierCopyWithOptions();
}

uint64_t BOMCopierFree()
{
  return _BOMCopierFree();
}

uint64_t BOMCopierNew()
{
  return _BOMCopierNew();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
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

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_attachmentList(void *a1, const char *a2, ...)
{
  return [a1 attachmentList];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filesize(void *a1, const char *a2, ...)
{
  return [a1 filesize];
}

id objc_msgSend_generateTimeStamp(void *a1, const char *a2, ...)
{
  return [a1 generateTimeStamp];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}