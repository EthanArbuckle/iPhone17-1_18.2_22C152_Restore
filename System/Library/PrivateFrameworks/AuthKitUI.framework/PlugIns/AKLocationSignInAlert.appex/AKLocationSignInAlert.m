uint64_t sub_100003650()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  long long v6;
  long long v7;

  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v0 = qword_10000D2F8;
  v5 = qword_10000D2F8;
  if (!qword_10000D2F8)
  {
    v6 = *(_OWORD *)off_1000082A8;
    v7 = *(_OWORD *)&off_1000082B8;
    v3[3] = _sl_dlopen();
    qword_10000D2F8 = v3[3];
    v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_100003760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003778(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10000D2F8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100003808()
{
  uint64_t v0 = sub_100003650();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_100003864()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_10000D300;
  uint64_t v7 = qword_10000D300;
  if (!qword_10000D300)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100003948;
    v3[3] = &unk_1000082F8;
    v3[4] = &v4;
    sub_100003948((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100003930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100003948(uint64_t a1)
{
  sub_100003808();
  Class result = objc_getClass("AKAppleIDAuthenticationInAppContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10000D300 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10000533C();
    return (Class)sub_1000039A0(v3);
  }
  return result;
}

id sub_1000039A0()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_10000D308;
  uint64_t v7 = qword_10000D308;
  if (!qword_10000D308)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100003A84;
    v3[3] = &unk_1000082F8;
    v3[4] = &v4;
    sub_100003A84((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100003A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003A84(uint64_t a1)
{
  sub_100003808();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AKBasicLoginContentViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10000D308 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (void *)sub_100005364();
    +[AKLocationSignInContentViewController initialize];
  }
}

void sub_10000431C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [a2 image];
    [*(id *)(*(void *)(a1 + 32) + 16) setImage:v6];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000447C;
    v11[3] = &unk_100008320;
    uint64_t v12 = *(void *)(a1 + 32);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000044D8;
    v10[3] = &unk_100008348;
    v10[4] = v12;
    +[UIView animateWithDuration:v11 animations:v10 completion:0.3];
  }
  else
  {
    uint64_t v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000538C(v5, v7);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

id sub_10000447C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v2 setAlpha:0.0];
}

void sub_1000044D8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) stopAnimating];
  [*(id *)(*(void *)(a1 + 32) + 24) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  SEL v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

void sub_100004E14(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004EDC;
  v5[3] = &unk_100008398;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 startWithCompletionHandler:v5];

  objc_destroyWeak(&v8);
}

void sub_100004EC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100004EDC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      [*(id *)(a1 + 40) _setImageForSnapshot:v5];
    }
    else
    {
      v9 = _AKLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100005468((uint64_t)v6, v9);
      }

      [WeakRetained[2] stopAnimating];
    }
  }
  else
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100005424(v8);
    }
  }
}

id sub_1000050D0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_setImageForSnapshot:", *(void *)(a1 + 40));
}

uint64_t sub_10000533C()
{
  uint64_t v0 = abort_report_np();
  return sub_100005364(v0);
}

uint64_t sub_100005364()
{
  uint64_t v0 = abort_report_np();
  return sub_10000538C(v0);
}

void sub_10000538C(void *a1, NSObject *a2)
{
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to snapshot location, error: \"%@\"", (uint8_t *)&v4, 0xCu);
}

void sub_100005424(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing reference to map view!", v1, 2u);
}

void sub_100005468(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to snapshot location, error: \"%@\"", (uint8_t *)&v2, 0xCu);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t UIRoundToScreenScale()
{
  return _UIRoundToScreenScale();
}

uint64_t _AKLogSystem()
{
  return __AKLogSystem();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

uint64_t _UIContentSizeCategoryCompareToContentSizeCategory()
{
  return __UIContentSizeCategoryCompareToContentSizeCategory();
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void free(void *a1)
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

void objc_copyWeak(id *to, id *from)
{
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend__configureCodeGenView(void *a1, const char *a2, ...)
{
  return [a1 _configureCodeGenView];
}

id objc_msgSend__configureFooterView(void *a1, const char *a2, ...)
{
  return [a1 _configureFooterView];
}

id objc_msgSend__configureMapView(void *a1, const char *a2, ...)
{
  return [a1 _configureMapView];
}

id objc_msgSend__configureTitleHeaderView(void *a1, const char *a2, ...)
{
  return [a1 _configureTitleHeaderView];
}

id objc_msgSend__deviceLocation(void *a1, const char *a2, ...)
{
  return [a1 _deviceLocation];
}

id objc_msgSend__generatorLabelFont(void *a1, const char *a2, ...)
{
  return [a1 _generatorLabelFont];
}

id objc_msgSend__hasLocationInformation(void *a1, const char *a2, ...)
{
  return [a1 _hasLocationInformation];
}

id objc_msgSend__interpolatedReason(void *a1, const char *a2, ...)
{
  return [a1 _interpolatedReason];
}

id objc_msgSend__message(void *a1, const char *a2, ...)
{
  return [a1 _message];
}

id objc_msgSend__snapshotMapLocation(void *a1, const char *a2, ...)
{
  return [a1 _snapshotMapLocation];
}

id objc_msgSend_authenticationContext(void *a1, const char *a2, ...)
{
  return [a1 authenticationContext];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_contentContainerView(void *a1, const char *a2, ...)
{
  return [a1 contentContainerView];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_generatedCode(void *a1, const char *a2, ...)
{
  return [a1 generatedCode];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_notificationDisclaimer(void *a1, const char *a2, ...)
{
  return [a1 notificationDisclaimer];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startLoadingImage(void *a1, const char *a2, ...)
{
  return [a1 startLoadingImage];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
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

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}