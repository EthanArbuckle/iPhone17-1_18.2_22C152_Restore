id sub_3A1C(uint64_t a1)
{
  void *v2;
  uint64_t vars8;

  objc_storeWeak((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    return [v2 _registerForCameraNotifications];
  }
  else
  {
    return [v2 _unregisterForCameraNotifications];
  }
}

id sub_3C6C(id result, io_registry_entry_t a2, int a3)
{
  if (a3 == -536870608)
  {
    v5 = result;
    if (sub_41C4(a2, @"FrontCameraActive")) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = v6 | sub_41C4(a2, @"BackCameraActive");
    if (sub_41C4(a2, @"BackTeleCameraActive")) {
      uint64_t v8 = v7 | 4;
    }
    else {
      uint64_t v8 = v7;
    }
    return [v5 _capturingCameraTypesDidChange:v8];
  }
  return result;
}

void sub_3EF4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyDelegateIfNeeded];
}

void sub_40B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained isCameraCapturingDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 8)];
}

void sub_4180(id a1)
{
  qword_11D90 = (uint64_t)os_log_create("com.apple.BarcodeSupport.NFCControlCenterModule", "NFCCCameraMonitor");

  _objc_release_x1();
}

BOOL sub_41C4(io_registry_entry_t a1, const __CFString *a2)
{
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return 0;
  }
  CFBooleanRef v3 = CFProperty;
  CFTypeID v4 = CFGetTypeID(CFProperty);
  BOOL v6 = v4 == CFBooleanGetTypeID() && v3 == kCFBooleanTrue;
  CFRelease(v3);
  return v6;
}

void sub_4234(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_463C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isExpanded];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) _didCollapse];
    [*(id *)(a1 + 32) scrollToTop:0];
    CFBooleanRef v3 = *(void **)(a1 + 32);
    return [v3 _setModuleState:0 animated:0];
  }
  return result;
}

void sub_4914(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_4930(uint64_t a1, char a2)
{
  CFBooleanRef v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      BOOL v6 = (void *)WeakRetained[5];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_4A8C;
      v9[3] = &unk_C438;
      objc_copyWeak(&v10, v3);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_4C84;
      v7[3] = &unk_C358;
      objc_copyWeak(&v8, v3);
      [v6 startReaderWithDelegate:v5 errorHandler:v9 interruptionHandler:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&v10);
    }
    else
    {
      [WeakRetained _setModuleState:5 animated:1];
    }
  }
}

void sub_4A70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_4A8C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4B1C;
  block[3] = &unk_C358;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_4B1C(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CFBooleanRef v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _setModuleState:3 animated:1];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_4C44;
    v7[3] = &unk_C410;
    objc_copyWeak(&v8, v1);
    uint64_t v4 = +[NSTimer timerWithTimeInterval:0 repeats:v7 block:1.5];
    v5 = (void *)v3[7];
    v3[7] = v4;

    BOOL v6 = +[NSRunLoop mainRunLoop];
    [v6 addTimer:v3[7] forMode:NSRunLoopCommonModes];

    objc_destroyWeak(&v8);
  }
}

void sub_4C2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_4C44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startReader];
}

void sub_4C84(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4D14;
  block[3] = &unk_C358;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_4D14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _setModuleState:3 animated:1];
    [v2 _startReaderIfNeeded];
    id WeakRetained = v2;
  }
}

void sub_4E6C(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredExpandedContentWidth];
  double v3 = v2;
  [*(id *)(a1 + 32) preferredExpandedContentHeight];
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", v3, v4);
  id v5 = [*(id *)(a1 + 32) view];
  [v5 setNeedsLayout];
}

void sub_4FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5018(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _stopTransientModuleStateTimer];
    [v2 _setModuleState:0 animated:1];
    id WeakRetained = v2;
  }
}

void sub_528C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_52A8(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (a2) {
      [WeakRetained _startReader];
    }
    else {
      [WeakRetained _setModuleState:3 animated:1];
    }
    id WeakRetained = v4;
  }
}

id sub_5388(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 48) = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) _stopTransientModuleStateTimer];
  uint64_t v2 = *(void *)(a1 + 40);
  if ((unint64_t)(v2 - 3) <= 1)
  {
    double v3 = [*(id *)(a1 + 32) contentModuleContext];
    [v3 dismissModule];

    uint64_t v2 = *(void *)(a1 + 40);
  }
  if (v2 == 6)
  {
    dispatch_time_t v4 = dispatch_time(0, 300000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_54F8;
    block[3] = &unk_C380;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
    uint64_t v2 = *(void *)(a1 + 40);
  }
  uint64_t v5 = 0;
  BOOL v6 = *(id **)(a1 + 32);
  switch(v2)
  {
    case 0:
      return objc_msgSend(v6[5], "disconnect", 0);
    case 1:
    case 8:
    case 10:
      uint64_t v5 = 3;
      return [v6 _setModuleState:v5 animated:1];
    case 5:
      uint64_t v5 = 1;
      return [v6 _setModuleState:v5 animated:1];
    case 6:
      uint64_t v5 = 2;
      return [v6 _setModuleState:v5 animated:1];
    default:
      return [v6 _setModuleState:v5 animated:1];
  }
}

void sub_54F8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentModuleContext];
  [v1 dismissModule];
}

id sub_55B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTransientModuleState:4];
}

void sub_59A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_59BC(uint64_t a1, uint64_t a2)
{
  double v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[48] = a2 == 1;
    [WeakRetained _updateAvailable];
    if (!a2)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_5AE8;
      v9[3] = &unk_C410;
      objc_copyWeak(&v10, v3);
      uint64_t v6 = +[NSTimer timerWithTimeInterval:0 repeats:v9 block:1.5];
      uint64_t v7 = (void *)v5[4];
      v5[4] = v6;

      id v8 = +[NSRunLoop mainRunLoop];
      [v8 addTimer:v5[4] forMode:NSRunLoopCommonModes];

      objc_destroyWeak(&v10);
    }
  }
}

