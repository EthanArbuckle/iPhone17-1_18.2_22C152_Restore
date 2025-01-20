void sub_24D29A608(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

id EKSSServiceXPCInterface()
{
  if (EKSSServiceXPCInterface_onceToken != -1) {
    dispatch_once(&EKSSServiceXPCInterface_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)EKSSServiceXPCInterface_interface;
  return v0;
}

uint64_t __EKSSServiceXPCInterface_block_invoke()
{
  EKSSServiceXPCInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FF81B98];
  return MEMORY[0x270F9A758]();
}

id EKSSClientXPCInterface()
{
  if (EKSSClientXPCInterface_onceToken != -1) {
    dispatch_once(&EKSSClientXPCInterface_onceToken, &__block_literal_global_46);
  }
  v0 = (void *)EKSSClientXPCInterface_interface;
  return v0;
}

uint64_t __EKSSClientXPCInterface_block_invoke()
{
  EKSSClientXPCInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FF81BF8];
  return MEMORY[0x270F9A758]();
}

id EKSSDiagnosticsDirectory()
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = [NSURL fileURLWithPath:@"/private/var/mobile/Library/EventKitSyncServices/Diagnostics/"];
  v1 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = *MEMORY[0x263F080A8];
  v5[0] = *MEMORY[0x263F080B0];
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v1 createDirectoryAtURL:v0 withIntermediateDirectories:1 attributes:v2 error:0];

  return v0;
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}