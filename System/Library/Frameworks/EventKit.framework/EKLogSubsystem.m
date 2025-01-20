@interface EKLogSubsystem
+ (OS_os_log)autocomplete;
+ (OS_os_log)availabilitySearch;
+ (OS_os_log)defaultCategory;
+ (OS_os_log)exchangeSync;
+ (OS_os_log)junk;
+ (OS_os_log)savingSignposts;
@end

@implementation EKLogSubsystem

+ (OS_os_log)defaultCategory
{
  if (defaultCategory_onceToken != -1) {
    dispatch_once(&defaultCategory_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)defaultCategory_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __33__EKLogSubsystem_defaultCategory__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.ek", "Default");
  uint64_t v1 = defaultCategory_logHandle;
  defaultCategory_logHandle = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (OS_os_log)autocomplete
{
  if (autocomplete_onceToken != -1) {
    dispatch_once(&autocomplete_onceToken, &__block_literal_global_4_1);
  }
  v2 = (void *)autocomplete_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __30__EKLogSubsystem_autocomplete__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.ek", "Autocomplete");
  uint64_t v1 = autocomplete_logHandle;
  autocomplete_logHandle = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (OS_os_log)availabilitySearch
{
  if (availabilitySearch_onceToken != -1) {
    dispatch_once(&availabilitySearch_onceToken, &__block_literal_global_7_0);
  }
  v2 = (void *)availabilitySearch_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __36__EKLogSubsystem_availabilitySearch__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.ek", "AvailabilitySearch");
  uint64_t v1 = availabilitySearch_logHandle;
  availabilitySearch_logHandle = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (OS_os_log)exchangeSync
{
  if (exchangeSync_onceToken != -1) {
    dispatch_once(&exchangeSync_onceToken, &__block_literal_global_10_1);
  }
  v2 = (void *)exchangeSync_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __30__EKLogSubsystem_exchangeSync__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.ek", "ExchangeSync");
  uint64_t v1 = exchangeSync_logHandle;
  exchangeSync_logHandle = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (OS_os_log)junk
{
  if (junk_onceToken != -1) {
    dispatch_once(&junk_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)junk_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __22__EKLogSubsystem_junk__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.ek", "Junk");
  uint64_t v1 = junk_logHandle;
  junk_logHandle = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (OS_os_log)savingSignposts
{
  if (savingSignposts_onceToken != -1) {
    dispatch_once(&savingSignposts_onceToken, &__block_literal_global_16_0);
  }
  v2 = (void *)savingSignposts_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __33__EKLogSubsystem_savingSignposts__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.ek", "SavingSignposts");
  uint64_t v1 = savingSignposts_logHandle;
  savingSignposts_logHandle = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end