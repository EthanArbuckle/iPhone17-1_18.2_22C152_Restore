@interface CalFoundationLogSubsystem
+ (OS_os_log)accounts;
+ (OS_os_log)contacts;
+ (OS_os_log)defaultCategory;
+ (OS_os_log)eventTimer;
+ (OS_os_log)junk;
+ (OS_os_log)locations;
+ (OS_os_log)memory;
+ (OS_os_log)messageTrace;
+ (OS_os_log)suggestions;
@end

@implementation CalFoundationLogSubsystem

+ (OS_os_log)defaultCategory
{
  if (defaultCategory_onceToken != -1) {
    dispatch_once(&defaultCategory_onceToken, &__block_literal_global);
  }
  v2 = (void *)defaultCategory_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __44__CalFoundationLogSubsystem_defaultCategory__block_invoke()
{
  defaultCategory_logHandle = (uint64_t)os_log_create("com.apple.calendar.foundation", "Default");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)accounts
{
  if (accounts_onceToken != -1) {
    dispatch_once(&accounts_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)accounts_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __37__CalFoundationLogSubsystem_accounts__block_invoke()
{
  accounts_logHandle = (uint64_t)os_log_create("com.apple.calendar.foundation", "Accounts");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)contacts
{
  if (contacts_onceToken != -1) {
    dispatch_once(&contacts_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)contacts_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __37__CalFoundationLogSubsystem_contacts__block_invoke()
{
  contacts_logHandle = (uint64_t)os_log_create("com.apple.calendar.foundation", "Contacts");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)eventTimer
{
  if (eventTimer_onceToken != -1) {
    dispatch_once(&eventTimer_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)eventTimer_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __39__CalFoundationLogSubsystem_eventTimer__block_invoke()
{
  eventTimer_logHandle = (uint64_t)os_log_create("com.apple.calendar.foundation", "EventTimer");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)junk
{
  if (junk_onceToken != -1) {
    dispatch_once(&junk_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)junk_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __33__CalFoundationLogSubsystem_junk__block_invoke()
{
  junk_logHandle = (uint64_t)os_log_create("com.apple.calendar.foundation", "Junk");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)locations
{
  if (locations_onceToken != -1) {
    dispatch_once(&locations_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)locations_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __38__CalFoundationLogSubsystem_locations__block_invoke()
{
  locations_logHandle = (uint64_t)os_log_create("com.apple.calendar.foundation", "Locations");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)memory
{
  if (memory_onceToken != -1) {
    dispatch_once(&memory_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)memory_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __35__CalFoundationLogSubsystem_memory__block_invoke()
{
  memory_logHandle = (uint64_t)os_log_create("com.apple.calendar.foundation", "Memory");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)messageTrace
{
  if (messageTrace_onceToken != -1) {
    dispatch_once(&messageTrace_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)messageTrace_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __41__CalFoundationLogSubsystem_messageTrace__block_invoke()
{
  messageTrace_logHandle = (uint64_t)os_log_create("com.apple.calendar.foundation", "MessageTrace");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)suggestions
{
  if (suggestions_onceToken != -1) {
    dispatch_once(&suggestions_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)suggestions_logHandle;

  return (OS_os_log *)v2;
}

uint64_t __40__CalFoundationLogSubsystem_suggestions__block_invoke()
{
  suggestions_logHandle = (uint64_t)os_log_create("com.apple.calendar.foundation", "Suggestions");

  return MEMORY[0x1F41817F8]();
}

@end