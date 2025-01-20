void sub_241DC7848(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x263EF8340];
  v4 = ACHLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_241DC5000, v4, OS_LOG_TYPE_DEFAULT, "Plugin initial achievement load did finish with success= %d", (uint8_t *)v6, 8u);
  }

  if (a2)
  {
    [*(id *)(a1 + 32) _finishingUnleashingTheKrakenForDevice:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    v5 = ACHLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl(&dword_241DC5000, v5, OS_LOG_TYPE_DEFAULT, "Aborting final phase of unleashing the Kraken", (uint8_t *)v6, 2u);
    }
  }
}

void sub_241DC85CC(uint64_t a1)
{
  v2 = ACHLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_241DC5000, v2, OS_LOG_TYPE_DEFAULT, "Plugin loading all achievements from database if necessary", v4, 2u);
  }

  v3 = [*(id *)(a1 + 32) achievementStore];
  [v3 loadAllAchievementsFromDatabaseIfNecessaryWithCompletionHandler:*(void *)(a1 + 40)];
}

uint64_t sub_241DC8A7C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_241DC9114(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_241DC9568(uint64_t a1)
{
  return MEMORY[0x270F0A7A8](*(void *)(a1 + 32));
}

void sub_241DC9B6C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_241DC9B88(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_241DC9BB0()
{
  sub_241DC9BA4();
  _os_log_error_impl(&dword_241DC5000, v0, OS_LOG_TYPE_ERROR, "AchievementsPlugin: an issue occurred while performing the migration.", v1, 2u);
}

void sub_241DC9BF0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_241DC9C5C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_241DC9CC8()
{
  sub_241DC9BA4();
  sub_241DC9B6C(&dword_241DC5000, v0, v1, "Initial move goal fetch was already completed, and kraken is unleashed, skipping", v2, v3, v4, v5, v6);
}

void sub_241DC9CFC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_241DC9D68()
{
  sub_241DC9BA4();
  sub_241DC9B6C(&dword_241DC5000, v0, v1, "Activity Challenge Assets URL explicitly choosen by user, skipping URL setting", v2, v3, v4, v5, v6);
}

void sub_241DC9D9C()
{
  sub_241DC9BA4();
  sub_241DC9B6C(&dword_241DC5000, v0, v1, "Customer install, skipping Activity Challenge Assets URL setting", v2, v3, v4, v5, v6);
}

uint64_t ACHCompanionHistoricalEvaluationPolicy()
{
  return MEMORY[0x270F0AAC0]();
}

uint64_t ACHGizmoHistoricalEvaluationPolicy()
{
  return MEMORY[0x270F0AAC8]();
}

uint64_t ACHIsActivityAchievementsAssetServerURLExplicitlySet()
{
  return MEMORY[0x270F0A6A0]();
}

uint64_t ACHLogDefault()
{
  return MEMORY[0x270F0A6E8]();
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return MEMORY[0x270F0A7B0]();
}

uint64_t ACHTinkerHistoricalEvaluationPolicy()
{
  return MEMORY[0x270F0AAD0]();
}

uint64_t FIAreFitnessAppsRestricted()
{
  return MEMORY[0x270F29938]();
}

uint64_t FIIsActivePairedDeviceSatellitePaired()
{
  return MEMORY[0x270F29A00]();
}

uint64_t HDQuantitySampleEntityPredicateForQuantity()
{
  return MEMORY[0x270F319E8]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
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