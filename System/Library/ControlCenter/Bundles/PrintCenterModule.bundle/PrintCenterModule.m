void sub_3C50(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t vars8;

  v4 = objc_alloc_init((Class)_LSOpenConfiguration);
  v2 = [*(id *)(a1 + 32) _launchOptions];
  [v4 setFrontBoardOptions:v2];

  v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openApplicationWithBundleIdentifier:@"com.apple.printcenter" usingConfiguration:v4 completionHandler:&stru_4080];
}

void sub_3CEC(id a1, BOOL a2, NSError *a3)
{
  if (!a2) {
    NSLog(@"CCPrintCenterModule: Failed to launch PrintCenter.ios %@", a3);
  }
}

void NSLog(NSString *format, ...)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

id objc_msgSend__launchOptions(void *a1, const char *a2, ...)
{
  return [a1 _launchOptions];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_setFrontBoardOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrontBoardOptions:");
}