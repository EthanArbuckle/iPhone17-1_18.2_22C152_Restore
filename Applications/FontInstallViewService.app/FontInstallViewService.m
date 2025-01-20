void sub_100002244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  uint64_t v23;

  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v23 - 40));
  _Unwind_Resume(a1);
}

void sub_1000045CC()
{
  _Unwind_Resume(v0);
}

void sub_100004FA4(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id *location)
{
  *(void *)(v30 - 144) = a1;
  *(_DWORD *)(v30 - 148) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v30 - 88));
  _Unwind_Resume(*(_Unwind_Exception **)(v30 - 144));
}

unsigned char *__os_log_helper_16_0_0(unsigned char *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_100005618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v23 - 40));
  _Unwind_Resume(a1);
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_10000AA0C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id *location)
{
  *(void *)(v20 - 176) = a1;
  *(_DWORD *)(v20 - 180) = a2;
  objc_destroyWeak((id *)(v20 - 136));
  objc_destroyWeak((id *)(v20 - 120));
  _Unwind_Resume(*(_Unwind_Exception **)(v20 - 176));
}

void sub_10000AF6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v23 - 40));
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v3);
  int v9 = UIApplicationMain(argc, (char **)argv, 0, v5);

  return v9;
}

void FSLog(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v13 = 0;
  objc_storeStrong(&v13, a2);
  v12[1] = &a9;
  id v9 = objc_alloc((Class)NSString);
  v12[0] = [v9 initWithFormat:v13 arguments:&a9];
  os_log_t oslog = (os_log_t)LogForCategory(location);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v15, (uint64_t)[v12[0] UTF8String]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s", v15, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

id LogForCategory(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  v6 = (dispatch_once_t *)&LogForCategory_onceToken;
  id v5 = 0;
  objc_storeStrong(&v5, &__block_literal_global_3);
  if (*v6 != -1) {
    dispatch_once(v6, v5);
  }
  objc_storeStrong(&v5, 0);
  id v3 = [(id)gLogsDict objectForKey:location];
  if (!v3)
  {
    NSLog(@"FontServices - unknown log category.");
    objc_storeStrong(&v3, &_os_log_default);
  }
  id v2 = v3;
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&location, 0);

  return v2;
}

uint64_t __os_log_helper_16_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void FSLog_Debug(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v13 = 0;
  objc_storeStrong(&v13, a2);
  v12[1] = &a9;
  id v9 = objc_alloc((Class)NSString);
  v12[0] = [v9 initWithFormat:v13 arguments:&a9];
  os_log_t oslog = (os_log_t)LogForCategory(location);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v15, (uint64_t)[v12[0] UTF8String]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "%s", v15, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

void FSLog_Error(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v13 = 0;
  objc_storeStrong(&v13, a2);
  v12[1] = &a9;
  id v9 = objc_alloc((Class)NSString);
  v12[0] = [v9 initWithFormat:v13 arguments:&a9];
  os_log_t oslog = (os_log_t)LogForCategory(location);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v15, (uint64_t)[v12[0] UTF8String]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "%s", v15, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__cleanupOnRootControllerDismiss(void *a1, const char *a2, ...)
{
  return [a1 _cleanupOnRootControllerDismiss];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 _rootSheetPresentationController];
}

id objc_msgSend__systemDestructiveTintColor(void *a1, const char *a2, ...)
{
  return [a1 _systemDestructiveTintColor];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_applicationIconImage(void *a1, const char *a2, ...)
{
  return [a1 applicationIconImage];
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return [a1 applicationName];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_configureControllersForInput(void *a1, const char *a2, ...)
{
  return [a1 configureControllersForInput];
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return [a1 containerView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_destinationViewController(void *a1, const char *a2, ...)
{
  return [a1 destinationViewController];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_fontName(void *a1, const char *a2, ...)
{
  return [a1 fontName];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return [a1 input];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 leftBarButtonItem];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_providerCount(void *a1, const char *a2, ...)
{
  return [a1 providerCount];
}

id objc_msgSend_providerIcon(void *a1, const char *a2, ...)
{
  return [a1 providerIcon];
}

id objc_msgSend_providerName(void *a1, const char *a2, ...)
{
  return [a1 providerName];
}

id objc_msgSend_registeredFonts(void *a1, const char *a2, ...)
{
  return [a1 registeredFonts];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_remoteController(void *a1, const char *a2, ...)
{
  return [a1 remoteController];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
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

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}