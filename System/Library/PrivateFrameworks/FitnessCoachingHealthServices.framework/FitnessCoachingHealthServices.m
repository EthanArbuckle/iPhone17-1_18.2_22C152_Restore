uint64_t FCEventCoalescedWithRules(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  unsigned char v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4 = a2;
  v5 = [v4 currentDate];
  [v5 timeIntervalSinceReferenceDate];
  v7 = v6;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v3;
  v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v9)
  {
    v10 = v9;
    v11 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "eventIdentifier", (void)v26);
        v15 = [v4 lastFiredDateForProgressEventIdentifier:v14];

        if (v15)
        {
          [v15 timeIntervalSinceReferenceDate];
          v17 = v7 - v16;
          [v13 interval];
          if (v17 < v18)
          {
            _HKInitializeLogging();
            v20 = (void *)*MEMORY[0x1E4F29F08];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
            {
              v21 = v20;
              [v13 interval];
              v23 = v22;
              v24 = [v13 eventIdentifier];
              *(_DWORD *)buf = 134218242;
              v31 = v23;
              v32 = 2112;
              v33 = v24;
              _os_log_impl(&dword_1D3B3E000, v21, OS_LOG_TYPE_DEFAULT, "Less than %f seconds since %@; not showing another Almost There Update",
                buf,
                0x16u);
            }
            v19 = 1;
            goto LABEL_14;
          }
        }
      }
      v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  v19 = 0;
LABEL_14:

  return v19;
}

id FCFireDateForPercentOfDayRule(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 userStartOfDay];
    [v3 percentOfDay];
    double v8 = v7;
    [v5 projectedDayDuration];
    v10 = [v6 dateByAddingTimeInterval:v8 * v9];
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      FCFireDateForPercentOfDayRule_cold_1((uint64_t)v3, v11);
    }
    v10 = 0;
  }

  return v10;
}

id FCFireDateForTimeOfDayRule(void *a1, void *a2)
{
  id v3 = a1;
  if (a2)
  {
    id v4 = [a2 userEndOfDay];
    [v3 secondsBeforeEndOfDay];
    v6 = [v4 dateByAddingTimeInterval:-v5];
  }
  else
  {
    _HKInitializeLogging();
    double v7 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
      FCFireDateForTimeOfDayRule_cold_1((uint64_t)v3, v7);
    }
    v6 = 0;
  }

  return v6;
}

void sub_1D3B41A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1D3B4975C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3B4A36C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3B4AA48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void FCFireDateForPercentOfDayRule_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3B3E000, a2, OS_LOG_TYPE_ERROR, "Typical day model is missing for percentage of day evaluation: %@", (uint8_t *)&v2, 0xCu);
}

void FCFireDateForTimeOfDayRule_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3B3E000, a2, OS_LOG_TYPE_ERROR, "Typical day model is missing for time of day evaluation: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t FIActivityMoveModeChangeSampleForDateComponents()
{
  return MEMORY[0x1F4119550]();
}

uint64_t FIAgeInYearsForDateOfBirthComponentsWithCurrentDateAndCalendar()
{
  return MEMORY[0x1F4119568]();
}

uint64_t FIExperienceTypeForBirthDateComponentsWithCurrentDateAndCalendar()
{
  return MEMORY[0x1F4119578]();
}

uint64_t FIMoveGoalQuantityForActivitySummary()
{
  return MEMORY[0x1F41195A8]();
}

uint64_t FIMoveQuantityForActivitySummary()
{
  return MEMORY[0x1F41195B0]();
}

uint64_t HDActivityCacheEntityPredicateForCachesInDateComponentsRange()
{
  return MEMORY[0x1F411D330]();
}

uint64_t HDCreateSerialUtilityDispatchQueue()
{
  return MEMORY[0x1F411D370]();
}

uint64_t HDSampleEntityPredicateForStartDate()
{
  return MEMORY[0x1F411D450]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKActivityCacheDateComponentsFromCacheIndex()
{
  return MEMORY[0x1F40E8120]();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return MEMORY[0x1F40E8158]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1F40E81B8]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}