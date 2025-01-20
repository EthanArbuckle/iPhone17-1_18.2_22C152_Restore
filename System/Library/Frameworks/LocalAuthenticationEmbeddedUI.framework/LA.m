@interface LA
@end

@implementation LA

uint64_t __LA_LOG_block_invoke()
{
  LA_LOG_log = LALogForCategory();

  return MEMORY[0x270F9A758]();
}

uint64_t __LA_LOG_block_invoke_0()
{
  LA_LOG_log_0 = LALogForCategory();

  return MEMORY[0x270F9A758]();
}

@end