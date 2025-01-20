id _pttAttemptTranslateErrorFromCXError(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t vars8;

  v1 = a1;
  v2 = [v1 domain];
  v3 = [v2 isEqualToString:*MEMORY[0x263EFC8B8]];

  if (v3)
  {
    switch([v1 code])
    {
      case 1:
      case 8:
        v4 = (void *)MEMORY[0x263F087E8];
        v5 = [v1 userInfo];
        v6 = v4;
        v7 = 0;
        break;
      case 2:
        v9 = (void *)MEMORY[0x263F087E8];
        v5 = [v1 userInfo];
        v6 = v9;
        v7 = 3;
        break;
      case 3:
        v10 = (void *)MEMORY[0x263F087E8];
        v5 = [v1 userInfo];
        v6 = v10;
        v7 = 2;
        break;
      case 4:
        v11 = (void *)MEMORY[0x263F087E8];
        v5 = [v1 userInfo];
        v6 = v11;
        v7 = 1;
        break;
      case 6:
        v12 = (void *)MEMORY[0x263F087E8];
        v5 = [v1 userInfo];
        v6 = v12;
        v7 = 4;
        break;
      case 7:
        v13 = (void *)MEMORY[0x263F087E8];
        v5 = [v1 userInfo];
        v6 = v13;
        v7 = 5;
        break;
      case 9:
        v14 = (void *)MEMORY[0x263F087E8];
        v5 = [v1 userInfo];
        v6 = v14;
        v7 = 7;
        break;
      case 10:
        v15 = (void *)MEMORY[0x263F087E8];
        v5 = [v1 userInfo];
        v6 = v15;
        v7 = 8;
        break;
      case 11:
        v16 = (void *)MEMORY[0x263F087E8];
        v5 = [v1 userInfo];
        v6 = v16;
        v7 = 6;
        break;
      case 12:
        v17 = (void *)MEMORY[0x263F087E8];
        v5 = [v1 userInfo];
        v6 = v17;
        v7 = 9;
        break;
      default:
        goto LABEL_4;
    }
    v8 = [v6 errorWithDomain:@"com.apple.pushtotalk.channel" code:v7 userInfo:v5];
  }
  else
  {
LABEL_4:
    v8 = v1;
  }

  return v8;
}

id PTDefaultLog()
{
  if (PTDefaultLog_onceToken != -1) {
    dispatch_once(&PTDefaultLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)PTDefaultLog_log;

  return v0;
}

uint64_t __PTDefaultLog_block_invoke()
{
  PTDefaultLog_log = (uint64_t)os_log_create("com.apple.pushtotalk.framework", "Default");

  return MEMORY[0x270F9A758]();
}

void sub_239822F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_239823854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2398249A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id _pttTemporaryFilesystemURLForImage(void *a1)
{
  if (a1)
  {
    objc_msgSend(a1, "imageByPreparingThumbnailOfSize:", 300.0, 300.0);
    v1 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v2 = UIImageJPEGRepresentation(v1, 1.0);
    v3 = [MEMORY[0x263F08C38] UUID];
    v4 = NSString;
    v5 = [v3 UUIDString];
    v6 = [v4 stringWithFormat:@"PushToTalk-%@.jpeg", v5];

    v7 = NSTemporaryDirectory();
    v8 = [v7 stringByAppendingPathComponent:v6];

    uint64_t v9 = [NSURL fileURLWithPath:v8];
    [v2 writeToFile:v8 atomically:1];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id _pttCheckIfErrorPreventingInstantiationExists()
{
  v0 = [MEMORY[0x263F08AB0] processInfo];
  char v1 = [v0 isiOSAppOnMac];

  if (v1)
  {
    uint64_t v2 = 1;
    NSLog(&cfstr_ErrorPushToTal.isa);
    goto LABEL_14;
  }
  v3 = SecTaskCreateFromSelf(0);
  if (!v3) {
    goto LABEL_13;
  }
  v4 = v3;
  CFTypeRef v5 = SecTaskCopyValueForEntitlement(v3, @"com.apple.developer.push-to-talk", 0);
  CFRelease(v4);
  if (!v5) {
    goto LABEL_13;
  }
  CFTypeID v6 = CFGetTypeID(v5);
  if (v6 != CFBooleanGetTypeID())
  {
    CFRelease(v5);
    goto LABEL_13;
  }
  int Value = CFBooleanGetValue((CFBooleanRef)v5);
  CFRelease(v5);
  if (!Value)
  {
LABEL_13:
    uint64_t v2 = 4;
    NSLog(&cfstr_ErrorPushToTal_0.isa);
    goto LABEL_14;
  }
  v8 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v9 = [v8 infoDictionary];

  v10 = [v9 objectForKeyedSubscript:@"UIBackgroundModes"];
  int v11 = [v10 containsObject:@"push-to-talk"];

  if (v11)
  {
    v12 = SecTaskCreateFromSelf(0);
    if (v12)
    {
      v13 = v12;
      CFTypeRef v14 = SecTaskCopyValueForEntitlement(v12, @"aps-environment", 0);
      CFRelease(v13);
      if (v14)
      {
        CFTypeID v15 = CFGetTypeID(v14);
        CFTypeID TypeID = CFStringGetTypeID();
        CFRelease(v14);
        if (v15 == TypeID)
        {
          v17 = 0;
          goto LABEL_15;
        }
      }
    }
    uint64_t v2 = 3;
    NSLog(&cfstr_ErrorPushToTal_2.isa);
  }
  else
  {
    uint64_t v2 = 2;
    NSLog(&cfstr_ErrorPushToTal_1.isa);
  }
LABEL_14:
  v17 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.pushtotalk.instantiation" code:v2 userInfo:0];
LABEL_15:

  return v17;
}

BOOL PTChannelJoinReasonForCXActionOriginator(uint64_t a1)
{
  return a1 == 3;
}

uint64_t PTChannelLeaveReasonForCXActionOriginator(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return qword_239827498[a1 - 1];
  }
}

uint64_t PTChannelTransmitRequestSourceForCXActionOriginator(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return qword_2398274B8[a1 - 1];
  }
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F06070](image, compressionQuality);
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}