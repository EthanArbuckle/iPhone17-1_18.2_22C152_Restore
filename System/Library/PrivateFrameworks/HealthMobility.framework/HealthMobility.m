void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id HKMobilityAllWalkingSteadinessNotificationCategories()
{
  v0 = HKMobilityWalkingSteadinessInitialNotificationCategories();
  v1 = HKMobilityWalkingSteadinessRepeatNotificationCategories();
  v2 = [v0 arrayByAddingObjectsFromArray:v1];

  return v2;
}

id HKMobilityWalkingSteadinessInitialNotificationCategories()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"MobilityAppPlugin.WalkingSteadinessInitial.VeryLow";
  v2[1] = @"MobilityAppPlugin.WalkingSteadinessInitial.Low";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];

  return v0;
}

id HKMobilityWalkingSteadinessRepeatNotificationCategories()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"MobilityAppPlugin.WalkingSteadinessRepeat.VeryLow";
  v2[1] = @"MobilityAppPlugin.WalkingSteadinessRepeat.Low";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];

  return v0;
}

uint64_t HKMobilityNotificationCategoryForWalkingSteadinessEventValue(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return *((void *)&off_1E6D4CF40 + a1 - 1);
  }
}

uint64_t HKMobilityWalkingSteadinessFeatureStatusManagerClientInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B94F60];
}

uint64_t HKMobilityWalkingSteadinessFeatureStatusManagerServerInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B989E0];
}

const char *HMMobilityLogCategoryForCategory(unint64_t a1)
{
  if (a1 >= 0xF) {
    HMMobilityLogCategoryForCategory_cold_1();
  }
  if (a1 - 1 > 0xD) {
    return "default";
  }
  else {
    return off_1E6D4D038[a1 - 1];
  }
}

id HMMobilityLogForCategory(unint64_t a1)
{
  if (a1 >= 0xF) {
    HMMobilityLogForCategory_cold_1();
  }
  if (HMMobilityLogForCategory_onceToken != -1) {
    dispatch_once(&HMMobilityLogForCategory_onceToken, &__block_literal_global);
  }
  v2 = (void *)HMMobilityLogForCategory_logObjects[a1];

  return v2;
}

void __HMMobilityLogForCategory_block_invoke()
{
  for (unint64_t i = 0; i != 15; ++i)
  {
    v1 = (const char *)HMMobilityLogSubsystem;
    v2 = HMMobilityLogCategoryForCategory(i);
    os_log_t v3 = os_log_create(v1, v2);
    uint64_t v4 = (void *)HMMobilityLogForCategory_logObjects[i];
    HMMobilityLogForCategory_logObjects[i] = v3;
  }
}

void sub_1E0B18F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
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

void sub_1E0B191C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1E0B1943C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1E0B196EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1E0B1996C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t HKMobilityLocalizedNotificationString(uint64_t a1)
{
  return [NSString localizedUserNotificationStringForKey:a1 arguments:0];
}

uint64_t HKMobilityWalkingSteadinessType()
{
  return [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5E8]];
}

uint64_t HKMobilityWalkingSteadinessEventType()
{
  return [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29778]];
}

uint64_t HKMobilityWalkingSteadinessDetailRoomURL()
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"x-apple-health://SampleType/HKQuantityTypeIdentifierAppleWalkingSteadiness"];
}

id HKMobilityLocalizedNotificationDuringPregnancyBodyForCategory(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessInitial.Low"])
  {
    v2 = @"WALKING_STEADINESS_NOTIFICATION_BODY_INITIAL_LOW_PREGNANCY";
LABEL_9:
    os_log_t v3 = HKMobilityLocalizedNotificationString((uint64_t)v2);
    goto LABEL_10;
  }
  if ([v1 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessInitial.VeryLow"])
  {
    v2 = @"WALKING_STEADINESS_NOTIFICATION_BODY_INITIAL_VERY_LOW_PREGNANCY";
    goto LABEL_9;
  }
  if ([v1 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessRepeat.Low"])
  {
    v2 = @"WALKING_STEADINESS_NOTIFICATION_BODY_REPEAT_LOW_PREGNANCY";
    goto LABEL_9;
  }
  if ([v1 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessRepeat.VeryLow"])
  {
    v2 = @"WALKING_STEADINESS_NOTIFICATION_BODY_REPEAT_VERY_LOW_PREGNANCY";
    goto LABEL_9;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_FAULT)) {
    HKMobilityLocalizedNotificationDuringPregnancyBodyForCategory_cold_1();
  }
  os_log_t v3 = 0;
LABEL_10:

  return v3;
}

id HKMobilityLocalizedNotificationBodyForCategory(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessInitial.Low"])
  {
    v2 = @"WALKING_STEADINESS_NOTIFICATION_BODY_INITIAL_LOW";
LABEL_9:
    os_log_t v3 = HKMobilityLocalizedNotificationString((uint64_t)v2);
    goto LABEL_10;
  }
  if ([v1 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessInitial.VeryLow"])
  {
    v2 = @"WALKING_STEADINESS_NOTIFICATION_BODY_INITIAL_VERY_LOW";
    goto LABEL_9;
  }
  if ([v1 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessRepeat.Low"])
  {
    v2 = @"WALKING_STEADINESS_NOTIFICATION_BODY_REPEAT_LOW";
    goto LABEL_9;
  }
  if ([v1 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessRepeat.VeryLow"])
  {
    v2 = @"WALKING_STEADINESS_NOTIFICATION_BODY_REPEAT_VERY_LOW";
    goto LABEL_9;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_FAULT)) {
    HKMobilityLocalizedNotificationDuringPregnancyBodyForCategory_cold_1();
  }
  os_log_t v3 = 0;
LABEL_10:

  return v3;
}

__CFString *HKMobilityNotificationIdentifierForCategory(void *a1)
{
  id v1 = a1;
  v2 = HKMobilityWalkingSteadinessInitialNotificationCategories();
  char v3 = [v2 containsObject:v1];

  if (v3)
  {
    uint64_t v4 = @"MobilityAppPlugin.WalkingSteadinessInitial";
  }
  else
  {
    v5 = HKMobilityWalkingSteadinessRepeatNotificationCategories();
    char v6 = [v5 containsObject:v1];

    if (v6) {
      uint64_t v4 = @"MobilityAppPlugin.WalkingSteadinessRepeat";
    }
    else {
      uint64_t v4 = (__CFString *)v1;
    }
  }

  return v4;
}

void HMMobilityLogCategoryForCategory_cold_1()
{
}

void HMMobilityLogForCategory_cold_1()
{
}

void HKMobilityLocalizedNotificationDuringPregnancyBodyForCategory_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E0B16000, v0, v1, "[UNNotificationRequest+HKMobility] Unable to localize notification body prefix for category: %@", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x1F40E7BA0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1F40E81B8]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x1F40E81C0]();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}