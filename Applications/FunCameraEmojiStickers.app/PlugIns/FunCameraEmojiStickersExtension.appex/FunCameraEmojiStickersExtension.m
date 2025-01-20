void sub_100001B48(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t vars8;

  v3 = [*(id *)(a1 + 32) stickerBrowserViewController];
  [v3 reloadStickerAtIndex:a2];
}

void sub_1000026C0(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 view];
  v4 = [v6 layer];
  id v5 = [v3 CGContext];

  [v4 renderInContext:v5];
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend__startAnimating(void *a1, const char *a2, ...)
{
  return [a1 _startAnimating];
}

id objc_msgSend__stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 _stopAnimating];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return [a1 contentOffset];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_effectTypeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectTypeIdentifier];
}

id objc_msgSend_initEffectRegistry(void *a1, const char *a2, ...)
{
  return [a1 initEffectRegistry];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_prepareForSnapshotting(void *a1, const char *a2, ...)
{
  return [a1 prepareForSnapshotting];
}

id objc_msgSend_previewUrl(void *a1, const char *a2, ...)
{
  return [a1 previewUrl];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_stickerBrowser(void *a1, const char *a2, ...)
{
  return [a1 stickerBrowser];
}

id objc_msgSend_stickerBrowserViewController(void *a1, const char *a2, ...)
{
  return [a1 stickerBrowserViewController];
}

id objc_msgSend_stickerCache(void *a1, const char *a2, ...)
{
  return [a1 stickerCache];
}

id objc_msgSend_stickerSize(void *a1, const char *a2, ...)
{
  return [a1 stickerSize];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}