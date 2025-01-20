void sub_2DA0(id a1)
{
  uint64_t vars8;

  qword_88F8 = [[AXBannerUIServer alloc] _init];

  _objc_release_x1();
}

void sub_2F40(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) bannerPresenter];
  v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"title"];
  v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"message"];
  v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"duration"];
  [v4 doubleValue];
  objc_msgSend(v5, "presentBannerViewWithText:secondaryText:duration:fromUserAction:", v2, v3, 0);
}

void sub_3000(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) bannerPresenter];
  [v1 dismissFloatingView];
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend_bannerPresenter(void *a1, const char *a2, ...)
{
  return [a1 bannerPresenter];
}

id objc_msgSend_bannerViewController(void *a1, const char *a2, ...)
{
  return [a1 bannerViewController];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_dismissFloatingView(void *a1, const char *a2, ...)
{
  return [a1 dismissFloatingView];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}