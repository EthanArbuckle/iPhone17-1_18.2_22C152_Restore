void sub_100002A80(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002AA4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002AB4(uint64_t a1)
{
}

void sub_100002ABC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    v4 = sub_100002B44();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000072B8(a1);
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

id sub_100002B44()
{
  if (qword_100012428 != -1) {
    dispatch_once(&qword_100012428, &stru_10000C548);
  }
  v0 = (void *)qword_100012420;

  return v0;
}

void sub_100002B98(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    v4 = sub_100002B44();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100007344(a1);
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100002C20(uint64_t a1)
{
  v2 = [[CSSGenerateApplicationIconsResultObject alloc] initWithIconData:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) badgeIconData:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [*(id *)(a1 + 32) endOperationWithResultObject:v2];
}

void sub_100002D50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) calendarIcons];
  v2 = [v3 iconData];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void sub_100002E7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) calendarIcons];
  v2 = [v3 badgeIconData];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void sub_100002FC0(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "css_PNGRepresentation");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003190(id a1)
{
  qword_100012420 = (uint64_t)os_log_create("com.apple.classroom", "General");

  _objc_release_x1();
}

void sub_1000031D4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000033B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 sub_1000033CC(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 CGAffineTransformValue];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(_OWORD **)(v3 + 8);
  long long v5 = v4[3];
  *(_OWORD *)&v9.a = v4[2];
  *(_OWORD *)&v9.c = v5;
  *(_OWORD *)&v9.tx = v4[4];
  CGAffineTransformConcat(&v11, &t1, &v9);
  uint64_t v6 = *(void *)(v3 + 8);
  long long v8 = *(_OWORD *)&v11.c;
  __n128 result = *(__n128 *)&v11.tx;
  *(_OWORD *)(v6 + 32) = *(_OWORD *)&v11.a;
  *(_OWORD *)(v6 + 48) = v8;
  *(__n128 *)(v6 + 64) = result;
  return result;
}

void sub_100003688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000036BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateScreenState];
}

void sub_1000036FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateDeviceLocked];
}

void sub_100003EF0(id a1)
{
  if (qword_100012438 != -1) {
    dispatch_once(&qword_100012438, &stru_10000C5D8);
  }
  uint64_t v1 = qword_100012430;
  if (os_log_type_enabled((os_log_t)qword_100012430, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGTERM received, exiting.", v2, 2u);
  }
  exit(15);
}

void sub_100003FD4(id a1)
{
  qword_100012430 = (uint64_t)os_log_create("com.apple.classroom", "General");

  _objc_release_x1();
}

id CSSAllRoles()
{
  v0 = objc_opt_new();
  uint64_t v6 = v0;
  uint64_t v1 = objc_opt_new();
  id v7 = v1;
  v2 = objc_opt_new();
  long long v8 = v2;
  uint64_t v3 = +[NSArray arrayWithObjects:&v6 count:3];
  v4 = +[NSSet setWithArray:](NSSet, "setWithArray:", v3, v6, v7);

  return v4;
}

id sub_100004B64()
{
  if (qword_100012448 != -1) {
    dispatch_once(&qword_100012448, &stru_10000C5F8);
  }
  v0 = (void *)qword_100012440;

  return v0;
}

void sub_100004BB8(__IOSurface *a1)
{
  if (a1)
  {
    IOSurfaceUnlock(a1, 1u, 0);
    CFRelease(a1);
  }
}

void sub_100004DDC(id a1)
{
  qword_100012440 = (uint64_t)os_log_create("com.apple.classroom", "General");

  _objc_release_x1();
}

void sub_100004E20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

NSString *__cdecl sub_100005344(id a1, CSSRole *a2)
{
  return (NSString *)[(CSSRole *)a2 entitlement];
}

id sub_1000054B4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [a2 entitlement];
  id v5 = [v2 connection:v3 hasBooleanEntitlement:v4];

  return v5;
}

Protocol *__cdecl sub_10000556C(id a1, CSSRole *a2)
{
  return (Protocol *)[(CSSRole *)a2 protocol];
}

void sub_1000056FC(id a1)
{
  qword_100012450 = (uint64_t)os_log_create("com.apple.classroom", "General");

  _objc_release_x1();
}

