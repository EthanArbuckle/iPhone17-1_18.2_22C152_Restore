id LoggingAWCSF()
{
  void *v0;
  uint64_t vars8;

  if (qword_CE10 != -1) {
    dispatch_once(&qword_CE10, &stru_8250);
  }
  v0 = (void *)qword_CE08;
  return v0;
}

void sub_33CC(id a1)
{
  qword_CE08 = (uint64_t)os_log_create("com.apple.AppleWirelessChargingServiceFilter", "backboard");
  _objc_release_x1();
}

void sub_4610(void *a1, io_registry_entry_t a2, int a3)
{
  v5 = a1;
  if (!v5) {
    goto LABEL_22;
  }
  v16 = v5;
  dispatch_assert_queue_V2(v5[2]);
  v5 = v16;
  if (a3 != -536870608) {
    goto LABEL_22;
  }
  CFBooleanRef CFProperty = (CFBooleanRef)IORegistryEntryCreateCFProperty(a2, @"FrontIRCameraActive", kCFAllocatorDefault, 0);
  CFBooleanRef v7 = (CFBooleanRef)IORegistryEntryCreateCFProperty(a2, @"FrontCameraActive", kCFAllocatorDefault, 0);
  CFBooleanRef v8 = (CFBooleanRef)IORegistryEntryCreateCFProperty(a2, @"BackCameraActive", kCFAllocatorDefault, 0);
  if (CFProperty && (CFTypeID v9 = CFGetTypeID(CFProperty), v9 == CFBooleanGetTypeID()))
  {
    BOOL v10 = CFProperty == kCFBooleanTrue;
    if (!v7) {
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v10 = 0;
    if (!v7) {
      goto LABEL_11;
    }
  }
  CFTypeID v11 = CFGetTypeID(v7);
  if (v11 == CFBooleanGetTypeID())
  {
    BOOL v12 = v7 == kCFBooleanTrue;
    if (!v8) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
LABEL_11:
  BOOL v12 = 0;
  if (!v8)
  {
LABEL_14:
    BOOL v14 = 0;
    goto LABEL_15;
  }
LABEL_12:
  CFTypeID v13 = CFGetTypeID(v8);
  if (v13 != CFBooleanGetTypeID()) {
    goto LABEL_14;
  }
  BOOL v14 = v8 == kCFBooleanTrue;
LABEL_15:
  v15 = +[NSDate now];
  sub_4FA4(v16[2], @"FrontIR    ", (unsigned char *)v16 + 52, v10, (id *)v16 + 7, v15, (double *)v16 + 10);
  sub_4FA4(v16[2], @"FrontCamera", (unsigned char *)v16 + 53, v12, (id *)v16 + 8, v15, (double *)v16 + 11);
  sub_4FA4(v16[2], @"BackCamera ", (unsigned char *)v16 + 54, v14, (id *)v16 + 9, v15, (double *)v16 + 12);
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v8) {
    CFRelease(v8);
  }

  v5 = v16;
LABEL_22:
}

void sub_4DA0(double a1, double a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v10 = a4;
  BOOL v12 = LoggingAWCSF();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v22 = "-[AppleWirelessChargingServiceFilter handleB332Detachment]_block_invoke";
    __int16 v23 = 1024;
    int v24 = 418;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2048;
    double v28 = a1;
    __int16 v29 = 2048;
    float v11 = a1 * 100.0 / a2;
    double v30 = v11;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%s line %d [CAData prepared: %@: cameraUsageDuration = %lf, cameraUsagePercentage = %f%%]", buf, 0x30u);
  }

  *(float *)&double v13 = a1 * 100.0 / a2;
  BOOL v14 = +[NSNumber numberWithFloat:v13, @"Blocked_Percentage"];
  v20[0] = v14;
  v19[1] = @"Camera_Type";
  v15 = +[NSNumber numberWithInt:a5];
  v20[1] = v15;
  v19[2] = @"Pencil_Attach_Duration";
  v16 = +[NSNumber numberWithDouble:a2];
  v20[2] = v16;
  v19[3] = @"PencilSOC";
  v17 = +[NSNumber numberWithInteger:a6];
  v20[3] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  AnalyticsSendEvent();
}

