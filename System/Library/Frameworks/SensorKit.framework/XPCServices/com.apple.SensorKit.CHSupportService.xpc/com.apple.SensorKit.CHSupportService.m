void start()
{
  NSObject *v0;

  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  [[[SRCHSupportService alloc] initWithQueue:dispatch_queue_create("com.apple.SRCHSupportService.main", v0)] resume];
  dispatch_main();
}

void sub_100002008(id a1)
{
  v1 = qword_100008930;
  if (os_log_type_enabled((os_log_t)qword_100008930, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Client connection has invalidated.", v2, 2u);
  }
}

uint64_t sub_10000218C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

CFStringRef sub_1000023B0(uint64_t a1)
{
  if (a1 >= 4096)
  {
    if (os_variant_has_internal_content())
    {
      if (a1 >= 12288)
      {
        switch(a1)
        {
          case 12288:
            CFStringRef result = @"Writer Not Monitoring";
            break;
          case 12289:
            CFStringRef result = @"Writer Not Authorized";
            break;
          case 12290:
            CFStringRef result = @"Writer Input was invalid";
            break;
          case 12291:
            CFStringRef result = @"No available memory mapped to write sample";
            break;
          case 12292:
            CFStringRef result = @"Provided sample is out of order from previous samples";
            break;
          case 12293:
            CFStringRef result = @"Provided sample is too large";
            break;
          case 12294:
            CFStringRef result = @"Framework datastore state is invalid";
            break;
          case 12295:
            CFStringRef result = @"Writer does not have explicit authorization";
            break;
          case 12296:
            CFStringRef result = @"Provided sample is from the future";
            break;
          default:
            if ((unint64_t)(a1 - 20480) < 5 || a1 != 0x4000) {
              return 0;
            }
            CFStringRef result = @"Sensor Configuration is invalid";
            break;
        }
        return result;
      }
      if (a1 >= 0x2000)
      {
        switch(a1)
        {
          case 8192:
            CFStringRef result = @"No space available to write samples";
            break;
          case 8193:
            CFStringRef result = @"Connection Not Found";
            break;
          case 8194:
            CFStringRef result = @"Internal Error";
            break;
          case 8195:
            CFStringRef result = @"Prompt Busy";
            break;
          case 8196:
            CFStringRef result = @"Prompt is cancelled";
            break;
          case 8198:
            CFStringRef result = @"No device identifier could be found";
            break;
          case 8199:
            CFStringRef result = @"Time synchronization state is invalid";
            break;
          case 8200:
            CFStringRef result = @"The requested bundle authorization is being requested for could not be found";
            break;
          case 8201:
            CFStringRef result = @"No new authorization groups were requested";
            break;
          default:
            return 0;
        }
        return result;
      }
      switch(a1)
      {
        case 4096:
          return @"Required app is not installed";
        case 4097:
          return @"Required onboarding not completed";
        case 4098:
          return @"Global setting not enabled";
      }
    }
    return 0;
  }
  switch(a1)
  {
    case 0:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorInvalidEntitlement";
      break;
    case 1:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorNoAuthorization";
      break;
    case 2:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorDataInaccessible";
      break;
    case 3:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorFetchRequestInvalid";
      break;
    case 4:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorPromptDeclined";
      break;
    default:
      return 0;
  }

  return (const __CFString *)[(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1000041B0 table:0];
}

NSString *sub_100002714(uint64_t a1)
{
  if (a1 == 1)
  {
    CFStringRef v1 = @"SRErrorNoAuthorizationRecovery";
  }
  else
  {
    if (a1 != 2) {
      return 0;
    }
    CFStringRef v1 = @"SRErrorDataInaccessibleRecovery";
  }
  v2 = +[NSBundle bundleForClass:objc_opt_class()];

  return [(NSBundle *)v2 localizedStringForKey:v1 value:&stru_1000041B0 table:0];
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_main(void)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_customCategories(void *a1, const char *a2, ...)
{
  return [a1 customCategories];
}

id objc_msgSend_downloadDatabaseAssetIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 downloadDatabaseAssetIfNeeded];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_semanticVersion(void *a1, const char *a2, ...)
{
  return [a1 semanticVersion];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}