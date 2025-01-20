id sub_100001BE0()
{
  void *v0;
  uint64_t vars8;

  if (qword_10000E680 != -1) {
    dispatch_once(&qword_10000E680, &stru_100008270);
  }
  v0 = (void *)qword_10000E678;

  return v0;
}

void sub_100001C34(id a1)
{
  qword_10000E678 = (uint64_t)os_log_create("com.apple.BacklinkIndicator", "UI");

  _objc_release_x1();
}

void sub_1000023C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002404(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = sub_100001BE0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "background pip authorization: %@, state: %lu", (uint8_t *)&v8, 0x16u);
  }

  if (a3 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _createPipProxyIfNeeded];
  }
}

void sub_100002598(id a1, PGMutablePlaybackState *a2)
{
}

void sub_100002D6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = sub_100001BE0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100003C14(a1);
    }
  }
}

void sub_100002F40(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100003068(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1000036C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000038EC(uint64_t a1)
{
  sub_100003944();
  Class result = objc_getClass("NPNotePreviewProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100003DE4();
  }
  qword_10000E688 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100003944()
{
  v2[0] = 0;
  if (!qword_10000E690)
  {
    v2[1] = _NSConcreteStackBlock;
    v2[2] = (void *)3221225472;
    v2[3] = sub_100003A3C;
    v2[4] = &unk_100008360;
    v2[5] = v2;
    long long v3 = off_100008348;
    uint64_t v4 = 0;
    qword_10000E690 = _sl_dlopen();
  }
  uint64_t v0 = qword_10000E690;
  if (!qword_10000E690) {
    sub_100003E60(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t sub_100003A3C()
{
  uint64_t result = _sl_dlopen();
  qword_10000E690 = result;
  return result;
}

void *sub_100003AB0(uint64_t a1)
{
  v2 = (void *)sub_100003944();
  uint64_t result = dlsym(v2, "NPNotePreviewKeyPreview");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10000E698 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t start(int a1, char **a2)
{
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100003B74(void *a1)
{
  uint64_t v1 = [a1 userActivity];
  v2 = [v1 _syLoggableDescription];
  sub_100002F28();
  sub_100002F40((void *)&_mh_execute_header, v3, v4, "backlink indicator failed to show for user activity: %@, error: %@", v5, v6, v7, v8, v9);
}

void sub_100003C14(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _syLoggableDescription];
  sub_100002F28();
  sub_100002F40((void *)&_mh_execute_header, v2, v3, "failed to activate Notes with user activity: %@, error: %@", v4, v5, v6, v7, v8);
}

void sub_100003CA8()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"NSString *getNPNotePreviewKeyPreview(void)"];
  [v0 handleFailureInFunction:v1 file:@"BacklinkIndicatorViewController.m" lineNumber:18 description:@"%s" dlerror()];

  __break(1u);
}

void sub_100003D20(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 userActivity];
  uint64_t v6 = [v5 _syLoggableDescription];
  int v7 = 138412546;
  uint8_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "request to retrieve note preview for user activity: %@, failed with error: %@", (uint8_t *)&v7, 0x16u);
}

void sub_100003DE4()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getNPNotePreviewProviderClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"BacklinkIndicatorViewController.m" lineNumber:17 description:@"Unable to find class %s" "NPNotePreviewProvider"];

  __break(1u);
}

void sub_100003E60(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *NotesPreviewKitLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"BacklinkIndicatorViewController.m" lineNumber:16 description:@"%s" *a1];

  __break(1u);
  NSStringFromClass(v4);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SYIsPhone()
{
  return _SYIsPhone();
}

uint64_t SYIsQuickNoteOnPhoneEnabled()
{
  return _SYIsQuickNoteOnPhoneEnabled();
}

uint64_t SYMakeEditNoteUserActivity()
{
  return _SYMakeEditNoteUserActivity();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__createPipProxyIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _createPipProxyIfNeeded];
}

id objc_msgSend__pipSessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _pipSessionIdentifier];
}

id objc_msgSend__syIsBacklinkUserActivity(void *a1, const char *a2, ...)
{
  return [a1 _syIsBacklinkUserActivity];
}

id objc_msgSend__syIsShowBacklinkIndicatorUserActivity(void *a1, const char *a2, ...)
{
  return [a1 _syIsShowBacklinkIndicatorUserActivity];
}

id objc_msgSend__syLoggableDescription(void *a1, const char *a2, ...)
{
  return [a1 _syLoggableDescription];
}

id objc_msgSend__syUserInfoDomainIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _syUserInfoDomainIdentifiers];
}

id objc_msgSend__syUserInfoLinkIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _syUserInfoLinkIdentifiers];
}

id objc_msgSend__updateUI(void *a1, const char *a2, ...)
{
  return [a1 _updateUI];
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return [a1 activationState];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_backlinkIndicator(void *a1, const char *a2, ...)
{
  return [a1 backlinkIndicator];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return [a1 connectedScenes];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hide(void *a1, const char *a2, ...)
{
  return [a1 hide];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_previewProvider(void *a1, const char *a2, ...)
{
  return [a1 previewProvider];
}

id objc_msgSend_revoke(void *a1, const char *a2, ...)
{
  return [a1 revoke];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return [a1 userActivities];
}

id objc_msgSend_userActivity(void *a1, const char *a2, ...)
{
  return [a1 userActivity];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return [a1 viewIfLoaded];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return [a1 windows];
}