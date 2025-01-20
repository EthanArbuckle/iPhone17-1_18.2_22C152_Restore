id sub_100002B40(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUp];
}

void sub_100003034(id a1, NSNotification *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "************** ERROR: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_1000030D4(id a1, NSNotification *a2)
{
  v2 = a2;
  int v3 = +[DSTestAutomation sharedInstance];
  unsigned int v4 = [v3 testAutomationEnabled];

  if (v4) {
    UIAccessibilityPostNotification(0xFA2u, &off_100010AF0);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "************** START: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_1000031B8(id a1, NSNotification *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    unsigned int v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "************** STOP: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_100003258(id a1, NSNotification *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    unsigned int v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "************** INTERRUPT: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_1000032F8(id a1, NSNotification *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    unsigned int v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "************** INTERRUPTION ENDED: %@", (uint8_t *)&v3, 0xCu);
  }
}

id sub_10000449C(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) tag];

  return [v2 removeResultWithTag:v3];
}

void sub_1000044E4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = +[UIColor clearColor];
  [v1 setBackgroundColor:v2];
}

id sub_100004C8C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allResults];
  id v3 = [v2 count];

  unsigned int v4 = *(void **)(a1 + 32);
  if (v3) {
    int v5 = &off_100010B90;
  }
  else {
    int v5 = &off_100010BA8;
  }

  return [v4 endTestWithStatusCode:v5];
}

id sub_1000066C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) endTestWithStatusCode:&off_100010BF0];
}

id sub_1000066D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) retakeButtonPressed:0];
}

void sub_10000751C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007538(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007FF8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) shutterButton];
  [v1 setEnabled:1];
}

