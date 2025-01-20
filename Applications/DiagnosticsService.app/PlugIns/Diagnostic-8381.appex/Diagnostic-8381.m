void sub_1000031D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1000031EC(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIsAnimatedScrolling:1];

  id v4 = objc_loadWeakRetained(v2);
  unsigned int v5 = [v4 page];

  id v6 = objc_loadWeakRetained(v2);
  v7 = [v6 scrollView];
  [v7 frame];
  double v9 = v8;

  id v10 = objc_loadWeakRetained(v2);
  v11 = [v10 scrollView];
  [v11 contentOffset];
  uint64_t v13 = (int)(floor((v12 + v9 * -0.5) / v9) + 1.0);
  id v14 = objc_loadWeakRetained(v2);
  [v14 setPage:v13];

  id v15 = objc_loadWeakRetained(v2);
  LODWORD(v11) = [v15 page];

  if (v11 != v5)
  {
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_1000033A8;
    v20 = &unk_100008238;
    unsigned int v22 = v5;
    objc_copyWeak(&v21, v2);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v17);
    id v16 = objc_loadWeakRetained(v2);
    [v16 handleViewDidScroll:*(void *)(a1 + 32), v17, v18, v19, v20];

    objc_destroyWeak(&v21);
  }
}

void sub_100003394(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000033A8(uint64_t a1)
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100005334(a1, v2);
  }

  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  signed int v5 = [WeakRetained page];
  signed int v7 = *(_DWORD *)(a1 + 40);
  id v6 = (_DWORD *)(a1 + 40);
  id v8 = objc_loadWeakRetained(v3);
  double v9 = v8;
  if (v5 <= v7) {
    [v8 moveLeading];
  }
  else {
    [v8 moveTrailing];
  }

  id v10 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000051F8(v6, v3, v10);
  }
}

void sub_100003558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000356C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsAnimatedScrolling:0];
}

void sub_100003F68(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_log_t log, uint64_t a12, uint8_t buf)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, &buf, 0x2Cu);
}

void sub_100004474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_1000044A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000044B4(uint64_t a1)
{
}

void sub_1000044BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Got asset data for [%@]", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  signed int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
  id v8 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100004820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004848(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endTestWithStatusCode:&off_100008488];
}

void sub_100004AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100004AB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsAnimatedScrolling:0];
}

void sub_1000051F8(_DWORD *a1, id *location, os_log_t log)
{
  HIDWORD(v18) = *a1;
  id WeakRetained = objc_loadWeakRetained(location);
  [WeakRetained page];
  id v4 = objc_loadWeakRetained(location);
  uint64_t v5 = [v4 leadingImageViews];
  [v5 count];
  id v6 = objc_loadWeakRetained(location);
  signed int v7 = [v6 trailingImageViews];
  [v7 count];
  id v8 = objc_loadWeakRetained(location);
  int v9 = [v8 currentImageView];
  uint64_t v10 = [v9 image];
  sub_100003F2C();
  sub_100003F68((void *)&_mh_execute_header, v11, v12, "END PAGE (%d) -> (%d) = Leading (%lu), Trailing (%lu), Current (%@)", v13, v14, v15, v16, v17, v18, log, (uint64_t)WeakRetained, v22);
}

void sub_100005334(uint64_t a1, os_log_t log)
{
  HIDWORD(v17) = *(_DWORD *)(a1 + 40);
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained page];
  id v3 = objc_loadWeakRetained(v2);
  id v4 = [v3 leadingImageViews];
  [v4 count];
  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 trailingImageViews];
  [v6 count];
  id v7 = objc_loadWeakRetained(v2);
  id v8 = [v7 currentImageView];
  int v9 = [v8 image];
  sub_100003F2C();
  sub_100003F68((void *)&_mh_execute_header, v10, v11, "BGN PAGE (%d) -> (%d) = Leading (%lu), Trailing (%lu), Current (%@)", v12, v13, v14, v15, v16, v17, log, (uint64_t)WeakRetained, v21);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__actionButton(void *a1, const char *a2, ...)
{
  return [a1 _actionButton];
}

id objc_msgSend_animatedScrollingQueue(void *a1, const char *a2, ...)
{
  return [a1 animatedScrollingQueue];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_confirmPageView(void *a1, const char *a2, ...)
{
  return [a1 confirmPageView];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return [a1 contentOffset];
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

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frameForConfirmation(void *a1, const char *a2, ...)
{
  return [a1 frameForConfirmation];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageFileNames(void *a1, const char *a2, ...)
{
  return [a1 imageFileNames];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_labelForConfirmation(void *a1, const char *a2, ...)
{
  return [a1 labelForConfirmation];
}

id objc_msgSend_leadingImageViews(void *a1, const char *a2, ...)
{
  return [a1 leadingImageViews];
}

id objc_msgSend_loadLeading(void *a1, const char *a2, ...)
{
  return [a1 loadLeading];
}

id objc_msgSend_loadTrailing(void *a1, const char *a2, ...)
{
  return [a1 loadTrailing];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_maxNumPages(void *a1, const char *a2, ...)
{
  return [a1 maxNumPages];
}

id objc_msgSend_moveLeading(void *a1, const char *a2, ...)
{
  return [a1 moveLeading];
}

id objc_msgSend_moveTrailing(void *a1, const char *a2, ...)
{
  return [a1 moveTrailing];
}

id objc_msgSend_page(void *a1, const char *a2, ...)
{
  return [a1 page];
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 panGestureRecognizer];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return [a1 scrollView];
}

id objc_msgSend_setUpViewAccessibilitySettings(void *a1, const char *a2, ...)
{
  return [a1 setUpViewAccessibilitySettings];
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return [a1 setupView];
}

id objc_msgSend_tradeInImages(void *a1, const char *a2, ...)
{
  return [a1 tradeInImages];
}

id objc_msgSend_trailingImageViews(void *a1, const char *a2, ...)
{
  return [a1 trailingImageViews];
}

id objc_msgSend_unloadLeading(void *a1, const char *a2, ...)
{
  return [a1 unloadLeading];
}

id objc_msgSend_unloadTrailing(void *a1, const char *a2, ...)
{
  return [a1 unloadTrailing];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:options:error:];
}