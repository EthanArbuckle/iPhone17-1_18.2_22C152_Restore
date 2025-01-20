@interface LA
@end

@implementation LA

uint64_t __LA_LOG_LACUIPackagedViewPlatformStateController_block_invoke()
{
  LA_LOG_LACUIPackagedViewPlatformStateController_log = (uint64_t)os_log_create("com.apple.LocalAuthentication", "LACUIPackagedViewPlatformStateController");
  return MEMORY[0x270F9A758]();
}

uint64_t __LA_LOG_LACUIPackagedViewStateController_block_invoke()
{
  LA_LOG_LACUIPackagedViewStateController_log = (uint64_t)os_log_create("com.apple.LocalAuthentication", "LACUIPackagedViewStateController");
  return MEMORY[0x270F9A758]();
}

uint64_t __LA_LOG_LACUIPackagedView_block_invoke()
{
  LA_LOG_LACUIPackagedView_log = (uint64_t)os_log_create("com.apple.LocalAuthentication", "LACUIPackagedView");
  return MEMORY[0x270F9A758]();
}

@end