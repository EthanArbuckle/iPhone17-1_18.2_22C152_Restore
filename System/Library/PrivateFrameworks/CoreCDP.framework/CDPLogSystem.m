@interface CDPLogSystem
@end

@implementation CDPLogSystem

uint64_t ___CDPLogSystem_block_invoke()
{
  _CDPLogSystem_log = (uint64_t)os_log_create("com.apple.cdp", "core");
  return MEMORY[0x270F9A758]();
}

@end