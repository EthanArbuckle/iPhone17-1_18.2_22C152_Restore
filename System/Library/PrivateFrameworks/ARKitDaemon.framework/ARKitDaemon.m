id _ARLogDaemon()
{
  void *v0;
  uint64_t vars8;

  if (_ARLogDaemon_onceToken != -1) {
    dispatch_once(&_ARLogDaemon_onceToken, &__block_literal_global_106);
  }
  v0 = (void *)_ARLogDaemon_logObj;
  return v0;
}

__CFString *NSStringFromARMemoryPressureCondition(uint64_t a1)
{
  if (a1) {
    return @"Critical";
  }
  else {
    return @"Warning";
  }
}

id _ARLogGeneral()
{
  if (_ARLogGeneral_onceToken != -1) {
    dispatch_once(&_ARLogGeneral_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)_ARLogGeneral_logObj;
  return v0;
}

void sub_24719D708(_Unwind_Exception *a1)
{
}

id _ARLogDaemon_0()
{
  if (_ARLogDaemon_onceToken_0 != -1) {
    dispatch_once(&_ARLogDaemon_onceToken_0, &__block_literal_global_169);
  }
  v0 = (void *)_ARLogDaemon_logObj_0;
  return v0;
}

id _ARLogDaemon_1()
{
  if (_ARLogDaemon_onceToken_1 != -1) {
    dispatch_once(&_ARLogDaemon_onceToken_1, &__block_literal_global_166);
  }
  v0 = (void *)_ARLogDaemon_logObj_1;
  return v0;
}

void sub_24719F330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _ARLogGeneral_0()
{
  if (_ARLogGeneral_onceToken_0 != -1) {
    dispatch_once(&_ARLogGeneral_onceToken_0, &__block_literal_global_170);
  }
  v0 = (void *)_ARLogGeneral_logObj_0;
  return v0;
}

void sub_24719F780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_24719F8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_24719FB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_24719FC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_24719FFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
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

id _ARLogDaemon_2()
{
  if (_ARLogDaemon_onceToken_2 != -1) {
    dispatch_once(&_ARLogDaemon_onceToken_2, &__block_literal_global_2);
  }
  v0 = (void *)_ARLogDaemon_logObj_2;
  return v0;
}

id _ARLogDaemon_3()
{
  if (_ARLogDaemon_onceToken_4 != -1) {
    dispatch_once(&_ARLogDaemon_onceToken_4, &__block_literal_global_4);
  }
  v0 = (void *)_ARLogDaemon_logObj_4;
  return v0;
}

__CFString *NSStringFromARProcessTaskState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"ARProcessTaskStateUnknown";
  }
  else {
    return off_265206F18[a1 - 1];
  }
}

__CFString *NSStringFromARProcessDebugState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"ARProcessDebugStateUnknown";
  }
  else {
    return off_265206F38[a1 - 1];
  }
}

__CFString *NSStringFromARProcessImmersivenessLevel(uint64_t a1)
{
  v1 = @"ARProcessImmersivenessLevelNone";
  if (a1 == 1) {
    v1 = @"ARProcessImmersivenessLevelDefocused";
  }
  if (a1 == 2) {
    return @"ARProcessImmersivenessLevelFull";
  }
  else {
    return v1;
  }
}

void sub_2471A22CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _ARLogProcessMonitor()
{
  if (_ARLogProcessMonitor_onceToken != -1) {
    dispatch_once(&_ARLogProcessMonitor_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)_ARLogProcessMonitor_logObj;
  return v0;
}

void sub_2471A2888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  os_unfair_lock_unlock(v15);
  _Unwind_Resume(a1);
}

void sub_2471A2BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  os_unfair_lock_unlock(v15);
  _Unwind_Resume(a1);
}

void sub_2471A2E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t ARDiagnosticPipelineRequestTailspin(uint64_t a1, uint64_t a2, void *a3)
{
  v7[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v6 = *MEMORY[0x263F08320];
    v7[0] = @"DiagnosticPipeline is not supported.";
    v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    ARErrorWithCodeAndUserInfo();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

void sub_2471A3A70(_Unwind_Exception *a1)
{
}

id _ARLogDaemon_4()
{
  if (_ARLogDaemon_onceToken_6 != -1) {
    dispatch_once(&_ARLogDaemon_onceToken_6, &__block_literal_global_275);
  }
  v0 = (void *)_ARLogDaemon_logObj_6;
  return v0;
}

void sub_2471A4624(_Unwind_Exception *a1)
{
}

id _ARLogGeneral_1()
{
  if (_ARLogGeneral_onceToken_1 != -1) {
    dispatch_once(&_ARLogGeneral_onceToken_1, &__block_literal_global_279);
  }
  v0 = (void *)_ARLogGeneral_logObj_1;
  return v0;
}

void sub_2471A5054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  os_unfair_lock_unlock(v7);
  _Unwind_Resume(a1);
}

void sub_2471A51E4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2471A5698(_Unwind_Exception *a1)
{
}

void sub_2471A5BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_2471A62B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2471A6628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, void (*a12)(char *))
{
}

