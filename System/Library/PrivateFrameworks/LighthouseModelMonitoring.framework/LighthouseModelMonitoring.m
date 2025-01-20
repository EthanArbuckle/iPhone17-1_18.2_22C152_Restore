void LCFModelMonitoringLoggingUtilsInit()
{
  if (LCFModelMonitoringLoggingUtilsInit_once != -1) {
    dispatch_once(&LCFModelMonitoringLoggingUtilsInit_once, &__block_literal_global);
  }
}

uint64_t __LCFModelMonitoringLoggingUtilsInit_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)LCFModelMonitoringLoggingSubsystem, (const char *)LCFModelMonitoringLoggingCategoryShadowEvaluation);
  v1 = (void *)LCFMMLogShadowEvaluation;
  LCFMMLogShadowEvaluation = (uint64_t)v0;

  LCFMMLogProactivePredictionRanker = (uint64_t)os_log_create((const char *)LCFModelMonitoringLoggingSubsystem, (const char *)LCFModelMonitoringLoggingCategoryProactivePredictionRanker);
  return MEMORY[0x270F9A758]();
}

uint64_t predictionSort(void *a1, void *a2)
{
  id v3 = a2;
  v4 = [a1 prediction];
  v5 = [v4 featureValueForName:@"classProbability"];

  v6 = [v3 prediction];

  v7 = [v6 featureValueForName:@"classProbability"];

  v8 = [v5 dictionaryValue];
  uint64_t v9 = MEMORY[0x263EFFA88];
  v10 = [v8 objectForKeyedSubscript:MEMORY[0x263EFFA88]];
  [v10 doubleValue];
  double v12 = v11;

  v13 = [v7 dictionaryValue];
  v14 = [v13 objectForKeyedSubscript:v9];
  [v14 doubleValue];
  double v16 = v15;

  if (v12 < v16) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = v12 > v16;
  }

  return v17;
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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