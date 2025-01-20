void sub_100001AF8(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;

  v2 = a2;
  v3 = sub_100002050();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000062A4(v2, v3);
  }
}

uint64_t start(int a1, char **a2)
{
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

id sub_100002050()
{
  if (qword_100012C38 != -1) {
    dispatch_once(&qword_100012C38, &stru_10000C398);
  }
  v0 = (void *)qword_100012C30;

  return v0;
}

void sub_1000020A4(id a1)
{
  qword_100012C30 = (uint64_t)os_log_create("com.apple.MobileStoreDemo", "Default");

  _objc_release_x1();
}

id sub_1000020E8()
{
  if (qword_100012C48 != -1) {
    dispatch_once(&qword_100012C48, &stru_10000C3B8);
  }
  v0 = (void *)qword_100012C40;

  return v0;
}

void sub_10000213C(id a1)
{
  qword_100012C40 = (uint64_t)os_log_create("com.apple.MobileStoreDemo", "ScreenSaver");

  _objc_release_x1();
}

id sub_100002180()
{
  if (qword_100012C58 != -1) {
    dispatch_once(&qword_100012C58, &stru_10000C3D8);
  }
  v0 = (void *)qword_100012C50;

  return v0;
}

void sub_1000021D4(id a1)
{
  qword_100012C50 = (uint64_t)os_log_create("com.apple.MobileStoreDemo", "Message");

  _objc_release_x1();
}

id sub_100002218()
{
  if (qword_100012C68 != -1) {
    dispatch_once(&qword_100012C68, &stru_10000C3F8);
  }
  v0 = (void *)qword_100012C60;

  return v0;
}

void sub_10000226C(id a1)
{
  if (os_variant_has_internal_content())
  {
    os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Signpost");
  }
  else
  {
    os_log_t v1 = (os_log_t)&_os_log_disabled;
    id v2 = &_os_log_disabled;
  }
  v3 = (void *)qword_100012C60;
  qword_100012C60 = (uint64_t)v1;
}

void sub_1000022DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  v10 = +[MSDLogModel sharedInstance];
  [v10 logWithFormat:v9 andArgs:&a9];
}

void sub_100002390(id a1)
{
  qword_100012C70 = objc_alloc_init(MSDLogModel);

  _objc_release_x1();
}

void sub_100002568(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100002928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002940(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002950(uint64_t a1)
{
}

void sub_100002958(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v14 = [*(id *)(a1 + 32) stringByAppendingFormat:@"/%@", a2];
  v6 = [*(id *)(a1 + 40) description];
  NSLog(@"Checking existing log file (full path) %@ against %@", v14, v6);

  uint64_t v7 = [*(id *)(a1 + 48) attributesOfItemAtPath:v14 error:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate];
  id v11 = [v10 compare:*(void *)(a1 + 40)];

  if (v11 == (id)-1)
  {
    v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate];
    v13 = [v12 description];
    NSLog(@"Removing %@ whose creation date is %@.", v14, v13);

    [*(id *)(a1 + 48) removeItemAtPath:v14 error:0];
  }
  *a4 = 0;
}

id sub_100004E20(uint64_t a1)
{
  return [*(id *)(a1 + 32) doCancelInstall];
}

id sub_100004E28(uint64_t a1)
{
  return [*(id *)(a1 + 32) timeout:0];
}

void sub_100005240(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_100005264(uint64_t a1)
{
  id v2 = +[MSDViewServiceModel sharedInstance];
  v3 = [v2 errorToReport];

  v4 = sub_100002050();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Operation failed...", v7, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained operationFailed:v3];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Operation completed...", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained quit];
  }
}

void sub_100005360(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateErrorState];
}

void sub_1000053A0(uint64_t a1)
{
  id v2 = +[MSDViewServiceModel sharedInstance];
  id v8 = [v2 progress];

  if (v8)
  {
    v3 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v3);
    BOOL v5 = [WeakRetained progressBar];
    [v5 setHidden:0];

    id v6 = objc_loadWeakRetained(v3);
    uint64_t v7 = [v6 progressBar];
    [v8 floatValue];
    [v7 setProgress:1 animated:YES];
  }
}

id sub_100005740(uint64_t a1)
{
  return [*(id *)(a1 + 32) quit];
}

void sub_100005A6C(id a1)
{
  qword_100012C80 = objc_alloc_init(MSDViewServiceModel);

  _objc_release_x1();
}

void sub_1000061E4(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Setting idle timer disabled: %d", (uint8_t *)v2, 8u);
}

void sub_100006260(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to corece UIScene into UIWindowScene.", v1, 2u);
}

void sub_1000062A4(void *a1, NSObject *a2)
{
  v3 = [a1 localizedDescription];
  int v4 = 138543362;
  BOOL v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to destroy scene session: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_10000633C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unknown key changed.", v1, 2u);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
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

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return [a1 cancelButton];
}

id objc_msgSend_cancelOperation(void *a1, const char *a2, ...)
{
  return [a1 cancelOperation];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_checkInBlockingUI(void *a1, const char *a2, ...)
{
  return [a1 checkInBlockingUI];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configurationContext(void *a1, const char *a2, ...)
{
  return [a1 configurationContext];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return [a1 displayString];
}

id objc_msgSend_errorMessage(void *a1, const char *a2, ...)
{
  return [a1 errorMessage];
}

id objc_msgSend_errorMessageFromErrors(void *a1, const char *a2, ...)
{
  return [a1 errorMessageFromErrors];
}

id objc_msgSend_errorToReport(void *a1, const char *a2, ...)
{
  return [a1 errorToReport];
}

id objc_msgSend_errorView(void *a1, const char *a2, ...)
{
  return [a1 errorView];
}

id objc_msgSend_errors(void *a1, const char *a2, ...)
{
  return [a1 errors];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return [a1 fileCreationDate];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return [a1 localizedFailureReason];
}

id objc_msgSend_logFP(void *a1, const char *a2, ...)
{
  return [a1 logFP];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainLabel(void *a1, const char *a2, ...)
{
  return [a1 mainLabel];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_observerAdded(void *a1, const char *a2, ...)
{
  return [a1 observerAdded];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressBar(void *a1, const char *a2, ...)
{
  return [a1 progressBar];
}

id objc_msgSend_quit(void *a1, const char *a2, ...)
{
  return [a1 quit];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_scene(void *a1, const char *a2, ...)
{
  return [a1 scene];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_showCancelButton(void *a1, const char *a2, ...)
{
  return [a1 showCancelButton];
}

id objc_msgSend_showErrorTimer(void *a1, const char *a2, ...)
{
  return [a1 showErrorTimer];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_statusLabel(void *a1, const char *a2, ...)
{
  return [a1 statusLabel];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return [a1 timer];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_typeOfDemoDevice(void *a1, const char *a2, ...)
{
  return [a1 typeOfDemoDevice];
}

id objc_msgSend_updateErrorState(void *a1, const char *a2, ...)
{
  return [a1 updateErrorState];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}