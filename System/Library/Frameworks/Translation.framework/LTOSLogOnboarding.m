@interface LTOSLogOnboarding
@end

@implementation LTOSLogOnboarding

uint64_t ___LTOSLogOnboarding_block_invoke()
{
  _LTOSLogOnboarding_log = (uint64_t)os_log_create("com.apple.Translation", "Onboarding");

  return MEMORY[0x270F9A758]();
}

@end