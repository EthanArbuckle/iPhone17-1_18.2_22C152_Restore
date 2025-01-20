void sub_225AA7BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225AA7D2C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_225AA7F4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

BOOL NCIsValidWidgetDisplayMode(unint64_t a1)
{
  return a1 < 2;
}

__CFString *NCStringFromWidgetDisplayMode(uint64_t a1)
{
  uint64_t v1 = @"[Unknown]";
  if (a1 == 1) {
    uint64_t v1 = @"NCWidgetDisplayModeExpanded";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"NCWidgetDisplayModeCompact";
  }
}

__CFString *NCStringFromWidgetVisibilityState(uint64_t a1)
{
  uint64_t v1 = @"[Unknown]";
  if (a1 == 1) {
    uint64_t v1 = @"NCWidgetVisibilityStateForeground";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"NCWidgetVisibilityStateBackground";
  }
}

void sub_225AA97A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 224), 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose((const void *)(v37 - 128), 8);
  _Block_object_dispose((const void *)(v37 - 96), 8);
  _Block_object_dispose((const void *)(v37 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t SanitizedClientFrameFromHostSize(double a1, double a2, double a3, double a4, double a5, double a6)
{
  CGFloat v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = fmax(a1 - a4 - a6, 0.0);
  if (a1 <= v9) {
    double v10 = a1;
  }
  else {
    double v10 = v9;
  }
  double v11 = fmax(a2 - a3 - a5, 0.0);
  if (a2 <= v11) {
    double v12 = a2;
  }
  else {
    double v12 = v11;
  }
  v26.origin.x = *(CGFloat *)MEMORY[0x263F001A8];
  v26.origin.y = *(CGFloat *)(MEMORY[0x263F001A8] + 8);
  v26.size.width = v10;
  v26.size.height = v12;
  double Width = CGRectGetWidth(v26);
  double v14 = fmax(a4, 0.0);
  if (Width <= v14) {
    CGFloat v15 = Width;
  }
  else {
    CGFloat v15 = v14;
  }
  v27.origin.x = v15;
  v27.origin.y = v8;
  v27.size.width = v10;
  v27.size.height = v12;
  double Height = CGRectGetHeight(v27);
  double v17 = fmax(a3, 0.0);
  if (Height <= v17) {
    double v18 = Height;
  }
  else {
    double v18 = v17;
  }
  v19.n128_u64[0] = NCMainScreenScale();
  v20.n128_f64[0] = v15;
  v21.n128_f64[0] = v18;
  v22.n128_f64[0] = v10;
  v23.n128_f64[0] = v12;

  return MEMORY[0x270F06258](v20, v21, v22, v23, v19);
}

void sub_225AAAB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225AAB17C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225AAB66C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225AAC1A8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,long long buf)
{
  if (a2 == 1)
  {
    id v24 = objc_begin_catch(a1);
    v25 = NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)(v23 + 32);
      LODWORD(buf) = 138543618;
      *(void *)((char *)&buf + 4) = v26;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v24;
      _os_log_impl(&dword_225AA6000, v25, OS_LOG_TYPE_DEFAULT, "Encountered exception attempting to encode layer tree (layer=%{public}@): %{public}@", (uint8_t *)&buf, 0x16u);
    }
    objc_end_catch();
    JUMPOUT(0x225AAC014);
  }
  _Unwind_Resume(a1);
}

void sub_225AAD220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_225AADC04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void NCSwizzleClassMethod(objc_class *a1, const char *a2, const char *a3)
{
  ClassMethod = class_getClassMethod(a1, a2);
  if (!ClassMethod)
  {
    CGFloat v8 = [MEMORY[0x263F08690] currentHandler];
    double v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void NCSwizzleClassMethod(__unsafe_unretained Class, SEL, SEL)");
    uint64_t v10 = NSStringFromSelector(a2);
    [v8 handleFailureInFunction:v9, @"NCUtilities.m", 15, @"Could not obtain method for selector '%@'", v10 file lineNumber description];
  }
  v7 = class_getClassMethod(a1, a3);
  if (!v7)
  {
    double v11 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void NCSwizzleClassMethod(__unsafe_unretained Class, SEL, SEL)");
    uint64_t v13 = NSStringFromSelector(a3);
    [v11 handleFailureInFunction:v12, @"NCUtilities.m", 17, @"Could not obtain method for selector '%@'", v13 file lineNumber description];
  }

  method_exchangeImplementations(ClassMethod, v7);
}

double NCMainScreenScale()
{
  if (NCMainScreenScale_onceToken != -1) {
    dispatch_once(&NCMainScreenScale_onceToken, &__block_literal_global);
  }
  return *(double *)&NCMainScreenScale___mainScreenScale;
}

void __NCMainScreenScale_block_invoke()
{
  v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 scale];
  NCMainScreenScale___mainScreenScale = v1;

  if (*(double *)&NCMainScreenScale___mainScreenScale <= 0.0)
  {
    objc_msgSend(MEMORY[0x263F08690], "currentHandler", *(double *)&NCMainScreenScale___mainScreenScale);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = [NSString stringWithUTF8String:"CGFloat NCMainScreenScale(void)_block_invoke"];
    [v3 handleFailureInFunction:v2 file:@"NCWidgetMetrics.m" lineNumber:25 description:@"Failed to initialized main screen scale!"];
  }
}

void NCRegisterWidgetsLogging()
{
  if (NCRegisterWidgetsLogging_onceToken != -1) {
    dispatch_once(&NCRegisterWidgetsLogging_onceToken, &__block_literal_global_0);
  }
}

uint64_t __NCRegisterWidgetsLogging_block_invoke()
{
  NCLogWidgets = (uint64_t)os_log_create((const char *)NCWidgetLogSubsystem, "Widgets");

  return MEMORY[0x270F9A758]();
}

uint64_t CAMLEncodeLayerTreeToPathWithOptions()
{
  return MEMORY[0x270EFB860]();
}

void CFRelease(CFTypeRef cf)
{
}

CGRect CGRectFromString(NSString *string)
{
  MEMORY[0x270F05E78](string);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGSize CGSizeFromString(NSString *string)
{
  MEMORY[0x270F05E80](string);
  result.height = v2;
  result.width = v1;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x270F05F28]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x270F05FC0](lhs, rhs);
}

UIEdgeInsets UIEdgeInsetsFromString(NSString *string)
{
  MEMORY[0x270F05FE8](string);
  result.right = v4;
  result.bottom = v3;
  result.left = v2;
  result.top = v1;
  return result;
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x270F06268]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle()
{
  return MEMORY[0x270F496F8]();
}

uint64_t _MTInternalVibrancyEffectStyleForPublicStyle()
{
  return MEMORY[0x270F49700]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
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

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A450](cls, name);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x270ED9480](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

void method_exchangeImplementations(Method m1, Method m2)
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}