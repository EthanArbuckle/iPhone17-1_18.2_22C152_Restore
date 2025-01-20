void sendNotificationAfterHandlingWebKeyEventIfNeeded(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t vars8;

  v5 = a1;
  if (_AXSAutomationEnabled())
  {
    v1 = [v5 characters];
    v2 = [v5 charactersIgnoringModifiers];
    v3 = [v5 modifierFlags];
    v4 = [NSNumber numberWithUnsignedInt:v3];
    AXUIAutomationHandleKeyComplete();
  }
}

void sub_2404C4B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2404C4F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t axIsSafari()
{
  if ((axIsSafari_DidCheck & 1) == 0)
  {
    v0 = [(id)*MEMORY[0x263F1D020] _accessibilityBundleIdentifier];
    axIsSafari_IsSafari = [v0 isEqualToString:@"com.apple.mobilesafari"];

    axIsSafari_DidCheck = 1;
  }
  return axIsSafari_IsSafari;
}

void sub_2404C51D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getWebThreadLockSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!WebKitLegacyLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __WebKitLegacyLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2650B9D18;
    uint64_t v6 = 0;
    WebKitLegacyLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v2 = (void *)WebKitLegacyLibraryCore_frameworkLibrary;
  if (!WebKitLegacyLibraryCore_frameworkLibrary) {
    __getWebThreadLockSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  result = dlsym(v2, "WebThreadLock");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWebThreadLockSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __WebKitLegacyLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WebKitLegacyLibraryCore_frameworkLibrary = result;
  return result;
}

void insertChar(__int16 a1, _WORD **a2, void **a3, CGRect **a4, void *a5, uint64_t a6, uint64_t a7)
{
  v9 = *a2;
  _WORD *v9 = a1;
  *a2 = v9 + 1;
  v10 = *a3;
  void *v10 = a7;
  *a3 = v10 + 1;
  double x = (*a4)[-1].origin.x;
  double y = (*a4)[-1].origin.y;
  double width = (*a4)[-1].size.width;
  double height = (*a4)[-1].size.height;
  double v16 = x - width;
  double v17 = y - height;
  double v18 = width * 0.5;
  if (a6 == 270) {
    double v19 = width * 0.5;
  }
  else {
    double v19 = (*a4)[-1].size.height;
  }
  if (a6 != 270) {
    double v17 = (*a4)[-1].origin.y;
  }
  if (a6 == 180)
  {
    double v19 = (*a4)[-1].size.height;
    double v20 = height * 0.5;
  }
  else
  {
    double v20 = (*a4)[-1].size.width;
  }
  if (a6 == 180) {
    double v17 = (*a4)[-1].origin.y;
  }
  else {
    double v16 = (*a4)[-1].origin.x;
  }
  double v21 = x + width;
  double v22 = y + height;
  if (a6 != 90)
  {
    double v18 = (*a4)[-1].size.height;
    double v22 = (*a4)[-1].origin.y;
  }
  if (a6) {
    double height = v18;
  }
  else {
    double width = height * 0.5;
  }
  if (a6) {
    double y = v22;
  }
  else {
    double x = v21;
  }
  if (a6 > 179)
  {
    double height = v19;
    double width = v20;
    double y = v17;
    double x = v16;
  }
  v11 = *a4;
  CGRect *v11 = CGRectIntegral(*(CGRect *)&x);
  ++*a4;
  ++*a5;
}

void __getWebThreadLockSymbolLoc_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *WebKitLegacyLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"UIWebDocumentViewAccessibility.m", 16, @"%s", *a1);

  __break(1u);
  AXFormatInteger();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x270F09248]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F09460]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F09540]();
}

uint64_t AXUIAutomationHandleKeyComplete()
{
  return MEMORY[0x270F808B0]();
}

uint64_t AXUIKeyboardWindow()
{
  return MEMORY[0x270F09DA0]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x270EE6BF8](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x270EE6C00](document, pageNumber);
}

uint64_t CGPDFPageCopyTextString()
{
  return MEMORY[0x270EE6D68]();
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x270EE6D80](page, *(void *)&box);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x270EE6DA8](page);
}

uint64_t CGPDFTextStringGetBBoxForIndex()
{
  return MEMORY[0x270EE6F18]();
}

uint64_t CGPDFTextStringGetCharacterAtIndex()
{
  return MEMORY[0x270EE6F20]();
}

uint64_t CGPDFTextStringGetLength()
{
  return MEMORY[0x270EE6F28]();
}

uint64_t CGPDFTextStringGetPositionForIndex()
{
  return MEMORY[0x270EE6F30]();
}

uint64_t CGPDFTextStringGetTransformForIndex()
{
  return MEMORY[0x270EE6F38]();
}

uint64_t CGPDFTextStringRelease()
{
  return MEMORY[0x270EE6F40]();
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t DDResultGetCategory()
{
  return MEMORY[0x270F251C0]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x270F25200]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilitySceneReferencePointToScreenPoint()
{
  return MEMORY[0x270F80A00]();
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x270F80A40]();
}

uint64_t WebThreadLock()
{
  return MEMORY[0x270F07310]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F095D8]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIApplicationIsWebKitLoaded()
{
  return MEMORY[0x270F06318]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F09600]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
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

uint64_t uscript_getScript()
{
  return MEMORY[0x270F998E8]();
}