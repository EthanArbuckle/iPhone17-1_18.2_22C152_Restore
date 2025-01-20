void __RBSProcessLegacyStateDescriptor_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void v4[2];

  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F96448] descriptor];
  v1 = (void *)RBSProcessLegacyStateDescriptor___LegacyDescriptor;
  RBSProcessLegacyStateDescriptor___LegacyDescriptor = v0;

  [(id)RBSProcessLegacyStateDescriptor___LegacyDescriptor setValues:9];
  v2 = (void *)RBSProcessLegacyStateDescriptor___LegacyDescriptor;
  v4[0] = *MEMORY[0x1E4F964E0];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 setEndowmentNamespaces:v3];
}

void BKSProcessAssertionSetExpirationHandler(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (!v4)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSProcessAssertionSetExpirationHandler(__strong dispatch_queue_t, void (^__strong)(void))");
    [v13 handleFailureInFunction:v14, @"BKSProcessAssertion.m", 364, @"Invalid parameter not satisfying: %@", @"handler != nil" file lineNumber description];
  }
  if (BKSProcessAssertionSetExpirationHandler_onceToken != -1) {
    dispatch_once(&BKSProcessAssertionSetExpirationHandler_onceToken, &__block_literal_global_1);
  }
  v5 = (void *)MEMORY[0x1BA997070]();
  v6 = (void *)MEMORY[0x1E4F963E8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __BKSProcessAssertionSetExpirationHandler_block_invoke_2;
  v15[3] = &unk_1E60C65D0;
  id v7 = v4;
  id v17 = v7;
  id v8 = v3;
  id v16 = v8;
  v9 = [v6 observeForImminentAssertionsExpiration:v15];
  v10 = rbs_shim_log();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)MEMORY[0x1BA997230](v7);
      *(_DWORD *)buf = 138412546;
      v19 = v12;
      __int16 v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1B50B5000, v11, OS_LOG_TYPE_DEFAULT, "adding imminent expiration handler: %@, observer %@", buf, 0x16u);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&BKSProcessAssertionSetExpirationHandler_lock);
    [(id)BKSProcessAssertionSetExpirationHandler__observers addObject:v9];
    os_unfair_lock_unlock((os_unfair_lock_t)&BKSProcessAssertionSetExpirationHandler_lock);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      BKSProcessAssertionSetExpirationHandler_cold_1(v11);
    }
  }
}

