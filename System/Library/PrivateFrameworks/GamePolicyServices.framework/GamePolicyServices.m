uint64_t gps_isInternalBuild()
{
  if (gps_isInternalBuild_onceToken != -1) {
    dispatch_once(&gps_isInternalBuild_onceToken, &__block_literal_global);
  }
  return gps_isInternalBuild_isInternalBuild;
}

uint64_t __gps_isInternalBuild_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  gps_isInternalBuild_isInternalBuild = result;
  return result;
}

id getGPSLogger()
{
  if (getGPSLogger_onceToken != -1) {
    dispatch_once(&getGPSLogger_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)gpsLogger;
  return v0;
}

uint64_t __getGPSLogger_block_invoke()
{
  gpsLogger = (uint64_t)os_log_create("com.apple.GamePolicy", "services");
  return MEMORY[0x270F9A758]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}