int main(int argc, const char **argv, const char **envp)
{
  DDAddToRecentsDelegate *v3;
  void *v4;

  v3 = objc_alloc_init(DDAddToRecentsDelegate);
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];
  exit(1);
}

void DDPerformWebSearchFromQuery(void *a1)
{
  id v1 = a1;
  if (qword_100008918 != -1) {
    dispatch_once(&qword_100008918, &stru_100004240);
  }
  if (byte_100008910 == 1)
  {
    v2 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    id v11 = [v1 stringByTrimmingCharactersInSet:v2];

    id v3 = +[DDUISearchWebHandler webSearchURLForQueryString:v11];
    v4 = +[LSApplicationWorkspace defaultWorkspace];
    [v4 openURL:v3 configuration:0 completionHandler:0];
  }
  else
  {
    id v3 = v1;
    v5 = +[NSBundle mainBundle];
    v6 = [v5 bundleIdentifier];
    unsigned int v7 = [v6 isEqualToString:@"com.apple.datadetectors.AddToRecentsService"];

    if (v7)
    {
      NSLog(@"AddToRecentsService couldn't get the default browser");
    }
    else
    {
      id v8 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.datadetectors.AddToRecentsService"];
      v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DDAddToRecentsInterface];
      [v8 setRemoteObjectInterface:v9];

      [v8 resume];
      v10 = [v8 remoteObjectProxy];
      [v10 performWebSearchFromQuery:v3];

      [v8 invalidate];
    }
    id v11 = v3;
  }
}

void sub_100002484(id a1)
{
  id v1 = sub_100002590(@"com.apple.security.exception.shared-preference.read-only");
  if (v1)
  {
    CFArrayRef v2 = v1;
    CFTypeID TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v2))
    {
      v8.length = CFArrayGetCount(v2);
      v8.location = 0;
      if (CFArrayContainsValue(v2, v8, @"com.apple.mobilesafarishared")) {
        byte_100008910 = 1;
      }
    }
    CFRelease(v2);
  }
  if ((byte_100008910 & 1) == 0)
  {
    v4 = sub_100002590(@"com.apple.security.exception.shared-preference.read-write");
    if (v4)
    {
      CFArrayRef v5 = v4;
      CFTypeID v6 = CFArrayGetTypeID();
      if (v6 == CFGetTypeID(v5))
      {
        v9.length = CFArrayGetCount(v5);
        v9.location = 0;
        if (CFArrayContainsValue(v5, v9, @"com.apple.mobilesafarishared")) {
          byte_100008910 = 1;
        }
      }
      CFRelease(v5);
    }
  }
}

__SecTask *sub_100002590(const __CFString *a1)
{
  result = SecTaskCreateFromSelf(kCFAllocatorDefault);
  if (result)
  {
    id v3 = result;
    CFTypeRef v4 = SecTaskCopyValueForEntitlement(result, a1, 0);
    CFRelease(v3);
    return (__SecTask *)v4;
  }
  return result;
}

void sub_100002B78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void sub_100002B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002CF0(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Trying to add unhandled result %@", (uint8_t *)&v1, 0xCu);
}

void sub_100002D70(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Could not extract a phone number from %@", (uint8_t *)&v1, 0xCu);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return _CFBundleGetIdentifier(bundle);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t DDResultGetCategory()
{
  return _DDResultGetCategory();
}

void NSLog(NSString *format, ...)
{
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return _SecTaskCreateFromSelf(allocator);
}

uint64_t TUFormattedPhoneNumber()
{
  return _TUFormattedPhoneNumber();
}

uint64_t _CFBundleCreateWithExecutableURLIfMightBeBundle()
{
  return __CFBundleCreateWithExecutableURLIfMightBeBundle();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_coreResult(void *a1, const char *a2, ...)
{
  return [a1 coreResult];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultInstance(void *a1, const char *a2, ...)
{
  return [a1 defaultInstance];
}

id objc_msgSend_defaultSearchEngine(void *a1, const char *a2, ...)
{
  return [a1 defaultSearchEngine];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_matchedString(void *a1, const char *a2, ...)
{
  return [a1 matchedString];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_reloadSearchEngines(void *a1, const char *a2, ...)
{
  return [a1 reloadSearchEngines];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}