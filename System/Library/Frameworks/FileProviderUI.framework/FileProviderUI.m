void CallBlockOnMainThread(void *a1)
{
  void (**block)(void);
  uint64_t vars8;

  block = a1;
  if (pthread_main_np()) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void sub_235BE7B90(_Unwind_Exception *a1)
{
}

id FPUILogHandle()
{
  v0 = (void *)fpuiLogHandle;
  if (!fpuiLogHandle)
  {
    FPUIInitLogging();
    v0 = (void *)fpuiLogHandle;
  }

  return v0;
}

id FPProviderDomainIDToDomainIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 rangeOfString:@"/"];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    v4 = [v1 substringFromIndex:v2 + v3];
  }

  return v4;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t FPUITableCellServerIcon()
{
  return [MEMORY[0x263F1C6B0] systemImageNamed:@"network" withConfiguration:0];
}

void sub_235BEA714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *FPUILoc(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  uint64_t v10 = FPUILocalizationBundle();
  v11 = [v10 localizedStringForKey:v9 value:@"FILEPROVIDER_UI_LOCALIZED_STRING_UNAVAILABLE" table:@"FileProviderUI"];

  if ([v11 isEqualToString:@"FILEPROVIDER_UI_LOCALIZED_STRING_UNAVAILABLE"])
  {
    v12 = fpuiLogHandle;
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v12 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      FPUILoc_cold_1((uint64_t)v9, v12);
    }
    v13 = @"FILEPROVIDER_UI_LOCALIZED_STRING_UNAVAILABLE";
  }
  else
  {
    v13 = (__CFString *)[[NSString alloc] initWithFormat:v11 arguments:&a9];
  }

  return v13;
}

id FPUILocalizationBundle()
{
  if (FPUILocalizationBundle_onceToken != -1) {
    dispatch_once(&FPUILocalizationBundle_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)FPUILocalizationBundle_bundle;

  return v0;
}

uint64_t __FPUILocalizationBundle_block_invoke()
{
  FPUILocalizationBundle_bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

void FPUIInitLogging()
{
  if (FPUIInitLogging_once != -1) {
    dispatch_once(&FPUIInitLogging_once, &__block_literal_global_3);
  }
}

uint64_t __FPUIInitLogging_block_invoke()
{
  fpuiLogHandle = (uint64_t)os_log_create("com.apple.FileProviderUI", "FileProviderUI");

  return MEMORY[0x270F9A758]();
}

BOOL IsMainThread()
{
  return pthread_main_np() != 0;
}

void sub_235BED020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void FPUILoc_cold_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  v4 = FPUILocalizationBundle();
  v5 = [v4 bundlePath];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_235BE4000, v3, OS_LOG_TYPE_ERROR, "Localized key '%@' missing from table 'FileProviderUI' (bundlePath:%@)", (uint8_t *)&v6, 0x16u);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x270EE4578](bundle, key, value, tableName);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t FPExtensionMatchingDictionaryForItem()
{
  return MEMORY[0x270EEBAB0]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F05FC8](category);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x270EE55C0]();
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

int pthread_main_np(void)
{
  return MEMORY[0x270EDAF40]();
}