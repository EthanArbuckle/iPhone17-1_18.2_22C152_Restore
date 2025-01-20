void sub_100004F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id sub_100005264(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 40) isEqualToString:@"ExtensionAlertKeyCompletionActionInstall"])
  {
    v2 = SUSUILogExtension();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 96);
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Installing from countdown with install options %@", buf, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    uint64_t v6 = *(void *)(v4 + 96);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100005420;
    v9[3] = &unk_100008198;
    v9[4] = v4;
    return [v5 installUpdateWithInstallOptions:v6 withResult:v9];
  }
  else
  {
    id result = [*(id *)(*(void *)(a1 + 32) + 40) isEqualToString:@"ExtensionAlertKeyCompletionActionReboot"];
    if (result)
    {
      v8 = SUSUILogExtension();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Rebooting from countdown", buf, 2u);
      }

      [*(id *)(a1 + 32) reboot];
      return [*(id *)(a1 + 32) invalidate];
    }
  }
  return result;
}

id sub_100005420(uint64_t a1, int a2)
{
  uint64_t v4 = SUSUILogExtension();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"failed";
    if (a2) {
      CFStringRef v5 = @"Success";
    }
    int v7 = 138412290;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Installation id result = %@", (uint8_t *)&v7, 0xCu);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_100005998(id a1)
{
  qword_10000CDA8 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServicesUI.framework/Plugins/SoftwareUpdateServicesUIPlugin.servicebundle"];

  _objc_release_x1();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t SUSUILogExtension()
{
  return _SUSUILogExtension();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__clearCountdownTimer(void *a1, const char *a2, ...)
{
  return [a1 _clearCountdownTimer];
}

id objc_msgSend__createView(void *a1, const char *a2, ...)
{
  return [a1 _createView];
}

id objc_msgSend__messageTextWithCountdown(void *a1, const char *a2, ...)
{
  return [a1 _messageTextWithCountdown];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_reboot(void *a1, const char *a2, ...)
{
  return [a1 reboot];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}