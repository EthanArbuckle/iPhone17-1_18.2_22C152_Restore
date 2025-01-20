@interface DKPluggedInMonitorLog
@end

@implementation DKPluggedInMonitorLog

uint64_t ___DKPluggedInMonitorLog_block_invoke()
{
  _DKPluggedInMonitorLog__pluggedInLog = (uint64_t)os_log_create("com.apple.coreduet.monitors", "_DKPluggedInMonitor");
  return MEMORY[0x270F9A758]();
}

@end