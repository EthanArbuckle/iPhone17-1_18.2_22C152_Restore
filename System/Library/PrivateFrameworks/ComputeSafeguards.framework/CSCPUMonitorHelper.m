@interface CSCPUMonitorHelper
+ (int)clearMonitorForPID:(int)a3;
+ (int)setThreshold:(float)a3 overTimeWindow:(float)a4 forPID:(int)a5 withFatalEffect:(BOOL)a6;
@end

@implementation CSCPUMonitorHelper

+ (int)setThreshold:(float)a3 overTimeWindow:(float)a4 forPID:(int)a5 withFatalEffect:(BOOL)a6
{
  uint64_t v7 = *(void *)&a5;
  *__error() = 0;
  if ([a1 clearMonitorForPID:v7])
  {
    v9 = +[CSLogger defaultCategory];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[CSCPUMonitorHelper setThreshold:overTimeWindow:forPID:withFatalEffect:](v9);
    }
  }
  if (a6) {
    int v10 = proc_set_cpumon_params_fatal();
  }
  else {
    int v10 = proc_set_cpumon_params();
  }
  int v11 = v10;
  if (v10)
  {
    v12 = +[CSLogger defaultCategory];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[CSCPUMonitorHelper setThreshold:overTimeWindow:forPID:withFatalEffect:](v12);
    }
  }
  return v11;
}

+ (void)setThreshold:(NSObject *)a1 overTimeWindow:forPID:withFatalEffect:.cold.1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_24A698000, a1, OS_LOG_TYPE_ERROR, "Error enabling CPU monitoring: %d", (uint8_t *)v3, 8u);
}

+ (int)clearMonitorForPID:(int)a3
{
  return MEMORY[0x270EDAD30](*(void *)&a3, a2);
}

+ (void)setThreshold:(os_log_t)log overTimeWindow:forPID:withFatalEffect:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24A698000, log, OS_LOG_TYPE_DEBUG, "Failed to disable monitoring (okay if no limits were applied). Proceeding to set new limits.", v1, 2u);
}

@end