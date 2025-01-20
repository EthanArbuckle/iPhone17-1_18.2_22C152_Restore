@interface CDPSignpostLogSystem
@end

@implementation CDPSignpostLogSystem

uint64_t ___CDPSignpostLogSystem_block_invoke()
{
  _CDPSignpostLogSystem_log = (uint64_t)os_log_create("com.apple.cdp", "signpost");
  return MEMORY[0x270F9A758]();
}

@end