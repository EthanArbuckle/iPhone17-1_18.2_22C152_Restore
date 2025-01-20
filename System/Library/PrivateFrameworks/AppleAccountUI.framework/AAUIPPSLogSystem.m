@interface AAUIPPSLogSystem
@end

@implementation AAUIPPSLogSystem

uint64_t ___AAUIPPSLogSystem_block_invoke()
{
  _AAUIPPSLogSystem_log = (uint64_t)os_log_create("com.apple.appleaccount", "ui.pps");
  return MEMORY[0x270F9A758]();
}

@end