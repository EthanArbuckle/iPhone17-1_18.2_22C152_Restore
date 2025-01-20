void sub_22CE9ACBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *__getHLPHelpViewControllerVersionLatestSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)HelpKitLibrary();
  result = dlsym(v2, "HLPHelpViewControllerVersionLatest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHLPHelpViewControllerVersionLatestSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t HelpKitLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!HelpKitLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __HelpKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264937048;
    uint64_t v5 = 0;
    HelpKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = HelpKitLibraryCore_frameworkLibrary;
  v1 = (void *)v3[0];
  if (!HelpKitLibraryCore_frameworkLibrary)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __HelpKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HelpKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getHLPHelpViewControllerClass_block_invoke(uint64_t a1)
{
  HelpKitLibrary();
  Class result = objc_getClass("HLPHelpViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHLPHelpViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHLPHelpViewControllerClass_block_invoke_cold_1();
    return (Class)BCViewContollerForModallyPresentingTheUrl(v3);
  }
  return result;
}

id BCViewContollerForModallyPresentingTheUrl(void *a1)
{
  id v1 = a1;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getSFSafariViewControllerClass_softClass;
  uint64_t v11 = getSFSafariViewControllerClass_softClass;
  if (!getSFSafariViewControllerClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getSFSafariViewControllerClass_block_invoke;
    v7[3] = &unk_264937028;
    v7[4] = &v8;
    __getSFSafariViewControllerClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  uint64_t v3 = v2;
  _Block_object_dispose(&v8, 8);
  long long v4 = (void *)[[v3 alloc] initWithURL:v1];
  uint64_t v5 = BPSBridgeTintColor();
  [v4 setPreferredControlTintColor:v5];

  [v4 setModalPresentationStyle:1];
  return v4;
}

void sub_22CE9B018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFSafariViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SafariServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __SafariServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264937080;
    uint64_t v6 = 0;
    SafariServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!SafariServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SFSafariViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getSFSafariViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFSafariViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SafariServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SafariServicesLibraryCore_frameworkLibrary = result;
  return result;
}

id BCDiscoverPluginDescriptionWithSymbol(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F1C370];
  id v2 = a1;
  uint64_t v3 = (void *)[[v1 alloc] initWithData:0 ofType:0];
  long long v4 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v5 = *MEMORY[0x263F1D270];
  uint64_t v6 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D270] scale:2];
  uint64_t v7 = [v4 systemImageNamed:@"arrow.up.forward.app.fill" withConfiguration:v6];
  uint64_t v8 = [MEMORY[0x263F1C550] systemGrayColor];
  v9 = [v7 imageWithTintColor:v8 renderingMode:0];
  [v3 setImage:v9];

  uint64_t v10 = [v3 image];
  [v10 size];
  double v12 = v11;
  double v14 = v13;

  v15 = [MEMORY[0x263F1C658] preferredFontForTextStyle:v5];
  [v15 capHeight];
  objc_msgSend(v3, "setBounds:", 0.0, (v16 - v14) * 0.5, v12, v14);

  v17 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v2];
  v18 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
  [v17 appendAttributedString:v18];

  v19 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v3];
  [v17 appendAttributedString:v19];

  return v17;
}

uint64_t __getHLPHelpViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFSafariViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getSFSafariViewControllerClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return __41__BCPluginLoader_loadPluginBundlesAtURL___block_invoke_cold_1(v0, v1, v2);
}

uint64_t BPSBridgeTintColor()
{
  return MEMORY[0x270F12828]();
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
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t pbb_bridge_log()
{
  return MEMORY[0x270F51658]();
}

uint64_t pbb_discover_log()
{
  return MEMORY[0x270F51660]();
}