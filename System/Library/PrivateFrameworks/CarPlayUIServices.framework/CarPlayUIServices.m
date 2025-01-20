id CRSUIImageViewWithResolver(void *a1)
{
  objc_class *v1;
  void (**v2)(id, void *);
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t vars8;

  v1 = (objc_class *)MEMORY[0x263F1C6B8];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
  v5 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
  v6 = v2[2](v2, v4);
  [v3 registerImage:v6 withTraitCollection:v4];

  v7 = v2[2](v2, v5);

  [v3 registerImage:v7 withTraitCollection:v5];
  v8 = [MEMORY[0x263F1CB00] currentTraitCollection];
  v9 = [v3 imageWithTraitCollection:v8];

  v10 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v9];
  [v10 setContentMode:2];
  [v10 setClipsToBounds:1];

  return v10;
}

CRSUICAPackageView *CRSUICAPackageViewWithStatefulPackage(void *a1)
{
  id v1 = a1;
  int v2 = [v1 hasDynamicState];
  v3 = [CRSUICAPackageView alloc];
  v4 = [v1 package];
  if (v2)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __CRSUICAPackageViewWithStatefulPackage_block_invoke;
    v8[3] = &unk_2643075F8;
    id v9 = v1;
    v5 = [(CRSUICAPackageView *)v3 initWithPackage:v4 dynamicStateProvider:v8];
  }
  else
  {
    v6 = [v1 lightModeState];
    v5 = [(CRSUICAPackageView *)v3 initWithPackage:v4 state:v6];
  }
  [(CRSUICAPackageView *)v5 setContentMode:2];
  [(CRSUICAPackageView *)v5 setClipsToBounds:1];

  return v5;
}

id __CRSUICAPackageViewWithStatefulPackage_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInterfaceStyle];
  v4 = *(void **)(a1 + 32);
  if (v3 == 2) {
    [v4 darkModeState];
  }
  else {
  v5 = [v4 lightModeState];
  }
  return v5;
}

void sub_21817CA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21817CB84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21817D934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21817DA74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21817F93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21817FA7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id CRSUILogForCategory(unint64_t a1)
{
  if (a1 >= 7) {
    CRSUILogForCategory_cold_1();
  }
  if (CRSUILogForCategory_onceToken != -1) {
    dispatch_once(&CRSUILogForCategory_onceToken, &__block_literal_global_4);
  }
  int v2 = (void *)CRSUILogForCategory_logObjects[a1];
  return v2;
}

uint64_t __CRSUILogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.CarPlayUIServices", "CarPlayUIServices");
  id v1 = (void *)CRSUILogForCategory_logObjects[0];
  CRSUILogForCategory_logObjects[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.CarPlayUIServices", "StatusBar");
  uint64_t v3 = (void *)qword_267BC2210;
  qword_267BC2210 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.CarPlayUIServices", "AudioNotification");
  v5 = (void *)qword_267BC2218;
  qword_267BC2218 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.CarPlayUIServices", "DashboardWindow");
  v7 = (void *)qword_267BC2220;
  qword_267BC2220 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.CarPlayUIServices", "Appearance");
  id v9 = (void *)qword_267BC2228;
  qword_267BC2228 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.CarPlayUIServices", "PunchThrough");
  v11 = (void *)qword_267BC2230;
  qword_267BC2230 = (uint64_t)v10;

  qword_267BC2238 = (uint64_t)os_log_create("com.apple.CarPlayUIServices", "ClusterTheme");
  return MEMORY[0x270F9A758]();
}

void sub_218182710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218182870(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_218183FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218184154(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_218184A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void CRSUICarPlayTestAppSetMainScreenCornerMaskImage(void *a1)
{
  image = a1;
  CFPreferencesAppSynchronize(@"com.apple.carplay.internal");
  if (image)
  {
    id v1 = UIImagePNGRepresentation(image);
    CFPreferencesSetAppValue(@"CornerMaskOverrideImage", v1, @"com.apple.carplay.internal");
  }
  else
  {
    CFPreferencesSetAppValue(@"CornerMaskOverrideImage", 0, @"com.apple.carplay.internal");
  }
}

void CRSUICarPlayTestAppSetClusterScreenCornerMaskImage(void *a1)
{
  image = a1;
  CFPreferencesAppSynchronize(@"com.apple.carplay.internal");
  if (image)
  {
    id v1 = UIImagePNGRepresentation(image);
    CFPreferencesSetAppValue(@"ClusterCornerMaskOverrideImage", v1, @"com.apple.carplay.internal");
  }
  else
  {
    CFPreferencesSetAppValue(@"ClusterCornerMaskOverrideImage", 0, @"com.apple.carplay.internal");
  }
}

void CRSUICarPlayTestAppSetUISyncDisabled(int a1)
{
  CFPreferencesAppSynchronize(@"com.apple.carplay.internal");
  if (a1) {
    os_log_t v2 = (const void *)*MEMORY[0x263EFFB40];
  }
  else {
    os_log_t v2 = 0;
  }
  CFPreferencesSetAppValue(@"UISyncChannelDisabled", v2, @"com.apple.carplay.internal");
}

void sub_218187D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218187E70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_21818B904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21818BA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21818F420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218191530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2181923F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 144));
  _Unwind_Resume(a1);
}

void CRSUILogForCategory_cold_1()
{
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x270F10750]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x270F10770]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x270F10778]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UISceneSettingsDiffActionPerformChangesWithTransitionContext()
{
  return MEMORY[0x270F063B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}