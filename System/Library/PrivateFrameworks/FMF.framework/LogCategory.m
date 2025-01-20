@interface LogCategory
@end

@implementation LogCategory

uint64_t __LogCategory_Daemon_block_invoke()
{
  LogCategory_Daemon_log = (uint64_t)os_log_create("com.apple.icloud.fmfd", "_");

  return MEMORY[0x270F9A758]();
}

uint64_t __LogCategory_FMFMapXPC_block_invoke()
{
  LogCategory_FMFMapXPC_log = (uint64_t)os_log_create("com.apple.icloud.fmfd", "FMFMapXPC");

  return MEMORY[0x270F9A758]();
}

@end