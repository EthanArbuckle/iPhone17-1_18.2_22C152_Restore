void sub_3344(uint64_t a1, void *a2, const void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const void *v10;

  v4 = a2;
  v5 = _IOHIDLogCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "MotionEventSessionFilter CFNotification: %@\n", (uint8_t *)&v9, 0xCu);
  }

  if (CFEqual(a3, @"com.apple.LocalAuthentication.ui.presented"))
  {
    [v4 setLAUIActive:1];
    v6 = [v4 session];
    v7 = v6;
    v8 = &__kCFBooleanTrue;
LABEL_7:
    [v6 setProperty:v8 forKey:@"MotionEventRestricted"];

    goto LABEL_8;
  }
  if (CFEqual(a3, @"com.apple.LocalAuthentication.ui.dismissed"))
  {
    [v4 setLAUIActive:0];
    v6 = [v4 session];
    v7 = v6;
    v8 = &__kCFBooleanFalse;
    goto LABEL_7;
  }
LABEL_8:
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

uint64_t IOHIDEventSystemConnectionGetEntitlements()
{
  return _IOHIDEventSystemConnectionGetEntitlements();
}

uint64_t _IOHIDLogCategory()
{
  return __IOHIDLogCategory();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_LAUIActive(void *a1, const char *a2, ...)
{
  return [a1 LAUIActive];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}
->_LAUIActive = 0;
    v9 = v7;
  }

  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IOHIDMotionEventSessionFilter;
  [(IOHIDMotionEventSessionFilter *)&v2 dealloc];
}

- (void)activate
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_3344, @"com.apple.LocalAuthentication.ui.presented", 0, (CFNotificationSuspensionBehavior)0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)sub_3344, @"com.apple.LocalAuthentication.ui.dismissed", 0, (CFNotificationSuspensionBehavior)0);
  id v5 = [(IOHIDMotionEventSessionFilter *)self session];
  [v5 setProperty:&__kCFBooleanFalse forKey:@"MotionEventRestricted"];
}

- (void)setDispatchQueue:(id)a3
{
}

- (HIDSession)session
{
  return self->_session;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setLAUIActive:(BOOL)a3
{
  self->_LAUIActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end