@interface ARLogProcessMonitor
@end

@implementation ARLogProcessMonitor

uint64_t ___ARLogProcessMonitor_block_invoke()
{
  _ARLogProcessMonitor_logObj = (uint64_t)os_log_create("com.apple.ARKit", "ProcessMonitor");
  return MEMORY[0x270F9A758]();
}

@end