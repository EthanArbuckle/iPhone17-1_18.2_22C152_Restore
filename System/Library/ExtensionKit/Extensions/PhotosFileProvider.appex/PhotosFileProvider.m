void sub_100004EF4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;

  v5 = [a3 objectForKeyedSubscript:PHImageErrorKey];
  if (a2)
  {
    v6 = *(void **)(a1 + 56);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100005090;
    v9[3] = &unk_100008338;
    v7 = *(void *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    [v6 _saveImageRef:a2 toURL:v7 completionHandler:v9];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Fetching image for asset failed with error: %@ (progress: %@)", buf, 0x16u);
    }
    [*(id *)(a1 + 40) setCompletedUnitCount:100];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100005090(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 setCompletedUnitCount:100];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_1000057B8(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 48) _replaceAssetAtURL:*(void *)(a1 + 32) withItemAtURL:a2 completionHandler:*(void *)(a1 + 40)];
  }
  else {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id sub_1000057E0(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 48) _replaceAssetAtURL:*(void *)(a1 + 32) withItemAtURL:a2 completionHandler:*(void *)(a1 + 40)];
  }
  else {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id sub_100005DB4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addChild:a2 withPendingUnitCount:100];
}

void sub_100005DC4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(void, void))(v6 + 16))(*(void *)(a1 + 40), 0);
  }
  else if (v5)
  {
    (*(void (**)(void, id))(v6 + 16))(*(void *)(a1 + 40), v5);
  }
  else
  {
    id v7 = +[NSError errorWithDomain:@"PFPAssetRequestErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  [*(id *)(a1 + 32) unpublish];
}

void sub_1000060CC(id a1)
{
  v1 = +[NSBundle mainBundle];
  +[CPAnalytics setupWithConfigurationFilename:@"CPAnalyticsConfig-PhotosFileProvider" inBundle:v1];

  v2 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
  +[CPAnalytics setupSystemPropertyProvidersForLibrary:v2];

  +[CPAnalytics activateEventQueue];
  byte_10000C610 = 1;
}

void CFRelease(CFTypeRef cf)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithURL(url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t PXPhotosFileProviderManager()
{
  return _PXPhotosFileProviderManager();
}

uint64_t PXPhotosFileProviderURLQueryItemIdentifierCodeKey()
{
  return _PXPhotosFileProviderURLQueryItemIdentifierCodeKey();
}

uint64_t PXPhotosFileProviderURLQueryItemLibraryIdentifierKey()
{
  return _PXPhotosFileProviderURLQueryItemLibraryIdentifierKey();
}

uint64_t PXPhotosFileProviderURLQueryItemThumbnailSizeKey()
{
  return _PXPhotosFileProviderURLQueryItemThumbnailSizeKey();
}

uint64_t PXPhotosFileProviderURLQueryItemUUIDKey()
{
  return _PXPhotosFileProviderURLQueryItemUUIDKey();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingPathExtension];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_activateEventQueue(void *a1, const char *a2, ...)
{
  return [a1 activateEventQueue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_documentStorageURL(void *a1, const char *a2, ...)
{
  return [a1 documentStorageURL];
}

id objc_msgSend_enableMultiLibraryMode(void *a1, const char *a2, ...)
{
  return [a1 enableMultiLibraryMode];
}

id objc_msgSend_exportConfiguration(void *a1, const char *a2, ...)
{
  return [a1 exportConfiguration];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIdentifier];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_photoLibrary(void *a1, const char *a2, ...)
{
  return [a1 photoLibrary];
}

id objc_msgSend_publish(void *a1, const char *a2, ...)
{
  return [a1 publish];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_sharedMomentSharePhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedMomentSharePhotoLibrary];
}

id objc_msgSend_thumbnailSize(void *a1, const char *a2, ...)
{
  return [a1 thumbnailSize];
}

id objc_msgSend_unpublish(void *a1, const char *a2, ...)
{
  return [a1 unpublish];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}