void sub_5AD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_5AE8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkHardwareSupport];
}

id sub_64E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40) == 5) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  [*(id *)(v2 + 16) setAlpha:v3];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 40) == 5) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  uint64_t v6 = *(void **)(v4 + 24);

  return [v6 setAlpha:v5];
}

id sub_766C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:v2];
  if (*(unsigned char *)(a1 + 41)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:v3];
  if (*(unsigned char *)(a1 + 42)) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  double v5 = *(void **)(*(void *)(a1 + 32) + 40);

  return [v5 setAlpha:v4];
}

BOOL sub_780C(NSString *a1, uint64_t a2)
{
  return (unint64_t)(a2 - 3) <= 1
      && UIContentSizeCategoryCompareToCategory(a1, UIContentSizeCategoryAccessibilityMedium) == NSOrderedDescending;
}

id sub_8264(uint64_t a1)
{
  double v1 = 0.75;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

void sub_82F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_8330(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_8368(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
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

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

uint64_t _BCSLocalizedString()
{
  return __BCSLocalizedString();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend__checkHardwareSupport(void *a1, const char *a2, ...)
{
  return [a1 _checkHardwareSupport];
}

id objc_msgSend__contentSizeCategoryDidChange(void *a1, const char *a2, ...)
{
  return [a1 _contentSizeCategoryDidChange];
}

id objc_msgSend__didCollapse(void *a1, const char *a2, ...)
{
  return [a1 _didCollapse];
}

id objc_msgSend__isModuleAvailable(void *a1, const char *a2, ...)
{
  return [a1 _isModuleAvailable];
}

id objc_msgSend__makePromptLabelWrapper(void *a1, const char *a2, ...)
{
  return [a1 _makePromptLabelWrapper];
}

id objc_msgSend__notifyDelegateIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _notifyDelegateIfNeeded];
}

id objc_msgSend__service(void *a1, const char *a2, ...)
{
  return [a1 _service];
}

id objc_msgSend__setUp(void *a1, const char *a2, ...)
{
  return [a1 _setUp];
}

id objc_msgSend__setUpSettingsViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _setUpSettingsViewIfNeeded];
}

id objc_msgSend__startReader(void *a1, const char *a2, ...)
{
  return [a1 _startReader];
}

id objc_msgSend__startReaderIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _startReaderIfNeeded];
}

id objc_msgSend__stopCheckingHardwareSupport(void *a1, const char *a2, ...)
{
  return [a1 _stopCheckingHardwareSupport];
}

id objc_msgSend__stopMonitoringCamera(void *a1, const char *a2, ...)
{
  return [a1 _stopMonitoringCamera];
}

id objc_msgSend__stopReader(void *a1, const char *a2, ...)
{
  return [a1 _stopReader];
}

id objc_msgSend__stopTransientModuleStateTimer(void *a1, const char *a2, ...)
{
  return [a1 _stopTransientModuleStateTimer];
}

id objc_msgSend__unregisterForCameraNotifications(void *a1, const char *a2, ...)
{
  return [a1 _unregisterForCameraNotifications];
}

id objc_msgSend__updateAvailable(void *a1, const char *a2, ...)
{
  return [a1 _updateAvailable];
}

id objc_msgSend__updateContentViewSize(void *a1, const char *a2, ...)
{
  return [a1 _updateContentViewSize];
}

id objc_msgSend__willExpand(void *a1, const char *a2, ...)
{
  return [a1 _willExpand];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeInterfaceOrientation];
}

id objc_msgSend_alignmentRectInsets(void *a1, const char *a2, ...)
{
  return [a1 alignmentRectInsets];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buttonView(void *a1, const char *a2, ...)
{
  return [a1 buttonView];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_contentModuleContext(void *a1, const char *a2, ...)
{
  return [a1 contentModuleContext];
}

id objc_msgSend_controlCenterDidDisappear(void *a1, const char *a2, ...)
{
  return [a1 controlCenterDidDisappear];
}

id objc_msgSend_controlCenterTertiaryCapturingMaterial(void *a1, const char *a2, ...)
{
  return [a1 controlCenterTertiaryCapturingMaterial];
}

id objc_msgSend_controlCenterWillAppear(void *a1, const char *a2, ...)
{
  return [a1 controlCenterWillAppear];
}

id objc_msgSend_didActivateNFCReader(void *a1, const char *a2, ...)
{
  return [a1 didActivateNFCReader];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return [a1 disconnect];
}

id objc_msgSend_dismissModule(void *a1, const char *a2, ...)
{
  return [a1 dismissModule];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return [a1 isExpanded];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredExpandedContentHeight(void *a1, const char *a2, ...)
{
  return [a1 preferredExpandedContentHeight];
}

id objc_msgSend_preferredExpandedContentWidth(void *a1, const char *a2, ...)
{
  return [a1 preferredExpandedContentWidth];
}

id objc_msgSend_requestExpandModule(void *a1, const char *a2, ...)
{
  return [a1 requestExpandModule];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedLogger(void *a1, const char *a2, ...)
{
  return [a1 sharedLogger];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_turnOnNFCButton(void *a1, const char *a2, ...)
{
  return [a1 turnOnNFCButton];
}

id objc_msgSend_turnOnNFCButtonTapped(void *a1, const char *a2, ...)
{
  return [a1 turnOnNFCButtonTapped];
}

id objc_msgSend_updateOrientationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 updateOrientationIfNeeded];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}