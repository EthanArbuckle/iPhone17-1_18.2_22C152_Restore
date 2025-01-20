@interface ICProactiveQuickTypeOSLogFacility
@end

@implementation ICProactiveQuickTypeOSLogFacility

uint64_t ___ICProactiveQuickTypeOSLogFacility_block_invoke()
{
  _ICProactiveQuickTypeOSLogFacility_logFacility = (uint64_t)os_log_create("com.apple.InputContext", "ProactiveQuickType");
  return MEMORY[0x270F9A758]();
}

@end