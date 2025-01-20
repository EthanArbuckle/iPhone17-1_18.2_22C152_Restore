id CRNavigationServiceInterface()
{
  void *v0;
  uint64_t vars8;

  if (CRNavigationServiceInterface_onceToken != -1) {
    dispatch_once(&CRNavigationServiceInterface_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)CRNavigationServiceInterface_interface;
  return v0;
}

id CRNavigationClientInterface()
{
  if (CRNavigationClientInterface_onceToken != -1) {
    dispatch_once(&CRNavigationClientInterface_onceToken, &__block_literal_global_68);
  }
  v0 = (void *)CRNavigationClientInterface_interface;
  return v0;
}

void __CRNavigationClientInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FDA0278];
  v1 = (void *)CRNavigationClientInterface_interface;
  CRNavigationClientInterface_interface = v0;

  v2 = (void *)CRNavigationClientInterface_interface;
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setClasses:v5 forSelector:sel_didUpdateActiveComponents_ argumentIndex:0 ofReply:0];
}

void __CRNavigationServiceInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FDA0178];
  v1 = (void *)CRNavigationServiceInterface_interface;
  CRNavigationServiceInterface_interface = v0;

  v2 = (void *)CRNavigationServiceInterface_interface;
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_sendInfo_toComponentUID_ argumentIndex:0 ofReply:0];

  v10 = (void *)CRNavigationServiceInterface_interface;
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v10 setClasses:v11 forSelector:sel_sendInfo_toComponentUID_ argumentIndex:1 ofReply:0];
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x34u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

id CarNavLogging()
{
  if (CarNavLogging_onceToken != -1) {
    dispatch_once(&CarNavLogging_onceToken, &__block_literal_global_2);
  }
  uint64_t v0 = (void *)CarNavLogging_facility;
  return v0;
}

uint64_t __CarNavLogging_block_invoke()
{
  CarNavLogging_facility = (uint64_t)os_log_create("com.apple.carkit.nav", "ACCNav");
  return MEMORY[0x270F9A758]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}