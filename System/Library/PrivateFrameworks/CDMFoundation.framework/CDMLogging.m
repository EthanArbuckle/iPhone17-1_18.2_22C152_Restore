@interface CDMLogging
+ (BOOL)debugEnabled;
+ (void)CDMLogInitIfNeeded;
@end

@implementation CDMLogging

+ (void)CDMLogInitIfNeeded
{
  if (+[CDMLogging CDMLogInitIfNeeded]::once != -1) {
    dispatch_once(&+[CDMLogging CDMLogInitIfNeeded]::once, &__block_literal_global_59);
  }
}

+ (BOOL)debugEnabled
{
  return os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG);
}

uint64_t __32__CDMLogging_CDMLogInitIfNeeded__block_invoke()
{
  CDMLogContext = (uint64_t)os_log_create((const char *)CDMLoggingSubsystem, (const char *)CDMLoggingCategory);
  return MEMORY[0x270F9A758]();
}

@end