void sub_1000093A4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100009410(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000947C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000094B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000094EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100009524(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t BKSDisplayBrightnessGetCurrent()
{
  return _BKSDisplayBrightnessGetCurrent();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_msgSend_adaptationClient(void *a1, const char *a2, ...)
{
  return [a1 adaptationClient];
}

id objc_msgSend_addPanGesture(void *a1, const char *a2, ...)
{
  return [a1 addPanGesture];
}

id objc_msgSend_addTapGesture(void *a1, const char *a2, ...)
{
  return [a1 addTapGesture];
}

id objc_msgSend_addedRectangleView(void *a1, const char *a2, ...)
{
  return [a1 addedRectangleView];
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return [a1 allResults];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return [a1 bezierPath];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blueLightClient(void *a1, const char *a2, ...)
{
  return [a1 blueLightClient];
}

id objc_msgSend_blueLightStatusActive(void *a1, const char *a2, ...)
{
  return [a1 blueLightStatusActive];
}

id objc_msgSend_bottomBar(void *a1, const char *a2, ...)
{
  return [a1 bottomBar];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return [a1 cancelButton];
}

id objc_msgSend_cancelTapped(void *a1, const char *a2, ...)
{
  return [a1 cancelTapped];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return [a1 cleanUp];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_colorAdaptationStatus(void *a1, const char *a2, ...)
{
  return [a1 colorAdaptationStatus];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_continueButton(void *a1, const char *a2, ...)
{
  return [a1 continueButton];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentImageView(void *a1, const char *a2, ...)
{
  return [a1 currentImageView];
}

id objc_msgSend_currentTag(void *a1, const char *a2, ...)
{
  return [a1 currentTag];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_disableAdaptationAndBlueLightReduction(void *a1, const char *a2, ...)
{
  return [a1 disableAdaptationAndBlueLightReduction];
}

id objc_msgSend_disableAmbientLightAdaptation(void *a1, const char *a2, ...)
{
  return [a1 disableAmbientLightAdaptation];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_drawColor(void *a1, const char *a2, ...)
{
  return [a1 drawColor];
}

id objc_msgSend_drawableView(void *a1, const char *a2, ...)
{
  return [a1 drawableView];
}

id objc_msgSend_drawingMode(void *a1, const char *a2, ...)
{
  return [a1 drawingMode];
}

id objc_msgSend_enableMaxBrightness(void *a1, const char *a2, ...)
{
  return [a1 enableMaxBrightness];
}

id objc_msgSend_endDrawing(void *a1, const char *a2, ...)
{
  return [a1 endDrawing];
}

id objc_msgSend_fileDataRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileDataRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flashButton(void *a1, const char *a2, ...)
{
  return [a1 flashButton];
}

id objc_msgSend_flashModeOn(void *a1, const char *a2, ...)
{
  return [a1 flashModeOn];
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

id objc_msgSend_getEnabled(void *a1, const char *a2, ...)
{
  return [a1 getEnabled];
}

id objc_msgSend_hideCameraView(void *a1, const char *a2, ...)
{
  return [a1 hideCameraView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageScrollView(void *a1, const char *a2, ...)
{
  return [a1 imageScrollView];
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

id objc_msgSend_isDrawing(void *a1, const char *a2, ...)
{
  return [a1 isDrawing];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
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

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_minimumSquareLength(void *a1, const char *a2, ...)
{
  return [a1 minimumSquareLength];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_orangeColor(void *a1, const char *a2, ...)
{
  return [a1 orangeColor];
}

id objc_msgSend_originPoint(void *a1, const char *a2, ...)
{
  return [a1 originPoint];
}

id objc_msgSend_originalScreenBrightness(void *a1, const char *a2, ...)
{
  return [a1 originalScreenBrightness];
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return [a1 output];
}

id objc_msgSend_overlayView(void *a1, const char *a2, ...)
{
  return [a1 overlayView];
}

id objc_msgSend_panGesture(void *a1, const char *a2, ...)
{
  return [a1 panGesture];
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 panGestureRecognizer];
}

id objc_msgSend_parseResults(void *a1, const char *a2, ...)
{
  return [a1 parseResults];
}

id objc_msgSend_photoCaptureCompletionHandler(void *a1, const char *a2, ...)
{
  return [a1 photoCaptureCompletionHandler];
}

id objc_msgSend_photoSettings(void *a1, const char *a2, ...)
{
  return [a1 photoSettings];
}

id objc_msgSend_previewView(void *a1, const char *a2, ...)
{
  return [a1 previewView];
}

id objc_msgSend_rectangle(void *a1, const char *a2, ...)
{
  return [a1 rectangle];
}

id objc_msgSend_rectangleEdgeColor(void *a1, const char *a2, ...)
{
  return [a1 rectangleEdgeColor];
}

id objc_msgSend_rectangleFillColor(void *a1, const char *a2, ...)
{
  return [a1 rectangleFillColor];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeDrawingModeViews(void *a1, const char *a2, ...)
{
  return [a1 removeDrawingModeViews];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resetBrightness(void *a1, const char *a2, ...)
{
  return [a1 resetBrightness];
}

id objc_msgSend_resetColorAdjustmentStates(void *a1, const char *a2, ...)
{
  return [a1 resetColorAdjustmentStates];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_retakeButton(void *a1, const char *a2, ...)
{
  return [a1 retakeButton];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_saveAndMaximizeBrightness(void *a1, const char *a2, ...)
{
  return [a1 saveAndMaximizeBrightness];
}

id objc_msgSend_saveColorAdjustmentStates(void *a1, const char *a2, ...)
{
  return [a1 saveColorAdjustmentStates];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setupCameraPreview(void *a1, const char *a2, ...)
{
  return [a1 setupCameraPreview];
}

id objc_msgSend_shapeView(void *a1, const char *a2, ...)
{
  return [a1 shapeView];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_showCameraView(void *a1, const char *a2, ...)
{
  return [a1 showCameraView];
}

id objc_msgSend_shutterButton(void *a1, const char *a2, ...)
{
  return [a1 shutterButton];
}

id objc_msgSend_shutterButtonIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 shutterButtonIntrinsicContentSize];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return [a1 startRunning];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return [a1 stopRunning];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_tapGesture(void *a1, const char *a2, ...)
{
  return [a1 tapGesture];
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return [a1 testAutomationEnabled];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_usePhotoButton(void *a1, const char *a2, ...)
{
  return [a1 usePhotoButton];
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

id objc_msgSend_zoomScale(void *a1, const char *a2, ...)
{
  return [a1 zoomScale];
}