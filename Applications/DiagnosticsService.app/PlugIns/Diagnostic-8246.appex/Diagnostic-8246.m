void sub_100005668(uint64_t a1)
{
  id v1;
  uint64_t vars8;

  v1 = [*(id *)(a1 + 32) shutterButton];
  [v1 setEnabled:1];
}

void sub_100006C00(id a1, NSNotification *a2)
{
  v2 = a2;
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100008514((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_100006C58(id a1, NSNotification *a2)
{
  v2 = a2;
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "************** START: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100006D08(id a1, NSNotification *a2)
{
  v2 = a2;
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "************** STOP: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100006DB8(id a1, NSNotification *a2)
{
  v2 = a2;
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "************** INTERRUPT: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100006E68(id a1, NSNotification *a2)
{
  v2 = a2;
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "************** INTERRUPTION ENDED: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100008194(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000081BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000084AC()
{
  sub_1000081B0();
  sub_100008194((void *)&_mh_execute_header, v0, v1, "Failed to fall back to front camera", v2, v3, v4, v5, v6);
}

void sub_1000084E0()
{
  sub_1000081B0();
  sub_100008194((void *)&_mh_execute_header, v0, v1, "Failed to start with rear camera. Falling back to front camera", v2, v3, v4, v5, v6);
}

void sub_100008514(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008580()
{
  sub_1000081B0();
  sub_100008194((void *)&_mh_execute_header, v0, v1, "Unable to initialize preview layer.", v2, v3, v4, v5, v6);
}

void sub_1000085B4(char a1, uint64_t a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set torch state to %d. Error: %@", (uint8_t *)v3, 0x12u);
}

void sub_100008640()
{
  sub_1000081B0();
  sub_100008194((void *)&_mh_execute_header, v0, v1, "Failed to switch back to original camera position", v2, v3, v4, v5, v6);
}

void sub_100008674()
{
  sub_1000081B0();
  sub_100008194((void *)&_mh_execute_header, v0, v1, "Failed to switch camera positions. Attempting to switch back", v2, v3, v4, v5, v6);
}

void sub_1000086A8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008714(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_beginConfiguration(void *a1, const char *a2, ...)
{
  return [a1 beginConfiguration];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return [a1 bezierPath];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cameraDevice(void *a1, const char *a2, ...)
{
  return [a1 cameraDevice];
}

id objc_msgSend_cameraInput(void *a1, const char *a2, ...)
{
  return [a1 cameraInput];
}

id objc_msgSend_cameraPosition(void *a1, const char *a2, ...)
{
  return [a1 cameraPosition];
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return [a1 cancelButton];
}

id objc_msgSend_cancelTapped(void *a1, const char *a2, ...)
{
  return [a1 cancelTapped];
}

id objc_msgSend_captureSession(void *a1, const char *a2, ...)
{
  return [a1 captureSession];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return [a1 cleanup];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_codeTypes(void *a1, const char *a2, ...)
{
  return [a1 codeTypes];
}

id objc_msgSend_commitConfiguration(void *a1, const char *a2, ...)
{
  return [a1 commitConfiguration];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_flashButton(void *a1, const char *a2, ...)
{
  return [a1 flashButton];
}

id objc_msgSend_flashState(void *a1, const char *a2, ...)
{
  return [a1 flashState];
}

id objc_msgSend_flashTapped(void *a1, const char *a2, ...)
{
  return [a1 flashTapped];
}

id objc_msgSend_flipButton(void *a1, const char *a2, ...)
{
  return [a1 flipButton];
}

id objc_msgSend_flipButtonIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 flipButtonIntrinsicContentSize];
}

id objc_msgSend_flipButtonOverContent(void *a1, const char *a2, ...)
{
  return [a1 flipButtonOverContent];
}

id objc_msgSend_flipTapped(void *a1, const char *a2, ...)
{
  return [a1 flipTapped];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isTorchActive(void *a1, const char *a2, ...)
{
  return [a1 isTorchActive];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_overlayView(void *a1, const char *a2, ...)
{
  return [a1 overlayView];
}

id objc_msgSend_previewView(void *a1, const char *a2, ...)
{
  return [a1 previewView];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setupCamera(void *a1, const char *a2, ...)
{
  return [a1 setupCamera];
}

id objc_msgSend_setupCodeRecognition(void *a1, const char *a2, ...)
{
  return [a1 setupCodeRecognition];
}

id objc_msgSend_shutterButton(void *a1, const char *a2, ...)
{
  return [a1 shutterButton];
}

id objc_msgSend_shutterButtonIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 shutterButtonIntrinsicContentSize];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return [a1 startRunning];
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return [a1 stopRunning];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_unlockForConfiguration(void *a1, const char *a2, ...)
{
  return [a1 unlockForConfiguration];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewfinderInstruction(void *a1, const char *a2, ...)
{
  return [a1 viewfinderInstruction];
}

id objc_msgSend_viewfinderOutsideRegionBottom(void *a1, const char *a2, ...)
{
  return [a1 viewfinderOutsideRegionBottom];
}

id objc_msgSend_viewfinderOutsideRegionTop(void *a1, const char *a2, ...)
{
  return [a1 viewfinderOutsideRegionTop];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}