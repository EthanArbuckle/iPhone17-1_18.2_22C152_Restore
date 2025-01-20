void sub_24724CBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24724D634(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_24724DC8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_24725C658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
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

id AXAuditLocString(void *a1, uint64_t a2)
{
  return AXAuditLocStringWithValue(a1, a2, &stru_26FB6E0B0);
}

id AXAuditLocStringWithValue(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if (AXAuditLocStringWithValue_onceToken != -1) {
    dispatch_once(&AXAuditLocStringWithValue_onceToken, &__block_literal_global_17);
  }
  v7 = @"LocalizableIOS";
  if (a2 != 1) {
    v7 = 0;
  }
  if (a2) {
    v8 = v7;
  }
  else {
    v8 = @"Localizable";
  }
  if ([(__CFString *)v8 length])
  {
    v9 = [(id)AXAuditLocStringWithValue_myBundle localizedStringForKey:v5 value:v6 table:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t AXAuditAttributeWithPrefixLocStringExists(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = [NSString stringWithFormat:@"%@-%@", a2, v5];
  v7 = AXAuditLocStringWithValue(v6, 1, @"KEY NOT FOUND");
  if (![v7 isEqualToString:@"KEY NOT FOUND"])
  {
    if (!a3)
    {
      uint64_t v10 = 1;
      id v8 = v6;
      id v9 = v7;
      goto LABEL_11;
    }
    id v8 = v6;
    goto LABEL_8;
  }
  id v8 = v5;

  AXAuditLocStringWithValue(v8, 1, @"KEY NOT FOUND");
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (([v9 isEqualToString:@"KEY NOT FOUND"] & 1) == 0)
  {
    if (!a3)
    {
LABEL_9:
      uint64_t v10 = 1;
      goto LABEL_11;
    }
    v7 = v9;
LABEL_8:
    id v9 = v7;
    *a3 = v9;
    goto LABEL_9;
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

id AXAuditAttributeWithPrefixLocString(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v8 = 0;
  LODWORD(a2) = AXAuditAttributeWithPrefixLocStringExists(v3, a2, &v8);
  id v4 = v8;
  id v5 = v4;
  if (!a2) {
    id v4 = v3;
  }
  id v6 = v4;

  return v6;
}

BOOL AuditDoesAllowDeveloperAttributes(int pid)
{
  mach_port_name_t v2 = 0;
  return task_for_pid(*MEMORY[0x263EF8960], pid, &v2) == 0;
}

id iOSFrontmostApp()
{
  v0 = [MEMORY[0x263F21668] primaryApp];
  if (!v0)
  {
    AXUIElementRef SystemWide = AXUIElementCreateSystemWide();
    if (SystemWide)
    {
      AXUIElementRef v2 = SystemWide;
      AXUIElementCopyApplicationAtPosition();
      v0 = 0;
      CFRelease(v2);
    }
    else
    {
      v0 = 0;
    }
  }

  return v0;
}

id AXAuditCurrentApplications()
{
  v0 = [MEMORY[0x263F21668] systemWideElement];
  v1 = [v0 systemApplication];
  AXUIElementRef v2 = [v1 currentApplications];

  return v2;
}

uint64_t __AXAuditLocStringWithValue_block_invoke()
{
  AXAuditLocStringWithValue_myBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

void sub_247264F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void updateTimestampOfResults(void *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v3;
  uint64_t v20 = [v3 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v30;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v29 + 1) + 8 * v5);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v7 = [v6 caseResults];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v34 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v26;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
              long long v21 = 0u;
              long long v22 = 0u;
              long long v23 = 0u;
              long long v24 = 0u;
              v13 = [v12 auditIssues];
              uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v33 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v22;
                do
                {
                  uint64_t v17 = 0;
                  do
                  {
                    if (*(void *)v22 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    [*(id *)(*((void *)&v21 + 1) + 8 * v17++) setTimeStamp:v4];
                  }
                  while (v15 != v17);
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v33 count:16];
                }
                while (v15);
              }

              ++v11;
            }
            while (v11 != v9);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v34 count:16];
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v20);
  }
}

void _axNotificationHandler(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if (a3 == 1000) {
    [v6 _screenChangedNotification];
  }
}

uint64_t AXDevicePrimeDisplayManager()
{
  return MEMORY[0x270F0A020]();
}

AXError AXObserverAddNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification, void *refcon)
{
  return MEMORY[0x270F09818](observer, element, notification, refcon);
}

AXError AXObserverCreate(pid_t application, AXObserverCallback callback, AXObserverRef *outObserver)
{
  return MEMORY[0x270F09820](*(void *)&application, callback, outObserver);
}

CFRunLoopSourceRef AXObserverGetRunLoopSource(AXObserverRef observer)
{
  return (CFRunLoopSourceRef)MEMORY[0x270F09828](observer);
}

AXError AXObserverRemoveNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification)
{
  return MEMORY[0x270F09830](observer, element, notification);
}

uint64_t AXUIElementCopyApplicationAtPosition()
{
  return MEMORY[0x270F09880]();
}

AXUIElementRef AXUIElementCreateSystemWide(void)
{
  return (AXUIElementRef)MEMORY[0x270F09898]();
}

AXError AXUIElementGetPid(AXUIElementRef element, pid_t *pid)
{
  return MEMORY[0x270F098A0](element, pid);
}

uint64_t AXUIElementRegisterSystemWideServerDeathCallback()
{
  return MEMORY[0x270F098C0]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x270EE5BF8]();
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextStrokeRectWithWidth(CGContextRef c, CGRect rect, CGFloat width)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint)
{
  return MEMORY[0x270EF2A88]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)bPoint, *(__n128 *)&bPoint.y);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x270EF2A90]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSEqualSizes(NSSize aSize, NSSize bSize)
{
  return MEMORY[0x270EF2A98]((__n128)aSize, *(__n128 *)&aSize.height, (__n128)bSize, *(__n128 *)&bSize.height);
}

NSRect NSInsetRect(NSRect aRect, CGFloat dX, CGFloat dY)
{
  MEMORY[0x270EF2AE0]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, dX, dY);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL NSIsEmptyRect(NSRect aRect)
{
  return MEMORY[0x270EF2B08]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x270EF2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F06070](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

uint64_t _AXUIElementCreateData()
{
  return MEMORY[0x270F09980]();
}

uint64_t _AXUIElementCreateWithData()
{
  return MEMORY[0x270F09988]();
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

void dispatch_activate(dispatch_object_t object)
{
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x270F9AAB0](p, isRequiredMethod, isInstanceMethod, outCount);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x270EDB840](*(void *)&target_tport, *(void *)&pid, t);
}