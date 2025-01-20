__CFString *IRServicePackageString(uint64_t a1)
{
  __CFString *v1;

  v1 = @"Invalid";
  if (a1 == 1) {
    v1 = @"ServicePackageAppleTVControl";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"ServicePackageMedia";
  }
}

__CFString *IRMediaBundleTypeToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"Invalid";
  }
  else {
    return off_26539E568[a1];
  }
}

__CFString *IRMediaEventTypeToString(unint64_t a1)
{
  if (a1 > 0xB) {
    return @"Invalid";
  }
  else {
    return off_26539E590[a1];
  }
}

__CFString *IRMediaEventSubTypeToString(uint64_t a1)
{
  if (a1) {
    return @"Invalid";
  }
  else {
    return @"Default";
  }
}

__CFString *IRAppleTVControlEventTypeToString(unint64_t a1)
{
  if (a1 > 5) {
    return @"Invalid";
  }
  else {
    return off_26539E5F0[a1];
  }
}

__CFString *IRAppleTVControlEventSubTypeToString(uint64_t a1)
{
  if (a1) {
    return @"Invalid";
  }
  else {
    return @"Default";
  }
}

void sub_254184490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2541862A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void IRSetupLogging()
{
  if (IRSetupLogging_onceToken != -1) {
    dispatch_once(&IRSetupLogging_onceToken, &__block_literal_global);
  }
}

uint64_t __IRSetupLogging_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.intelligentrouting", "general");
  v1 = (void *)IRLogObject;
  IRLogObject = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.intelligentrouting", "qe");
  v3 = (void *)IRLogObjectQE;
  IRLogObjectQE = (uint64_t)v2;

  IRLogObjectLongTerm = (uint64_t)os_log_create("com.apple.intelligentrouting", "LongTerm");
  return MEMORY[0x270F9A758]();
}

__CFString *IRCandidateClassificationToString(unint64_t a1)
{
  if (a1 > 4) {
    return @"Invalid";
  }
  else {
    return off_26539E720[a1];
  }
}

id IRMakeXPCServerInterface()
{
  os_log_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_27039C258];
  id v1 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v2 = objc_opt_class();
  v23 = objc_msgSend(v1, "initWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClass:objc_opt_class() forSelector:sel__createServiceWithParameters_reply_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v23 forSelector:sel__createServiceWithParameters_reply_ argumentIndex:1 ofReply:1];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v22 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v0 setClasses:v22 forSelector:sel__databaseExportwithReply_ argumentIndex:0 ofReply:1];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  [v0 setClasses:v9 forSelector:sel__getServiceTokensWithReply_ argumentIndex:0 ofReply:1];
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v10 forSelector:sel__deleteDatabaseWithReply_ argumentIndex:0 ofReply:1];
  [v0 setClass:objc_opt_class() forSelector:sel__deleteService_ argumentIndex:0 ofReply:0];
  v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v11 forSelector:sel__runWithConfiguration_ argumentIndex:0 ofReply:0];
  id v12 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v12, "initWithObjects:", v13, v14, objc_opt_class(), 0);
  [v0 setClasses:v15 forSelector:sel__updateCandidates_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v15 forSelector:sel__deleteCandidate_ argumentIndex:0 ofReply:0];
  id v16 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v16, "initWithObjects:", v17, v18, v19, objc_opt_class(), 0);
  [v0 setClasses:v20 forSelector:sel__addEvent_forCandidate_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel__setSpotOnLocationWithParameters_ argumentIndex:0 ofReply:0];

  return v0;
}

id IRMakeXPCClientInterface()
{
  os_log_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_27039AFC8];
  id v1 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v1, "initWithObjects:", v2, v3, v4, v5, v6, objc_opt_class(), 0);
  [v0 setClasses:v7 forSelector:sel__didUpdateContext_ argumentIndex:0 ofReply:0];
  id v8 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
  [v0 setClasses:v10 forSelector:sel__didUpdateBundlesWithSignificantInteractionPattern_ argumentIndex:0 ofReply:0];

  return v0;
}

uint64_t IRErrorWithCodeAndUserInfo(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.IntelligentRouting" code:a1 userInfo:a2];
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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