void sub_100005880(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) screenshotter];
  objc_msgSend(v2, "fetchScreenshotDataWithMaximumSizeInPixels:completion:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void sub_10000599C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) applicationProvider];
  [v2 fetchApplicationWithDescriptor:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void sub_100005A88(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) internetDateProvider];
  [v2 fetchInternetDateWithCompletion:*(void *)(a1 + 40)];
}

id sub_100005F4C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id makeService()
{
  uint64_t v1 = objc_opt_new();

  return v1;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = makeService();
  [v3 run];

  return 0;
}

void sub_100006608(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v6 = a2;
  id v7 = [v5 localizedName];
  long long v8 = [*(id *)(a1 + 48) shortVersionString];
  uint64_t v9 = [v6 iconData];
  uint64_t v10 = [v6 badgeIconData];

  id v11 = [v3 applicationWithBundleIdentifier:v4 name:v7 shortVersionString:v8 iconData:v9 badgeIconData:v10];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_1000067E4(void *a1, void *a2)
{
  uint64_t v4 = (void *)a1[4];
  uint64_t v3 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v3 bundleIdentifier];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v8 = [v7 localizedStringForKey:@"Web Clip" value:&stru_10000C9F0 table:0];
  uint64_t v9 = [v5 iconData];
  uint64_t v10 = [v5 badgeIconData];

  id v11 = [v4 applicationWithBundleIdentifier:v6 name:v8 shortVersionString:0 iconData:v9 badgeIconData:v10];

  (*(void (**)(void))(a1[6] + 16))();
}

void sub_100006AE0(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = (void *)a1[6];
  id v6 = a2;
  id v7 = [v5 title];
  long long v8 = [v6 iconData];
  uint64_t v9 = [v6 badgeIconData];

  id v10 = [v3 applicationWithBundleIdentifier:v4 name:v7 shortVersionString:0 iconData:v8 badgeIconData:v9];

  (*(void (**)(void))(a1[7] + 16))();
}

void sub_100006EE8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];
  if (v2)
  {
    if (qword_100012468 != -1) {
      dispatch_once(&qword_100012468, &stru_10000C7D0);
    }
    uint64_t v3 = (void *)qword_100012460;
    if (os_log_type_enabled((os_log_t)qword_100012460, OS_LOG_TYPE_ERROR)) {
      sub_100007530(a1, v3, v2);
    }
  }
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) resultObject];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

void sub_100007080(id a1)
{
  qword_100012460 = (uint64_t)os_log_create("com.apple.classroom", "General");

  _objc_release_x1();
}

void sub_1000072B8(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) bundleIdentifier];
  sub_1000031D4((void *)&_mh_execute_header, v2, v3, "Got back nil full size icon data for %{public}@", v4, v5, v6, v7, 2u);
}

void sub_100007344(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) bundleIdentifier];
  sub_1000031D4((void *)&_mh_execute_header, v2, v3, "Got back nil badge icon data for %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000073D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007408(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004E20((void *)&_mh_execute_header, a1, a3, "Could not take screenshot because IOSurfaceCreate() returned NULL", a5, a6, a7, a8, 0);
}

void sub_100007440(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004E20((void *)&_mh_execute_header, a1, a3, "Could not take screenshot because CGDataProviderCreateWithData() returned NULL", a5, a6, a7, a8, 0);
}

void sub_100007478(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 denialMessageForConnection:a3];
  int v7 = 138543362;
  long long v8 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v7, 0xCu);
}

