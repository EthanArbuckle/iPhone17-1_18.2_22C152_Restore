@interface CPCrashReporter
+ (void)simulateCrashReportFromPID:(int)a3 withKillCode:(unsigned int)a4 usingReasonWithFormat:(id)a5;
+ (void)simulateCrashReportWithFormat:(id)a3;
+ (void)simulateCrashReportWithReason:(id)a3 pid:(int)a4 code:(unsigned int)a5;
@end

@implementation CPCrashReporter

+ (void)simulateCrashReportWithReason:(id)a3 pid:(int)a4 code:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  if (simulateCrashReportWithReason_pid_code___pred_SimulateCrashCrashReporterSupport != -1) {
    dispatch_once(&simulateCrashReportWithReason_pid_code___pred_SimulateCrashCrashReporterSupport, &__block_literal_global_2);
  }
  char v8 = simulateCrashReportWithReason_pid_code___SimulateCrash(v6, a5, v7);
  v9 = CPDefaultLog();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CPCrashReporter simulateCrashReportWithReason:pid:code:]();
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    +[CPCrashReporter simulateCrashReportWithReason:pid:code:]();
  }
}

uint64_t (*__58__CPCrashReporter_simulateCrashReportWithReason_pid_code___block_invoke())(void, void, void)
{
  result = (uint64_t (*)(void, void, void))CUTWeakLinkSymbol();
  simulateCrashReportWithReason_pid_code___SimulateCrash = result;
  return result;
}

+ (void)simulateCrashReportFromPID:(int)a3 withKillCode:(unsigned int)a4 usingReasonWithFormat:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  char v8 = (objc_class *)NSString;
  id v9 = a5;
  v10 = (void *)[[v8 alloc] initWithFormat:v9 arguments:&v11];

  [a1 simulateCrashReportWithReason:v10 pid:v6 code:v5];
}

+ (void)simulateCrashReportWithFormat:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [a1 simulateCrashReportWithReason:v6 pid:getpid() code:14593455];
}

+ (void)simulateCrashReportWithReason:pid:code:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1B0DF7000, v0, OS_LOG_TYPE_ERROR, "%s Simulated a crash report for reason: %@", (uint8_t *)v1, 0x16u);
}

+ (void)simulateCrashReportWithReason:pid:code:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1B0DF7000, v0, OS_LOG_TYPE_FAULT, "%s Wanted to file a simulated crash report for reason: %@", (uint8_t *)v1, 0x16u);
}

@end