void sub_4FA4(NSObject *a1, void *a2, unsigned char *a3, int a4, id *a5, void *a6, double *a7)
{
  id v13 = a2;
  id v14 = a6;
  dispatch_assert_queue_V2(a1);
  if (v13 && a3 && a5 && v14 && a7 && *a3 != a4)
  {
    *a3 = a4;
    id v15 = *a5;
    objc_storeStrong(a5, a6);
    if (*a3)
    {
LABEL_18:

      goto LABEL_19;
    }
    if (v15)
    {
      [*a5 timeIntervalSinceDate:v15];
      double v17 = v16;
      if (v16 < 0.0)
      {
        v18 = LoggingAWCSF();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_5C84((uint64_t)v13, v18);
        }

        goto LABEL_15;
      }
    }
    else
    {
      double v17 = 0.0;
    }
    *a7 = v17 + *a7;
LABEL_15:
    v19 = LoggingAWCSF();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = *a7;
      int v21 = 136316162;
      v22 = "void checkActiveStatusUpdate(__strong dispatch_queue_t, NSString *__strong, _Bool *, _Bool, NSDate *__strong"
            " *, NSDate *__strong, NSTimeInterval *)";
      __int16 v23 = 1024;
      int v24 = 485;
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2048;
      double v28 = v17;
      __int16 v29 = 2048;
      double v30 = v20;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%s line %d [%@: duration: %lf, totalDuration: %lf]", (uint8_t *)&v21, 0x30u);
    }

    goto LABEL_18;
  }
LABEL_19:
}

void sub_5568(uint64_t a1)
{
  v2 = LoggingAWCSF();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[AppleWirelessChargingServiceFilter cancel]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 544;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%s line %d [calling cancel handler]", (uint8_t *)&v5, 0x12u);
  }

  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;
}

void sub_5A78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_5A94()
{
  sub_5A64();
  sub_5A78(&dword_0, v0, v1, "%s line %d [Framework BatteryCenter not present]", v2, v3, v4, v5, v6);
}

void sub_5B10()
{
  sub_5A64();
  sub_5A78(&dword_0, v0, v1, "%s line %d [Class BCBatteryDeviceController not present in Framework BatteryCenter]", v2, v3, v4, v5, v6);
}

void sub_5B8C()
{
  sub_5A64();
  sub_5A78(&dword_0, v0, v1, "%s line %d [Camera service not found]", v2, v3, v4, v5, v6);
}

void sub_5C08()
{
  sub_5A64();
  sub_5A78(&dword_0, v0, v1, "%s line %d [Camera interest notification is not added successfully]", v2, v3, v4, v5, v6);
}

void sub_5C84(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "void checkActiveStatusUpdate(__strong dispatch_queue_t, NSString *__strong, _Bool *, _Bool, NSDate *__strong *, N"
       "SDate *__strong, NSTimeInterval *)";
  __int16 v4 = 1024;
  int v5 = 482;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s line %d [%@: duration is negative]", (uint8_t *)&v2, 0x1Cu);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t IOHIDEventGetDataValue()
{
  return _IOHIDEventGetDataValue();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return _dlclose(__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_accessoryCategory(void *a1, const char *a2, ...)
{
  return [a1 accessoryCategory];
}

id objc_msgSend_batteryController(void *a1, const char *a2, ...)
{
  return [a1 batteryController];
}

id objc_msgSend_batteryPercentage(void *a1, const char *a2, ...)
{
  return [a1 batteryPercentage];
}

id objc_msgSend_batteryQueue(void *a1, const char *a2, ...)
{
  return [a1 batteryQueue];
}

id objc_msgSend_handleB332Attachment(void *a1, const char *a2, ...)
{
  return [a1 handleB332Attachment];
}

id objc_msgSend_handleB332Detachment(void *a1, const char *a2, ...)
{
  return [a1 handleB332Detachment];
}

id objc_msgSend_initB332Status(void *a1, const char *a2, ...)
{
  return [a1 initB332Status];
}

id objc_msgSend_initCameraStatus(void *a1, const char *a2, ...)
{
  return [a1 initCameraStatus];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_percentCharge(void *a1, const char *a2, ...)
{
  return [a1 percentCharge];
}

id objc_msgSend_productIdentifier(void *a1, const char *a2, ...)
{
  return [a1 productIdentifier];
}

id objc_msgSend_registerCameraInterest(void *a1, const char *a2, ...)
{
  return [a1 registerCameraInterest];
}

id objc_msgSend_unregisterCameraInterest(void *a1, const char *a2, ...)
{
  return [a1 unregisterCameraInterest];
}

id objc_msgSend_vendor(void *a1, const char *a2, ...)
{
  return [a1 vendor];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                objc_destroyWeak((id *)&self->_client);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_pencilData, 0);
  objc_storeStrong((id *)&self->_lastBackCameraActiveTS, 0);
  objc_storeStrong((id *)&self->_lastFrontCameraActiveTS, 0);
  objc_storeStrong((id *)&self->_lastFrontIRCameraActiveTS, 0);
  objc_storeStrong((id *)&self->_b332AttachedTS, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
}

@end