void sub_1000036B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000038A8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003994;
  v13[3] = &unk_100008208;
  v13[4] = *(void *)(a1 + 32);
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

id sub_100003994(void *a1)
{
  [*(id *)(a1[4] + 16) setUsername:a1[5]];
  [*(id *)(a1[4] + 16) setNavBarTitle:a1[6]];
  v2 = *(void **)(a1[4] + 16);
  uint64_t v3 = a1[7];

  return [v2 setAuthURL:v3];
}

id sub_1000039F4(uint64_t a1)
{
  LOBYTE(v2) = 1;
  return [*(id *)(a1 + 32) beginRemoteSheetController:*(void *)(*(void *)(a1 + 40) + 24) delegate:*(void *)(a1 + 40) didEndSelector:"_remoteSheetDidEnd" contextInfo:0 requireTopApplication:0 opaque:0 presentAnimated:v2];
}

void sub_100003CD0(id a1)
{
  v1 = _ACLogSystem();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100004170(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void sub_100003D14(id a1)
{
  v1 = _ACLogSystem();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_1000041A8(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

uint64_t start(int a1, char **a2)
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100003EC8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "\"Modified the URL: %@\"", (uint8_t *)&v2, 0xCu);
}

void sub_100003F40(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 URL];
  uint64_t v4 = [v3 host];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "\"willSendRequest called for host: %@\"", (uint8_t *)&v5, 0xCu);
}

void sub_100003FF0()
{
  sub_1000036D4();
  sub_1000036B8((void *)&_mh_execute_header, v0, v1, "\"Failed to identify Apple's EV certificate. Cancelling.\"", v2, v3, v4, v5, v6);
}

void sub_100004024()
{
  sub_1000036D4();
  sub_1000036B8((void *)&_mh_execute_header, v0, v1, "\"Verified this challenge is Apple's EV SSL certificate\"", v2, v3, v4, v5, v6);
}

void sub_100004058()
{
  sub_1000036D4();
  sub_1000036B8((void *)&_mh_execute_header, v0, v1, "\"Received authentication challenge\"", v2, v3, v4, v5, v6);
}

void sub_10000408C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "\"OOPAWebViewController: failed with error - %@\"", (uint8_t *)&v2, 0xCu);
}

void sub_100004104()
{
  sub_1000036D4();
  sub_1000036B8((void *)&_mh_execute_header, v0, v1, "\"OOPAWebViewController: user tapped Cancel.\"", v2, v3, v4, v5, v6);
}

void sub_100004138(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004170(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000041A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SecTrustCopyInfo()
{
  return _SecTrustCopyInfo();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t _ACLogSystem()
{
  return __ACLogSystem();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

{
}

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

void objc_destroyWeak(id *location)
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
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

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__connectToAuthenticationDialogManager(void *a1, const char *a2, ...)
{
  return [a1 _connectToAuthenticationDialogManager];
}

id objc_msgSend__dialogManager(void *a1, const char *a2, ...)
{
  return [a1 _dialogManager];
}

id objc_msgSend__disconnectFromAuthenticationDialogManager(void *a1, const char *a2, ...)
{
  return [a1 _disconnectFromAuthenticationDialogManager];
}

id objc_msgSend__getSpringBoardOrientation(void *a1, const char *a2, ...)
{
  return [a1 _getSpringBoardOrientation];
}

id objc_msgSend__loadWebViewIfReady(void *a1, const char *a2, ...)
{
  return [a1 _loadWebViewIfReady];
}

id objc_msgSend__updateNavigationButtons(void *a1, const char *a2, ...)
{
  return [a1 _updateNavigationButtons];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_authURL(void *a1, const char *a2, ...)
{
  return [a1 authURL];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_canGoBack(void *a1, const char *a2, ...)
{
  return [a1 canGoBack];
}

id objc_msgSend_canGoForward(void *a1, const char *a2, ...)
{
  return [a1 canGoForward];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_goBack(void *a1, const char *a2, ...)
{
  return [a1 goBack];
}

id objc_msgSend_goForward(void *a1, const char *a2, ...)
{
  return [a1 goForward];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navBarTitle(void *a1, const char *a2, ...)
{
  return [a1 navBarTitle];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_nonPersistentDataStore(void *a1, const char *a2, ...)
{
  return [a1 nonPersistentDataStore];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resourceSpecifier(void *a1, const char *a2, ...)
{
  return [a1 resourceSpecifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return [a1 serverTrust];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_titleView(void *a1, const char *a2, ...)
{
  return [a1 titleView];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_webViewController_didFinishWithSuccess_response_(void *a1, const char *a2, ...)
{
  return [a1 webViewController:didFinishWithSuccess:response:];
}