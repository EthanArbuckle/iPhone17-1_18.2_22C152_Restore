id sub_100003574(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t vars8;

  [*(id *)(a1 + 32) _setupWebView];
  [*(id *)(a1 + 32) _configureWebView];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 webView];
  [v3 setNavigationDelegate:v2];

  v4 = [*(id *)(a1 + 32) webView];
  v5 = [*(id *)(a1 + 32) item];
  v6 = [v5 fileData];
  v7 = [*(id *)(a1 + 32) item];
  v8 = [v7 contentType];
  v9 = [v8 preferredMIMEType];
  v10 = objc_opt_new();
  v11 = [v4 loadData:v6 MIMEType:v9 characterEncodingName:@"UTF-8" baseURL:v10];

  [*(id *)(a1 + 32) _setupLoadTimeoutTimer];
  [*(id *)(a1 + 32) setStartedLoad:1];
  v12 = *(void **)(a1 + 32);
  v13 = *(void *)(a1 + 40);

  return [v12 setLoadCompletion:v13];
}

void sub_100003B60(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = [*(id *)(a1 + 40) paginationManager];

    if (v4)
    {
      if (!v5)
      {
        v6 = [QLWebPaginationManager alloc];
        uint64_t v7 = *(void *)(a1 + 32);
        v8 = [*(id *)(a1 + 40) webView];
        v9 = [(QLWebPaginationManager *)v6 initWithPageElementXPath:v7 webview:v8];
        [*(id *)(a1 + 40) setPaginationManager:v9];
      }
      v10 = [*(id *)(a1 + 40) paginationManager];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100003D64;
      v29[3] = &unk_100008368;
      v12 = *(void **)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 56);
      v29[4] = *(void *)(a1 + 40);
      uint64_t v31 = v11;
      id v30 = v12;
      [v10 processPageGeometryFromXpath:v29];
    }
    else
    {
      if (!v5)
      {
        v13 = [QLWebPaginationManager alloc];
        [*(id *)(a1 + 40) previewSize];
        double v15 = v14;
        double v17 = v16;
        v18 = [*(id *)(a1 + 40) webView];
        v19 = -[QLWebPaginationManager initWithPageSize:webview:](v13, "initWithPageSize:webview:", v18, v15, v17);
        [*(id *)(a1 + 40) setPaginationManager:v19];
      }
      v20 = [*(id *)(a1 + 40) paginationManager];
      [v20 pageRectForPage:*(void *)(a1 + 56)];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;

      objc_msgSend(*(id *)(a1 + 40), "_requestSnapshotThumbnailForRect:completion:", *(void *)(a1 + 48), v22, v24, v26, v28);
    }
  }
}

id sub_100003D64(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) paginationManager];
  [v2 pageRectForPage:*(void *)(a1 + 48)];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);

  return objc_msgSend(v11, "_requestSnapshotThumbnailForRect:completion:", v12, v4, v6, v8, v10);
}

void sub_100003E78(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) webView];
  [v4 bounds];
  double v3 = v2;
  [v4 bounds];
  objc_msgSend(*(id *)(a1 + 32), "_requestSnapshotThumbnailForRect:completion:", *(void *)(a1 + 40), 0.0, 0.0, v3);
}

uint64_t sub_100004074(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004194(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004790(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setPageFrames:a2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_100004A94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = objc_opt_new();
  if (v5)
  {
    uint64_t v26 = a1;
    id v27 = v6;
    id v28 = v5;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "objectForKeyedSubscript:", @"x", v26, v27, v28);
          [v13 floatValue];
          double v15 = v14;

          double v16 = [v12 objectForKeyedSubscript:@"y"];
          [v16 floatValue];
          double v18 = v17;

          v19 = [v12 objectForKeyedSubscript:@"width"];
          [v19 floatValue];
          double v21 = v20;

          double v22 = [v12 objectForKeyedSubscript:@"height"];
          [v22 floatValue];
          double v24 = v23;

          double v25 = +[NSValue valueWithRect:](NSValue, "valueWithRect:", v15, v18, v21, v24);
          [v7 addObject:v25];
        }
        id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v9);
    }

    id v6 = v27;
    id v5 = v28;
    a1 = v26;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_100005130(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005140(uint64_t a1)
{
}

id sub_100005148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _sendReplyFor:*(void *)(a1 + 40) fromCGImage:a2 extension:*(void *)(a1 + 48) error:a3 completionHandler:*(void *)(a1 + 56)];
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

  return [v4 cleanup];
}