void sub_100007530(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = a2;
  uint64_t v6 = [a3 verboseDescription];
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Generate icons operation failed for descriptor %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

uint64_t CARenderServerSnapshot()
{
  return _CARenderServerSnapshot();
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return _CATransform3DMakeAffineTransform(retstr, m);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return _CGDataProviderCreateWithData(info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return _CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, bitmapInfo, provider, decode, shouldInterpolate, intent);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CRKErrorWithCodeAndUserInfo()
{
  return _CRKErrorWithCodeAndUserInfo();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return _IOSurfaceCreate(properties);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return _IOSurfaceGetBaseAddress(buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceLock(buffer, options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceUnlock(buffer, options, seed);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return _NSStringFromProtocol(proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGAffineTransformValue(void *a1, const char *a2, ...)
{
  return [a1 CGAffineTransformValue];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_applicationProvider(void *a1, const char *a2, ...)
{
  return [a1 applicationProvider];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_badgeIconData(void *a1, const char *a2, ...)
{
  return [a1 badgeIconData];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_calendarIcons(void *a1, const char *a2, ...)
{
  return [a1 calendarIcons];
}

id objc_msgSend_classroomKitBundle(void *a1, const char *a2, ...)
{
  return [a1 classroomKitBundle];
}

id objc_msgSend_composedTransform(void *a1, const char *a2, ...)
{
  return [a1 composedTransform];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentMode(void *a1, const char *a2, ...)
{
  return [a1 currentMode];
}

id objc_msgSend_currentOrientation(void *a1, const char *a2, ...)
{
  return [a1 currentOrientation];
}

id objc_msgSend_denominator(void *a1, const char *a2, ...)
{
  return [a1 denominator];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_deviceProperties(void *a1, const char *a2, ...)
{
  return [a1 deviceProperties];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_displaySize(void *a1, const char *a2, ...)
{
  return [a1 displaySize];
}

id objc_msgSend_entitlement(void *a1, const char *a2, ...)
{
  return [a1 entitlement];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_exportedObject(void *a1, const char *a2, ...)
{
  return [a1 exportedObject];
}

id objc_msgSend_greatestCommonDivisor(void *a1, const char *a2, ...)
{
  return [a1 greatestCommonDivisor];
}

id objc_msgSend_hasZeroArea(void *a1, const char *a2, ...)
{
  return [a1 hasZeroArea];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_iconData(void *a1, const char *a2, ...)
{
  return [a1 iconData];
}

id objc_msgSend_iconImage(void *a1, const char *a2, ...)
{
  return [a1 iconImage];
}

id objc_msgSend_includeBadgeIcon(void *a1, const char *a2, ...)
{
  return [a1 includeBadgeIcon];
}

id objc_msgSend_includeIcon(void *a1, const char *a2, ...)
{
  return [a1 includeIcon];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internetDateProvider(void *a1, const char *a2, ...)
{
  return [a1 internetDateProvider];
}

id objc_msgSend_isGeneratingCalendarIcons(void *a1, const char *a2, ...)
{
  return [a1 isGeneratingCalendarIcons];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isScreenOn(void *a1, const char *a2, ...)
{
  return [a1 isScreenOn];
}

id objc_msgSend_isSpecificWebClip(void *a1, const char *a2, ...)
{
  return [a1 isSpecificWebClip];
}

id objc_msgSend_isWebClipHostApplication(void *a1, const char *a2, ...)
{
  return [a1 isWebClipHostApplication];
}

id objc_msgSend_listenerDelegate(void *a1, const char *a2, ...)
{
  return [a1 listenerDelegate];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return [a1 mainDisplay];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nativeOrientation(void *a1, const char *a2, ...)
{
  return [a1 nativeOrientation];
}

id objc_msgSend_numerator(void *a1, const char *a2, ...)
{
  return [a1 numerator];
}

id objc_msgSend_preferredScale(void *a1, const char *a2, ...)
{
  return [a1 preferredScale];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return [a1 protocol];
}

id objc_msgSend_resultObject(void *a1, const char *a2, ...)
{
  return [a1 resultObject];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screenStateNotificationToken(void *a1, const char *a2, ...)
{
  return [a1 screenStateNotificationToken];
}

id objc_msgSend_screenshotter(void *a1, const char *a2, ...)
{
  return [a1 screenshotter];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setupSignalHandler(void *a1, const char *a2, ...)
{
  return [a1 setupSignalHandler];
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return [a1 shortVersionString];
}

id objc_msgSend_simplifiedFraction(void *a1, const char *a2, ...)
{
  return [a1 simplifiedFraction];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sourceIcon(void *a1, const char *a2, ...)
{
  return [a1 sourceIcon];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_transforms(void *a1, const char *a2, ...)
{
  return [a1 transforms];
}

id objc_msgSend_updateDeviceLocked(void *a1, const char *a2, ...)
{
  return [a1 updateDeviceLocked];
}

id objc_msgSend_updateScreenState(void *a1, const char *a2, ...)
{
  return [a1 updateScreenState];
}

id objc_msgSend_verboseDescription(void *a1, const char *a2, ...)
{
  return [a1 verboseDescription];
}

id objc_msgSend_webClips(void *a1, const char *a2, ...)
{
  return [a1 webClips];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_zeroSize(void *a1, const char *a2, ...)
{
  return [a1 zeroSize];
}