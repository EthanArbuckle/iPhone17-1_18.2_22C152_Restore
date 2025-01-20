@interface DMTLogOperation
@end

@implementation DMTLogOperation

uint64_t ___DMTLogOperation_block_invoke()
{
  _DMTLogOperation_logObj = (uint64_t)os_log_create("com.apple.devicemanagementtools", "Operation");
  return MEMORY[0x270F9A758]();
}

uint64_t ___DMTLogOperation_block_invoke_0()
{
  _DMTLogOperation_logObj_0 = (uint64_t)os_log_create("com.apple.devicemanagementtools", "Operation");
  return MEMORY[0x270F9A758]();
}

@end