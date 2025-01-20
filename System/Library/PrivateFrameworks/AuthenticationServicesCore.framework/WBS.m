@interface WBS
@end

@implementation WBS

uint64_t __WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent_block_invoke()
{
  WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent_log = (uint64_t)os_log_create("com.apple.AuthenticationServicesCore", "AuthenticationServicesAgent");

  return MEMORY[0x270F9A758]();
}

uint64_t __WBS_LOG_CHANNEL_PREFIXAuthorization_block_invoke()
{
  WBS_LOG_CHANNEL_PREFIXAuthorization_log = (uint64_t)os_log_create("com.apple.AuthenticationServicesCore", "Authorization");

  return MEMORY[0x270F9A758]();
}

uint64_t __WBS_LOG_CHANNEL_PREFIXServiceLifecycle_block_invoke()
{
  WBS_LOG_CHANNEL_PREFIXServiceLifecycle_log = (uint64_t)os_log_create("com.apple.AuthenticationServicesCore", "ServiceLifecycle");

  return MEMORY[0x270F9A758]();
}

@end