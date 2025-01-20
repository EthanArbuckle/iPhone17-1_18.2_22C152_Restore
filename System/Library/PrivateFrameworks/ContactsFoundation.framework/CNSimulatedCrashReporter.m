@interface CNSimulatedCrashReporter
+ (id)os_log;
+ (void)simulateCrashWithCode:(int64_t)a3 description:(id)a4;
+ (void)simulateCrashWithMessage:(id)a3;
@end

@implementation CNSimulatedCrashReporter

+ (void)simulateCrashWithMessage:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [a1 simulateCrashWithCode:732802011 description:v6];
}

+ (void)simulateCrashWithCode:(int64_t)a3 description:(id)a4
{
  id v6 = a4;
  if (softLinkSimulateCrashAvailable_onceToken != -1) {
    dispatch_once(&softLinkSimulateCrashAvailable_onceToken, &__block_literal_global_10);
  }
  if (softLinkSimulateCrashAvailable_isAvailable)
  {
    uint64_t v7 = (void (*)(uint64_t, uint64_t, void *))softLinkSimulateCrash[0];
    uint64_t v8 = getpid();
    v7(v8, a3, v6);
  }
  else
  {
    v9 = objc_msgSend(a1, "os_log");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[CNSimulatedCrashReporter simulateCrashWithCode:description:](v6, a3, v9);
    }

    v10 = objc_msgSend(a1, "os_log");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[CNSimulatedCrashReporter simulateCrashWithCode:description:](v10);
    }
  }
}

+ (id)os_log
{
  if (os_log_cn_once_token_3 != -1) {
    dispatch_once(&os_log_cn_once_token_3, &__block_literal_global_10);
  }
  v2 = (void *)os_log_cn_once_object_3;

  return v2;
}

uint64_t __34__CNSimulatedCrashReporter_os_log__block_invoke()
{
  os_log_cn_once_object_3 = (uint64_t)os_log_create("com.apple.contacts", "crash-reporter");

  return MEMORY[0x1F41817F8]();
}

+ (void)simulateCrashWithCode:(NSObject *)a1 description:.cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29060] callStackSymbols];
  int v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_19091D000, a1, OS_LOG_TYPE_FAULT, "[CRASH] Backtrace: %@", (uint8_t *)&v3, 0xCu);
}

+ (void)simulateCrashWithCode:(NSObject *)a3 description:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 136315394;
  uint64_t v6 = [a1 UTF8String];
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_19091D000, a3, OS_LOG_TYPE_FAULT, "[CRASH] %s (code 0x%llx)", (uint8_t *)&v5, 0x16u);
}

@end