void sub_2471A6990(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2471A6AEC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id _ARLogDaemon_5()
{
  if (_ARLogDaemon_onceToken_7 != -1) {
    dispatch_once(&_ARLogDaemon_onceToken_7, &__block_literal_global_7);
  }
  v0 = (void *)_ARLogDaemon_logObj_7;
  return v0;
}

id _ARLogDaemon_6()
{
  if (_ARLogDaemon_onceToken_8 != -1) {
    dispatch_once(&_ARLogDaemon_onceToken_8, &__block_literal_global_8);
  }
  v0 = (void *)_ARLogDaemon_logObj_8;
  return v0;
}

void sub_2471A9834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _ARLogGeneral_2()
{
  if (_ARLogGeneral_onceToken_2 != -1) {
    dispatch_once(&_ARLogGeneral_onceToken_2, &__block_literal_global_9);
  }
  v0 = (void *)_ARLogGeneral_logObj_2;
  return v0;
}

uint64_t ARCoreAnalyticsEventCreateAndReport()
{
  return MEMORY[0x270F08CE8]();
}

uint64_t ARCreateFixedPriorityDispatchQueue()
{
  return MEMORY[0x270F08CF0]();
}

uint64_t ARCreateNonFixedPriorityConcurrentDispatchQueue()
{
  return MEMORY[0x270F08CF8]();
}

uint64_t ARCreateNonFixedPriorityDispatchQueue()
{
  return MEMORY[0x270F08D00]();
}

uint64_t ARCreateTransactionForService()
{
  return MEMORY[0x270F08D08]();
}

uint64_t ARErrorWithCodeAndUserInfo()
{
  return MEMORY[0x270F08D48]();
}

uint64_t ARFrameworkVersions()
{
  return MEMORY[0x270F08D50]();
}

uint64_t ARGetMemoryFootprint()
{
  return MEMORY[0x270F08D58]();
}

uint64_t ARGetSubclassesForClass()
{
  return MEMORY[0x270F08D68]();
}

uint64_t ARGetSystemBootTime()
{
  return MEMORY[0x270F08D70]();
}

uint64_t ARGetSystemUpTime()
{
  return MEMORY[0x270F08D78]();
}

uint64_t ARGetSystemUpTimeIncludingSleep()
{
  return MEMORY[0x270F08D80]();
}

uint64_t ARGetSystemUpTimeIncludingSleepAndDriftCorrection()
{
  return MEMORY[0x270F08D88]();
}

uint64_t ARRemoteGeoTrackingTechniqueClientInterface()
{
  return MEMORY[0x270F08DD8]();
}

uint64_t ARRemoteGeoTrackingTechniqueServiceInterface()
{
  return MEMORY[0x270F08DE0]();
}

uint64_t ARRemoteLocationSensorClientInterface()
{
  return MEMORY[0x270F08DE8]();
}

uint64_t ARRemoteLocationSensorServiceInterface()
{
  return MEMORY[0x270F08DF0]();
}

uint64_t ARRemoteSensorClientInterfaceWithProtocol()
{
  return MEMORY[0x270F08DF8]();
}

uint64_t ARRemoteSensorServiceInterfaceWithProtocol()
{
  return MEMORY[0x270F08E00]();
}

uint64_t ARRemoteTechniqueClientInterfaceWithProtocol()
{
  return MEMORY[0x270F08E08]();
}

uint64_t ARRemoteTechniqueServiceInterfaceWithProtocol()
{
  return MEMORY[0x270F08E10]();
}

uint64_t ARVector3FromNSData()
{
  return MEMORY[0x270F08E18]();
}

void CVBufferRelease(CVBufferRef buffer)
{
}

CVBufferRef CVBufferRetain(CVBufferRef buffer)
{
  return (CVBufferRef)MEMORY[0x270EEA008](buffer);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x270ED9518](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}