@interface CMSILogingFacility
@end

@implementation CMSILogingFacility

uint64_t ___CMSILogingFacility_block_invoke()
{
  _CMSILogingFacility_oslog = (uint64_t)os_log_create("com.apple.agora.interface", "log");
  return MEMORY[0x270F9A758]();
}

@end