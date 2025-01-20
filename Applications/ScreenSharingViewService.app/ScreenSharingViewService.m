void sub_100002318(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CFStringRef v6;
  void *v7;

  v1 = a1;
  if (v1)
  {
    v6 = @"pid";
    v2 = +[NSNumber numberWithInt:getpid()];
    v7 = v2;
    v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    [v1 pidNotification:v3];

    v4 = +[NSRunLoop currentRunLoop];
    v5 = +[NSDate dateWithTimeIntervalSinceNow:0.25];
    [v4 runUntilDate:v5];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000048C0();
  }
}

void sub_100002444(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    [v3 pauseResumeResponse:v4];
    v5 = +[NSRunLoop currentRunLoop];
    v6 = +[NSDate dateWithTimeIntervalSinceNow:0.25];
    [v5 runUntilDate:v6];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100004908();
  }
}

void sub_1000026F0(void *a1)
{
}

void sub_1000026FC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) helperToolConnection];
  [v1 setInvalidationHandler:0];
}

void sub_100002744(id a1, NSError *a2)
{
  v2 = a2;
  id v4 = [(NSError *)v2 domain];
  id v3 = [(NSError *)v2 code];

  NSLog(@"connect failed: %@ / %d", v4, v3);
}

id sub_100002CF4(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendResultAndTerminate:2];
}

id sub_100002D00(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendResultAndTerminate:1];
}

id sub_100002D0C(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendResultAndTerminate:0];
}

id sub_100002D18(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendResultAndTerminate:3];
}

uint64_t start(int a1, char **a2)
{
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_10000346C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send result to server", v7, 2u);
  }
  [v3 termsAndConditionsResponse:v4];
  v5 = +[NSRunLoop currentRunLoop];
  v6 = +[NSDate dateWithTimeIntervalSinceNow:0.25];
  [v5 runUntilDate:v6];
}

void sub_1000037BC(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100003764);
  }
  _Unwind_Resume(a1);
}

void sub_1000037D0(id a1)
{
  id v3 = +[UIDevice currentDevice];
  id v1 = [v3 model];
  id v2 = [v1 rangeOfString:@"iPad"];

  if (v2 != (id)0x7FFFFFFFFFFFFFFFLL) {
    byte_10000D758 = 1;
  }
}

void sub_100003854(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "xpc connection invalidated", v3, 2u);
  }
  id v2 = [*(id *)(a1 + 32) helperToolConnection];
  [v2 setInvalidationHandler:0];
}

void sub_1000038D8(id a1, NSError *a2)
{
  id v2 = a2;
  id v4 = [(NSError *)v2 domain];
  id v3 = [(NSError *)v2 code];

  NSLog(@"connect failed: %@ / %d", v4, v3);
}

void sub_100003DF8(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v1 = [*(id *)(a1 + 32) toolbar];
  id v2 = [v1 items];

  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v8 = [v7 title];
        id v9 = [v8 length];

        if (v9)
        {
          v10 = [v7 title];
          v11 = +[NSBundle mainBundle];
          v12 = [v11 localizedStringForKey:@"3Linefeed" value:&stru_100008398 table:0];
          v13 = [v10 stringByAppendingString:v12];
          [v7 setTitle:v13];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

void sub_1000048C0()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "SendPIDToScreenSharingServer called with nil helperTool", v0, 2u);
}

void sub_100004908()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "SBSendPauseResumeResultToScreenSharingServer called with nil helperTool", v0, 2u);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

void exit(int a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_helperTool(void *a1, const char *a2, ...)
{
  return [a1 helperTool];
}

id objc_msgSend_helperToolConnection(void *a1, const char *a2, ...)
{
  return [a1 helperToolConnection];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAppleSupportRequest(void *a1, const char *a2, ...)
{
  return [a1 isAppleSupportRequest];
}

id objc_msgSend_isPausedNumber(void *a1, const char *a2, ...)
{
  return [a1 isPausedNumber];
}

id objc_msgSend_isScreenLockedNumber(void *a1, const char *a2, ...)
{
  return [a1 isScreenLockedNumber];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentationController];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_shareSettingsRequest(void *a1, const char *a2, ...)
{
  return [a1 shareSettingsRequest];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_showControls(void *a1, const char *a2, ...)
{
  return [a1 showControls];
}

id objc_msgSend_terminateWithSuccess(void *a1, const char *a2, ...)
{
  return [a1 terminateWithSuccess];
}

id objc_msgSend_termsHeaderTextView(void *a1, const char *a2, ...)
{
  return [a1 termsHeaderTextView];
}

id objc_msgSend_termsIcon(void *a1, const char *a2, ...)
{
  return [a1 termsIcon];
}

id objc_msgSend_termsSubHeaderTextView(void *a1, const char *a2, ...)
{
  return [a1 termsSubHeaderTextView];
}

id objc_msgSend_termsTextView(void *a1, const char *a2, ...)
{
  return [a1 termsTextView];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_toolbar(void *a1, const char *a2, ...)
{
  return [a1 toolbar];
}

id objc_msgSend_userInfoSet(void *a1, const char *a2, ...)
{
  return [a1 userInfoSet];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewerName(void *a1, const char *a2, ...)
{
  return [a1 viewerName];
}