void sub_1B50B71F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id RBSProcessLegacyStateDescriptor()
{
  if (RBSProcessLegacyStateDescriptor_onceToken != -1) {
    dispatch_once(&RBSProcessLegacyStateDescriptor_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)RBSProcessLegacyStateDescriptor___LegacyDescriptor;
  return v0;
}

uint64_t __BKSProcessAssertionSetExpirationHandler_block_invoke()
{
  BKSProcessAssertionSetExpirationHandler__observers = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  return MEMORY[0x1F41817F8]();
}

void BKSProcessAssertionBackgroundTimeRemaining()
{
  v0 = [MEMORY[0x1E4F963E8] currentProcess];
  v1 = [v0 activeLimitations];
  [v1 runTime];
}

__CFString *NSStringFromBKSProcessErrorCode(uint64_t a1)
{
  v1 = @"(unknown)";
  if (a1 == 1) {
    v1 = @"bootstrap-failed";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"none";
  }
}

__CFString *NSStringFromBKSProcessExitReason(char a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = v2;
  if (a1)
  {
    [v2 addObject:@"voluntary"];
    if ((a1 & 4) == 0)
    {
LABEL_3:
      if ((a1 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"signal"];
  if ((a1 & 8) == 0)
  {
LABEL_4:
    if ((a1 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 addObject:@"jetsam"];
  if ((a1 & 2) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 addObject:@"crash"];
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 addObject:@"fairPlay"];
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_16:
  [v3 addObject:@"badSignature"];
  if ((a1 & 0x40) != 0) {
LABEL_8:
  }
    [v3 addObject:@"unknown"];
LABEL_9:
  if ([v3 count])
  {
    id v4 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    id v4 = @"(none)";
  }

  return v4;
}

void sub_1B50BBC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __BKSProcessAssertionSetExpirationHandler_block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = rbs_shim_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (void *)MEMORY[0x1BA997230](*(void *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1B50B5000, v2, OS_LOG_TYPE_DEFAULT, "BKSProcessAssertionSetExpirationHandler fired: %@", (uint8_t *)&v6, 0xCu);
  }
  id v4 = *(NSObject **)(a1 + 32);
  v5 = *(void (***)(void))(a1 + 40);
  if (v4) {
    dispatch_async(v4, v5);
  }
  else {
    v5[2](*(void *)(a1 + 40));
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t BKSTerminationAssertionActiveEfficacyForBundleIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __observerManager();
  uint64_t v3 = [v2 efficacyForBundleID:v1];

  return v3;
}

id __observerManager()
{
  if (__observerManager_onceToken != -1) {
    dispatch_once(&__observerManager_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)__observerManager___manager;
  return v0;
}

uint64_t BKSTerminationAssertionHeldForBundleIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __observerManager();
  uint64_t v3 = [v2 hasTerminationAssertionForBundleID:v1];

  return v3;
}

void BKSTerminationAssertionRegisterObserver(void *a1)
{
  id v1 = a1;
  __observerManager();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObserver:v1];
}

void BKSTerminationAssertionUnregisterObserver(void *a1)
{
  id v1 = a1;
  __observerManager();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeObserver:v1];
}

void sub_1B50BD2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Block_object_dispose((const void *)(v17 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1BA997230](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__49(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__50(uint64_t a1)
{
}

uint64_t ____observerManager_block_invoke()
{
  __observerManager___manager = objc_alloc_init(BKSTerminationAssertionObserverManager);
  return MEMORY[0x1F41817F8]();
}

uint64_t _BKSWatchdogAssertionGetTypeID()
{
  if (_BKSWatchdogAssertionGetTypeID_once != -1) {
    dispatch_once(&_BKSWatchdogAssertionGetTypeID_once, &__block_literal_global_4);
  }
  return _BKSWatchdogAssertionGetTypeID_typeID;
}

void _BKSWatchdogAssertionDestroy(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&watchdogLock);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(a1 + 24)];
  id v2 = [(id)assertionsByIdentifier objectForKey:v3];
  [v2 invalidate];
  [(id)assertionsByIdentifier removeObjectForKey:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&watchdogLock);
}

BOOL _BKSWatchdogAssertionEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef _BKSWatchdogAssertionDescribe(unsigned int *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, @"<BKSWatchdogAssertion %p> pid = %d", a1, a1[4]);
}

uint64_t BKSWatchdogAssertionCreateForPID(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F96478] targetWithPid:a2];
  id v4 = objc_alloc(MEMORY[0x1E4F96318]);
  v5 = [MEMORY[0x1E4F96348] grant];
  v18[0] = v5;
  int v6 = [MEMORY[0x1E4F96308] attributeWithCompletionPolicy:0];
  v18[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  uint64_t v8 = (void *)[v4 initWithExplanation:@"BKSWatchdogAssertion" target:v3 attributes:v7];

  id v17 = 0;
  LODWORD(v7) = [v8 acquireWithError:&v17];
  id v9 = v17;
  uint64_t Instance = 0;
  if (v7)
  {
    if (_BKSWatchdogAssertionGetTypeID_once != -1) {
      dispatch_once(&_BKSWatchdogAssertionGetTypeID_once, &__block_literal_global_4);
    }
    uint64_t Instance = _CFRuntimeCreateInstance();
    *(_DWORD *)(Instance + 16) = v2;
    os_unfair_lock_lock((os_unfair_lock_t)&watchdogLock);
    uint64_t v11 = nextIdentifier++;
    *(void *)(Instance + 24) = v11;
    v12 = (void *)assertionsByIdentifier;
    if (!assertionsByIdentifier)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
      v14 = (void *)assertionsByIdentifier;
      assertionsByIdentifier = v13;

      v12 = (void *)assertionsByIdentifier;
      uint64_t v11 = *(void *)(Instance + 24);
    }
    v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v11];
    [v12 setObject:v8 forKey:v15];

    os_unfair_lock_unlock((os_unfair_lock_t)&watchdogLock);
  }

  return Instance;
}

void BKSProcessAssertionSetExpirationHandler_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1B50B5000, log, OS_LOG_TYPE_FAULT, "unable to create assertion expiration observer", v1, 2u);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t RBSServiceInitialize()
{
  return MEMORY[0x1F4149D60]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t rbs_general_log()
{
  return MEMORY[0x1F4149D70]();
}

uint64_t rbs_shim_log()
{
  return MEMORY[0x1F4149D78]();
}