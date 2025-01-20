@interface LA
@end

@implementation LA

uint64_t __LA_LOG_EndpointProvider_block_invoke()
{
  LA_LOG_EndpointProvider_log = (uint64_t)os_log_create("com.apple.LocalAuthentication", "EndpointProvider");

  return MEMORY[0x1F41817F8]();
}

@end