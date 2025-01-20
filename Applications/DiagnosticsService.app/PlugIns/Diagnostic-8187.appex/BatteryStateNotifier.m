@interface BatteryStateNotifier
+ (BOOL)disableUSBCharging;
+ (BOOL)enableUSBCharging;
+ (void)registerForBatteryEvents;
+ (void)unregisterForBatteryEvents;
@end

@implementation BatteryStateNotifier

+ (void)registerForBatteryEvents
{
  io_iterator_t notification = 0;
  v2 = IONotificationPortCreate(kIOMainPortDefault);
  qword_10001A7A0 = (uint64_t)v2;
  if (!v2)
  {
    v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000CD00();
    }
    goto LABEL_11;
  }
  CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(v2);
  if (!RunLoopSource)
  {
    IONotificationPortDestroy((IONotificationPortRef)qword_10001A7A0);
    qword_10001A7A0 = 0;
    v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000CD34();
    }
LABEL_11:

    return;
  }
  v4 = RunLoopSource;
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, v4, kCFRunLoopCommonModes);
  v6 = (IONotificationPort *)qword_10001A7A0;
  CFDictionaryRef v7 = IOServiceMatching("IOPMPowerSource");
  LODWORD(v6) = IOServiceAddMatchingNotification(v6, "IOServiceFirstMatch", v7, (IOServiceMatchingCallback)sub_100008A5C, &qword_10001A7A0, &notification);
  v8 = DiagnosticLogHandleForCategory();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000CD68();
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Registered for battery status changes: added matching notification", v11, 2u);
    }

    sub_100008A5C((IONotificationPort **)&qword_10001A7A0, notification);
  }
  IOObjectRelease(notification);
}

+ (void)unregisterForBatteryEvents
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Unregistering for battery status changes", v9, 2u);
  }

  if (dword_10001A7A8)
  {
    v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10000CE78();
    }

    IOObjectRelease(dword_10001A7A8);
    dword_10001A7A8 = 0;
  }
  if (qword_10001A7A0)
  {
    CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_10001A7A0);
    if (RunLoopSource)
    {
      v5 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, v5, kCFRunLoopCommonModes);
      CFDictionaryRef v7 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_10000CE44();
      }
    }
    else
    {
      CFDictionaryRef v7 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000CE10();
      }
    }

    v8 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10000CDDC();
    }

    IONotificationPortDestroy((IONotificationPortRef)qword_10001A7A0);
    qword_10001A7A0 = 0;
  }
}

+ (BOOL)disableUSBCharging
{
  kern_return_t v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  io_service_t v10;

  CFDictionaryRef v2 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    CFDictionarySetValue(Mutable, @"FieldDiagsInflowInhibit", kCFBooleanTrue);
    v5 = IORegistryEntrySetCFProperties(MatchingService, Mutable);
    CFRelease(Mutable);
    if (v5)
    {
      v6 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 67109120;
        v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unable to disable charging. Reason: 0x%x", (uint8_t *)&v9, 8u);
      }

      io_service_t MatchingService = 0;
    }
    else
    {
      io_service_t MatchingService = 1;
    }
  }
  CFDictionaryRef v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 67109120;
    v10 = MatchingService;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully disabled charging: %d", (uint8_t *)&v9, 8u);
  }

  return MatchingService;
}

+ (BOOL)enableUSBCharging
{
  kern_return_t v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  io_service_t v10;

  CFDictionaryRef v2 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    CFDictionarySetValue(Mutable, @"FieldDiagsInflowInhibit", kCFBooleanFalse);
    v5 = IORegistryEntrySetCFProperties(MatchingService, Mutable);
    CFRelease(Mutable);
    if (v5)
    {
      v6 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 67109120;
        v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unable to resume charging. Reason: 0x%x", (uint8_t *)&v9, 8u);
      }

      io_service_t MatchingService = 0;
    }
    else
    {
      io_service_t MatchingService = 1;
    }
  }
  CFDictionaryRef v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 67109120;
    v10 = MatchingService;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully enabled charging: %d", (uint8_t *)&v9, 8u);
  }

  return MatchingService;
}

@end