id sub_10000519C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _sendReplyFor:*(void *)(a1 + 40) fromCGImage:a2 extension:*(void *)(a1 + 48) error:a3 completionHandler:*(void *)(a1 + 56)];
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

  return [v4 cleanup];
}

uint64_t sub_100005384(uint64_t a1, CGContextRef c)
{
  CGContextScaleCTM(c, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 32));
  CGContextSetInterpolationQuality(c, kCGInterpolationHigh);
  v5.origin.x = CGPointZero.x;
  v5.origin.y = CGPointZero.y;
  v5.size.width = *(CGFloat *)(a1 + 40);
  v5.size.height = *(CGFloat *)(a1 + 48);
  CGContextDrawImage(c, v5, *(CGImageRef *)(a1 + 56));
  CGImageRelease(*(CGImageRef *)(a1 + 56));
  return 1;
}

void sub_1000053EC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "processPageGeometryFromXpath needs to be called before pageRectForPage if using pageElementXPath", v1, 2u);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return _CGImageGetColorSpace(image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return _CGImageRetain(image);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return _CGSizeMakeWithDictionaryRepresentation(dict, size);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t QLTInitLogging()
{
  return _QLTInitLogging();
}

uint64_t WKContextSetCacheModel()
{
  return _WKContextSetCacheModel();
}

uint64_t WKPreferencesSetDatabasesEnabled()
{
  return _WKPreferencesSetDatabasesEnabled();
}

uint64_t WKPreferencesSetEncodingDetectorEnabled()
{
  return _WKPreferencesSetEncodingDetectorEnabled();
}

uint64_t WKPreferencesSetLocalStorageEnabled()
{
  return _WKPreferencesSetLocalStorageEnabled();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__configureWebView(void *a1, const char *a2, ...)
{
  return [a1 _configureWebView];
}

id objc_msgSend__setupLoadTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 _setupLoadTimeoutTimer];
}

id objc_msgSend__setupWebView(void *a1, const char *a2, ...)
{
  return [a1 _setupWebView];
}

id objc_msgSend__teardownLoadTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 _teardownLoadTimeoutTimer];
}

id objc_msgSend_allWebsiteDataTypes(void *a1, const char *a2, ...)
{
  return [a1 allWebsiteDataTypes];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultClientWorld(void *a1, const char *a2, ...)
{
  return [a1 defaultClientWorld];
}

id objc_msgSend_didFinish(void *a1, const char *a2, ...)
{
  return [a1 didFinish];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_fileData(void *a1, const char *a2, ...)
{
  return [a1 fileData];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_generationData(void *a1, const char *a2, ...)
{
  return [a1 generationData];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadCompletion(void *a1, const char *a2, ...)
{
  return [a1 loadCompletion];
}

id objc_msgSend_loaded(void *a1, const char *a2, ...)
{
  return [a1 loaded];
}

id objc_msgSend_loadingTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 loadingTimeoutTimer];
}

id objc_msgSend_maximumSize(void *a1, const char *a2, ...)
{
  return [a1 maximumSize];
}

id objc_msgSend_nonPersistentDataStore(void *a1, const char *a2, ...)
{
  return [a1 nonPersistentDataStore];
}

id objc_msgSend_pageElementXPath(void *a1, const char *a2, ...)
{
  return [a1 pageElementXPath];
}

id objc_msgSend_pageFrames(void *a1, const char *a2, ...)
{
  return [a1 pageFrames];
}

id objc_msgSend_pageSize(void *a1, const char *a2, ...)
{
  return [a1 pageSize];
}

id objc_msgSend_paginationManager(void *a1, const char *a2, ...)
{
  return [a1 paginationManager];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_preferences(void *a1, const char *a2, ...)
{
  return [a1 preferences];
}

id objc_msgSend_preferredMIMEType(void *a1, const char *a2, ...)
{
  return [a1 preferredMIMEType];
}

id objc_msgSend_previewSize(void *a1, const char *a2, ...)
{
  return [a1 previewSize];
}

id objc_msgSend_processPool(void *a1, const char *a2, ...)
{
  return [a1 processPool];
}

id objc_msgSend_rectValue(void *a1, const char *a2, ...)
{
  return [a1 rectValue];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_startedLoad(void *a1, const char *a2, ...)
{
  return [a1 startedLoad];
}

id objc_msgSend_webView(void *a1, const char *a2, ...)
{
  return [a1 webView];
}

id objc_msgSend_websiteDataStore(void *a1, const char *a2, ...)
{
  return [a1 websiteDataStore];
}

id objc_msgSend_webview(void *a1, const char *a2, ...)
{
  return [a1 webview];
}