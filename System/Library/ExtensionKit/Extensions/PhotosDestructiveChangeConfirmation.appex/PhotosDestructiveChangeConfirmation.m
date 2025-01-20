void sub_100001AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100001ABC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100001ACC(uint64_t a1)
{
}

void sub_100001AD4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    [*(id *)(a1 + 32) setDeliveryMode:2];
    v5 = +[PHImageManager defaultManager];
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100001BB4;
    v9[3] = &unk_1000041E8;
    v9[4] = *(void *)(a1 + 48);
    objc_msgSend(v5, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, v6, v8, v9, *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
}

void sub_100001BB4(uint64_t a1, void *a2)
{
}

void sub_100002510(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002534(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002544(uint64_t a1)
{
}

void sub_10000254C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    [*(id *)(a1 + 32) setDeliveryMode:2];
    v5 = +[PHImageManager defaultManager];
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002690;
    v9[3] = &unk_1000041E8;
    v9[4] = *(void *)(a1 + 48);
    objc_msgSend(v5, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, v6, v8, v9, *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
}

intptr_t sub_10000262C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[PLVideoTranscoder generatePosterFrameForAVAsset:maxSize:error:](PLVideoTranscoder, "generatePosterFrameForAVAsset:maxSize:error:", a2, 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void sub_100002690(uint64_t a1, void *a2)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t PLCreateImageFromFileWithFormat()
{
  return _PLCreateImageFromFileWithFormat();
}

uint64_t PLUIGetLog()
{
  return _PLUIGetLog();
}

uint64_t PUPixelSizeFromPointSize()
{
  return _PUPixelSizeFromPointSize();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_assetLocalIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 assetLocalIdentifiers];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return [a1 mediaType];
}

id objc_msgSend_numberOfVisibleItems(void *a1, const char *a2, ...)
{
  return [a1 numberOfVisibleItems];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_photoLibraryURL(void *a1, const char *a2, ...)
{
  return [a1 photoLibraryURL];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_renderedContentURLs(void *a1, const char *a2, ...)
{
  return [a1 renderedContentURLs];
}

id objc_msgSend_stackPerspectiveOffset(void *a1, const char *a2, ...)
{
  return [a1 stackPerspectiveOffset];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}