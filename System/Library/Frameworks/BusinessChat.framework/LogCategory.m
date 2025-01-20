@interface LogCategory
@end

@implementation LogCategory

uint64_t __LogCategory_Daemon_block_invoke()
{
  qword_2682A3608 = (uint64_t)os_log_create("com.apple.icloud.messages", "_");

  return MEMORY[0x270F9A758]();
}

@end